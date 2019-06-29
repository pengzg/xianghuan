<%@page import="org.xianghuan.util.SystemConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.xianghuan.web.model.SessionInfo"%>
<%
	String contextPath = request.getContextPath();
	Boolean yuyinFlag = false;
	SessionInfo sessionInfo = (SessionInfo) session.getAttribute("RM_LOGIN_USER");
	yuyinFlag = false;
	
%>
<script type="text/javascript" charset="utf-8">
	var lockWindowFun = function() {
		$.post(sy.contextPath + '/system/loginController/logout.action', function(result) {
			$('#loginDialog').dialog('open');
		}, 'json');
	};
	var logoutFun = function() {
		$.post(sy.contextPath + '/system/loginController/logout.action', function(result) {
			location.replace(sy.contextPath + '/index.jsp');
		}, 'json');
	};
	var showMyInfoFun = function() {
		var dialog = parent.sy.modalDialog({
			title : '我的信息',
			url : sy.contextPath + '/securityJsp/userInfo.jsp'
		});
	};
	
	
	/**
	*
	* 订单提醒及 走马灯文字提醒操作
	*/
	//音频
	var sound = document.getElementById("js_sound");
	//走马灯文字
	var meninfo="";  
	var info="";
	var execNum = 0;
	var intTime = 0;
	function loadHandlerOrder(){
		if(!<%=yuyinFlag%>){
			return;
		}
		if($('#yuyin').is(':checked')){
			$.post(sy.contextPath + '/storeclient/order/queryOrderCount.action',{},function(data){
				if(data.success==true){
					var orderNum = data.obj;
					if(orderNum > 0 ){
						sound.play();
						//处理走马灯文字
						meninfo = "	您有 "+data.obj+" 笔新订单,请及时处理!";
						info =meninfo;
						//自动执行走马灯文字
						intTime = self.setInterval("execZmdWord()",500);
					}
				}
			},"json");		
		}
	}
	self.setInterval("loadHandlerOrder()",1000*50);
	
	//走马灯文字
	function execZmdWord(){
		 var id=document.getElementById("wenzi");  
	    if(typeof id.textContent=="string"){  
	        id.textContent=meninfo.substring(0,meninfo.length);   
	    } else{  
	        id.innerText=meninfo.substring(0,meninfo.length);  
	    }                       
	    meninfo=meninfo+meninfo.substring(0,1);                               
	    meninfo=meninfo.substring(1,meninfo.length); 
	    
	    execNum ++;
	    
	    if(execNum >=20){
	    	intTime=window.clearInterval(intTime);
	    	if(typeof id.textContent=="string"){  
		        id.textContent="";   
		    } else{  
		        id.innerText="";  
		    }
	    	execNum=0;
	    }
	} 
</script>
<div id="wenzi" style="text-align:center;padding-top:5px;font-size:30px;color:red;">
</div>
<div style="position: absolute; right: 0px; top: 5px;">
	<!-- <a href="javascript:test();" class="easyui-linkbutton" data-options="plain:true,iconCls:'ext-icon-bricks'">切换到柜面结算</a>-->
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'ext-icon-rainbow'">更换皮肤</a> 
<!-- 	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_kzmbMenu',iconCls:'ext-icon-cog'">控制面板</a> 
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_zxMenu',iconCls:'ext-icon-disconnect'">注销</a>
 -->
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_zxMenu',iconCls:'ext-icon-cog'">控制面板</a>
</div>

<div id="layout_north_pfMenu" style="width: 120px; display: none;">
	<div onclick="sy.changeTheme('default');" title="default">default</div>
	<div onclick="sy.changeTheme('gray');" title="gray">gray</div>
	<div onclick="sy.changeTheme('metro');" title="metro">metro</div>
	<div onclick="sy.changeTheme('bootstrap');" title="bootstrap">bootstrap</div>
	<div onclick="sy.changeTheme('black');" title="black">black</div>
	<div class="menu-sep"></div>
	<div onclick="sy.changeTheme('metro-blue');" title="metro-blue">metro-blue</div>
	<div onclick="sy.changeTheme('metro-gray');" title="metro-gray">metro-gray</div>
	<div onclick="sy.changeTheme('metro-green');" title="metro-green">metro-green</div>
	<div onclick="sy.changeTheme('metro-orange');" title="metro-orange">metro-orange</div>
	<div onclick="sy.changeTheme('metro-red');" title="metro-red">metro-red</div>
</div>
<!-- <div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
</div> -->
<div id="layout_north_zxMenu" style="width: 100px; display: none;">
	<!-- <div class="menu-sep"></div>
	<div data-options="iconCls:'ext-icon-user'" onclick="showMyInfoFun();">我的信息</div> -->
	<div data-options="iconCls:'ext-icon-user_edit'" onclick="$('#passwordDialog').dialog('open');">修改密码</div>
	<!-- <div data-options="iconCls:'ext-icon-lock'" onclick="lockWindowFun();">锁定窗口</div> -->
	<div class="menu-sep"></div>
	<div data-options="iconCls:'ext-icon-door_out'" onclick="logoutFun();">退出系统</div>
</div>
<div>
<!-- 音频效果 -->
<audio controls="controls" id="js_sound" preload style="position:absolute; left:-1999px;">
  <source src="<%=contextPath%>/style/mp3/new_order_tip.mp3" type="audio/mpeg">
Your browser does not support the audio tag.
</audio>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<%
	String su_id = request.getParameter("su_id");
	if (su_id == null) {
		su_id = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../../../inc.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
	   $('#su_orgid').combotree('setValue', '${bean.su_orgid}');
	   $('#su_role').combobox('setValue','${bean.su_role}');
	   $('#su_sex').combobox('setValue','${bean.su_sex}');
	   $('#su_status').combobox('setValue','${bean.su_status}');
	});
	var submitNow = function($dialog, $grid, $pjq) {
		var url;
		
		url = sy.contextPath + '/system/sysUserControl/update.action';
		
		var su_startdate = $("#su_startdate").datebox("getValue"); 
		var su_enddate = $("#su_enddate").datebox("getValue"); 
		if(su_enddate!='' && su_enddate < su_startdate){
			parent.$.messager.alert('提示', '有效结束日期不能早于有效开始日期');
			return false;
		}
		$.post(url, sy.serializeObject($('form')), function(result) {
			parent.sy.progressBar('close');//关闭上传进度条
			if (result.success) {
				$pjq.messager.alert('提示', result.msg, 'info');
				$grid.datagrid('load');
				$dialog.dialog('destroy');
			} else {
				$pjq.messager.alert('提示', result.msg, 'error');
			}
		}, 'json');
	};
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			submitNow($dialog, $grid, $pjq);
		}
	};
	function checkUserName(proName,_this) {
		var flag = false;
		$.ajax({
			   type: "POST",
			   url:  sy.contextPath + '/system/sysUserControl/checkUserName.action?&time=' + new Date().getTime(),
			   data: proName +"="+_this.value,
			   async:false,
			   success: function(msg){
				   if(msg.success) {
					   flag = true;
				   }else {
					   //提示信息
					   //$pjq.messager.alert('提示', result.msg, 'error');
				   }
			   }
		});
	}
	/* 
	function showSysUserUnity(){
		var su_belongtype =  $('#su_belongtype').combobox('getValue');
		showSysUserUnityWin(sy.contextPath,'s',su_belongtype);
	}
	 */
	function SysUserUnityCallBack(res){
		var rowData=res.split(",");
		$('#su_belongpk').val(rowData[0]); 
		$('#su_belongpk_nameref').val(rowData[1]); 
	}
	$.extend($.fn.validatebox.defaults.rules, {
		//用户账号验证(只能包括 _ 数字 字母) 
	    account: {//param的值为[]中值
	        validator: function (value, param) {
	            if (value.length < param[0] || value.length > param[1]) {
	                $.fn.validatebox.defaults.rules.account.message = '账号长度必须在' + param[0] + '至' + param[1] + '范围';
	                return false;
	            } else {
	                if (!/^[\w]+$/.test(value)) {
	                    $.fn.validatebox.defaults.rules.account.message = '账号只能数字、字母、下划线组成.';
	                    return false;
	                } else {
	                    return true;
	                }
	            }
	        }, message: ''
	    }
	})
	 
</script>
</head>
<body>
	<form method="post" class="form">
		<fieldset>
			<legend>用户基本信息</legend>
			<table class="table">
				<tr style="display: none">
					<th>编号</th>
					<td><input value="${bean.su_id}" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>部门名称</th>
					<td>
						<select value="${bean.su_orgid}" id="su_orgid" name="su_orgid" class="easyui-combotree" 
						data-options="required:true,editable:false,idField:'id',textField:'text',parentField:'pid',
						url:sy.contextPath + '/system/publicControl/orgTree.action'" 
						style="width: 155px;">
						</select>
					</td>
					<th>角色</th>
					<td>
						<input id="su_role" name="su_role" class="easyui-combobox" 
						data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=1001',
						valueField:'bd_code',textField:'bd_name',editable:false, required:true" />
					</td>
				</tr>
				<tr>
					<th>姓名</th>
					<td><input id="su_name" name="su_name" value="${bean.su_name}"  class="easyui-validatebox"
					 validType="length[0,20]" invalidMessage="不能超过20个字符！" data-options="required:true" /></td>
					<th>账号</th>
					<td><input name="su_loginname" id="su_loginname" value="${bean.su_loginname}" class="easyui-validatebox"
					validtype="account[4,20]" data-options="required:true" onblur="checkUserName('su_loginname',this)"/></td>
				</tr>
				<tr>
					<th>性别</th>
					<td>
						<input id="su_sex" name="su_sex" class="easyui-combobox" 
						data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=1017',
						valueField:'bd_code',textField:'bd_name', editable:false, required:true" />
					</td>
					<th>状态</th>
					<td>
						<input id="su_status" name="su_status" class="easyui-combobox" 
						data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=1006',
						valueField:'bd_code',textField:'bd_name', editable:false, required:true" />
						</td>
				</tr>				
				<tr>
					<th>手机号</th>
					<td><input type="su_phone" name="su_phone" value="${bean.su_phone}" class="easyui-numberbox" data-options="required:false,validType:'mobile'" 
					 onblur="checkUserName('su_phone',this)" ></td>
					<th>邮箱</th>
					<td><input type="su_email" name="su_email" value="${bean.su_email}" 
					 class="easyui-validatebox" validType="email" invalidMessage="请填写正确的邮箱格式" onblur="checkUserName('su_email',this)" ></td>
				</tr>	
				<tr>
					<th>微信号</th>
					<td><input id="su_wx" name="su_wx" value="${bean.su_wx}" 
					 class="easyui-validatebox" ></td>
					<th></th>
					<td></td>
				</tr>					
				<tr>
					<th>有效开始日期</th>
					<td><input type="text" id="su_startdate" name="su_startdate" value="${bean.su_startdate}" 
					 class="easyui-datebox" data-options="required:true,editable:false"/></td>
					<th>有效结束日期</th>
					<td><input type="text" data-options="required:false,editable:false" id="su_enddate" name="su_enddate" value="${bean.su_enddate}" class="easyui-datebox" /></td>
				</tr>
				<tr style="display:none">
					<td>
						<input name="su_id" value="${bean.su_id}"/>
						<input name="su_ts" value="${bean.su_ts}"/>
						<input name="su_dr" value="${bean.su_dr}"/>
						<input name="su_version" value="${bean.su_version}"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
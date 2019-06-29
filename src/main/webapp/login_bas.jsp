<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>系统登录</title>
<jsp:include page="inc.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		/* $('#userType').combobox('setValue','03'); */
		var loginFun = function() {
			var loginTabs = $('#loginTabs').tabs('getSelected');//当前选中的tab
			var $form = loginTabs.find('form');//选中的tab里面的form
			if ($form.length == 1 && $form.form('validate')) {
				$('#loginBtn').linkbutton('disable');
				$.post(sy.contextPath + '/system/loginController/doLogin.action?validatecode='+$("#validatecode").val(), $form.serialize(), function(result) {
					if (result.success) {
						location.replace(sy.contextPath + '/index.jsp');
					} else {
						$.messager.alert('提示', result.msg, 'error', function() {
							$('#loginBtn').linkbutton('enable');
						});
					}
				}, 'json');
			}
		};

		$('#loginDialog').show().dialog({
			modal : false,
			closable : false,
			iconCls : 'ext-icon-lock_open',
			buttons : [{
				id : 'loginBtn',
				text : '登录',
				handler : function() {
					loginFun();
				}
			} ],
			onOpen : function() {
				$('form :input:first').focus();
				$('form :input').keyup(function(event) {
					if (event.keyCode == 13) {
						loginFun();
					}
				});
			}
		});
		//window.location.href="${pageContext.request.contextPath}/management/counter/login.action";
	});
	function code_change(_this) {
		$(_this).attr("src",'${pageContext.request.contextPath}/ImageServlet?t='+new Date().getTime());
	}
	
</script>
</head>
<body>
	<div id="loginDialog" title="系统登录" style="display: none; width: 450px; height: 320px; overflow: hidden;">
		<!--
		-->
		<div style="text-align: center;">
			<img id="erp" alt="" src="${pageContext.request.contextPath}/style/images/logo.png" />
		</div>
		<div id="loginTabs" class="easyui-tabs" data-options="fit:true,border:false">
			<div title="用户输入模式" style="overflow: hidden; padding: 10px; ">
				<form method="post" class="form">
					<table class="table" style="width: 100%; height: 100%;height: 80px;">
						<tr>
							<th width="50">登录名</th>
							<td><input name="loginname" class="easyui-validatebox" data-options="required:true" style="width: 210px;" /></td>
						</tr>
						<tr>
							<th>密码</th>
							<td><input name="loginPwd" id="pwd" type="password" class="easyui-validatebox" data-options="required:true" style="width: 210px;" /></td>
						</tr>
								<input id="userType" name="userType" value="01" type = "hidden">
						<%-- <tr>
							<th>
								角色
							</th>
							<td>
								<input id="userType" name="userType" class="easyui-combobox" 
									data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.htm?codekey=1007',
									valueField:'bd_code',textField:'bd_name', editable:false, required:true" />
							</td>
						</tr> --%>
<!-- 						<tr> -->
<!-- 							<th> -->
<!-- 								验证码 -->
<!-- 							</th> -->
<!-- 							<td> -->
<%-- 							<img id="ImageId" style="-webkit-user-select: none" src="${pageContext.request.contextPath}/ImageServlet" onclick="code_change(this)" > --%>
<!-- 							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 							<input id="validatecode"  class="easyui-validatebox" data-options="required:false" style="width: 60px;" /> -->
<!-- 							</td> -->
<!-- 						</tr> -->
					</table>
				</form>
			</div>
		
		</div>
	</div>
</body>
</html>
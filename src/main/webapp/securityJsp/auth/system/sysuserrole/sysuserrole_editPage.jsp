<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="sur_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysUserRoleControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysUserRoleControl/insert.action';
			}
			$.post(url, sy.serializeObject($('form')), function(result) {
				if (result.success) {
					$grid.datagrid('load');
					$dialog.dialog('destroy');
				} else {
					$pjq.messager.alert('提示', result.msg, 'error');
				}
			}, 'json');
		}
	};
</script>
</head>
<body>
	<form method="post" class="form">
		<fieldset>
			<legend>基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>	
					<th>sur_id</th>
					<td>
						<input name="sur_id" value="${bean.sur_id}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sur_roleid</th>
					<td>
						<input name="sur_roleid" value="${bean.sur_roleid}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sur_userid</th>
					<td>
						<input name="sur_userid" value="${bean.sur_userid}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
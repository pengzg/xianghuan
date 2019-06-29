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
			if ($(':input[name="sul_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysUppdLogControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysUppdLogControl/insert.action';
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
					<th>sul_id</th>
					<td>
						<input name="sul_id" value="${bean.sul_id}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sul_creatid</th>
					<td>
						<input name="sul_creatid" value="${bean.sul_creatid}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sul_uptime</th>
					<td>
						<input name="sul_uptime" value="${bean.sul_uptime}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sul_oldpd</th>
					<td>
						<input name="sul_oldpd" value="${bean.sul_oldpd}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sul_newpd</th>
					<td>
						<input name="sul_newpd" value="${bean.sul_newpd}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sul_inserttime</th>
					<td>
						<input name="sul_inserttime" value="${bean.sul_inserttime}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sul_sp_id</th>
					<td>
						<input name="sul_sp_id" value="${bean.sul_sp_id}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sul_desc</th>
					<td>
						<input name="sul_desc" value="${bean.sul_desc}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
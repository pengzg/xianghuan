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
			if ($(':input[name="smt_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysMenuTypeControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysMenuTypeControl/insert.action';
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
					<th>smt_id</th>
					<td>
						<input name="smt_id" value="${bean.smt_id}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>smt_name</th>
					<td>
						<input name="smt_name" value="${bean.smt_name}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>smt_dr</th>
					<td>
						<input name="smt_dr" value="${bean.smt_dr}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>smt_ts</th>
					<td>
						<input name="smt_ts" value="${bean.smt_ts}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
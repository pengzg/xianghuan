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
			if ($(':input[name="sal_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysActionLogControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysActionLogControl/insert.action';
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
					<th>sal_id</th>
					<td>
						<input name="sal_id" value="${bean.sal_id}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_creatid</th>
					<td>
						<input name="sal_creatid" value="${bean.sal_creatid}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_createname</th>
					<td>
						<input name="sal_createname" value="${bean.sal_createname}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_actionname</th>
					<td>
						<input name="sal_actionname" value="${bean.sal_actionname}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_actiontype</th>
					<td>
						<input name="sal_actiontype" value="${bean.sal_actiontype}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_actiontime</th>
					<td>
						<input name="sal_actiontime" value="${bean.sal_actiontime}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_ownerid</th>
					<td>
						<input name="sal_ownerid" value="${bean.sal_ownerid}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_ip</th>
					<td>
						<input name="sal_ip" value="${bean.sal_ip}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_plattype</th>
					<td>
						<input name="sal_plattype" value="${bean.sal_plattype}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_desc</th>
					<td>
						<input name="sal_desc" value="${bean.sal_desc}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_ts</th>
					<td>
						<input name="sal_ts" value="${bean.sal_ts}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>sal_dr</th>
					<td>
						<input name="sal_dr" value="${bean.sal_dr}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			if ($(':input[name="ss_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysSystemControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysSystemControl/insert.action';
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
				<input name="ss_id" value="${bean.ss_id}" type="hidden" />
				<tr>	
					<th>系统编码</th>
					<td>
						<input name="ss_code" value="${bean.ss_code}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>系统名称</th>
					<td>
						<input name="ss_name" value="${bean.ss_name}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>域名前缀</th>
					<td>
						<input name="ss_url" value="${bean.ss_url}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>系统描述</th>
					<td>
						<input name="ss_desc" value="${bean.ss_desc}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
						<input name="ss_ts" value="${bean.ss_ts}" type="hidden" />
						<input name="ss_version" value="${bean.ss_version}" type="hidden" />
						<input name="ss_adduser" value="${bean.ss_adduser}" type="hidden" />
						<input name="ss_adddate" value="${bean.ss_adddate}" type="hidden" />
						<input name="ss_modifyuser" value="${bean.ss_modifyuser}" type="hidden" />
						<input name="ss_modifydate" value="${bean.ss_modifydate}" type="hidden" />
						<input name="ss_deleteuser" value="${bean.ss_deleteuser}" type="hidden" />
						<input name="ss_deletedate" value="${bean.ss_deletedate}" type="hidden" />
			</table>
		</fieldset>
	</form>
</body>
</html>
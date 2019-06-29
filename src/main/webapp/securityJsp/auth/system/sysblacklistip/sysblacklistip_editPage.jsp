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
			if ($(':input[name="sbli_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysBlackListIpControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysBlackListIpControl/insert.action';
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
					<th>IP地址</th>
					<td>
						<input name="sbli_ipadd" value="${bean.sbli_ipadd}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>原因</th>
					<td>
						<input name="sbli_res" value="${bean.sbli_res}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
						<input name="sbli_id" value="${bean.sbli_id}" type="hidden"  />
						<input name="sbl_adddate" value="${bean.sbl_adddate}"  type="hidden" />
						<input name="sbl_modifyuser" value="${bean.sbl_modifyuser}"  type="hidden" />
						<input name="sbl_modifydate" value="${bean.sbl_modifydate}"  type="hidden" />
						<input name="sbl_deletedate" value="${bean.sbl_deletedate}"  type="hidden" />
						<input name="sbl_deleteuser" value="${bean.sbl_deleteuser}"  type="hidden" />
						<input name="sbl_adduser" value="${bean.sbl_adduser}"  type="hidden" />
						<input name="sbl_version" value="${bean.sbl_version}"  type="hidden" />
			</table>
		</fieldset>
	</form>
</body>
</html>
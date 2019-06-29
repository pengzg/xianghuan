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
			if ($(':input[name="sp_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysPdlevelControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysPdlevelControl/insert.action';
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
					<th>编号</th>
					<td>
						<input value="${bean.sp_id}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th>名称</th>
					<td>
						<input name="sp_name" value="${bean.sp_name}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>
					<th>密码复杂度</th>
					<td>
						<input name="sp_pdfzd" value="${bean.sp_pdfzd}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>密码重复间隔次数</th>
					<td>
						<input name="sp_pdjgtimes" value="${bean.sp_pdjgtimes}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>密码修改间隔时间</th>
					<td>
						<input name="sp_pduptimes" value="${bean.sp_pduptimes}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>
				<tr>
					<th>状态</th>
					<td><select class="easyui-combobox" name="sp_status" data-options="panelHeight:'auto',editable:false" style="width: 155px;">
						<option <c:if test="${bean.sp_status=='1'}"> selected </c:if> value="1">启用</option>
						<option <c:if test="${bean.sp_status=='0'}"> selected </c:if> value="0">禁用</option>
					</select></td>
				</tr>
				</tr>
				<tr style="display:none">
					<td>
						<input name="sp_id" value="${bean.sp_id}"/>
						<input name="sp_ts" value="${bean.sp_ts}"/>
						<input name="sp_dr" value="${bean.sp_dr}"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
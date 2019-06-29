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
			if ($(':input[name="bp_id"]').val().length > 0) {
				url = sy.contextPath + '/base/baseParameter/update.action';
			} else {
				url = sy.contextPath + '/base/baseParameter/insert.action';
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
				<input name="bp_id" value="${bean.bp_id}" type="hidden"  />
				<tr >	
					<th>编码</th>
					<td>
						<input name="bp_key" value="${bean.bp_key}" class="easyui-validatebox" data-options="required:true"  />
					</td>
				</tr>	
				<tr>	
					<th>值</th>
					<td>											
					    <textarea  name="bp_value" class="easyui-validatebox"  style="resize:none" data-options="required:true">${bean.bp_value}</textarea>
					</td>
				</tr>	
				<tr >	
					<th>备注说明</th>
					<td>
					<textarea  name="bp_remark" class="easyui-validatebox"  style="resize:none" data-options="required:true">${bean.bp_remark}</textarea>
					</td>
				</tr>	
				<tr>	
					<th>级别</th>
					<td><input id="bp_level" name="bp_level"
								class="easyui-combobox"
								data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2054',valueField:'bd_code',textField:'bd_name',panelHeight:'auto',required:true"
								value="${bean.bp_level}" />
					
					</td>
				</tr>	
   				<tr>	
					<th>是否启用</th>
					<td><input id="bp_dr" name="bp_dr"
								class="easyui-combobox"
								data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2006',valueField:'bd_code',textField:'bd_name',panelHeight:'auto',required:true"
								value="${bean.bp_dr}" />
					
					</td>
				</tr>
						<input name="status" value="1" type="hidden"  />
						<input name="bp_version" value="${bean.bp_version}" type="hidden"  />
						<input name="bp_adduser" value="${bean.bp_adduser}" type="hidden"  />
			</table>
		</fieldset>
	</form>
</body>
</html>
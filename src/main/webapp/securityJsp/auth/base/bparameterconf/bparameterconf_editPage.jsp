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
$(function() {
	   $('#bpc_status').combobox('setValue','${bean.bpc_status}');
	});
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="bpc_id"]').val().length > 0) {
				url = sy.contextPath + '/base/bparameterConfControl/update.action';
			} else {
				url = sy.contextPath + '/base/bparameterConfControl/insert.action';
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
				<input name="bpc_id" value="${bean.bpc_id}" type="hidden"  />
				<tr >	
					<th>编码</th>
					<td>
						<input name="bpc_key_code" value="${bean.bpc_key_code}" class="easyui-validatebox" data-options="required:true"  />
					</td>
				</tr>	
				<tr>	
					<th>值</th>
					<td>											
					    <textarea  name="bpc_value" class="easyui-validatebox"  style="resize:none" required>${bean.bpc_value}</textarea>
					</td>
				</tr>	
				<tr >	
					<th>备注说明</th>
					<td>
					<textarea  name="bpc_remark" class="easyui-validatebox"  style="resize:none" required>${bean.bpc_remark}</textarea>
					</td>
				</tr>	
					<input name="bpc_orgid" value="${bean.bpc_orgid}" class="easyui-validatebox" data-options="required:false" type="hidden" />	
				<tr>	
					<th>状态 </th>
					<td>
					<input id="bpc_status" name="bpc_status" class="easyui-combobox" 
						data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/deta	ilItem.action?codekey=1006',
						valueField:'bd_code',textField:'bd_name', editable:false, required:true,panelHeight:'auto'" />
					</td>
				</tr>	
   
					    <input name="bpc_dr" value="${bean.bpc_dr}" type="hidden" />
						<input name="bpc_version" value="${bean.bpc_version}" type="hidden"  />
						<input name="bpc_adduser" value="${bean.bpc_adduser}" type="hidden"  />
						<input name="bpc_adddate" value="${bean.bpc_adddate}" type="hidden"  />
						<input name="bpc_modifydate" value="${bean.bpc_modifydate}" type="hidden"  />
						<input name="bpc_deleteuser" value="${bean.bpc_deleteuser}" type="hidden"  />
						<input name="bpc_deletedate" value="${bean.bpc_deletedate}" type="hidden"  />	
			</table>
		</fieldset>
	</form>
</body>
</html>
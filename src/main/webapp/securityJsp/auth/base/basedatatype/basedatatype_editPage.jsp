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
			if ($(':input[name="bdt_id"]').val().length > 0) {
				url = sy.contextPath + '/base/baseDatatypeControl/update.action';
			} else {
				url = sy.contextPath + '/base/baseDatatypeControl/insert.action';
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
					<th>编码</th>
					<td>
						<input name="bdt_code" value="${bean.bdt_code}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>名称</th>
					<td>
						<input name="bdt_name" value="${bean.bdt_name}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>排序</th>
					<td>
						<input name="bdt_order" class="easyui-numberspinner"
						 data-options="required:true,min:0,max:100000,editable:true" style="width: 155px;" value="<c:if test="${bean.bdt_order==null || bean.bdt_order==''}">1</c:if> <c:if test="${bean.bdt_order!=null || bean.bdt_order!=''}">${bean.bdt_order}</c:if>" />
					</td>
				</tr>					
				<tr>	
					<th>描述</th>
					<td>
						<input name="bdt_des" value="${bean.bdt_des}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>状态</th>
					<td>
						<input id="bdt_status" name="bdt_status"
								class="easyui-combobox"
								data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2006',valueField:'bd_code',textField:'bd_name',panelHeight:'auto',required:true"
								value="${bean.bdt_status}" />
					</td>
				</tr>	
				<input type="hidden" name="bdt_id" value="${bean.bdt_id}" />
				
				<input name="bdt_dr" value="${bean.bdt_dr}" type="hidden" />
			</table>
		</fieldset>
	</form>
</body>
</html>
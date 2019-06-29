<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			var url = sy.contextPath + '/admin/baseTagControl/update.action';
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
	
	
		$(function() {
		   //$('#').combobox('setValue','');
		});
		
		function updateFun(){
			if ($('form').form('validate')) {
				var url;
				url = sy.contextPath + '/admin/baseTagControl/update.action';
				$.post(url, sy.serializeObject($('form')), function(result) {
					if (result.success) {
					    $.messager.alert('',result.msg);
						window.location.href=sy.contextPath + '/admin/baseTagControl/listPage.action';
					} else {
						$.messager.show({title : '提示',msg : result.msg});
					}
				}, 'json');
			}
		}
		
		
		function goBackFun(){
			window.location.href=sy.contextPath + '/base/baseTagControl/listPage.action';
		}
		
		
</script>
</head>
<body>
	<form method="post" class="form">
		<table class="table" style="width: 100%;">
			<tr >
				<th colspan="10">
					<div style="text-align: right;padding-right: 5px;padding-bottom: 5px;">
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-database_save',plain:true" onclick="updateFun();">保存</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-database_go',plain:true" onclick="goBackFun();">返回</a>
					</div>
				</th>
			</tr>
		</table>
		
		<fieldset>
			<legend>基本信息</legend>
			<table class="table" style="width: 100%;">
				<input name="bt_id" value="${bean.bt_id}" type="hidden" />
				<tr>	
					<th>标签名称</th>
					<td>
						<input name="bt_title" value="${bean.bt_title}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>标签编码</th>
					<td>
						<input name="bt_code" value="${bean.bt_code}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>标签类型 1-用户 2-房子 </th>
					<td>
						<input name="bt_type" value="${bean.bt_type}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>图标</th>
					<td>
						<input name="bt_icon" value="${bean.bt_icon}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>1在前台显示 2 不在前台显示</th>
					<td>
						<input name="bt_is_show" value="${bean.bt_is_show}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>标签排序</th>
					<td>
						<input name="bt_order" value="${bean.bt_order}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
			
				<tr>	
					<th>标签状态 1-启用 0-禁用</th>
					<td>
						<input name="bt_status" value="${bean.bt_status}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
			
			</table>
		</fieldset>
	</form>
</body>
</html>
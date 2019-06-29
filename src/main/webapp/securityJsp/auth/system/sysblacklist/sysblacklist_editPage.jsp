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
			
			url = sy.contextPath + '/system/sysBlackListControl/update.action';
			
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
				url = sy.contextPath + '/system/sysBlackListControl/update.action';
				$.post(url, sy.serializeObject($('form')), function(result) {
					if (result.success) {
					    $.messager.alert('',result.msg);
						window.location.href=sy.contextPath + '/system/sysBlackListControl/listPage.action';
					} else {
						$.messager.show({title : '提示',msg : result.msg});
					}
				}, 'json');
			}
		}
		
		
		function goBackFun(){
			window.location.href=sy.contextPath + '/system/sysBlackListControl/listPage.action';
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

			<input type="hidden" name="sbl_id" value="${bean.sbl_id}"  />
	
				<tr>	
					<th>平台</th>
					<td>
						<input id="sbl_type" name="sbl_type" class="easyui-combobox"   data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2086',valueField:'bd_code',textField:'bd_name',panelHeight:'auto'" value="${bean.sbl_type }" />
					</td>
				</tr>	
				<tr>	
					<th>用户对应id</th>
					<td>
						<input name="sbl_userid" value="${bean.sbl_userid}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>
				<tr>	
					<th>用户对应手机</th>
					<td>
						<input name="sbl_mobile" value="${bean.sbl_mobile}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>ip地址</th>
					<td>
						<input name="sbl_ip" value="${bean.sbl_ip}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>原因</th>
					<td>
						<input name="sbl_note" value="${bean.sbl_note}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	

	
			</table>
		</fieldset>
	</form>
</body>
</html>
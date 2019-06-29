<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.xianghuan.util.SecurityUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<%
	String sr_id = request.getParameter("sr_id");
	if (sr_id == null) {
		sr_id = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var submitForm = function($dialog, $userGrid, $pjq) {
		var nodes = grid.datagrid('getChecked', [ 'checked', 'indeterminate' ]);
		var ids = [];
		for (var i = 0; i < nodes.length; i++) {
			ids.push(nodes[i].su_id);
		}
		$.post(sy.contextPath + '/system/sysUserControl/roleGrantUser.action', {
			sr_id : $('input[name="sr_id"]').val(),
			ids : ids.join(',')
		}, function(result) {
			if (result.success) {
				$pjq.messager.alert('提示', '添加成功！', 'info');
				$dialog.dialog('destroy');
				$userGrid.datagrid('load');
			} else {
				$pjq.messager.alert('提示', result.msg, 'error');
			}
		}, 'json');
	};
	$(function() {
		parent.$.messager.progress({
			text : '数据加载中....'
		});
		grid = $('#grid').datagrid({
			title : '',
			queryParams:sy.serializeObject($('#searchForm')),
			url : sy.contextPath + '/system/sysUserControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			checkbox : true,
			singleSelect : false,
 			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			checkOnSelect : false,
			selectOnCheck : false,
			frozenColumns : [ [ 
				{checkbox:true},
				{width : '100', title : '用户编号', field :'su_id', sortable : true, hidden:true}, 
				{width : '120', title : '用户名', field : 'su_name', sortable : true},
		        {width : '120', title : '登录账号', field : 'su_loginname', sortable : true},
		        {width : '120', title : '手机号', field : 'su_phone', sortable : true},
		        {width : '120', title : '邮箱', field : 'su_email', sortable : true}] ],
		        toolbar : '#toolbar',
		});
		parent.$.messager.progress('close');
	});
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<td>
					<form id="searchForm">
						<table>
							<tr>
								<td>用户名</td>
								<td><input name="su_name_query" placeholder="用户名" /></td>
								<td>登录账号</td>
								<td><input name="su_loginname_query" placeholder="登陆账号" /></td>
								<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">过滤</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置过滤</a></td>
								<input name="su_status" value="1" type="hidden">
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<input name="sr_id" value="${param.sr_id}" readonly="readonly" type="hidden" />
	<fieldset>
		<ul id="grid"></ul>
	</fieldset>
</body>
</html>
<%@page import="com.xianghuan.auth.system.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.xianghuan.util.SecurityUtil"%>
<%
	String contextPath = request.getContextPath();
	SecurityUtil securityUtil = new SecurityUtil(session);
%>
<!DOCTYPE html>
<html>
<head>
<title>管理列表</title>
<jsp:include page="../../../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var grid;
	var addFun = function() {
		var dialog = parent.sy.modalDialog({
			width :  380,
			height : 260,
			title : '添加信息',
			url : sy.contextPath + '/system/sysSystemControl/addPage.action',
			buttons : [ {
				text : '添加',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}, {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	
	var showFun = function( ss_id) {
		var dialog = parent.sy.modalDialog({
			width :  380,
			height : 400,
			title : '查看信息',
			url : sy.contextPath + '/system/sysSystemControl/detailPage.action?ss_id='+ss_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var editFun = function(ss_id) {
		var dialog = parent.sy.modalDialog({
			width :  380,
			height : 260,
			title : '编辑信息',
			url : sy.contextPath + '/system/sysSystemControl/editPage.action?ss_id=' + ss_id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
					$('#grid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				}
			}, {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var removeFun = function( ss_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/system/sysSystemControl/delete.action', {
					 ss_id : ss_id
				}, function() {
					grid.datagrid('reload');
					$('#grid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				}, 'json');
			}
		});
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/system/sysSystemControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : ' ss_id',
			sortName : ' ss_id',
			sortOrder : 'asc',
			//frozenColumns : 
			columns : [ [ 
			             
					{width : '100', title : 'PK', field :'ss_id', sortable : true,hidden:true}, 
					{width : '100', title : '系统编码', field :'ss_code', sortable : true,hidden:false}, 
					{width : '100', title : '系统名称', field :'ss_name', sortable : true,hidden:false}, 
					{width : '100', title : '域名前缀', field :'ss_url', sortable : true,hidden:false}, 
					{width : '100', title : '系统描述', field :'ss_desc', sortable : true,hidden:false}, 
					{width : '100', title : '新增人', field :'ss_adduser', sortable : true,hidden:false}, 
					{width : '100', title : '新增日期 ', field :'ss_adddate', sortable : true,hidden:false}, 
					{width : '100', title : '最后修改人', field :'ss_modifyuser', sortable : true,hidden:false}, 
					{width : '100', title : '最后修改日期', field :'ss_modifydate', sortable : true,hidden:false}, 
					{width : '100', title : '删除人', field :'ss_deleteuser', sortable : true,hidden:false}, 
					{width : '100', title : '删除日期', field :'ss_deletedate', sortable : true,hidden:false}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/system/sysSystemControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.ss_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysSystemControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.ss_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysSystemControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.ss_id);
					<%//}%>
					return str;
				}
			} ] ],
			toolbar : '#toolbar',
			onBeforeLoad : function(param) {
				parent.$.messager.progress({
					text : '数据加载中....'
				});
			},
			onDblClickRow: function (rowIndex, rowData) {
				showFun(rowData. ss_id);
			},
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', sy.pixel_0);
				parent.$.messager.progress('close');
			}
		});
	});
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<%//if (securityUtil.havePermission("/system/sysSystemControl/addPage")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
				<%//}%>
				<td>
					<form id="searchForm">
						<table>
							<tr>
								<th>系统名称</th>
								<td><input name="ss_name" placeholder="系统名称模糊查询" class="span2" /></td>
								<th>系统编码</th>
								<td><input name="ss_code" placeholder="系统编码模糊查询" class="span2" /></td>
								<td>
									<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">过滤</a>
									<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置过滤</a>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
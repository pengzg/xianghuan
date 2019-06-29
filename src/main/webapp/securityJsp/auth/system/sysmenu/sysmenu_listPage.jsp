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
			width :  800,
			height : 500,
			title : '添加信息',
			url : sy.contextPath + '/system/sysMenuControl/addPage.action',
			buttons : [ {
				text : '添加',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
					$('#searchBox').searchbox('setValue','');
					grid.datagrid('load',{});
				}
			}, {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	
	var showFun = function(id) {
		var dialog = parent.sy.modalDialog({
			width :  800,
			height : 500,
			title : '查看信息',
			url : sy.contextPath + '/system/sysMenuControl/detailPage.action?sm_id='+id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var editFun = function(id) {
		var dialog = parent.sy.modalDialog({
			width :  800,
			height : 500,
			title : '编辑信息',
			url : sy.contextPath + '/system/sysMenuControl/editPage.action?sm_id=' + id,
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
	var removeFun = function(id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/system/sysMenuControl/delete.action', {
					 sm_id : id
				}, function() {
					grid.treegrid('reload');
					$('#grid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				}, 'json');
			}
		});
	};
	var redoFun = function() {
		var node = grid.treegrid('getSelected');
		if (node) {
			grid.treegrid('expandAll', node.sm_id);
		} else {
			grid.treegrid('expandAll');
		}
	};
	var undoFun = function() {
		var node = grid.treegrid('getSelected');
		if (node) {
			grid.treegrid('collapseAll', node.sm_id);
		} else {
			grid.treegrid('collapseAll');
		}
	};
	$(function() {
		grid = $('#grid').treegrid({
			title : '',
			url : sy.contextPath + '/system/sysMenuControl/treeGrid.action',
			idField : 'id',
			treeField : 'sm_name',
			parentField : 'sm_pid',
			rownumbers : true,
			pagination : false,
			sortName : 'sm_seq',
			sortOrder : 'asc',
			frozenColumns : [ [ 
								{width : '100', title : 'PK', field :'id', sortable : true,hidden:true}, 
					{width : '200', title : '菜单名称', field :'sm_name', sortable : true,hidden:false}
			] ],
			
			columns : [ [ 
					{width : '220', title : '访问地址', field :'sm_url', sortable : true,hidden:false}, 
					{width : '100', title : 'sm_pid', field :'sm_pid', sortable : true,hidden:true}, 
					{width : '100', title : '上级节点', field :'sm_pid', sortable : true,hidden:true}, 
					{width : '150', title : '图标', field :'sm_iconcls', sortable : true,hidden:false}, 
					{width : '60', title : '菜单类型', field :'sm_typeid', sortable : true,hidden:false,
						formatter : function(value, row, index) {switch (value) {case '1':return '菜单';case '2':return '功能';}}}, 
					{width : '60', title : '序号', field :'sm_seq', sortable : true,hidden:false}, 
					{width : '80', title : '目标', field :'sm_target', sortable : true,hidden:false}, 
					{width : '80', title : '状态', field :'sm_status', sortable : true,hidden:false,
						formatter : function(value, row, index) {switch (value) {case '1':return '启用';case '0':return '禁用';}}}, 
					{width : '100', title : '所属系统', field :'ss_name', sortable : true,hidden:false}, 
					{width : '100', title : '描述', field :'sm_description', sortable : true,hidden:false}, 
				{ 
					width : '60', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/system/sysMenuControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysMenuControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysMenuControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.id);
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
				showFun(rowData.sm_id);
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
				<%//if (securityUtil.havePermission("/system/sysMenuControl/addPage")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
				<%//}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td>
					<a onclick="redoFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ext-icon-resultset_next'">展开</a>
					<a onclick="undoFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ext-icon-resultset_previous'">折叠</a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a onclick="grid.treegrid('reload');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'ext-icon-arrow_refresh'">刷新</a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><input id="searchBox" class="easyui-searchbox" style="width: 150px" data-options="searcher:function(value,sm_name){grid.datagrid('load',{'sm_name':value});},prompt:'搜索名称'"></input></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchBox').searchbox('setValue','');grid.datagrid('load',{});">清空查询</a></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
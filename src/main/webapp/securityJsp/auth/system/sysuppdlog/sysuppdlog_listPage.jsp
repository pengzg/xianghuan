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
			//width :  680,
			//height : 300,
			title : '添加信息',
			url : sy.contextPath + '/system/sysUppdLogControl/addPage.action',
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
	
	var showFun = function( sul_id) {
		var dialog = parent.sy.modalDialog({
			title : '查看信息',
			url : sy.contextPath + '/system/sysUppdLogControl/detailPage.action?sul_id='+sul_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var editFun = function(sul_id) {
		var dialog = parent.sy.modalDialog({
			//width :  680,
			//height : 300,
			title : '编辑信息',
			url : sy.contextPath + '/system/sysUppdLogControl/editPage.action?sul_id=' + sul_id,
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
	var removeFun = function( sul_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/system/sysUppdLogControl/delete.action', {
					 sul_id : sul_id
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
			url : sy.contextPath + '/system/sysUppdLogControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : ' sul_id',
			sortName : ' sul_id',
			sortOrder : 'asc',
			//frozenColumns : 
			columns : [ [ 
			             
					{width : '100', title : 'sul_id', field :'sul_id', sortable : true,hidden:false}, 
					{width : '100', title : 'sul_creatid', field :'sul_creatid', sortable : true,hidden:false}, 
					{width : '100', title : 'sul_uptime', field :'sul_uptime', sortable : true,hidden:false}, 
					{width : '100', title : 'sul_oldpd', field :'sul_oldpd', sortable : true,hidden:false}, 
					{width : '100', title : 'sul_newpd', field :'sul_newpd', sortable : true,hidden:false}, 
					{width : '100', title : 'sul_inserttime', field :'sul_inserttime', sortable : true,hidden:false}, 
					{width : '100', title : 'sul_sp_id', field :'sul_sp_id', sortable : true,hidden:false}, 
					{width : '100', title : 'sul_desc', field :'sul_desc', sortable : true,hidden:false}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/system/sysUppdLogControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.sul_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysUppdLogControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.sul_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysUppdLogControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.sul_id);
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
				showFun(rowData. sul_id);
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
				<%//if (securityUtil.havePermission("/system/sysUppdLogControl/addPage")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
				<%//}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><input id="searchBox" class="easyui-searchbox" style="width: 150px" data-options="searcher:function(value,name){grid.datagrid('load',{'QUERY_t#name_S_LK':value});},prompt:'搜索名称'"></input></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchBox').searchbox('setValue','');grid.datagrid('load',{});">清空查询</a></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
<%@page import="com.xianghuan.admin.basetag.model.*" %>
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
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var grid;
	var addFun = function() {
	// 	window.location.href=sy.contextPath + '/admin/baseTagControl/addPage.action';
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 300,
			title : '添加信息',
			url : sy.contextPath + '/admin/baseTagControl/addPage.action',
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
	
	var showFun = function(bt_id) {
		// window.location.href=sy.contextPath + '/base/baseTagControl/detailPage.action?bt_id='+bt_id;
		
		var dialog = parent.sy.modalDialog({
			title : '查看信息',
			url : sy.contextPath + '/admin/baseTagControl/detailPage.action?bt_id='+bt_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
		
	};
	var editFun = function(bt_id) {
		// window.location.href=sy.contextPath + '/base/baseTagControl/editPage.action?bt_id='+bt_id;
		
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 300,
			title : '编辑信息',
			url : sy.contextPath + '/admin/baseTagControl/editPage.action?bt_id=' + bt_id,
			buttons : [ {
				text : '编辑',
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
	var removeFun = function( bt_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/admin/baseTagControl/remove.action', {
					 bt_id : bt_id
				}, function() {
					grid.datagrid('reload');
				}, 'json');
			}
		});
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/admin/baseTagControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : ' bt_id',
			sortName : ' bt_id',
			sortOrder : 'asc',
			//frozenColumns : 
			columns : [ [ 
			             
					{width : '100', title : '主键', field :'bt_id', sortable : true,hidden:true}, 
					{width : '100', title : '标签名称', field :'bt_title', sortable : true,hidden:false}, 
					{width : '100', title : '标签编码', field :'bt_code', sortable : true,hidden:false}, 
					{width : '100', title : '标签类型 1-用户 2-房子 ', field :'bt_type', sortable : true,hidden:false}, 
					{width : '100', title : '图标', field :'bt_icon', sortable : true,hidden:false}, 
					{width : '100', title : '1在前台显示 2 不在前台显示', field :'bt_is_show', sortable : true,hidden:false}, 
					{width : '100', title : '标签排序', field :'bt_order', sortable : true,hidden:false}, 
					{width : '100', title : '添加人', field :'bt_adduserid_nameref', sortable : true,hidden:false}, 
					{width : '100', title : '标签状态 1-启用 0-禁用', field :'bt_status', sortable : true,hidden:false}, 
					{width : '100', title : '删除标识位', field :'bt_dr', sortable : true,hidden:false}, 
					{width : '100', title : '创建时间', field :'bt_addtime', sortable : true,hidden:false}, 
					{width : '100', title : '修改时间', field :'bt_updatetime', sortable : true,hidden:false}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/base/baseTagControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.bt_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/baseTagControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.bt_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/baseTagControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.bt_id);
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
				showFun(rowData. bt_id);
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
				<%//if (securityUtil.havePermission("/base/baseTagControl/addPage")) {%>
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
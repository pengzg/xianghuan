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
			url : sy.contextPath + '/system/sysUserUnityControl/addPage.action',
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
	
	var showFun = function(suu_id) {
		var dialog = parent.sy.modalDialog({
			title : '查看信息',
			url : sy.contextPath + '/system/sysUserUnityControl/detailPage.action?suu_id='+suu_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var editFun = function(suu_id) {
		var dialog = parent.sy.modalDialog({
			//width :  680,
			//height : 300,
			title : '编辑信息',
			url : sy.contextPath + '/system/sysUserUnityControl/editPage.action?suu_id=' + suu_id,
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
	var removeFun = function( suu_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/system/sysUserUnityControl/delete.action', {
					 suu_id : suu_id
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
			url : sy.contextPath + '/system/sysUserUnityControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : ' suu_id',
			sortName : ' suu_id',
			sortOrder : 'asc',
			//frozenColumns : 
			columns : [ [ 
			             
					{width : '100', title : '主键ID', field :'suu_id', sortable : true,hidden:false}, 
					{width : '100', title : '用户ID', field :'suu_ub_id', sortable : true,hidden:false}, 
					{width : '100', title : '用户名称', field :'suu_ub_name', sortable : true,hidden:false}, 
					{width : '100', title : '用户类型1.部门；2代理；3商户；4推广人；5终端用户', field :'suu_ub_type', sortable : true,hidden:false}, 
					{width : '100', title : '状态（0.禁用；1.启用）', field :'suu_status', sortable : true,hidden:false}, 
					{width : '100', title : '删除标志位:0删除，1未删除', field :'suu_dr', sortable : true,hidden:false}, 
					{width : '100', title : '时间', field :'suu_ts', sortable : true,hidden:false}, 
					{width : '100', title : '版本号', field :'suu_version', sortable : true,hidden:false}, 
					{width : '100', title : '新增人', field :'suu_adduser', sortable : true,hidden:false}, 
					{width : '100', title : '新增日期', field :'suu_adddate', sortable : true,hidden:false}, 
					{width : '100', title : '最后修改人', field :'suu_modifyuser', sortable : true,hidden:false}, 
					{width : '100', title : '最后修改日期', field :'suu_modifydate', sortable : true,hidden:false}, 
					{width : '100', title : '删除人', field :'suu_deleteuser', sortable : true,hidden:false}, 
					{width : '100', title : '删除日期', field :'suu_deletedate', sortable : true,hidden:false}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/system/sysUserUnityControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.suu_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysUserUnityControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.suu_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysUserUnityControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.suu_id);
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
				showFun(rowData. suu_id);
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
				<%//if (securityUtil.havePermission("/system/sysUserUnityControl/addPage")) {%>
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
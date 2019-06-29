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
			width :  600,
			height : 350,
			title : '添加信息',
			url : sy.contextPath + '/base/bparameterConfControl/addPage.action',
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
	
	var showFun = function(bpc_id) {
		var dialog = parent.sy.modalDialog({
			title : '查看信息',
			url : sy.contextPath + '/base/bparameterConfControl/detailPage.action?bpc_id='+bpc_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var editFun = function(bpc_id) {
		var dialog = parent.sy.modalDialog({
			//width :  680,
			//height : 300,
			title : '编辑信息',
			url : sy.contextPath + '/base/bparameterConfControl/editPage.action?bpc_id=' + bpc_id,
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
	var removeFun = function( bpc_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/base/bparameterConfControl/remove.action', {
					 bpc_id : bpc_id
				}, function() {
					grid.datagrid('reload');
				}, 'json');
			}
		});
	};
	
	var batchDeleteFun = function() {
		var rows = grid.datagrid('getChecked');
		var ids = [];
		$.each(rows, function(index, item){
			 ids.push(item.bpc_id);
		});
		if (rows.length > 0) {
			parent.$.messager.confirm('确认', '您确认要批量删除数据吗？', function(r) {
				if (r) {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.post(sy.contextPath + '/base/bparameterConfControl/removeMulti.action', {
						ids : ids.join(',')
					}, function() {
						grid.datagrid('reload');
					}, 'json');
				}
			});
		} else {
			parent.$.messager.alert('提示', '请勾选要删除的记录！', 'success');
		}
	};
	
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/base/bparameterConfControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : false,
			//idField : ' bpc_id',
			sortName : ' bpc_id',
			sortOrder : 'asc',
			frozenColumns:[[
						{width : '100', title : '主键', field :'bpc_id',sortable : true, hidden:false, checkbox:true}, 	
						{width : '100', title : '编码', field :'bpc_key_code', sortable : true,hidden:false}
			                 ]],
			columns : [ [ 
						{width : '250', title : '值', field :'bpc_value', sortable : true,hidden:false}, 
						{width : '280', title : '备注说明', field :'bpc_remark', sortable : true,hidden:false}, 
						{width : '80', title : '状态', field :'bpc_status_nameref', sortable : true,hidden:false},
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/base/bparameterConfControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.bpc_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/bparameterConfControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.bpc_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/bparameterConfControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.bpc_id);
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
				showFun(rowData. bpc_id);
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
				<%//if (securityUtil.havePermission("/base/bparameterConfControl/addPage")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_delete',plain:true" onclick="batchDeleteFun();">批量删除</a></td>
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
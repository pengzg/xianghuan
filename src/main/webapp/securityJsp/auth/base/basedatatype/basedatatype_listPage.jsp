<%@page import="com.xianghuan.auth.base.model.*" %>
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
			width :  480,
			height : 300,
			title : '添加信息',
			url : sy.contextPath + '/base/baseDatatypeControl/addPage.action',
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
	
	var showFun = function( bdt_id) {
		var dialog = parent.sy.modalDialog({
			width :  480,
			height : 300,
			title : '查看信息',
			url : sy.contextPath + '/base/baseDatatypeControl/detailPage.action?bdt_id='+bdt_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var editFun = function(bdt_id) {
		var dialog = parent.sy.modalDialog({
			width :  480,
			height : 300,
			title : '编辑信息',
			url : sy.contextPath + '/base/baseDatatypeControl/editPage.action?bdt_id=' + bdt_id,
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
	var removeFun = function( bdt_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/base/baseDatatypeControl/delete.action', {
					 bdt_id : bdt_id
				}, function() {
					grid.datagrid('reload');
					$('#grid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				}, 'json');
			}
		});
	};
	
	
	var refreshFun = function() {
		parent.$.messager.confirm('询问', '您确定要同步更新吗？', function(r) {
			if (r) {
				$.messager.progress({
					title:"提示",
					msg:"正在执行中,请稍后....",
					text:"",
					interval:500
				}); 
				
				
				$.post(sy.contextPath + '/base/baseDatatypeControl/synchroFlush.action',{},function(data){
					var datas=eval('('+data+')');
					$.messager.progress("close");
					if(datas.success){													
					}
					$.messager.alert("提示",datas.msg);
				});
			}
		});
	};
	
	
	
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/base/baseDatatypeControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			sortName : ' bdt_id',
			sortOrder : 'asc',
			//idField : ' bdt_id',
			//frozenColumns : 
			columns : [ [ 
			             
					{width : '100', title : '主键', field :'bdt_id', sortable : true,hidden:true}, 
					{width : '100', title : '编码', field :'bdt_code', sortable : true,hidden:false}, 
					{width : '240', title : '名称', field :'bdt_name', sortable : true,hidden:false}, 
					{width : '100', title : '排序', field :'bdt_order', sortable : true,hidden:false}, 
					{field : 'bdt_isgroup',title : '级别',width : 100,sortable : true, 
						formatter : function(value, row, index) {switch (value) {case '1':return '集团';case '2':return '公司';}}}, 
					
					{field : 'bdt_type',title : '类型',width : 100,sortable : true, 
						formatter : function(value, row, index) {switch (value) {case '0':return '用户';case '1':return '系统';}}}, 
					{width : '100', title : '描述', field :'bdt_des', sortable : true,hidden:false}, 
					{field : 'bdt_status',title : '状态',width : 100,sortable : true, 
						formatter : function(value, row, index) {switch (value) {case '0':return '禁用';case '1':return '启用';}}}, 
						
					{width : '100', title : '', field :'def1', sortable : true,hidden:true}, 
					{width : '100', title : '', field :'def2', sortable : true,hidden:true}, 
					{width : '100', title : '', field :'bdt_dr', sortable : true,hidden:true}, 
					{width : '100', title : '', field :'bdt_ts', sortable : true,hidden:true}, 
					{width : '100', title : '', field :'bdt_version', sortable : true,hidden:true}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/base/baseDatatypeControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.bdt_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/baseDatatypeControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.bdt_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/baseDatatypeControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.bdt_id);
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
				showFun(rowData. bdt_id);
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
				<%//if (securityUtil.havePermission("/base/baseDatatypeControl/addPage")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-arrow_refresh',plain:true" onclick="refreshFun();">同步更新</a></td>
				<%//}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><input id="searchBox" class="easyui-searchbox" style="width: 150px" data-options="searcher:function(value,name){grid.datagrid('load',{'bdt_name_like':value});},prompt:'搜索名称'"></input></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchBox').searchbox('setValue','');grid.datagrid('load',{});">清空查询</a></td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
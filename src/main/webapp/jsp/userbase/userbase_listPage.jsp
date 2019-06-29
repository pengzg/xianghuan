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
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var grid;
	var addFun = function() {
		window.location.href=sy.contextPath + '/admin/userBaseControl/addPage.action';
		/*
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 300,
			title : '添加信息',
			url : sy.contextPath + '/base/userBaseControl/addPage.htm',
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
		*/
	};
	
	var showFun = function(ub_id) {
		window.location.href=sy.contextPath + '/admin/userBaseControl/detailPage.action?ub_id='+ub_id;
		/*
		var dialog = parent.sy.modalDialog({
			title : '查看信息',
			url : sy.contextPath + '/base/userBaseControl/detailPage.htm?ub_id='+ub_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
		*/
	};
	var editFun = function(ub_id) {
		window.location.href=sy.contextPath + '/admin/userBaseControl/editPage.action?ub_id='+ub_id;
		/*
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 300,
			title : '编辑信息',
			url : sy.contextPath + '/base/userBaseControl/editPage.htm?ub_id=' + ub_id,
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
		*/
	};
	var removeFun = function( ub_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/admin/userBaseControl/remove.action', {
					 ub_id : ub_id
				}, function() {
					grid.datagrid('reload');
				}, 'json');
			}
		});
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/admin/userBaseControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : ' ub_id',
			sortName : ' ub_id',
			sortOrder : 'asc',
			//frozenColumns : 
			columns : [ [ 
			             
					{width : '100', title : '', field :'ub_id', sortable : true,hidden:false}, 
					{width : '100', title : '用户真实姓名', field :'ub_realname', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'ub_username', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'ub_mobile', sortable : true,hidden:false}, 
					{width : '100', title : '经度', field :'ub_lng', sortable : true,hidden:false}, 
					{width : '100', title : '纬度', field :'ub_lat', sortable : true,hidden:false}, 
					{width : '100', title : '微信openid', field :'ub_openid', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'ub_unionid', sortable : true,hidden:false}, 
					{width : '100', title : '邮件', field :'ub_email', sortable : true,hidden:false}, 
					{width : '100', title : '性别 ', field :'ub_sex', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'ub_last_logintime', sortable : true,hidden:false}, 
					{width : '100', title : '注册时间', field :'ub_regtime', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'ub_pinyin', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'ub_status', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'ub_dr', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'ub_addtime', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'ub_updatetime', sortable : true,hidden:false}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.ub_id);
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.ub_id);
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.ub_id);
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
				showFun(rowData. ub_id);
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
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
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
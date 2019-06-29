<%@page import="com.xianghuan.admin.baseservice.model.*" %>
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
		// window.location.href=sy.contextPath + '/admin/baseServiceControl/addPage.action';
		
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 300,
			title : '添加信息',
			url : sy.contextPath + '/admin/baseServiceControl/addPage.action',
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
	
	var showFun = function(bs_id) {
		window.location.href=sy.contextPath + '/admin/baseServiceControl/detailPage.action?bs_id='+bs_id;
		/*
		var dialog = parent.sy.modalDialog({
			title : '查看信息',
			url : sy.contextPath + '/base/baseServiceControl/detailPage.action?bs_id='+bs_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
		*/
	};
	var editFun = function(bs_id) {
		// window.location.href=sy.contextPath + '/admin/baseServiceControl/editPage.action?bs_id='+bs_id;
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 300,
			title : '编辑信息',
			url : sy.contextPath + '/admin/baseServiceControl/editPage.action?bs_id=' + bs_id,
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
	var removeFun = function( bs_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/admin/baseServiceControl/remove.action', {
					 bs_id : bs_id
				}, function() {
					grid.datagrid('reload');
				}, 'json');
			}
		});
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/admin/baseServiceControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			idField : ' bs_id',
			sortName : ' bs_id',
			sortOrder : 'asc',
			//frozenColumns : 
			columns : [ [ 
			             
					{width : '100', title : '自增id', field :'bs_id', sortable : true,hidden:false}, 
					{width : '100', title : '类别id', field :'bs_categoryid', sortable : true,hidden:false}, 
					{width : '100', title : '类别编码', field :'bs_categorycode', sortable : true,hidden:false}, 
					{width : '100', title : '公司名 ', field :'bs_name', sortable : true,hidden:false}, 
					{width : '100', title : '联系人电话', field :'bs_mobile', sortable : true,hidden:false}, 
					{width : '100', title : '联系人姓名', field :'bs_contact_name', sortable : true,hidden:false}, 
					{width : '100', title : '地址', field :'bs_address', sortable : true,hidden:false}, 
					{width : '100', title : '图片', field :'bs_image', sortable : true,hidden:false}, 
					{width : '100', title : '拨打数量', field :'bs_clicknum', sortable : true,hidden:false}, 
					{width : '100', title : '经度', field :'bs_lng', sortable : true,hidden:false}, 
					{width : '100', title : ' 纬度', field :'bs_lat', sortable : true,hidden:false}, 
					{width : '100', title : '简介 ', field :'bs_intro', sortable : true,hidden:false}, 
					{width : '100', title : '评价星级', field :'bs_star', sortable : true,hidden:false}, 
					{width : '100', title : '备注', field :'bs_note', sortable : true,hidden:false}, 
					{width : '100', title : '工作时间', field :'bs_officehour', sortable : true,hidden:false}, 
					{width : '100', title : '排序', field :'bs_vieworder', sortable : true,hidden:false}, 
					{width : '100', title : '状态 ', field :'bs_state', sortable : true,hidden:false}, 
					{width : '100', title : '删除标记位', field :'bs_dr', sortable : true,hidden:false}, 
					{width : '100', title : '添加时间', field :'bs_addtime', sortable : true,hidden:false}, 
					{width : '100', title : '更新时间', field :'bs_updatetime', sortable : true,hidden:false},
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/base/baseServiceControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.bs_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/baseServiceControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.bs_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/baseServiceControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.bs_id);
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
				showFun(rowData. bs_id);
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
				<%//if (securityUtil.havePermission("/base/baseServiceControl/addPage")) {%>
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
<%@page import="com.xianghuan.admin.house.model.*" %>
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
		window.location.href=sy.contextPath + '/admin/houseBaseControl/addPage.action';
		/*
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 300,
			title : '添加信息',
			url : sy.contextPath + '/base/houseBaseControl/addPage.action',
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
	
	var showFun = function(hb_id) {
		window.location.href=sy.contextPath + '/admin/houseBaseControl/detailPage.action?hb_id='+hb_id;
		/*
		var dialog = parent.sy.modalDialog({
			title : '查看信息',
			url : sy.contextPath + '/base/houseBaseControl/detailPage.action?hb_id='+hb_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
		*/
	};
	var editFun = function(hb_id) {
		window.location.href=sy.contextPath + '/admin/houseBaseControl/editPage.action?hb_id='+hb_id;
		/*
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 300,
			title : '编辑信息',
			url : sy.contextPath + '/base/houseBaseControl/editPage.action?hb_id=' + hb_id,
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
	var removeFun = function( hb_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/base/houseBaseControl/remove.action', {
					 hb_id : hb_id
				}, function() {
					grid.datagrid('reload');
				}, 'json');
			}
		});
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/admin/houseBaseControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : ' hb_id',
			sortName : ' hb_id',
			sortOrder : 'asc',
			//frozenColumns : 
			columns : [ [ 
			             
					{width : '100', title : '', field :'hb_id', sortable : true,hidden:false}, 
					{width : '100', title : '标题', field :'hb_title', sortable : true,hidden:false}, 
					{width : '100', title : '简介', field :'hb_summary', sortable : true,hidden:false}, 
					{width : '100', title : '介绍', field :'hb_intro', sortable : true,hidden:false}, 
					{width : '100', title : '主图', field :'hb_cover', sortable : true,hidden:false}, 
					{width : '100', title : '用户', field :'hb_userid', sortable : true,hidden:false}, 
					{width : '100', title : '联系电话', field :'hb_contacts_mobile', sortable : true,hidden:false}, 
					{width : '100', title : '联系人姓名', field :'hb_contacts_name', sortable : true,hidden:false}, 
					{width : '100', title : '发布时间', field :'hb_posttime', sortable : true,hidden:false}, 
					{width : '100', title : '地址', field :'hb_address', sortable : true,hidden:false}, 
					{width : '100', title : '价格', field :'hb_price', sortable : true,hidden:false}, 
					{width : '100', title : '价格区间 ', field :'hb_price_range', sortable : true,hidden:false}, 
					{width : '100', title : '经度', field :'hb_lng', sortable : true,hidden:false}, 
					{width : '100', title : '纬度 ', field :'hb_lat', sortable : true,hidden:false}, 
					{width : '100', title : '是否显示  1是 2 不显示', field :'hb_isshow', sortable : true,hidden:false}, 
					{width : '100', title : '标签', field :'hb_tag', sortable : true,hidden:false}, 
					{width : '100', title : '状态  1正常', field :'hb_status', sortable : true,hidden:false}, 
					{width : '100', title : '1正常', field :'hb_dr', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'hb_addtime', sortable : true,hidden:false}, 
					{width : '100', title : '', field :'hb_updatetime', sortable : true,hidden:false}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/base/houseBaseControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.hb_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/houseBaseControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.hb_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/base/houseBaseControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.hb_id);
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
				showFun(rowData. hb_id);
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
				<%//if (securityUtil.havePermission("/base/houseBaseControl/addPage")) {%>
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
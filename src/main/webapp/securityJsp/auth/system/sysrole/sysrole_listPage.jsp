<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.xianghuan.util.SecurityUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
	SecurityUtil securityUtil = new SecurityUtil(session);
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var grid,sr_id,grantTree,menuGrid,viewDialog;
	var addFun = function() {
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 375,
			title : '添加角色信息',
			url : sy.contextPath + '/system/sysRoleControl/addPage.action',
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
			width :  680,
			height : 400,
			title : '查看角色信息',
			url : sy.contextPath + '/system/sysRoleControl/detailPage.action?sr_id=' + id,
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
			width :  680,
			height : 350,
			title : '编辑角色信息',
			url : sy.contextPath + '/system/sysRoleControl/editPage.action?sr_id=' + id,
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
				$.post(sy.contextPath + '/system/sysRoleControl/delete.action', {
					sr_id : id
				}, function() {
					grid.datagrid('reload');
					$('#grid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				}, 'json');
			}
		});
	};
	var grantFun = function(id) {
		var rows = grid.datagrid('getChecked');
		var dialog = parent.sy.modalDialog({
			title : '角色授权--['+rows[0].sr_name+']',
			url : sy.contextPath + '/system/sysMenuControl/sysRoleGrant.action?sr_id=' + id,
			buttons : [ {
				text : '授权',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}, {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			} ]
		});
	};
	var batchDeleteFun = function() {
		var rows = grid.datagrid('getChecked');
		var ids = [];
		$.each(rows, function(index, item){
			 ids.push(item.id);
		});
		if (rows.length > 0) {
			parent.$.messager.confirm('确认', '您是否要删除当前选中的角色？', function(r) {
				if (r) {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.post(sy.contextPath + '/system/sysRoleControl/deleteMulti.action', {
						ids : ids.join(',')
					}, function() {
						grid.datagrid('reload');
					}, 'json');
				}
			});
		} else {
			parent.$.messager.alert('提示', '请勾选要删除的角色！', 'success');
		}
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/system/sysRoleControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			idField : 'id',
			sortName : 'sr_order',
			sortOrder : 'asc',
			frozenColumns : [ [ 
				{ width : '130', title : '角色编号', field : 'id', sortable : true, checkbox:true},
				{ width : '130', title : '角色编码', field : 'sr_code', sortable : true },
				{ width : '130', title : '角色名称', field : 'sr_name', sortable : true },
				{ width : '130', title : '上级角色', field : 'name', sortable : true ,hidden:true} ] ],
			columns : [ [ 
				{ width : '130', title : '角色描述', field : 'sr_desc', sortable : true}, 
				{ width : '180', title : '部门名称', field : 'sr_so_orgid_nameref', sortable : true,hidden:true}, 
				{ width : '80', title : '顺序', field : 'sr_order', sortable : true}, 
				{ width : '80', title : '角色状态', field : 'sr_status_nameref', sortable : true}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (SecurityUtil.havePermission("/system/syroleController/getById")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/syroleController/update")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/syroleController/grant")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-key" title="授权" onclick="grantFun(\'{0}\');"/>', row.id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/syroleController/delete")) {%>
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
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', sy.pixel_0);
				parent.$.messager.progress('close');
			},
			onDblClickRow: function (rowIndex, rowData) {
				if (sr_id && sr_id === rowData.id) {
	                return;
	            }
	            // 菜单树
	            sr_id = rowData.id;
	            doGrant();
	            //用户列表
	            userGrid.datagrid({
	            	title : '',
	    			rownumbers : true,
	            	singleSelect : false,
	    			url : sy.contextPath + '/system/sysRoleControl/getUserByRoleId.action',
	    			queryParams: {sr_id : sr_id}
	            });
			}
		});
		grantTree = $('#menu_grid').datagrid({
	        fit: true,
	        border: false,
	        showHeader: false,
	        toolbar: [{
                text: '授权',
                iconCls: 'ext-icon-note_add',
                handler: toGrant
            }]
	    });
	    grantTree = $('<ul/>');
	    $('#menu_grid').data().datagrid.dc.body2.append(grantTree);
	    
	    userGrid = $('#user_grid').datagrid({
	        fit: true,
	        border: false,
	        pagination: true,
	        columns: [[
	                {checkbox: true},
	                {width : '120', title : '用户名', field : 'su_name', sortable : true},
	                {width : '120', title : '登录账号', field : 'su_loginname', sortable : true},
	                {width : '120', title : '手机号', field : 'su_phone', sortable : true},
	                {width : '120', title : '邮箱', field : 'su_email', sortable : true}
	            ]],
	        toolbar: [{
	                text: '新增',
	                iconCls: 'ext-icon-note_add',
	                handler: addRoleUserView
	            }, {
	                text: '删除',
	                iconCls: 'ext-icon-note_delete',
	                handler: doDeleteUser
	            }]
	    });
	});
	//角色授权{新增或删除}
	toGrant = function() {
		var rows = grid.datagrid('getChecked');
		var dialog = parent.sy.modalDialog({
			title : '角色授权--['+rows[0].sr_name+']',
			url : sy.contextPath + '/system/sysMenuControl/sysRoleGrant.action?sr_id=' + rows[0].id,
			buttons : [ {
				text : '授权',
				handler : function() {
					var rows = $('#grid').datagrid('getChecked');
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, toGrant, parent.$,grantTree,rows[0].id);
				}
			}, {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			} ]
		});
	};
	addRoleUserView = function() {
		var rows = grid.datagrid('getChecked');
		var dialog = parent.sy.modalDialog({
			title : '角色添加用户--['+rows[0].sr_name+']',
			url : sy.contextPath + '/system/sysUserControl/listPageRef.action?sr_id=' + rows[0].id,
			buttons : [ {
				text : '添加',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, userGrid, parent.$);
				}
			}, {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			} ]
		});
	};
	doDeleteUser = function() {
		var rows = userGrid.datagrid('getChecked');
		var ids = [];
		$.each(rows, function(index, item){
			 ids.push(item.su_id);
		});
		if (rows.length > 0) {
			parent.$.messager.confirm('确认', '您是否要删除当前选中的用户？', function(r) {
				if (r) {
					$.post(sy.contextPath + '/system/sysRoleControl/deleteUser.action', {
						ids : ids.join(',')
					}, function(result) {
						if(result.success) {
							userGrid.datagrid('reload');
						}
						$.messager.alert('提示', result.msg, 'error');
					}, 'json');
				}
			});
		} else {
			parent.$.messager.alert('提示', '请勾选要删除的用户！', 'success');
		}
	};
	
	//授权树
	function doGrant() {
	   var $layout = $('#bt_role_layout');
        var south = $layout.layout('panel', 'south');
        if (south.panel('options').collapsed) {
            $layout.layout('expand', 'south');
        }
		var rows = $('#grid').datagrid('getChecked');
		grantTree.tree({
			url : sy.contextPath + '/system/sysMenuControl/getRoleMenus.action?sr_id=' + rows[0].id,
			parentField : 'pid',
			lines : true,
			editable : true,
//    			checkbox : true,
			pagination : false,
			formatter : function(node) {
				return node.text;
			}
		});
	}
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false" id='bt_role_layout'>
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<%//if (securityUtil.havePermission("/system/syroleController/save")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
				<%//}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<%//if (securityUtil.havePermission("/system/syroleController/save")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton ext-icon-arrow_refresh" data-options="plain:true,iconCls:'ext-icon-note_delete',plain:true" onclick="batchDeleteFun();">批量删除</a></td>
				<%//}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<%//if (securityUtil.havePermission("/system/userController/save")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton ext-icon-arrow_refresh" data-options="plain:true,iconCls:'ext-icon-arrow_refresh'" onclick="grid.datagrid('reload');">刷新</a></td>
				<%//}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td><input id="searchBox" class="easyui-searchbox" style="width: 150px" data-options="searcher:function(value,sr_name){grid.datagrid('load',{'sr_name':value});},prompt:'搜索角色名称'"></input></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchBox').searchbox('setValue','');grid.datagrid('load',{});">清空查询</a></td>
			</tr>
		</table>
	</div>
	<div region="center" style="border-bottom: none;">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
    <div region="south" style="height: 250px;padding: 2px;" title="角色详情" collapsed="true" split='true'>
        <div class="easyui-layout" fit="true">
	        <div region="west" style="width: 400px;">
	            <div class="easyui-panel" fit="true" border="false" title="权限">
	            	<table id="menu_grid"></table>
	            </div>
	        </div>
            <div region="center" title="用户" style="border-left: none;">
                <table id="user_grid"></table>
            </div>
        </div>
    </div>
</body>
</html>
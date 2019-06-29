<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.xianghuan.util.SecurityUtil"%>
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
	var grid;
	var userid;
	var addFun = function(type) {
			var dialog = parent.sy.modalDialog({
				width :  680,
				height : 380,
				title : '添加用户信息',
				url : sy.contextPath + '/system/sysUserControl/addPage.action?type='+type,
				buttons : [ {
					text : '添加',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
						$('#searchForm input').val('');
						grid.datagrid('load',{});
					}
				}, {
					text : '关闭',
					handler : function() {
						dialog.dialog('destroy');
					}
				}]
			});
	};
	var showFun = function(su_id) {
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 370,
			title : '查看用户信息',
			url : sy.contextPath + '/system/sysUserControl/detailPage.action?su_id=' + su_id,
			buttons : [ {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}]
		});
	};
	var editFun = function(su_id) {
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 380,
			title : '修改用户信息',
			url : sy.contextPath + '/system/sysUserControl/editPage.action?su_id=' + su_id,
			buttons : [ {
				text : '修改',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
					$('#grid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
					}
				}, {
					text : '关闭',
					handler : function() {
						dialog.dialog('destroy');
					}
				} ]
		});
	};
	var removeFun = function(su_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/system/sysUserControl/delete.action', {
					su_id : su_id
				}, function() {
					grid.datagrid('reload');
					$('#grid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				}, 'json');
			}
		});
	};
	var grantRoleFun = function(su_id) {
		var dialog = parent.sy.modalDialog({
			title : '用户分配角色',
			url : sy.contextPath + '/system/sysRoleControl/getRolesTrees.action?su_id=' + su_id,
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
	var userOrgGrantFun = function(su_id) {
		var dialog = parent.sy.modalDialog({
			width :  480,
			height : 400,
			title : '用户部门',
			url : sy.contextPath + '/system/sysUserOrgControl/getOrgTrees.action?su_id=' + su_id,
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
			 ids.push(item.su_id);
		});
		if (rows.length > 0) {
			parent.$.messager.confirm('确认', '您是否要删除当前选中的用户？', function(r) {
				if (r) {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.post(sy.contextPath + '/system/sysUserControl/deleteMulti.action', {
						ids : ids.join(',')
					}, function() {
						grid.datagrid('reload');
					}, 'json');
				}
			});
		} else {
			parent.$.messager.alert('提示', '请勾选要删除的用户！', 'success');
		}
	}
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/system/sysUserControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			//idField : 'su_id',
			sortName : 'su_createdatetime',
			sortOrder : 'desc',
 			pageSize : 20,
			//pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			checkOnSelect : false,
			selectOnCheck : false,
			frozenColumns : [ [ 
				{width : '100', title : '用户编号', field :'su_id', sortable : true, hidden:true, checkbox:false}, 
				{width : '100', title : '登录账号', field : 'su_loginname', sortable : true},
				{width : '140', title : '姓名', field : 'su_name', sortable : true}
				] ], 
			columns : [ [ 
				{width : '30',title : '性别',field : 'su_sex_nameref',sortable : true},
				{width : '100', title : '微信号', field : 'su_wx', sortable : true, hidden:true},
				{width : '120', title : '邮箱', field : 'su_email', sortable : true},
				{width : '110', title : '手机号', field : 'su_phone', sortable : true},
				{width : '80', title : '用户角色', field : 'su_role_nameref', sortable : true},
				{width : '120', title : '部门名称', field : 'su_orgid_nameref', sortable : true},
				{width : '80',title : '状态',field : 'su_status_nameref',sortable : true},
				{ 
						width : '80', 
						title : '修改状态', 
						field : 'action2', 
						formatter : function(value, row,rowIndex) {
						var str = '';
						if (row.su_status == 1){
						str += sy.formatString('<button iconCls="icon-save" onclick="setSu_status(\'{0}\', 0);">禁用</button>', row.su_id);
					    } else {
						str += sy.formatString('<button iconCls="icon-save" onclick="setSu_status(\'{0}\', 1);">启用</button>', row.su_id);
					    }
					    
						return str;
					}},
				{width : '150',title : '操作',field : 'action',
				formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("'/system/sysUserControl/detailPage.action?su_id=' + su_id")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.su_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/userController/update")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.su_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/userController/grantRole")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-user" title="用户角色" onclick="grantRoleFun(\'{0}\');"/>', row.su_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/userController/grantOrganization")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-group" title="用户部门" onclick="userOrgGrantFun(\'{0}\');"/>', row.su_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/userController/grantOrganization")) {%>
					//str += sy.formatString('<img class="iconImg ext-icon-group" title="自提柜" onclick="userCabinetFun(\'{0}\');"/>', row.su_id);
				<%//}%>
					<%//if (securityUtil.havePermission("/system/userController/delete")) {%>
						// str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.su_id);
					<%//}%>
					return str;
				}}
	           
			] ],
			enableHeaderClickMenu: true,        //此属性开启表头列名称右侧那个箭头形状的鼠标左键点击菜单 
            enableHeaderContextMenu: true,      //此属性开启表头列名称右键点击菜单 
            enableRowContextMenu: false,
			toolbar : '#toolbar',
			onBeforeLoad : function(param) {
				parent.$.messager.progress({
					text : '数据加载中....'
				});
			},
			onDblClickRow: function (rowIndex, rowData) {
				showFun(rowData. su_id);
			},
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', sy.pixel_0);
				parent.$.messager.progress('close');
			}
		});
		
		$('#passwordDialog').show().dialog({
			modal : true,
			closable : true,
			iconCls : 'ext-icon-lock_edit',
			buttons : [ {
				text : '重置',
				handler : function() {
					if ($('#passwordDialog form').form('validate')) {
						$.post(sy.contextPath + '/system/sysUserControl/updateCurrentPassWord.action', {
							'pwd' : $('#pwd').val(),pwd1 : $('#pwd1').val(),userid:userid
						}, function(result) {
							if (result.success) {
								$('#passwordDialog').dialog('close');
							}
							$.messager.alert('提示',result.msg , 'info');
						}, 'json');
					}
				}
			} ],
			onOpen : function() {
				$('#passwordDialog form :input').val('');
			}
		}).dialog('close');
	});
	
	var resetPwd = function(){
		var getSelected = $('#grid').datagrid('getSelected');
		if(getSelected!=null) {
			userid = getSelected.su_id;
			var loginname = getSelected.su_loginname;
			var name = getSelected.su_name;
			$('#passwordDialog').dialog('open');
			$('#su_loginname1').val(loginname);
			$('#su_name1').val(name);
		}else {
			parent.$.messager.alert('提示', "请选择要操作的列!", 'success');
		}
		
	};
	function userCabinetFun(userid){
		showCabinetWin(sy.contextPath,'s',userid);
	}
	
	//同步数据
	function synData(){
		parent.$.messager.confirm('确认', '您是否确定要同步用户数据？', function(r) {
			if (r) {
				parent.$.messager.progress({
					title : '提示',
					text : '数据同步处理中，请稍后....'
				});
				$.post(sy.contextPath + '/system/sysUserControl/synUserAndShopData.action', {}, function(data) {
					if(data.success==true){
						parent.$.messager.alert('提示', "同步数据成功!", 'success');
						grid.datagrid('load',{});
					}else{
						parent.$.messager.alert('提示', "同步数据失败", 'error');					
					}
					parent.$.messager.progress('close');
				}, 'json');
			}
		});
	}
	
$(function(){
		//查询回车事件
	$("#su_name,#su_loginname").on("keydown",function(e){
		var theEvent = e || window.event;
		var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
		
		if (code == 13) {
			// 回车执行查询
			grid.datagrid('load',sy.serializeObject($('#searchForm')));
		}
	});
});
function setSu_status(su_id, status) {
	if (!su_id) {
		return false;
	}
	parent.$.messager.confirm('询问', '您确定要执行此操作吗', function(r) { 
		if (r)  {
		  	var url = sy.contextPath + '/system/sysUserControl/setStatus.action';
			var data = { 'sys_userid':su_id, 'status':status };
			$.post(url, data, function(json){
		 		if (json.success) {
		 			alert(json.msg);
		 			window.location = location.href;
		 		} else {
		 			alert(json.msg);
		 		}
		 			
			}, 'json');
		}
	});
}
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<td>
					<form id="searchForm">
						<table>
							<tr>
								<td>登录账号</td>
								<td><input id="su_loginname" name="su_loginname_query" style="width: 80px;" /></td>
								<td>姓名&nbsp;&nbsp;<input id="su_name" name="su_name_query" style="width: 80px;" /> </td>
								<td>性别</td>
								<td><select name="su_sex" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
										<option value="M">男</option>
										<option value="F">女</option></select></td>
								<td>角色</td>
							    <td>
						         <input id="su_role" name="su_role" class="easyui-combobox" 
								data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2001',
								valueField:'bd_code',textField:'bd_name',editable:false" />
								</td>
							</tr>
								
							<tr>
							<td>是否启用</td>
							<td>
								<input id="su_status" name="su_status"
								class="easyui-combobox" style="width:100px;"
								data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2006',valueField:'bd_code',textField:'bd_name',panelHeight:'auto',required:false"
								/>
							</td>
								
								<td><a href="javascript:void(0);"  class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">过滤</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置过滤</a></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<%//if (securityUtil.havePermission("/system/userController/save")) {%>
							<!-- <td><a href="javascript:void(0);" class="easyui-linkbutton ext-icon-arrow_refresh" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun(1);">添加店铺账号</a></td> -->
							<td><a href="javascript:void(0);" class="easyui-linkbutton ext-icon-arrow_refresh" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun(2);">添加后台帐号</a></td>
							<%//}%>
							<%//if (securityUtil.havePermission("/system/userController/save")) {%>
							<!-- <td><a href="javascript:void(0);" class="easyui-linkbutton ext-icon-arrow_refresh" data-options="plain:true,iconCls:'ext-icon-note_delete',plain:true" onclick="batchDeleteFun();">批量删除</a></td>
							 --><%//}%>
							 <td><div class="datagrid-btn-separator"></div></td>
							<%//if (securityUtil.havePermission("/system/userController/save")) {%>
							<td><a href="javascript:void(0);" class="easyui-linkbutton ext-icon-arrow_refresh" data-options="plain:true,iconCls:'ext-icon-arrow_refresh'" onclick="grid.datagrid('reload');">刷新</a></td>
							<td><div class="datagrid-btn-separator"></div></td>
							<td><a href="javascript:void(0);" class="easyui-linkbutton ext-icon-arrow_redo" data-options="plain:true,iconCls:'ext-icon-arrow_redo'" onclick="resetPwd();">重置密码</a></td>
							<!-- <td><a href="javascript:void(0);" class="easyui-linkbutton ext-icon-arrow_redo" data-options="plain:true,iconCls:'ext-icon-connect'" onclick="synData();">同步数据</a></td> -->
							<%//}%>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
	<div id="passwordDialog" title="重置密码" style="display: none;">
		<form method="post" class="form" onsubmit="return false;">
			<table class="table">
				<tr>
					<th>登录账号</th>
					<td><input id="su_loginname1" name="su_loginname1" type="text" class="easyui-validatebox" data-options="required:false" readonly/></td>
				</tr>
				<tr>
					<th>用户名</th>
					<td><input id="su_name1" name="su_name1" type="text" class="easyui-validatebox" data-options="required:false" readonly/></td>
				</tr>
				<tr>
					<th>新密码</th>
					<td><input id="pwd" name="pwd" type="password" class="easyui-validatebox" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>重复密码</th>
					<td><input id="pwd1" type="password" name="pwd1" class="easyui-validatebox" data-options="required:true,validType:'eqPwd[\'#pwd\']'" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
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
	var addFun = function() {
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 380,
			title : '添加关注人员信息',
			url : sy.contextPath + '/system/userAttention/addPage.action',
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
			title : '查看关注人员信息',
			url : sy.contextPath + '/system/userAttention/detailPage.action?su_id=' + su_id,
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
			title : '修改关注人员信息',
			url : sy.contextPath + '/system/userAttention/editPage.action?su_id=' + su_id,
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
				$.post(sy.contextPath + '/system/userAttention/delete.action', {
					su_id : su_id
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
			url : sy.contextPath + '/system/userAttention/dataGrid.action',
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
			/* frozenColumns : [ [ 
				] ],  */
			columns : [ [ 
			             
				{width : '100', title : '关注人员编号', field :'su_id', sortable : true, hidden:true, checkbox:false}, 
				{width : '180',title : 'Wecha_Id',field : 'su_wxid',sortable : true},
				{width : '100', title : '登录账号', field : 'su_loginname', sortable : true,hidden:false},
				{width : '140', title : '姓名', field : 'su_name', sortable : true},
				{width : '50',title : '性别',field : 'su_sex_nameref',sortable : true},
				{width : '140', title : 'email', field : 'su_email', sortable : true},
				{width : '100', title : '微信号', field : 'su_wx', sortable : true},
				{width : '100', title : 'QQ', field : 'su_qq', sortable : true},
				{width : '100', title : '认证', field : 'su_isauth_nameref', sortable : true},
				{width : '110', title : '手机号', field : 'su_phone', sortable : true},
				{width : '85',title : '操作',field : 'action',
				formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("'/system/userAttention/detailPage.action?su_id=' + su_id")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.su_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/userController/update")) {%>
						//str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.su_id);
					
					<%//if (securityUtil.havePermission("/system/userController/delete")) {%>
						//str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.su_id);
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
						$.post(sy.contextPath + '/system/userAttention/updateCurrentPassWord.action', {
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
								<td><input name="su_loginname_query" style="width: 80px;" /></td>
								<td>姓名 </td>
								<td><input name="su_name_query" style="width: 80px;" /></td>
								<td>性别</td>
								<td><select name="su_sex" class="easyui-combobox" data-options="panelHeight:'auto',editable:false"><option value="">请选择</option>
										<option value="M">男</option>
										<option value="F">女</option></select></td>
								<!-- <td>使用开始日期</td>
								<td><input name="su_startdate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" style="width: 120px;" /></td> -->
								<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">过滤</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置过滤</a></td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
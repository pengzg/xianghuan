<%@page import="com.xianghuan.auth.system.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>管理列表</title>
<jsp:include page="../../../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var gridSysActionLog;
	var addFun = function() {
		var dialog = parent.sy.modalDialog({
			//width :  680,
			//height : 300,
			title : '添加信息',
			url : sy.contextPath + '/system/sysActionLogControl/addPage.action',
			buttons : [ {
				text : '添加',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, gridSysActionLog, parent.$);
				}
			}, {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	
	var showFun = function( sal_id) {
		var dialog = parent.sy.modalDialog({
			width :  680,
			height : 370,
			title : '查看信息',
			url : sy.contextPath + '/system/sysActionLogControl/detailPage.action?sal_id='+sal_id,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var editFun = function(sal_id) {
		var dialog = parent.sy.modalDialog({
			//width :  680,
			//height : 300,
			title : '编辑信息',
			url : sy.contextPath + '/system/sysActionLogControl/editPage.action?sal_id=' + sal_id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, gridSysActionLog, parent.$);
					$('#gridSysActionLog').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				}
			}, {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var removeFun = function( sal_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/system/sysActionLogControl/delete.action', {
					 sal_id : sal_id
				}, function() {
					gridSysActionLog.datagrid('reload');
					$('#gridSysActionLog').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				}, 'json');
			}
		});
	};
	$(function() {
		gridSysActionLog = $('#gridSysActionLog').datagrid({
			title : '',
			url : sy.contextPath + '/system/sysActionLogControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : false,
			sortName : ' sal_id',
			sortOrder : 'desc',
			//frozenColumns : 
			columns : [ [ 
			             
					{width : '100', title : 'sal_id', field :'sal_id', sortable : true,checkbox:true}, 
					{width : '100', title : '操作人编号', field :'sal_creatid', sortable : true,hidden:true}, 
					{width : '100', title : '操作人姓名', field :'sal_createname', sortable : true,hidden:false}, 
					{width : '100', title : '事件名称', field :'sal_actionname', sortable : true,hidden:false}, 
					{width : '100', title : '事件类型', field :'sal_actiontype', sortable : true,hidden:false}, 
					{width : '100', title : '事件时间', field :'sal_actiontime', sortable : true,hidden:true}, 
					{width : '100', title : '所属人编号', field :'sal_ownerid', sortable : true,hidden:false}, 
					{width : '100', title : '机器IP', field :'sal_ip', sortable : true,hidden:false}, 
					{width : '100', title : '日志平台类型', field :'sal_plattype', sortable : true, formatter : function(value, row, index) {switch (value) {case '1':return '权限';}}},
					{width : '100', title : '日志类型', field :'sal_type', sortable : true, formatter : function(value, row, index) {switch (value) {case 1:return '控制层';case 2:return '业务层';}}},
					{width : '100', title : '日志描述', field :'sal_desc', sortable : true,hidden:false}, 
					{width : '100', title : '删除标志位', field :'sal_dr', sortable : true,hidden:true}, 
					{width : '100', title : '时间', field :'sal_ts', sortable : true,hidden:false}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/system/sysActionLogControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.sal_id);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysActionLogControl/editPage")) {%>
						/* str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.sal_id); */
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysActionLogControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.sal_id);
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
				showFun(rowData. sal_id);
			},
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', sy.pixel_0);
				parent.$.messager.progress('close');
			}
		});
	});
	
	function seachFun() {
		$('#searchForm input').val('');
		$('#searchForm select').each(function() {
			$(this).find('option').eq(0).attr('selected',true);
		});
		gridSysActionLog.datagrid('load',{});
	}
	
	function BatchRemove() {
		var checkedItems = $('#gridSysActionLog').datagrid('getChecked');
		var ids = [];
		$.each(checkedItems, function(index, item){
		 ids.push(item.sal_id);
		});
		if(ids.length>0) {
			parent.$.messager.confirm('询问', '您确定要删除这些记录？', function(r) {
				if (r) {
					$.post(sy.contextPath + '/system/sysActionLogControl/deleteMulti.action', {
						ids : ids.join(",")
					}, function(re) {
						if(re.success) {
							parent.$.messager.alert('提示', re.msg, 'success');
							gridSysActionLog.datagrid('reload');
						}
					}, 'json');
				}
			});
		}else {
			parent.$.messager.alert('提示', "请选择要删除的列!", 'success');
		}
	}

</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<%//if (securityUtil.havePermission("/system/sysActionLogControl/addPage")) {%>
				<td>
				<button   onclick="BatchRemove()">批量删除</button>
				</td>
				<%//}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td>
					<form id="searchForm">
						<table>
							<tr>
								<th>操作人姓名</th>
								<td><input name="sal_createname" placeholder="可以模糊查询操作人姓名" class="span2" /></td>
								<th>日志描述 </th>
								<td>
									<input name="sal_desc" placeholder="可以模糊查询日志描述 " class="span2"/>
								</td>
								<th>日志类型 </th>
								<td>
									<select name="sal_type">
										<option value="">请选择</option>
										<option value="1">控制层</option>
										<option value="2">业务层</option>
									</select>
								</td>
								<th>日志平台类型 </th>
								<td>
									<select name="sal_plattype">
										<option value="">请选择</option>
										<option value="1">权限系统</option>
									</select>
								</td>
								<td>
									<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="gridSysActionLog.datagrid('load',sy.serializeObject($('#searchForm')));">过滤</a>
									<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="seachFun()">重置过滤</a>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="gridSysActionLog" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
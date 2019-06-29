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
			width :  720,
			height : 480,
			title : '添加信息',
			url : sy.contextPath + '/system/sysOrgControl/addPage.action',
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
	
	var showFun = function( so_orgid) {
		var dialog = parent.sy.modalDialog({
			width :  720,
			height : 480,
			title : '查看信息',
			url : sy.contextPath + '/system/sysOrgControl/detailPage.action?so_orgid='+so_orgid,
			buttons : [{
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	};
	var editFun = function(so_orgid) {
		var dialog = parent.sy.modalDialog({
			width :  720,
			height : 480,
			title : '编辑信息',
			url : sy.contextPath + '/system/sysOrgControl/editPage.action?so_orgid=' + so_orgid,
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
	var removeFun = function( so_orgid) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/system/sysOrgControl/delete.action', {
					 so_orgid : so_orgid
				}, 
				function(r) {
					$.messager.alert('提示', r.msg);
					grid.datagrid('reload');
					$('#grid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
				}, 'json');
			}
		});
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/system/sysOrgControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			sortName : ' so_orgid',
			sortOrder : 'asc',
			frozenColumns : [[
				{field : 'so_orgcode',title : '部门编码',width : 80,sortable : true}, 
				{field : 'so_orgname',title : '部门名称',width : 180,sortable : true}
			                  ]],
			columns : [ [ 
				{field : 'org_name',title : '上级部门',width : 140,sortable : true}, 
				{field : 'so_contactname',title : '联系人姓名',width : 100,sortable : true},
				{field : 'so_brand_nameref',title : '品牌',width : 140,sortable : true},
				{field : 'so_brand',title : '品牌id',width : 140,sortable : true,hidden:true}, 
			    {field : 'so_status',title : '部门状态',width : 80,sortable : true, formatter : function(value, row, index) {switch (value) {case '0':return '禁用';case '1':return '启用';}}}, 
			    {field : 'so_contactphone',title : '联系人电话',width : 100,sortable : true}, 
			    {field : 'so_fax',title : '传真',width : 100,sortable : true}, 
			    {field : 'so_orgadds',title : '部门地址',width : 100,sortable : true}, 
			   /*  {width : '100', title : '签约商户数量上限', field :'so_me_limit1', sortable : true,hidden:false}, 
				{width : '100', title : '个人用户数量上限', field :'so_per_limit1', sortable : true,hidden:false}, 
				{width : '100', title : '代理商层级上限', field :'so_agent_level_limit1', sortable : true,hidden:false}, 
				{width : '100', title : '外系统ID', field :'so_id_ext', sortable : true,hidden:false}, 
				{width : '100', title : '外系统编码', field :'so_code_ext', sortable : true,hidden:false}, 
				{width : '100', title : '外系统名称', field :'so_name_ext', sortable : true,hidden:false},  */
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
					<%//if (securityUtil.havePermission("/system/sysOrgControl/detailPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note" title="查看" onclick="showFun(\'{0}\');"/>', row.so_orgid);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysOrgControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.so_orgid);
					<%//}%>
					<%//if (securityUtil.havePermission("/system/sysOrgControl/delete")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="removeFun(\'{0}\');"/>', row.so_orgid);
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
				showFun(rowData. so_orgid);
			},
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', sy.pixel_0);
				parent.$.messager.progress('close');
			}
		});
	});
	
	function searchFun() {
        $("#dataGrid").datagrid("load", {
            "so_orgName":$("#searchForm").find("input[name='so_orgName']").val(),
            "so_contactphone":$("#searchForm").find("input[name='so_contactphone']").val()
        });
    }
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div id="toolbar" style="display: none;">
		<table>
			<tr>
				<%//if (securityUtil.havePermission("/system/sysOrgControl/addPage")) {%>
				<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a></td>
				<%//}%>
				<td><div class="datagrid-btn-separator"></div></td>
				<td>
					<form id="searchForm">
						<table>
							<tr>
								<td>
									<form id="searchForm">
										<table>
											<tr>
												<th>部门名称</th>
												<td><input name="so_orgname" placeholder="可以模糊查询部门名称" class="span2" /></td>
												<th>联系电话</th>
												<td><input name="so_contactphone" placeholder="查询联系电话" class="span2" /></td>
												<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">过滤</a><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置过滤</a></td>
											</tr>
										</table>
									</form>
								</td>
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
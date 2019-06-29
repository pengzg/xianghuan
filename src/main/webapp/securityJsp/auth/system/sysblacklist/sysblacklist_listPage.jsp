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
		window.location.href=sy.contextPath + '/system/sysBlackListControl/addPage.action';
	};
	
	var showFun = function(sbl_id) {
		window.location.href=sy.contextPath + '/system/sysBlackListControl/detailPage.action?sbl_id='+sbl_id;
	
	};
	var editFun = function(sbl_id) {
		window.location.href=sy.contextPath + '/system/sysBlackListControl/editPage.action?sbl_id='+sbl_id;

	};
	var removeFun = function( sbl_id) {
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(sy.contextPath + '/system/sysBlackListControl/remove.action', {
					 sbl_id : sbl_id
				}, function() {
					grid.datagrid('reload');
				}, 'json');
			}
		});
	};
	$(function() {
		grid = $('#grid').datagrid({
			title : '',
			url : sy.contextPath + '/system/sysBlackListControl/dataGrid.action',
			striped : true,
			rownumbers : true,
			pagination : true,
			singleSelect : false,
			idField : ' sbl_id',
			sortName : ' sbl_id',
			sortOrder : 'asc',
			//frozenColumns : 
			columns : [ [ 
					{width : '10', title : '', field :'sbl_id',checkbox:true},     
					
					{width : '100', title : '平台', field :'sbl_type_nameref', sortable : true,hidden:false}, 
					{width : '100', title : '用户id', field :'sbl_userid', sortable : true,hidden:false}, 
					{width : '100', title : '用户手机', field :'sbl_mobile', sortable : true,hidden:false}, 
					{width : '100', title : '用户名', field :'sbl_note', sortable : true,hidden:false}, 
					{width : '100', title : 'ip地址', field :'sbl_ip', sortable : true,hidden:false}, 
					
					{ 
						width : '80', 
						title : '修改状态', 
						field : 'action2', 
						formatter : function(value, row,rowIndex) {
							var str = '';
							if (row.sbl_status == 1){
							str += sy.formatString('<button iconCls="icon-save" onclick="setSbl_status(\'{0}\', 0);">禁用</button>', row.sbl_id);
						    } else {
							str += sy.formatString('<button iconCls="icon-save" onclick="setSbl_status(\'{0}\', 1);">启用</button>', row.sbl_id);
						    }
						    
							return str;
						}
					},
					
					{width : '100', title : '更新时间', field :'sbl_updatetime', sortable : true,hidden:false}, 
				{ 
					width : '80', 
					title : '操作', 
					field : 'action', 
					formatter : function(value, row) {
					var str = '';
				
					<%//if (securityUtil.havePermission("/base/sysBlackListControl/editPage")) {%>
						str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="editFun(\'{0}\');"/>', row.sbl_id);
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
				showFun(rowData. sbl_id);
			},
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', sy.pixel_0);
				parent.$.messager.progress('close');
			}
		});
	});
	
	//键盘事件
	$(document).keydown(function (e) {
		var theEvent = e || window.event;
		var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
	    if(code==13){
	    	grid.datagrid('load',sy.serializeObject($('#searchForm')));
	    }
	});
	function setSbl_status(sbl_id, status) {
		if (!sbl_id) {
			return false;
		}
		parent.$.messager.confirm('询问', '您确定要执行此操作吗', function(r) { 
			if (r)  {
			  	var url = sy.contextPath + '/system/sysBlackListControl/setStatus.action';
				var data = { 'sbl_id':sbl_id, 'status':status };
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
	<form id="searchForm">
		<table>
			<tr>
				<th>手机号:</th>
				<td><input name="sbl_mobile_like" placeholder="手机号" class="span2" /></td>
				<td><div class="datagrid-btn-separator"></div></td>
					
				
			</tr>
		</table>
		</form>
		<table>
			<tr>
				<td>
					<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-note_add',plain:true" onclick="addFun();">添加</a>
					<a class="highgrade" style="cursor:pointer; color:#0020e2; margin-left:15px;">高级筛选</a>
					<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="grid.datagrid('load',sy.serializeObject($('#searchForm')));">过滤</a>
					<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');grid.datagrid('load',{});">重置过滤</a>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="grid" data-options="fit:true,border:false"></table>
	</div>
</body>
</html>
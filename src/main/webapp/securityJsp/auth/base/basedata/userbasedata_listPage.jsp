<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../../../inc.jsp"></jsp:include>
<script type="text/javascript">
var grid;
var datagrid;
$(function() {
	datagrid = $('#base_datatype_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/base/baseDatatypeControl/dataGrid.action?bdt_status=1&bdt_type=2',
			fit : true,
			fitColumns : true,
			border : true,
			pagination : true,
			idField : 'bdt_id',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50 ],
			sortName : 'bdt_code',
			sortOrder : 'asc',
			rownumbers:true,
			singleSelect:true,
			checkOnSelect : true,
			selectOnCheck : true,
			nowrap : true,
			onDblClickRow:function(rowIndex,rowData){
				$('#base_data_datagrid').treegrid({url:'${pageContext.request.contextPath}/base/baseDataControl/treeGrid.action',queryParams:{datatype:rowData.bdt_id,bdt_isgroup:rowData.bdt_isgroup}});
			},
			frozenColumns : [ [ {
				field : 'bdt_id',
				title : '主键 ',
				width : 150,
				checkbox : true
			}, {field : 'bdt_code',title : '字典项编码',	width : 80,	sortable : true	}
			 , {field : 'bdt_name',title : '字典项名称',	width : 150,	sortable : true	},
			 {field : 'bdt_isgroup',title : '级别',width : 80,sortable : true, 
					formatter : function(value, row, index) {switch (value) {case '1':return '集团';case '2':return '公司';}}}
				] ]
		});		
	});
	
	
	$(function(){
		grid = $('#base_data_datagrid').treegrid({
			url : '${pageContext.request.contextPath}/base/baseDataControl/treeGrid.action',
			treeField : 'bd_name',
			parentField : 'bd_pid',
			idField : 'bd_id',
			fit : true,
			fitColumns : true,
			rownumbers:true,
			singleSelect:true,
			checkOnSelect : true,
			selectOnCheck : true,
			border : false,
			frozenColumns : [ [ {field : 'bd_code',title : '编码',	width : 100,hidden : false},
			                    {field : 'bd_name',title : '名称',	width : 180,hidden : false},
			                    {field : 'bd_order',title : '序号',	width : 60,hidden : false},
			                    {field : 'bd_status',title : '状态 ',	width : 80,hidden : false,	
			                    	formatter : function(value, row, index) {switch (value) {case '1':return '启用';case '0':return '禁用';}} 
			                    }
								 ] ],
			columns : [ [ 
						 
						{
							title : '操作',
							field : 'action',
							width : '80',
							formatter : function(value, row) {
								var str = '';
									str += sy.formatString('<img class="iconImg ext-icon-note_edit" title="编辑" onclick="baseDataList_editFun(\'{0}\');" src="/auth/style/images/pixel_0.gif"/>', row.bd_id);
									str += sy.formatString('<img class="iconImg ext-icon-note_delete" title="删除" onclick="baseDataList_deleteFun(\'{0}\');" src="/auth/style/images/pixel_0.gif"/>', row.bd_id);
								return str;
							}
						}] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'ext-icon-note_add',
				handler : function() {
					baseDataList_appendFun();
				}
			}, '-', {
				text : '展开',
				iconCls : 'ext-icon-resultset_next',
				handler : function() {
					var node = $('#base_data_datagrid').treegrid('getSelected');
					if (node) {
						$('#base_data_datagrid').treegrid('expandAll', node.cid);
					} else {
						$('#base_data_datagrid').treegrid('expandAll');
					}
				}
			}, '-', {
				text : '折叠',
				iconCls : 'ext-icon-resultset_previous',
				handler : function() {
					var node = $('#base_data_datagrid').treegrid('getSelected');
					if (node) {
						$('#base_data_datagrid').treegrid('collapseAll', node.cid);
					} else {
						$('#base_data_datagrid').treegrid('collapseAll');
					}
				}
			}, '-', {
				text : '刷新',
				iconCls : 'ext-icon-arrow_refresh',
				handler : function() {
					var rows = $('#base_datatype_datagrid').datagrid('getChecked');
					if (rows.length <1) {
						$.messager.alert('提示', "请选择右侧的字典项目类型！");
						return ;
					}
					$('#base_data_datagrid').treegrid({url:'${pageContext.request.contextPath}/base/baseDataControl/treeGrid.action',queryParams:{datatype:rows[0].bdt_id,bdt_isgroup:rows[0].bdt_isgroup}});
				}
			} ]
		});
		
		$(".layout-button-up").click();
	});
	
	
	function baseDataList_appendFun() {
		var rows = $('#base_datatype_datagrid').datagrid('getChecked');
		if (rows.length <1) {
			$.messager.alert('提示', "请选择右侧的字典项目类型！");
			return ;
		}
		$('#base_data_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/base/baseDataControl/addPage.action?bd_datatypeid='+rows[0].bdt_id,
			width : 450,
			height : 300,
			modal : true,
			title : '添加字典项明细---->'+rows[0].bdt_name,
			buttons : [ {
				text : '增加',
				iconCls : 'ext-icon-note_add',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#baseDataListAdd_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/base/baseDataControl/insert.action',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									$('#base_data_datagrid').treegrid({url:'${pageContext.request.contextPath}/base/baseDataControl/treeGrid.action',queryParams:{datatype:rows[0].bdt_id,bdt_isgroup:rows[0].bdt_isgroup}});
									d.dialog('destroy');
									$.messager.show({
										msg : r.msg,
										title : '提示'
									});
								}else {
									$.messager.alert('提示', r.msg);
								}
							} catch (e) {
								$.messager.alert('提示', result);
							}
						}
					});
				}
			}, {
				text : '关闭',
				handler : function() {
					var d = $(this).closest('.window-body');
					d.dialog('destroy');
				}
			} ],
			onClose : function() {
				$(this).dialog('destroy');
			},onLoad : function() {
				$('#baseDataListAdd_addForm').form('load', {bd_datatypeid:rows[0].bdt_id});
			}
		});
	}
	
	
	
	function baseDataList_deleteFun(id) {
		if (id != undefined) {
			$('#base_data_datagrid').treegrid('select', id);
		}
		var node = $('#base_data_datagrid').treegrid('getSelected');
		if (node) {
			$.messager.confirm('询问', '您确定要删除【' + node.bd_name + '】？', function(b) {
				if (b) {
					$.ajax({
						url : '${pageContext.request.contextPath}/base/baseDataControl/delete.action',
						data : {
							bd_id : node.bd_id
						},
						cache : false,
						dataType : 'JSON',
						success : function(r) {
							if (r.success) {
								var rows = $('#base_datatype_datagrid').datagrid('getChecked');
								$('#base_data_datagrid').treegrid({url:'${pageContext.request.contextPath}/base/baseDataControl/treeGrid.action',queryParams:{datatype:rows[0].bdt_id,bdt_isgroup:rows[0].bdt_isgroup}});
								//$('#base_data_datagrid').treegrid('remove', r.obj);
							}
							$.messager.show({
								msg : r.msg,
								title : '提示'
							});
						}
					});
				}
			});
		}
	}
	
	function baseDataList_editFun(id) {
		if (id != undefined) {
			$('#base_data_datagrid').treegrid('select', id);
		}
		var node = $('#base_data_datagrid').treegrid('getSelected');
		var rows = $('#base_datatype_datagrid').datagrid('getSelected');
		var dialog = parent.sy.modalDialog({
			url : '${pageContext.request.contextPath}/base/baseDataControl/editPage.action?bd_id='+node.bd_id+'&bdt_isgroup='+rows.bdt_isgroup,
			width : 380,
			height : 320,
			modal : true,
			title : '编辑字典项--->'+node.bd_name,
			buttons : [{
				text : '编辑',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			},  {
				text : '关闭',
				handler : function() {
					dialog.dialog('destroy');
				}
			}  ]
		});
	}
	
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	 <div region="north" split="true" title=" " style="width:450px;height:80px;">
		<table data-options="fit:true,border:false">
			<tr>
				<td>
					<form id="searchForm">
						<table>
							<tr>
								<th>字典名称</th>
								<td><input name="bdt_name" placeholder="字典名称模糊查询" class="span2" /></td>
								<td>
									<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom',plain:true" onclick="datagrid.datagrid('load',sy.serializeObject($('#searchForm')));">过滤</a>
									<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-zoom_out',plain:true" onclick="$('#searchForm input').val('');datagrid.datagrid('load',{});">重置过滤</a>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td>
				</td>
			</tr>
		</table>
    </div> 
    <div region="west" split="true" title="字典项类型 " style="width:450px;" id="toolbar">		
    	<table id="base_datatype_datagrid" data-options="fit:true,border:false"></table>
    </div>  
    <div region="center" title="字典项明细" style="overflow: hidden;">
    	<table id="base_data_datagrid"></table>
    </div>  
</div>  
</body>
</html>
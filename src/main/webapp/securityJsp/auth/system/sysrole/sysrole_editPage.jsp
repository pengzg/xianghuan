<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<%
	String sr_id = request.getParameter("sr_id");
	if (sr_id == null) {
		sr_id = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../../../inc.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
	  	$('#sr_status').combobox('setValue','${bean.sr_status}');
	    $('#sr_so_orgid').combotree('setValue', '${bean.sr_so_orgid}');
	});
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="sr_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysRoleControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysRoleControl/insert.action';
			}
			$.post(url, sy.serializeObject($('form')), function(result) {
				if (result.success) {
					$grid.datagrid('load');
					$dialog.dialog('destroy');
				} else {
					$pjq.messager.alert('提示', result.msg, 'error');
				}
			}, 'json');
		}
	};
</script>
</head>
<body>
	<form method="post" class="form">
		<input type="hidden" name="sr_so_orgid" value="00000001"/>
		<fieldset>
			<legend>角色基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr style="display: none">
					<th>编号</th>
					<td><input value="${bean.sr_id}" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>部门编码</th>
					<td>
						<input name="sr_code" value="${bean.sr_code}" class="easyui-validatebox" data-options="required:true" />
					</td>
					<th>角色名称</th>
					<td>
						<input name="sr_name" value="${bean.sr_name}" class="easyui-validatebox" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>顺序</th>
					<td><input name="sr_order" value="${bean.sr_order}" class="easyui-numberspinner" missingMessage="该输入项为必输项" data-options="required:true,min:0,max:100000,editable:true" style="width: 155px;" value="50" /></td>
					<th>角色状态</th>
					<td>
						<input id="sr_status" name="sr_status" class="easyui-combobox" 
						data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2006',
						valueField:'bd_code',textField:'bd_name', required:true,editable:false" />
					</td>
				</tr>
				<tr>
<!-- 					<th>部门名称</th> -->
<!-- 					<td> -->
<%-- 						<select value="${bean.sr_so_orgid}" id="sr_so_orgid" name="sr_so_orgid" class="easyui-combotree"  --%>
<!-- 						data-options="required:true,editable:false,idField:'id',textField:'text',parentField:'pid', -->
<!-- 						url:sy.contextPath + '/system/publicControl/orgTree.action'"  -->
<!-- 						style="width: 155px;"> -->
<!-- 						</select> -->
<!-- 					</td> -->
					<th>角色描述</th>
					<td colspan="3"><textarea name="sr_desc">${bean.sr_desc}</textarea></td>
				</tr>
<!-- 				<tr style="display:none"> -->
<!-- 						<th>上级角色</th> -->
<!-- 					<td><select id="sr_pid" name="sr_pid" class="easyui-combotree"  -->
<!-- 						data-options="editable:true,idField:'id',textField:'text',parentField:'pid', -->
<!-- 							url:sy.contextPath + '/system/publicControl/roleTree.action'" style="width: 155px;"> -->
<!-- 					</select></td> -->
<!-- 				</tr> -->
				<tr style="display:none">
					<td>
						<input name="sr_id" value="${bean.sr_id}"/>
						<input name="sr_version" value="${bean.sr_version}"/>
						<input name="sr_ts" value="${bean.sr_ts}"/>
						<input name="sr_dr" value="${bean.sr_dr}"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
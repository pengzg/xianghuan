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
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="suu_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysUserUnityControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysUserUnityControl/insert.action';
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
		<fieldset>
			<legend>基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>	
					<th>主键ID</th>
					<td>
						<input name="suu_id" value="${bean.suu_id}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>用户ID</th>
					<td>
						<input name="suu_ub_id" value="${bean.suu_ub_id}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>用户名称</th>
					<td>
						<input name="suu_ub_name" value="${bean.suu_ub_name}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>用户类型1.部门；2代理；3商户；4推广人；5终端用户</th>
					<td>
						<input name="suu_ub_type" value="${bean.suu_ub_type}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>状态（0.禁用；1.启用）</th>
					<td>
						<input name="suu_status" value="${bean.suu_status}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>删除标志位:0删除，1未删除</th>
					<td>
						<input name="suu_dr" value="${bean.suu_dr}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>时间</th>
					<td>
						<input name="suu_ts" value="${bean.suu_ts}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>版本号</th>
					<td>
						<input name="suu_version" value="${bean.suu_version}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>新增人</th>
					<td>
						<input name="suu_adduser" value="${bean.suu_adduser}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>新增日期</th>
					<td>
						<input name="suu_adddate" value="${bean.suu_adddate}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>最后修改人</th>
					<td>
						<input name="suu_modifyuser" value="${bean.suu_modifyuser}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>最后修改日期</th>
					<td>
						<input name="suu_modifydate" value="${bean.suu_modifydate}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>删除人</th>
					<td>
						<input name="suu_deleteuser" value="${bean.suu_deleteuser}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
				<tr>	
					<th>删除日期</th>
					<td>
						<input name="suu_deletedate" value="${bean.suu_deletedate}" class="easyui-validatebox" data-options="required:false" ', sortable : true />
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
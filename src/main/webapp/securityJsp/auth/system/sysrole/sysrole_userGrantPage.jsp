<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	var submitForm = function($dialog, $grid, $pjq) {
		var nodes = $('#tree').tree('getChecked', [ 'checked', 'indeterminate' ]);
		var ids = [];
		for (var i = 0; i < nodes.length; i++) {
			ids.push(nodes[i].id);
		}
		$.post(sy.contextPath + '/system/sysUserControl/grantRole.action', {
			id : $(':input[name="id"]').val(),
			ids : ids.join(',')
		}, function(result) {
			if (result.success) {
				//$pjq.messager.alert('提示', '修改成功！', 'info');
				$dialog.dialog('destroy');
			} else {
				$pjq.messager.alert('提示', result.msg, 'error');
			}
		}, 'json');
	};
	$(function() {
		parent.$.messager.progress({
			text : '数据加载中....'
		});
		$('#tree').tree({
			url : sy.contextPath + '/system/sysRoleControl/getRolesTree.action',
			parentField:'pid',
			editable:true,
			checkbox : true,
			cascadeCheck : false,
			lines:true,
			formatter : function(node) {
				return node.text;
			},
			onLoadSuccess : function(node, data) {
				$.post(sy.contextPath + '/system/sysRoleControl/getRoleByUserId.action', {
					su_id : $('input[name="id"]').val()
				}, function(result) {
					if (result) {
						for (var i = 0; i < result.length; i++) {
							var node = $('#tree').tree('find', result[i].id);
							if (node) {
								var isLeaf = $('#tree').tree('isLeaf', node.target);
								if (isLeaf) {
									$('#tree').tree('check', node.target);
								}
							}
						}
					}
					parent.$.messager.progress('close');
				}, 'json');
			}
		});
	});
</script>
</head>
<body>
	<input name="id" value="${su_id}" readonly="readonly" type="hidden" />
	<fieldset>
		<legend>所属角色</legend>
		<ul id="tree"></ul>
	</fieldset>
</body>
</html>
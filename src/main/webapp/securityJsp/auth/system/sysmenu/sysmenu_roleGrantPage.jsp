<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<%
	String sm_id = request.getParameter("sm_id");
	if (sm_id == null) {
		sm_id = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../../../inc.jsp"></jsp:include>
<script type="text/javascript">
	var submitForm = function($dialog, $toGrant, $pjq,grantTree,id) {
		var nodes = $('#tree').tree('getChecked', [ 'checked', 'indeterminate' ]);
		var ids = [];
		for (var i = 0; i < nodes.length; i++) {
			ids.push(nodes[i].id);
		}
		$.post(sy.contextPath + '/system/sysRoleControl/grantMenu.action', {
			id : $(':input[name="id"]').val(),
			ids : ids.join(',')
		}, function(result) {
			if (result.success) {
				$pjq.messager.alert('提示', '授权成功！', 'info');
				console.log(grantTree);
				$dialog.dialog('destroy');
				grantTree.tree({
					url : sy.contextPath + '/system/sysMenuControl/getRoleMenus.action?sr_id='+id,
					parentField : 'pid',
					lines : true,
					editable : true,
//		    			checkbox : true,
					pagination : false,
					formatter : function(node) {
						return node.text;
					}
				});
			} else {
				$pjq.messager.alert('提示', result.msg, 'error');
			}
		},'json');
	};
	$(function() {
		parent.$.messager.progress({
			text : '数据加载中....'
		});
		$('#tree').tree({
			url : sy.contextPath + '/system/sysMenuControl/getMenuTree.action',
			parentField : 'pid',
			lines : true,
			editable : true,
			checkbox : true,
			pagination : false,
			formatter : function(node) {
				return node.text;
			},
			onLoadSuccess : function(node, data) {
				$.post(sy.contextPath + '/system/sysMenuControl/getRoleMenus.action', {
					sr_id : $(':input[name="id"]').val()
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
	<input name="id" value="${sr_id}" readonly="readonly" type="hidden" />
	<fieldset>
		<legend>角色授权</legend>
		<ul id="tree"></ul>
	</fieldset>
</body>
</html>
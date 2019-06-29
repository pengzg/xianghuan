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
	$(function() {
	    $('#sm_pid').combotree('setValue', '${bean.sm_pid}');
	    $('#sm_systemid').combotree('setValue', '${bean.sm_systemid}');
	});
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="sm_id"]').val().length > 0) {
				url = sy.contextPath + '/system/sysMenuControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysMenuControl/insert.action';
			}
			$.post(url, sy.serializeObject($('form')), function(result) {
				if (result.success) {
					$grid.treegrid('load');
					$dialog.dialog('destroy');
				} else {
					$pjq.messager.alert('提示', result.msg, 'error');
				}
			}, 'json');
		}
	};
	var showIcons = function() {
		var dialog = parent.sy.modalDialog({
			title : '浏览小图标',
			url : sy.contextPath + '/style/icons.jsp',
			buttons : [ {
				text : '确定',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.selectIcon(dialog, $('#sm_iconcls'));
				}
			} ]
		});
	};
</script>
</head>
<body>
	<form method="post" class="form">
		<fieldset>
			<legend>基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>	
					<th>编号</th>
					<td>
						<input type="hidden" name="sm_id" value="${bean.sm_id}" />
						<input value="${bean.sm_id}" class="easyui-validatebox" data-options="required:false" ',  disabled/>
					</td>
					<th>菜单名称</th>
					<td>
						<input name="sm_name" value="${bean.sm_name}" class="easyui-validatebox" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>所属系统</th>
					<td><select value="${bean.ss_name}" id="sm_systemid" name="sm_systemid" class="easyui-combotree" 
						data-options="required:true,editable:false,idField:'id',textField:'text',
							url:sy.contextPath + '/system/publicControl/getSystemTree.action'" style="width: 155px;">
					</select></td>
					<th>上级节点</th>
					<td><select id="sm_pid" name="sm_pid" class="easyui-combotree" 
						data-options="required:false,editable:true,idField:'id',textField:'text',parentField:'pid',
							url:sy.contextPath + '/system/publicControl/menuTree.action'" style="width: 155px;">
					</select></td>
				</tr>
				<tr>
					<th>菜单类型</th>
					<td>
						<select class="easyui-combobox" name="sm_typeid" data-options="panelHeight:'auto',editable:false" style="width: 155px;">
							<option <c:if test="${bean.sm_typeid==1}"> selected </c:if> value="1">菜单</option>
							<option <c:if test="${bean.sm_typeid==2}"> selected </c:if> value="2">功能</option>
						</select>
					</td>
					<th>排序</th>
					<td>
						<input name="sm_seq" class="easyui-numberspinner"
						 data-options="required:true,min:0,max:100000,editable:true" style="width: 155px;" value="${bean.sm_seq}" />
					</td>
				</tr>
				<tr>
					<th>图标</th>
					<td>
						<input id="sm_iconcls"" name="sm_iconcls" value="${bean.sm_iconcls}" readonly="readonly" class="easyui-validatebox" data-options="required:false" /><img class="iconImg ext-icon-zoom" onclick="showIcons();" title="浏览图标" /></td>
					</td>
					<th>访问地址</th>
					<td>
						<input name="sm_url" value="${bean.sm_url}" class="easyui-validatebox" data-options="required:false" />
					</td>
				</tr>
				<tr>
					<th>目标</th>
					<td>
						<input name="sm_target" value="${bean.sm_target}" class="easyui-validatebox" data-options="required:false" />
					</td>
					<th>描述</th>
					<td>
						<input name="sm_description" value="${bean.sm_description}" class="easyui-validatebox" data-options="required:false" />
					</td>
				</tr>
				<tr>
					<th>级别(盒子菜单必填)</th>
					<td>
						<select class="easyui-combobox" name="sm_level" data-options="panelHeight:'auto',editable:false" style="width: 155px;">
							<option <c:if test="${bean.sm_level==0}"> selected </c:if> value="0">0</option>
							<option <c:if test="${bean.sm_level==1}"> selected </c:if> value="1">1</option>
							<option <c:if test="${bean.sm_level==2}"> selected </c:if> value="2">2</option>
						</select>
					</td>
					<th>状态</th>
					<td>
						<select class="easyui-combobox" name="sm_status" data-options="panelHeight:'auto',editable:false" style="width: 155px;">
							<option <c:if test="${bean.sm_status==1}"> selected </c:if> value="1">启用</option>
							<option <c:if test="${bean.sm_status==0}"> selected </c:if> value="0">禁用</option>
						</select>
					</td>
					<th></th>
					<td>
					</td>
				</tr>
				<tr style="display:none">
					<td>
						<input name="sm_version" value="${bean.sm_version}"/>
						<input name="sm_ts" value="${bean.sm_ts}"/>
						<input name="sm_dr" value="${bean.sm_dr}"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
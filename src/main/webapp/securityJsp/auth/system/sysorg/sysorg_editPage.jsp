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
	    $('#so_orgparid').combotree('setValue', '${bean.so_orgparid}');
	    $('#so_brand').combobox('setValue','${bean.so_brand}');
	});
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			if ($(':input[name="so_orgid"]').val().length > 0) {
				url = sy.contextPath + '/system/sysOrgControl/update.action';
			} else {
				url = sy.contextPath + '/system/sysOrgControl/insert.action';
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
	
	var showIcons = function() {
		var dialog = parent.sy.modalDialog({
			title : '浏览小图标',
			url : sy.contextPath + '/style/icons.jsp',
			buttons : [ {
				text : '确定',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.selectIcon(dialog, $('#so_orgpic'));
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
					<th>部门编码</th>
					<td>
						<input name="so_orgcode" value="${bean.so_orgcode}" class="easyui-validatebox" data-options="required:false"  />
					</td>
					<th>部门名称</th>
					<td>
						<input name="so_orgname" value="${bean.so_orgname}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>上级部门</th>
					<td>
						<select id="so_orgparid" name="so_orgparid" class="easyui-combotree" 
						data-options="editable:true,idField:'id',textField:'text',parentField:'pid',url:sy.contextPath + '/system/publicControl/orgTree.action'" 
						style="width: 155px;">
						</select><img class="iconImg ext-icon-cross" onclick="$('#so_orgparid').combotree('clear');" title="清空" /> 
					</td>
					<th>联系人姓名</th>
					<td>
						<input name="so_contactname" value="${bean.so_contactname}" class="easyui-validatebox" data-options="required:false" />
					</td>
				</tr>	
				<tr>	
					<th>联系人电话</th>
					<td>
						<input name="so_contactphone" value="${bean.so_contactphone}" class="easyui-validatebox" data-options="required:false" />
					</td>
					<th>传真</th>
					<td>
						<input name="so_fax" value="${bean.so_fax}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>部门地址</th>
					<td>
						<input name="so_orgadds" value="${bean.so_orgadds}" class="easyui-validatebox" data-options="required:false"  />
					</td>
					<th>部门状态</th>
					<td>
						<select class="easyui-combobox" name="so_status" data-options="panelHeight:'auto',editable:false" style="width: 155px;">
							<option <c:if test="${bean.so_status==1}"> selected </c:if> value="1">启用</option>
							<option <c:if test="${bean.so_status==0}"> selected </c:if> value="0">禁用</option>
						</select>
					</td>
				</tr>	
			
				<tr>	
					<th>部门类型</th>
					<td>
						<input name="so_type" value="${bean.so_type}" class="easyui-validatebox" data-options="required:false"  />
					</td>
					<th>所属品牌</th>
					<td><input name="so_brand" id="so_brand" class="easyui-combobox" data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=1058&tempTime='+new Date().getTime(),
						valueField:'bd_code',textField:'bd_name', editable:false"></td>
				</tr>
				<tr style="display:none">
					<td>
						<input  type="hidden" name="so_orgid" value="${bean.so_orgid}"  /> 
						<input  type="hidden" name="so_version" value="${bean.so_version}"  /> 
						<input  type="hidden" name="so_ts" value="${bean.so_ts}"  /> 
						<input  type="hidden" name="so_dr" value="${bean.so_dr}"  /> 
						<input  type="hidden" name="so_per_limit" value="${bean.so_per_limit}"  /> 
						<input  type="hidden" name="so_me_limit" value="${bean.so_me_limit}"  />
						<input  type="hidden" name="so_agent_level_limit" value="${bean.so_agent_level_limit}"  /> 
						<input  type="hidden" name="so_id_ext" value="${bean.so_id_ext}"  /> 
						<input  type="hidden" name="so_code_ext" value="${bean.so_code_ext}"  /> 
						<input  type="hidden" name="so_name_ext" value="${bean.so_name_ext}"  /> 
					</td>
					<td></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
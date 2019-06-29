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
	   $('#bd_pid').combotree('setValue', '${bean.bd_pid}');
	});
	
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			if ($(':input[name="bd_id"]').val().length > 0) {
				url = '${pageContext.request.contextPath}/base/baseDataControl/update.action';
			} 
			$.post(url, sy.serializeObject($('form')), function(result) {
				if (result.success) {
					$grid.treegrid({url:'${pageContext.request.contextPath}/base/baseDataControl/treeGrid.action',queryParams:{datatype:$('#bd_datatypeid').val(),bdt_isgroup:$("#bdt_isgroup").val()}});
					$dialog.dialog('destroy');
					$pjq.messager.show({
						msg : result.msg,
						title : '提示'
					});
				} else {
					$pjq.messager.alert('提示', result.msg, 'error');
				}
			},'json');
		}
	};
</script>
</head>
<body >
	<form method="post" class="form" id="baseDataListAdd_addForm">
		<fieldset>
			<legend>基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>	
					<th>编码</th>
					<td>
						<input name="bd_code" value="${bean.bd_code}" class="easyui-validatebox" data-options="required:true" />
					</td>
				</tr>	
				<tr>	
					<th>名称</th>
					<td>
						<input name="bd_name" value="${bean.bd_name}" class="easyui-validatebox" data-options="required:true" />
					</td>
				</tr>	
				<tr>	
					<th>排序</th>
					<td>
						<input name="bd_order" class="easyui-numberspinner"
						 data-options="required:true,min:0,max:100000,editable:true" style="width: 155px;" value="${bean.bd_order}" />
					</td>
				</tr>	
				<tr>	
					<th>父节点</th>
					<td>
						<select id="bd_pid" name="bd_pid" class="easyui-combotree" 
							data-options="editable:true,idField:'id',textField:'text',parentField:'pid',url:sy.contextPath + '/system/publicControl/baseDataTree.action?bd_datatypeid=' + ${bd_datatypeid}" 
							style="width: 155px;">
						</select>
						<img class="iconImg ext-icon-cross" onclick="$('#bd_pid').combotree('clear');" title="清空" src="/auth/style/images/pixel_0.gif" /> 
					</td>
				</tr>	
				<tr>	
					<th>描述</th>
					<td>
						<input name="bd_des" value="${bean.bd_des}" class="easyui-validatebox" data-options="required:false" />
					</td>
				</tr>	
				<tr>	
					<th>状态</th>
					<td>
						<select class="easyui-combobox" name="bd_status" data-options="panelHeight:'auto',editable:false" style="width: 155px;">
							<option <c:if test="${bean.bd_status==1}"> selected </c:if> value="1">启用</option>
							<option <c:if test="${bean.bd_status==0}"> selected </c:if> value="0">禁用</option>
						</select>
					</td>
				</tr>	
				<tr style="display:none">	
					<th></th>
					<td>
						<input name="bd_datatypeid" id="bd_datatypeid" value="${bean.bd_datatypeid}"/>
						<input name="bd_version" value="${bean.bd_version}"  />
						<input name="bd_id" value="${bean.bd_id}"  />
						<input id="bdt_isgroup" value="${bdt_isgroup}"  />
					</td>
				</tr>	
				<%-- <tr>	
					<th>部门</th>
					<td>
						<input  name="bd_org" value="${bean.bd_org}" class="easyui-validatebox" data-options="required:true"  />
						<select id="bd_org" name="bd_org" class="easyui-combotree" 
						data-options="editable:true,idField:'id',textField:'text',parentField:'pid',url:sy.contextPath + '/system/publicControl/orgTree.action'" 
						style="width: 155px;">
						</select><img class="iconImg ext-icon-cross" onclick="$('#bd_org').combotree('clear');" title="清空" /> 
					</td>
				</tr> --%>
			</table>
		</fieldset>
	</form>
</body>
</html>
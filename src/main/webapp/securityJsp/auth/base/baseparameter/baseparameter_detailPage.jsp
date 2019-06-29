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

</script>
</head>
<body>
	<form method="post" class="form">
		<fieldset>
			<legend>基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr style="display:none">	
					<th >主键</th>
					<td>
						${bean.bp_id}
					</td>
				</tr>	
				<tr>	
					<th>编码</th>					
					<td> 
						 <input style="resize:none" readonly="readonly" value="${bean.bp_key}"></input>
					</td>
				</tr>	
				<tr>	
					<th>值</th>
					<td>						
					    <textarea  style="resize:none" readonly="readonly">${bean.bp_value}</textarea>
					</td>
				</tr>	
				<tr>	
					<th>备注说明</th>
					<td>
						<textarea  style="resize:none" readonly="readonly">${bean.bp_remark}</textarea>
					</td>
				</tr>
				<tr>	
					<th>级别</th>
					<td>
						<input id="bp_level" name="bp_level"
								class="easyui-combobox"
								data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2054',valueField:'bd_code',textField:'bd_name',panelHeight:'auto',required:true"
								value="${bean.bp_level}" />
					</td>
				</tr>	
				<tr>	
					<th>是否启用</th>
					<td><input id="bp_dr" name="bp_dr"
								class="easyui-combobox"
								data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2006',valueField:'bd_code',textField:'bd_name',panelHeight:'auto',required:true"
								value="${bean.bp_dr}" />
					
					</td>
				</tr>
					
			</table>
		</fieldset>
	</form>
</body>
</html>
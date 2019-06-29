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
				<tr>	
					<th>主键</th>
					<td>
						${bean.bdt_id}
					</td>
				</tr>	
				<tr>	
					<th>编码</th>
					<td>
						${bean.bdt_code}
					</td>
				</tr>	
				<tr>	
					<th>名称</th>
					<td>
						${bean.bdt_name}
					</td>
				</tr>	
				<tr>	
					<th>排序</th>
					<td>
						${bean.bdt_order}
					</td>
				</tr>	
				<tr>	
					<th>类型</th>
					<td>
						<c:if test="${bean.bdt_type==0}"> 用户</c:if>
						<c:if test="${bean.bdt_type==1}"> 系统 </c:if> 
					</td>
				</tr>	
				<tr>	
					<th>描述</th>
					<td>
						${bean.bdt_des}
					</td>
				</tr>	
				<tr>	
					<th>状态</th>
					<td>
						<c:if test="${bean.bdt_status==1}" > 启用 </c:if> 
						<c:if test="${bean.bdt_status==0}" > 禁用 </c:if> 
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
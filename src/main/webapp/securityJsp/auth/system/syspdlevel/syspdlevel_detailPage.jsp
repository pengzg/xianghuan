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
					<th>编号</th>
					<td> ${bean.sp_id} </td>
				</tr>	
				<tr>	
					<th>名称</th>
					<td> ${bean.sp_name} </td>
				</tr>	
				<tr>	
					<th>密码复杂度</th>
					<td> ${bean.sp_pdfzd} </td>
				</tr>	
				<tr>	
					<th>密码重复间隔次数</th>
					<td> ${bean.sp_pdjgtimes} </td>
				</tr>	
				<tr>	
					<th>密码修改间隔时间</th>
					<td> ${bean.sp_pduptimes} </td>
				</tr>	
				<tr>	
					<th>状态</th>
					<td>
						<c:if test="${bean.sp_status=='1'}"> 启用 </c:if>
						<c:if test="${bean.sp_status=='0'}"> 禁用 </c:if>
					</td>
				</tr>	
				<tr>	
					<th>时间</th>
					<td> ${bean.sp_ts} </td>
				</tr>	
				<tr>	
					<th>标志位</th>
					<td> ${bean.sp_dr} </td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
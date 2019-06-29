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
</head>
<body>
	<form method="post" class="form">
		<fieldset>
			<legend>用户基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>部门名称</th>
					<td>${bean.su_orgid_nameref}</td>
					<th>用户类型</th>
					<td>${bean.su_role_nameref}</td>
				</tr>
				<tr>
					<th>用户名</th>
					<td>${bean.su_name}</td>
					<th>登录账号</th>
					<td>${bean.su_loginname}</td>
				</tr>
				<tr>
					<th>性别</th>
					<td>${bean.su_sex_nameref}</td>
					<th>状态</th>
					<td>${bean.su_status_nameref}</td>
				</tr>
				<tr>
					<th>手机号</th>
					<td>${bean.su_phone}</td>
					<th>邮箱</th>
					<td>${bean.su_email}</td>
				</tr>
				<tr>
					<th>微信号 </th>
					<td>${bean.su_wx}</td>
					<th></th>
					<td></td>
				</tr>
				
				<tr>
					<th>有效开始日期</th>
					<td>${bean.su_startdate}</td>
					<th>有效结束日期</th>
					<td>${bean.su_enddate}</td>
				</tr>
				
			</table>
		</fieldset>
	</form>
</body>
</html>
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
	<!-- 	<fieldset>
			<legend>用户基本信息</legend> -->
			<table class="table" style="width: 100%;">
				<tr>
					<th>登录账号</th>
					<td>${bean.su_loginname}</td>
					<th>微信号</th>
					<td>${bean.su_wx}</td>
				</tr>
				<tr>
					<th>姓名</th>
					<td>${bean.su_name}</td>
					<th>手机号</th>
					<td>${bean.su_phone}</td>
				</tr>
				<tr>
					<th>性别</th>
					<td>${bean.su_sex_nameref}</td>
					<th>出生年月</th>
					<td></td>
				</tr>
				<tr>
					<th>微信Id：</th>
					<td>${bean.su_wxid}</td>
					<th>Token</th>
					<td>${bean.su_token}</td>
				</tr>
				<tr>
					<th>地址：</th>
					<td>${bean.su_address}</td>
					<th></th>
					<td></td>
				</tr>
				
				
				
			</table>
<!-- 		</fieldset> -->
	</form>
</body>
</html>
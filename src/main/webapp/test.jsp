<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.xianghuan.web.model.SessionInfo"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<form action="/app/bbsUser/getThankUserList_login.action"  method="post" >
	<input name="reqCode" type="hidden" value="1012"/>
	<input name="device" type="hidden" value="1"/>
	<input name="deviceType" type="hidden" value="ios"/>
	<input name="user" type="hidden" value="47759"/>
	<input name="community"  value="100032"/>
        <input type="submit" value="上传"/>
    </form>
</body>
</html>
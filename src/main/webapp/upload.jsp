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
	<form action="/app/bbsTopic/publishTopic_login.action"  method="post" enctype="multipart/form-data">
	<input name="reqCode" type="hidden" value="0802"/>
	<input name="device" type="hidden" value="1"/>
	<input name="deviceType" type="hidden" value="ios"/>
	<input name="user" type="hidden" value="47759"/>
	<input name="bbsChannelId" type="hidden" value="1"/>
	<input name="topicContent"  value="周末一起去郊游啊"/>
	<input name="community"  value="100032"/>
         <table>
             <tr>
                 <td>头像1</td>
                 <td><input id="iconImg1" name="iconImg" type="file" /></td>
                 <td>头像2</td>
                 <td><input id="iconImg2" name="iconImg" type="file" /></td>
                 <td>头像3</td>
                 <td><input id="iconImg3" name="iconImg" type="file" /></td>
                 <td><input type="submit" value="上传"/></td>
             </tr>
         </table>
    </form>
</body>
</html>
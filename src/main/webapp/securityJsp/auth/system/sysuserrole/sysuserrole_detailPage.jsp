<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<th>sur_id</th>
					<td>
						${bean.sur_id}
					</td>
				</tr>	
				<tr>	
					<th>sur_roleid</th>
					<td>
						${bean.sur_roleid}
					</td>
				</tr>	
				<tr>	
					<th>sur_userid</th>
					<td>
						${bean.sur_userid}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
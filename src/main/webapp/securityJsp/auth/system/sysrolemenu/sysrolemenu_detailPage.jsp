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
					<th>srm_id</th>
					<td>
						${bean.srm_id}
					</td>
				</tr>	
				<tr>	
					<th>srm_roleid</th>
					<td>
						${bean.srm_roleid}
					</td>
				</tr>	
				<tr>	
					<th>srm_menuid</th>
					<td>
						${bean.srm_menuid}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
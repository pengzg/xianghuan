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
					<th>sul_id</th>
					<td>
						${bean.sul_id}
					</td>
				</tr>	
				<tr>	
					<th>sul_creatid</th>
					<td>
						${bean.sul_creatid}
					</td>
				</tr>	
				<tr>	
					<th>sul_uptime</th>
					<td>
						${bean.sul_uptime}
					</td>
				</tr>	
				<tr>	
					<th>sul_oldpd</th>
					<td>
						${bean.sul_oldpd}
					</td>
				</tr>	
				<tr>	
					<th>sul_newpd</th>
					<td>
						${bean.sul_newpd}
					</td>
				</tr>	
				<tr>	
					<th>sul_inserttime</th>
					<td>
						${bean.sul_inserttime}
					</td>
				</tr>	
				<tr>	
					<th>sul_sp_id</th>
					<td>
						${bean.sul_sp_id}
					</td>
				</tr>	
				<tr>	
					<th>sul_desc</th>
					<td>
						${bean.sul_desc}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
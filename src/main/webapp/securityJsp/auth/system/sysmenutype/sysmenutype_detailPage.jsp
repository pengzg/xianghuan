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
					<th>smt_id</th>
					<td>
						${bean.smt_id}
					</td>
				</tr>	
				<tr>	
					<th>smt_name</th>
					<td>
						${bean.smt_name}
					</td>
				</tr>	
				<tr>	
					<th>smt_dr</th>
					<td>
						${bean.smt_dr}
					</td>
				</tr>	
				<tr>	
					<th>smt_ts</th>
					<td>
						${bean.smt_ts}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
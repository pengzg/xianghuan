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
					<th>PK</th>
					<td>
						${bean.sbli_id}
					</td>
				</tr>	
				<tr>	
					<th>IP地址</th>
					<td>
						${bean.sbli_ipadd}
					</td>
				</tr>	
				<tr>	
					<th>原因</th>
					<td>
						${bean.sbli_res}
					</td>
				</tr>	
				<tr>	
					<th>新增人</th>
					<td>
						${bean.sbl_adduser}
					</td>
				</tr>	
				<tr>	
					<th>新增日期 </th>
					<td>
						${bean.sbl_adddate}
					</td>
				</tr>	
				<tr>	
					<th>最后修改人</th>
					<td>
						${bean.sbl_modifyuser}
					</td>
				</tr>	
				<tr>	
					<th>最后修改日期</th>
					<td>
						${bean.sbl_modifydate}
					</td>
				</tr>	
				<tr>	
					<th>删除人</th>
					<td>
						${bean.sbl_deleteuser}
					</td>
				</tr>	
				<tr>	
					<th>删除日期</th>
					<td>
						${bean.sbl_deletedate}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
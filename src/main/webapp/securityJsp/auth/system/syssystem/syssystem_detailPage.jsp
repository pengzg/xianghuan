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
						${bean.ss_id}
					</td>
				</tr>	
				<tr>	
					<th>系统编码</th>
					<td>
						${bean.ss_code}
					</td>
				</tr>	
				<tr>	
					<th>系统名称</th>
					<td>
						${bean.ss_name}
					</td>
				</tr>	
				<tr>	
					<th>域名前缀</th>
					<td>
						${bean.ss_url}
					</td>
				</tr>	
				<tr>	
					<th>系统描述</th>
					<td>
						${bean.ss_desc}
					</td>
				</tr>	
				<tr>	
					<th>新增人</th>
					<td>
						${bean.ss_adduser}
					</td>
				</tr>	
				<tr>	
					<th>新增日期 </th>
					<td>
						${bean.ss_adddate}
					</td>
				</tr>	
				<tr>	
					<th>最后修改人</th>
					<td>
						${bean.ss_modifyuser}
					</td>
				</tr>	
				<tr>	
					<th>最后修改日期</th>
					<td>
						${bean.ss_modifydate}
					</td>
				</tr>	
				<tr>	
					<th>删除人</th>
					<td>
						${bean.ss_deleteuser}
					</td>
				</tr>	
				<tr>	
					<th>删除日期</th>
					<td>
						${bean.ss_deletedate}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
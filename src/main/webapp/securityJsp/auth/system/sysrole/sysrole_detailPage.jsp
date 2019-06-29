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
			<legend>角色基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>
					<th>编号</th>
					<td>${bean.sr_id}</td>
				</tr>
				<tr style="display: none">
					<th>上级角色</th>
					<td>${bean.name}</td>
				</tr>
				<tr>
					<th>顺序</th>
					<td>${bean.sr_order}</td>
				</tr>
				<tr>
					<th>角色名称</th>
					<td>${bean.sr_name}</td>
				</tr>
				<tr>
					<th>角色状态</th>
					<td>${bean.sr_status_nameref}</td>
				</tr>
				<tr>
					<th>部门名称</th>
					<td>${bean.sr_so_orgid_nameref}</td>
				</tr>
				<tr>
					<th>角色描述</th>
					<td>${bean.sr_desc}</td>
				</tr>
				<tr>	
					<th>版本号</th>
					<td> ${bean.sr_version} </td>
				</tr>	
				<tr>	
					<th>记录插入时间</th>
					<td> ${bean.sr_ts} </td>
				</tr>	
				<tr>
					<th>删除标志位</th>
					<td>
						<c:if test="${bean.sr_dr==1}">有效</c:if>
						<c:if test="${bean.sr_dr==0}">无效</c:if>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
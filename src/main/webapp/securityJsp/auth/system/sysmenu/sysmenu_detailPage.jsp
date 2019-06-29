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
					<th>编号</th>
					<td> ${bean.sm_id} </td>
					<th>菜单名称</th>
					<td> ${bean.sm_name} </td>
				</tr>
				<tr>
					<th>访问地址</th>
					<td> ${bean.sm_url} </td>
					<th>上级节点</th>
					<td> ${bean.name} </td>
				</tr>
				<tr>
					<th>菜单类型</th>
					<td> ${bean.sm_typeid} </td>
					<th>所属系统</th>
					<td> ${bean.ss_name} </td>
				</tr>
				<tr>
					<th>图标</th>
					<td> ${bean.sm_iconcls} </td>
					<th>描述</th>
					<td> ${bean.sm_description} </td>
				</tr>
				<tr>
					<th>目标</th>
					<td> ${bean.sm_target} </td>
					<th>序号</th>
					<td> ${bean.sm_seq} </td>
				</tr>
				<tr>
					<th>状态</th>
					<td> ${bean.sm_status} </td>
					<th>标志位</th>
					<td> ${bean.sm_dr} </td>
				</tr>
				<tr>
					<th>时间</th>
					<td> ${bean.sm_ts} </td>
					<th>版本号</th>
					<td> ${bean.sm_version} </td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
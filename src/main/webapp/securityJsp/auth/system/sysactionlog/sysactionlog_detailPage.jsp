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
					<th>编号</th>
					<td>
						${bean.sal_id}
					</td>
				</tr>	
				<tr>	
					<th>操作人编号</th>
					<td>
						${bean.sal_creatid}
					</td>
				</tr>	
				<tr>	
					<th>操作人姓名</th>
					<td>
						${bean.sal_createname}
					</td>
				</tr>	
				<tr>	
					<th>事件名称</th>
					<td>
						${bean.sal_actionname}
					</td>
				</tr>	
				<tr>	
					<th>事件类型</th>
					<td>
						${bean.sal_actiontype}
					</td>
				</tr>	
				<tr>	
					<th>事件时间</th>
					<td>
						${bean.sal_actiontime}
					</td>
				</tr>	
				<tr>	
					<th>所属人编号</th>
					<td>
						${bean.sal_ownerid}
					</td>
				</tr>	
				<tr>	
					<th>机器IP</th>
					<td>
						${bean.sal_ip}
					</td>
				</tr>	
				<tr>	
					<th>日志平台类型</th>
					<td>
						${bean.sal_plattype}
					</td>
				</tr>	
				<tr>	
					<th>日志描述</th>
					<td>
						${bean.sal_desc}
					</td>
				</tr>	
				<tr>	
					<th>时间</th>
					<td>
						${bean.sal_ts}
					</td>
				</tr>	
				<%-- <tr>	
					<th>删除标志位</th>
					<td>
						${bean.sal_dr}
					</td>
				</tr>	 --%>
			</table>
		</fieldset>
	</form>
</body>
</html>
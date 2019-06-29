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
					<th>部门ID</th>
					<td>
						${bean.so_orgid}
					</td>
					<th>部门编码</th>
					<td>
						${bean.so_orgcode}
					</td>
				</tr>	
				<tr>	
					<th>所属品牌</th>
					<td>
						${bean.so_brand_nameref}
					</td>
					<th>部门名称</th>
					<td>
						${bean.so_orgname}
					</td>
				</tr>	
				<tr>	
					<th>联系人姓名</th>
					<td>
						${bean.so_contactname}
					</td>
					<th>联系人电话</th>
					<td>
						${bean.so_contactphone}
					</td>
				</tr>	
				<tr>	
					<th>传真</th>
					<td>
						${bean.so_fax}
					</td>
					<th>部门地址</th>
					<td>
						${bean.so_orgadds}
					</td>
				</tr>	
				<tr>	
					<th>上级部门</th>
					<td>
						${bean.so_orgparid}
					</td>
					<th>部门状态</th>
					<td>
						<c:if test="${bean.so_status==1}" > 启用 </c:if> 
						<c:if test="${bean.so_status==0}" > 禁用 </c:if> 
					</td>
				</tr>	
				<tr>	
					<th>部门版本号</th>
					<td>
						${bean.so_version}
					</td>
					<th>记录插入时间</th>
					<td>
						${bean.so_ts}
					</td>
				</tr>	
				<%-- <tr>	
					<th>删除标志位</th>
					<td>
						<c:if test="${bean.so_dr==1}">有效</c:if>
						<c:if test="${bean.so_dr==0}">无效</c:if>
					</td>
					<th>签约商户数量上限</th>
					<td>
						${bean.so_me_limit}
					</td>
				</tr>	
				<tr>	
					<th>个人用户数量上限</th>
					<td>
						${bean.so_per_limit}
					</td>
					<th>代理商层级上限</th>
					<td>
						${bean.so_agent_level_limit}
					</td>
				</tr>	
				<tr>	
					<th>外系统ID</th>
					<td>
						${bean.so_id_ext}
					</td>
					<th>外系统编码</th>
					<td>
						${bean.so_code_ext}
					</td>
				</tr>	
				<tr>
					<th>外系统名称</th>
					<td>
						${bean.so_name_ext}
					</td>
				</tr> --%>
			</table>
		</fieldset>
	</form>
</body>
</html>
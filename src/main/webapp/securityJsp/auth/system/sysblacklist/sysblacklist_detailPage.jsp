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
	function goBackFun(){
		window.location.href=sy.contextPath + '/base/sysBlackListControl/listPage.action';
	}
</script>
</head>
<body>
	<form method="post" class="form">
		<table class="table" style="width: 100%;">
			<tr >
				<th colspan="10">
					<div style="text-align: right;padding-right: 5px;padding-bottom: 5px;">
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-database_go',plain:true" onclick="goBackFun();">返回</a>
					</div>
				</th>
			</tr>
		</table>
		<fieldset>
			<legend>基本信息</legend>
			<table class="table" style="width: 100%;">
				<tr>	
					<th>主键</th>
					<td>
						${bean.sbl_id}
					</td>
				</tr>	
				<tr>	
					<th>平台  1社区快线  2社区盒子</th>
					<td>
						${bean.sbl_type}
					</td>
				</tr>	
				<tr>	
					<th>用户对应id</th>
					<td>
						${bean.sbl_userid}
					</td>
				</tr>	
				<tr>	
					<th>ip地址</th>
					<td>
						${bean.sbl_ip}
					</td>
				</tr>	
				<tr>	
					<th>原因</th>
					<td>
						${bean.sbl_note}
					</td>
				</tr>	
				<tr>	
					<th>删除标记位</th>
					<td>
						${bean.sbl_dr}
					</td>
				</tr>	
				<tr>	
					<th>状态</th>
					<td>
						${bean.sbl_status}
					</td>
				</tr>	
				<tr>	
					<th>添加时间</th>
					<td>
						${bean.sbl_addtime}
					</td>
				</tr>	
				<tr>	
					<th>更新时间</th>
					<td>
						${bean.sbl_updatetime}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
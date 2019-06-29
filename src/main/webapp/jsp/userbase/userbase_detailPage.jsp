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
		window.location.href=sy.contextPath + '/base/userBaseControl/listPage.htm';
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
					<th></th>
					<td>
						${bean.ub_id}
					</td>
				</tr>	
				<tr>	
					<th>用户真实姓名</th>
					<td>
						${bean.ub_realname}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.ub_username}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.ub_mobile}
					</td>
				</tr>	
				<tr>	
					<th>经度</th>
					<td>
						${bean.ub_lng}
					</td>
				</tr>	
				<tr>	
					<th>纬度</th>
					<td>
						${bean.ub_lat}
					</td>
				</tr>	
				<tr>	
					<th>微信openid</th>
					<td>
						${bean.ub_openid}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.ub_unionid}
					</td>
				</tr>	
				<tr>	
					<th>邮件</th>
					<td>
						${bean.ub_email}
					</td>
				</tr>	
				<tr>	
					<th>性别 </th>
					<td>
						${bean.ub_sex}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.ub_last_logintime}
					</td>
				</tr>	
				<tr>	
					<th>注册时间</th>
					<td>
						${bean.ub_regtime}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.ub_pinyin}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.ub_status}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.ub_dr}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.ub_addtime}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.ub_updatetime}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
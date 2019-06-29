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
		window.location.href=sy.contextPath + '/base/baseTagControl/listPage.htm';
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
						${bean.bt_id}
					</td>
				</tr>	
				<tr>	
					<th>标签名称</th>
					<td>
						${bean.bt_title}
					</td>
				</tr>	
				<tr>	
					<th>标签编码</th>
					<td>
						${bean.bt_code}
					</td>
				</tr>	
				<tr>	
					<th>标签类型 1-用户 2-房子 </th>
					<td>
						${bean.bt_type}
					</td>
				</tr>	
				<tr>	
					<th>图标</th>
					<td>
						${bean.bt_icon}
					</td>
				</tr>	
				<tr>	
					<th>1在前台显示 2 不在前台显示</th>
					<td>
						${bean.bt_is_show}
					</td>
				</tr>	
				<tr>	
					<th>标签排序</th>
					<td>
						${bean.bt_order}
					</td>
				</tr>	
				<tr>	
					<th>添加人</th>
					<td>
						${bean.bt_adduserid}
					</td>
				</tr>	
				<tr>	
					<th>标签状态 1-启用 0-禁用</th>
					<td>
						${bean.bt_status}
					</td>
				</tr>	
				<tr>	
					<th>删除标识位</th>
					<td>
						${bean.bt_dr}
					</td>
				</tr>	
				<tr>	
					<th>创建时间</th>
					<td>
						${bean.bt_addtime}
					</td>
				</tr>	
				<tr>	
					<th>修改时间</th>
					<td>
						${bean.bt_updatetime}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
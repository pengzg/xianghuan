<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript">
	function goBackFun(){
		window.location.href=sy.contextPath + '/base/baseServiceControl/listPage.htm';
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
					<th>自增id</th>
					<td>
						${bean.bs_id}
					</td>
				</tr>	
				<tr>	
					<th>类别id</th>
					<td>
						${bean.bs_categoryid}
					</td>
				</tr>	
				<tr>	
					<th>类别编码</th>
					<td>
						${bean.bs_categorycode}
					</td>
				</tr>	
				<tr>	
					<th>联系人姓名 </th>
					<td>
						${bean.bs_name}
					</td>
				</tr>	
				<tr>	
					<th>联系人电话</th>
					<td>
						${bean.bs_mobile}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.bs_contact_name}
					</td>
				</tr>	
				<tr>	
					<th>地址</th>
					<td>
						${bean.bs_address}
					</td>
				</tr>	
				<tr>	
					<th>图片</th>
					<td>
						${bean.bs_image}
					</td>
				</tr>	
				<tr>	
					<th>拨打数量</th>
					<td>
						${bean.bs_clicknum}
					</td>
				</tr>	
				<tr>	
					<th>经度</th>
					<td>
						${bean.bs_lng}
					</td>
				</tr>	
				<tr>	
					<th> 纬度</th>
					<td>
						${bean.bs_lat}
					</td>
				</tr>	
				<tr>	
					<th>简介 </th>
					<td>
						${bean.bs_intro}
					</td>
				</tr>	
				<tr>	
					<th>评价星级</th>
					<td>
						${bean.bs_star}
					</td>
				</tr>	
				<tr>	
					<th>备注</th>
					<td>
						${bean.bs_note}
					</td>
				</tr>	
				<tr>	
					<th>工作时间</th>
					<td>
						${bean.bs_officehour}
					</td>
				</tr>	
				<tr>	
					<th>排序</th>
					<td>
						${bean.bs_vieworder}
					</td>
				</tr>	
				<tr>	
					<th>状态 </th>
					<td>
						${bean.bs_state}
					</td>
				</tr>	
				<tr>	
					<th>删除标记位</th>
					<td>
						${bean.bs_dr}
					</td>
				</tr>	
				<tr>	
					<th>添加时间</th>
					<td>
						${bean.bs_addtime}
					</td>
				</tr>	
				<tr>	
					<th>更新时间</th>
					<td>
						${bean.bs_updatetime}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
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
		window.location.href=sy.contextPath + '/base/houseBaseControl/listPage.htm';
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
						${bean.hb_id}
					</td>
				</tr>	
				<tr>	
					<th>标题</th>
					<td>
						${bean.hb_title}
					</td>
				</tr>	
				<tr>	
					<th>简介</th>
					<td>
						${bean.hb_summary}
					</td>
				</tr>	
				<tr>	
					<th>介绍</th>
					<td>
						${bean.hb_intro}
					</td>
				</tr>	
				<tr>	
					<th>主图</th>
					<td>
						${bean.hb_cover}
					</td>
				</tr>	
				<tr>	
					<th>用户</th>
					<td>
						${bean.hb_userid}
					</td>
				</tr>	
				<tr>	
					<th>联系电话</th>
					<td>
						${bean.hb_contacts_mobile}
					</td>
				</tr>	
				<tr>	
					<th>联系人姓名</th>
					<td>
						${bean.hb_contacts_name}
					</td>
				</tr>	
				<tr>	
					<th>发布时间</th>
					<td>
						${bean.hb_posttime}
					</td>
				</tr>	
				<tr>	
					<th>地址</th>
					<td>
						${bean.hb_address}
					</td>
				</tr>	
				<tr>	
					<th>价格</th>
					<td>
						${bean.hb_price}
					</td>
				</tr>	
				<tr>	
					<th>价格区间 </th>
					<td>
						${bean.hb_price_range}
					</td>
				</tr>	
				<tr>	
					<th>经度</th>
					<td>
						${bean.hb_lng}
					</td>
				</tr>	
				<tr>	
					<th>纬度 </th>
					<td>
						${bean.hb_lat}
					</td>
				</tr>	
				<tr>	
					<th>是否显示  1是 2 不显示</th>
					<td>
						${bean.hb_isshow}
					</td>
				</tr>	
				<tr>	
					<th>标签</th>
					<td>
						${bean.hb_tag}
					</td>
				</tr>	
				<tr>	
					<th>状态  1正常</th>
					<td>
						${bean.hb_status}
					</td>
				</tr>	
				<tr>	
					<th>1正常</th>
					<td>
						${bean.hb_dr}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.hb_addtime}
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						${bean.hb_updatetime}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
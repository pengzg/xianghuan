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
				<tr style="display:none">	
					<th >主键</th>
					<td>
						${bean.bpc_id}
					</td>
				</tr>	
				<tr>	
					<th>编码</th>					
					<td> 
						 <input style="resize:none" readonly="readonly" value="${bean.bpc_key_code}"></input>
					</td>
				</tr>	
				<tr>	
					<th>值</th>
					<td>						
					    <textarea  style="resize:none" readonly="readonly">${bean.bpc_value}</textarea>
					</td>
				</tr>	
				<tr>	
					<th>备注说明</th>
					<td>
						<textarea  style="resize:none" readonly="readonly">${bean.bpc_remark}</textarea>
					</td>
				</tr>	
				<tr style="display:none">	
					<th >所属运营商ID</th>
					<td>
						${bean.bpc_orgid}
					</td>
				</tr>	
				<tr style="display:none">	
					<th >状态 0禁用 1启用</th>
					<td>
						${bean.bpc_status}
					</td>
				</tr>	
				<tr style="display:none">	
					<th>删除标志位:0删除，1未删除</th>
					<td>
						${bean.bpc_dr}
					</td>
				</tr>	
				<tr style="display:none">	
					<th>版本号</th>
					<td>
						${bean.bpc_version}
					</td>
				</tr>	
				<tr style="display:none">	
					<th>新增人</th>
					<td>
						${bean.bpc_adduser}
					</td>
				</tr>	
				<tr style="display:none">	
					<th>新增日期</th>
					<td>
						${bean.bpc_adddate}
					</td>
				</tr>	
				<tr style="display:none">	
					<th>最后修改人</th>
					<td>
						${bean.bpc_modifyuser}
					</td>
				</tr>	
				<tr style="display:none">	
					<th>最后修改日期</th>
					<td>
						${bean.bpc_modifydate}
					</td>
				</tr>	
				<tr style="display:none">	
					<th>删除人</th>
					<td>
						${bean.bpc_deleteuser}
					</td>
				</tr>	
				<tr style="display:none">	
					<th>删除日期</th>
					<td>
						${bean.bpc_deletedate}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
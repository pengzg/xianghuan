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
	var submitForm = function($dialog, $grid, $pjq) {
		if ($('form').form('validate')) {
			var url;
			if ($(':input[name="ub_id"]').val().length > 0) {
				url = sy.contextPath + '/admin/userBaseControl/update.htm';
			} else {
				url = sy.contextPath + '/admin/userBaseControl/insert.htm';
			}
			$.post(url, sy.serializeObject($('form')), function(result) {
				if (result.success) {
					$grid.datagrid('load');
					$dialog.dialog('destroy');
				} else {
					$pjq.messager.alert('提示', result.msg, 'error');
				}
			}, 'json');
		}
	};
	
	
		$(function() {
		   //$('#').combobox('setValue','');
		});
		
		function updateFun(){
			if ($('form').form('validate')) {
				var url;
				url = sy.contextPath + '/admin/userBaseControl/update.htm';
				$.post(url, sy.serializeObject($('form')), function(result) {
					if (result.success) {
					    $.messager.alert('',result.msg);
						window.location.href=sy.contextPath + '/admin/userBaseControl/listPage.htm';
					} else {
						$.messager.show({title : '提示',msg : result.msg});
					}
				}, 'json');
			}
		}
		
		
		function goBackFun(){
			window.location.href=sy.contextPath + '/admin/userBaseControl/listPage.htm';
		}
		
		
</script>
</head>
<body>
	<form method="post" class="form">
		<table class="table" style="width: 100%;">
			<tr >
				<th colspan="10">
					<div style="text-align: right;padding-right: 5px;padding-bottom: 5px;">
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-database_save',plain:true" onclick="updateFun();">保存</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'ext-icon-database_go',plain:true" onclick="goBackFun();">返回</a>
					</div>
				</th>
			</tr>
		</table>
		
		<fieldset>
			<legend>基本信息</legend>
			<table class="table" style="width: 100%;">

						<input name="ub_id" type="hidden" value="${bean.ub_id}" class="easyui-validatebox" data-options="required:false"  />

				<tr>	
					<th>用户真实姓名</th>
					<td>
						<input name="ub_realname" value="${bean.ub_realname}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>用户名</th>
					<td>
						<input name="ub_username" value="${bean.ub_username}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>手机号</th>
					<td>
						<input name="ub_mobile" value="${bean.ub_mobile}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>经度</th>
					<td>
						<input name="ub_lng" value="${bean.ub_lng}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>纬度</th>
					<td>
						<input name="ub_lat" value="${bean.ub_lat}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>微信openid</th>
					<td>
						<input name="ub_openid" value="${bean.ub_openid}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>unionid</th>
					<td>
						<input name="ub_unionid" value="${bean.ub_unionid}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>邮件</th>
					<td>
						<input name="ub_email" value="${bean.ub_email}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>性别 </th>
					<td>
						<input name="ub_sex" value="${bean.ub_sex}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				
					
				<tr>	
					<th>拼音</th>
					<td>
						<input name="ub_pinyin" value="${bean.ub_pinyin}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>状态</th>
					<td>
					<input id="ub_status" name="ub_status" class="easyui-combobox"   data-options="url:'${pageContext.request.contextPath}/base/baseDataControl/detailItem.action?codekey=2006',valueField:'bd_code',textField:'bd_name',panelHeight:'auto'" value="${bean.ub_status}" />
					</td>
				</tr>	
				<tr>	
					<th>最后一次登录时间 </th>
					<td>
						${bean.ub_last_logintime}
					</td>
				</tr>	
				<tr>	
					<th>注册时间 </th>
					<td>
						${bean.ub_regtime}
					</td>
				</tr>	
				<tr>	
					<th>更新时间</th>
					<td>
						${bean.ub_updatetime}
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
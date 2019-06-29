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
			if ($(':input[name="bs_id"]').val().length > 0) {
				url = sy.contextPath + '/admin/baseServiceControl/update.action';
			} else {
				url = sy.contextPath + '/admin/baseServiceControl/insert.action';
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
				url = sy.contextPath + '/admin/baseServiceControl/update.action';
				$.post(url, sy.serializeObject($('form')), function(result) {
					if (result.success) {
					    $.messager.alert('',result.msg);
						window.location.href=sy.contextPath + '/base/baseServiceControl/listPage.action';
					} else {
						$.messager.show({title : '提示',msg : result.msg});
					}
				}, 'json');
			}
		}
		
		
		function goBackFun(){
			window.location.href=sy.contextPath + '/base/baseServiceControl/listPage.action';
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
				<tr>	
					<th>自增id</th>
					<td>
						<input name="bs_id" value="${bean.bs_id}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>类别id</th>
					<td>
						<input name="bs_categoryid" value="${bean.bs_categoryid}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>类别编码</th>
					<td>
						<input name="bs_categorycode" value="${bean.bs_categorycode}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>公司名 </th>
					<td>
						<input name="bs_name" value="${bean.bs_name}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>联系人电话</th>
					<td>
						<input name="bs_mobile" value="${bean.bs_mobile}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>联系人姓名</th>
					<td>
						<input name="bs_contact_name" value="${bean.bs_contact_name}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>地址</th>
					<td>
						<input name="bs_address" value="${bean.bs_address}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>图片</th>
					<td>
						<input name="bs_image" value="${bean.bs_image}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>拨打数量</th>
					<td>
						<input name="bs_clicknum" value="${bean.bs_clicknum}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>经度</th>
					<td>
						<input name="bs_lng" value="${bean.bs_lng}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th> 纬度</th>
					<td>
						<input name="bs_lat" value="${bean.bs_lat}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>简介 </th>
					<td>
						<input name="bs_intro" value="${bean.bs_intro}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>评价星级</th>
					<td>
						<input name="bs_star" value="${bean.bs_star}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>备注</th>
					<td>
						<input name="bs_note" value="${bean.bs_note}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>工作时间</th>
					<td>
						<input name="bs_officehour" value="${bean.bs_officehour}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>排序</th>
					<td>
						<input name="bs_vieworder" value="${bean.bs_vieworder}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>状态 </th>
					<td>
						<input name="bs_state" value="${bean.bs_state}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>删除标记位</th>
					<td>
						<input name="bs_dr" value="${bean.bs_dr}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>添加时间</th>
					<td>
						<input name="bs_addtime" value="${bean.bs_addtime}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>更新时间</th>
					<td>
						<input name="bs_updatetime" value="${bean.bs_updatetime}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
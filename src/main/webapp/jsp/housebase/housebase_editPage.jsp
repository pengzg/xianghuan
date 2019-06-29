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
			if ($(':input[name="hb_id"]').val().length > 0) {
				url = sy.contextPath + '/base/houseBaseControl/update.htm';
			} else {
				url = sy.contextPath + '/base/houseBaseControl/insert.htm';
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
				url = sy.contextPath + '/base/houseBaseControl/update.htm';
				$.post(url, sy.serializeObject($('form')), function(result) {
					if (result.success) {
					    $.messager.alert('',result.msg);
						window.location.href=sy.contextPath + '/base/houseBaseControl/listPage.htm';
					} else {
						$.messager.show({title : '提示',msg : result.msg});
					}
				}, 'json');
			}
		}
		
		
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
					<th></th>
					<td>
						<input name="hb_id" value="${bean.hb_id}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>标题</th>
					<td>
						<input name="hb_title" value="${bean.hb_title}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>简介</th>
					<td>
						<input name="hb_summary" value="${bean.hb_summary}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>介绍</th>
					<td>
						<input name="hb_intro" value="${bean.hb_intro}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>主图</th>
					<td>
						<input name="hb_cover" value="${bean.hb_cover}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>用户</th>
					<td>
						<input name="hb_userid" value="${bean.hb_userid}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>联系电话</th>
					<td>
						<input name="hb_contacts_mobile" value="${bean.hb_contacts_mobile}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>联系人姓名</th>
					<td>
						<input name="hb_contacts_name" value="${bean.hb_contacts_name}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>发布时间</th>
					<td>
						<input name="hb_posttime" value="${bean.hb_posttime}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>地址</th>
					<td>
						<input name="hb_address" value="${bean.hb_address}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>价格</th>
					<td>
						<input name="hb_price" value="${bean.hb_price}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>价格区间 </th>
					<td>
						<input name="hb_price_range" value="${bean.hb_price_range}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>经度</th>
					<td>
						<input name="hb_lng" value="${bean.hb_lng}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>纬度 </th>
					<td>
						<input name="hb_lat" value="${bean.hb_lat}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>是否显示  1是 2 不显示</th>
					<td>
						<input name="hb_isshow" value="${bean.hb_isshow}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>标签</th>
					<td>
						<input name="hb_tag" value="${bean.hb_tag}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>状态  1正常</th>
					<td>
						<input name="hb_status" value="${bean.hb_status}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th>1正常</th>
					<td>
						<input name="hb_dr" value="${bean.hb_dr}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						<input name="hb_addtime" value="${bean.hb_addtime}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
				<tr>	
					<th></th>
					<td>
						<input name="hb_updatetime" value="${bean.hb_updatetime}" class="easyui-validatebox" data-options="required:false"  />
					</td>
				</tr>	
			</table>
		</fieldset>
	</form>
</body>
</html>
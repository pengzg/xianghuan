/*弹出参照应用名
 * 1 地区弹框
 *   调用函数  showBasePlatAreaWin 
 *   回调函数findBasePlatAreaCallBack
 */


/**
 * 地区弹框
 * 注：页面弹框DIV ID 统一命名为 showWindow
 * loc_path: ${pageContext.request.contextPath}
 * id: 此参数为冗余参数，只为传值(默认为 '')
 * chkType: s-单选 m-多(默认)
 */
function showBasePlatAreaWin(loc_path,chkType){
	var path=loc_path+"/base/basePlatAreaControl/listPageRef.htm?chkType="+chkType;
	var dialog = parent.sy.modalDialog({
			title:'选择地区类型信息',
			href:path,
			width:650,
			height : 560,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bpa_id+","+datas[i].bpa_code+","+datas[i].bpa_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						findBasePlatAreaCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function findBasePlatAreaCallBack(res){}



/**
 * 省份弹框
 * 注：页面弹框DIV ID 统一命名为 showWindow
 * loc_path: ${pageContext.request.contextPath}
 * id: 此参数为冗余参数，只为传值(默认为 '')
 * chkType: s-单选 m-多(默认)
 */
function showBaseProciceWin(loc_path,chkType){
	var path=loc_path+"/base/basePlatAreaControl/listPageRef.htm?chkType="+chkType+"&bpa_level=1";
	var dialog = parent.sy.modalDialog({
			title:'选择地区类型信息',
			href:path,
			width:780,
			height : 560,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bpa_id+","+datas[i].bpa_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showBaseProciceWinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showBaseProciceWinCallBack(res){}



function showBaseCityWin(loc_path,chkType,bpa_parent_id){
	var path=loc_path+"/base/basePlatAreaControl/listPageRef.htm?chkType="+chkType+"&bpa_level=2&bpa_parent_id="+bpa_parent_id;
	var dialog = parent.sy.modalDialog({
			title:'选择地区类型信息',
			href:path,
			width:680,
			height : 560,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bpa_id+","+datas[i].bpa_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showBaseCityWinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showBaseCityWinCallBack(res){}




function showBaseDistrictWin(loc_path,chkType,bpa_parent_id){
	var path=loc_path+"/base/basePlatAreaControl/listPageRef.htm?chkType="+chkType+"&bpa_level=3&bpa_parent_id="+bpa_parent_id;
	var dialog = parent.sy.modalDialog({
			title:'选择地区类型信息',
			href:path,
			width:680,
			height : 560,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bpa_id+","+datas[i].bpa_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showBaseDistrictWinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showBaseDistrictWinCallBack(res){}



/*
 *公司管理 
 */
function showBaseCorpWin(loc_path,chkType){
	var path=loc_path+"/base/baseCorpControl/listPageRef.htm?chkType="+chkType+"";
	var dialog = parent.sy.modalDialog({
			title:'选择物业公司信息',
			href:path,
			width:680,
			height : 560,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bc_id+","+datas[i].bc_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showBaseCorpWinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showBaseCorpWinCallBack(res){}



/*
 *商业公类
 */


function showBaseBusiness1Win(loc_path,chkType){
	var path=loc_path+"/base/baseBusinessTypeControl/listPageRef.htm?chkType="+chkType+"&bbt_level=1&bbt_parent_id=1000000";
	var dialog = parent.sy.modalDialog({
			title:'选择分类信息',
			href:path,
			width:680,
			height : 560,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bbt_id+","+datas[i].bbt_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showBaseBusiness1WinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showBaseBusiness1WinCallBack(res){}


function showBaseBusiness2Win(loc_path,chkType,bbt_parent_id){
	var path=loc_path+"/base/baseBusinessTypeControl/listPageRef.htm?chkType="+chkType+"&bbt_parent_id="+bbt_parent_id;
	var dialog = parent.sy.modalDialog({
			title:'选择分类信息',
			href:path,
			width:680,
			height : 560,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bbt_id+","+datas[i].bbt_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showBaseBusiness2WinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showBaseBusiness2WinCallBack(res){}

/**
 *商家信息列表
 */
function showUserMerchantWin(loc_path,chkType){
	var path=loc_path+"/user/userMerchantControl/listPageRef.htm?chkType="+chkType;
	var dialog = parent.sy.modalDialog({
			title:'商家信息',
			href:path,
			width:680,
			height : 560,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].um_id+","+datas[i].um_name+","
							+datas[i].um_procice+","+datas[i].um_procice_nameref+","
							+datas[i].um_city+","+datas[i].um_city_nameref+","
							+datas[i].um_district+","+datas[i].um_district_nameref+","
							+datas[i].um_category1+","+datas[i].um_category1_nameref+","
							+datas[i].um_category2+","+datas[i].um_category2_nameref;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showUserMerchantWinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showUserMerchantWinCallBack(res){}

/**
 * 街道信息列表
 */
function showStreetnoticeWin(loc_path,chkType){
	var path=loc_path+"/base/baseStreetControl/listPageRef.htm?chkType="+chkType;
	var dialog = parent.sy.modalDialog({
			title:'街道信息',
			href:path,
			width:680,
			height : 560,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bs_id+","+datas[i].bs_sort_no+","
							+datas[i].bs_code+","+datas[i].bs_name+","
							+datas[i].bs_procice_nameref+","+datas[i].bs_city_nameref+","
							+datas[i].bs_district_nameref+","+datas[i].bs_tel+","
							+datas[i].bs_enterprisesecret+","+datas[i].bs_corpid+","
							+datas[i].bs_status_nameref;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showStreetnoticeWinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showStreetnoticeWinCallBack(res){}

/**
 * 社区信息列表
 */
function showCommunityWin(loc_path,chkType,bc_procice,bc_city,bc_district){
	var path=loc_path+"/base/baseCommunityControl/listPageRef.htm?chkType="+chkType+"&bc_procice="+bc_procice+"&bc_city="+bc_city+"&bc_district="+bc_district;
	var dialog = parent.sy.modalDialog({
			title:'社区信息',
			href:path,
			width:680,
			height : 480,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bc_id+","+datas[i].bc_sort_no+","
							+datas[i].bc_name+","+datas[i].bc_procice_nameref+","
							+datas[i].bc_city_nameref+","+datas[i].bc_district_nameref+","
							+datas[i].bc_scope+","+datas[i].bc_address+","
							+datas[i].bc_tel+","+datas[i].bc_serviceid+","
							+datas[i].bc_corpid_nameref+datas[i].bc_status_nameref;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showCommunityWinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showCommunityWinCallBack(res){}


/**
 * 快递公司列表
 */
function showExpressWin(loc_path,chkType){
	var path=loc_path+"/base/baseExpressinfoControl/listPageRef.htm?chkType="+chkType;
	var dialog = parent.sy.modalDialog({
			title:'快递公司信息',
			href:path,
			width:680,
			height : 480,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].be_id+','+datas[i].be_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						showExpressWinCallBack(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showExpressWinCallBack(res){}

/**
 * 自提柜列表
 */
function showCabinetWin(loc_path,chkType,userid){
	var path=loc_path+"/base/baseCabinetControl/listPageRef.htm?chkType="+chkType+"&userid="+userid;
	var dialog = parent.sy.modalDialog({
			title:'快递公司信息',
			href:path,
			width:680,
			height : 480,
			buttons:[{
				text:"确定",
				iconCls:"icon-ok",
				handler:function(){
				var datas =parent.$("#grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","值不能为空!请选择!");
						return false;
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bc_cabinetid;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						$.post(sy.contextPath + '/base/baseCabinetControl/grantCatbinet.htm', {
							'str' : reStr,userid:userid
						}, function(result) {
							if (result.success) {
								$('#passwordDialog').dialog('close');
							}
							$.messager.alert('提示',result.msg , 'info');
						}, 'json');
						dialog.dialog('destroy');
					}
				}
			},{
				text:"取消",
				iconCls:"icon-cancel",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 回调函数，需重写
 * @param res
 */
function showCabinetWinCallBack(res){}

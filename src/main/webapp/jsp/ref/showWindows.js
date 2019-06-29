/**
 * 商品选择弹框
 * @param loc_path
 * @param shop_id
 * @param isClose
 */
function choiseGoods(loc_path,shop_id,isClose){
	var path=loc_path + '/management/product/getShopGoods.action?shop_id='+shop_id;
	var dialog = parent.sy.modalDialog({
			title:'选择商品',
			href:path,
			width :  1000,
			height : 580,
			buttons:[{
				text:"选择并继续",
				handler:function(){
					//var datas =parent.$("#product_grid_ref").datagrid("getSelections");
					var datas =parent.$("#product_grid_ref").datagrid("getChecked");
					handlerCheckData(datas,'N',dialog);
				}
			},{
				text:"选择",
				handler:function(){
				//var datas =parent.$("#product_grid_ref").datagrid("getSelections");
				var datas =parent.$("#product_grid_ref").datagrid("getChecked");
					handlerCheckData(datas,'Y',dialog);
				}
			},{
				text:"关闭",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}

/**
 * 加盟商调整单商品选择弹框
 * @param loc_path
 * @param shop_id
 * @param isClose
 */
function choiseGoodsAdjust(loc_path,shop_id,isClose){
	var path=loc_path + '/management/product/getShopGoods.action?shop_id='+shop_id+'&isAdjust=1';
	var dialog = parent.sy.modalDialog({
			title:'选择商品',
			href:path,
			width :  1000,
			height : 580,
			buttons:[{
				text:"选择并继续",
				handler:function(){
					//var datas =parent.$("#product_grid_ref").datagrid("getSelections");
					var datas =parent.$("#product_grid_ref").datagrid("getChecked");
					handlerCheckData(datas,'N',dialog);
				}
			},{
				text:"选择",
				handler:function(){
				//var datas =parent.$("#product_grid_ref").datagrid("getSelections");
				var datas =parent.$("#product_grid_ref").datagrid("getChecked");
					handlerCheckData(datas,'Y',dialog);
				}
			},{
				text:"关闭",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}




/**
 * 商品选择弹框
 * @param loc_path
 * @param shop_id
 * @param shop_id2
 * @param isClose
 */
function choiseGoods(loc_path,shop_id,shop_id2,isClose){
	var path=loc_path + '/management/product/getShopGoods2.action?shop_id='+shop_id+'&shop_id2='+shop_id2;
	var dialog = parent.sy.modalDialog({
			title:'选择商品',
			href:path,
			width :  1000,
			height : 580,
			buttons:[{
				text:"选择并继续",
				handler:function(){
					//var datas =parent.$("#product_grid_ref").datagrid("getSelections");
					var datas =parent.$("#product_grid_ref").datagrid("getChecked");
					handlerCheckData(datas,'N',dialog);
				}
			},{
				text:"选择",
				handler:function(){
				//var datas =parent.$("#product_grid_ref").datagrid("getSelections");
				var datas =parent.$("#product_grid_ref").datagrid("getChecked");
					handlerCheckData(datas,'Y',dialog);
				}
			},{
				text:"关闭",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
/**
 * 商品选择弹框
 * @param loc_path
 * @param shop_id
 * @param shop_id2
 * @param isClose
 */
function choiseGoodsDinghuo(loc_path,shop_id,shop_id2,isClose){
	var path=loc_path + '/management/product/getShopGoods3.action?shop_id='+shop_id+'&shop_id2='+shop_id2;
	var dialog = parent.sy.modalDialog({
			title:'选择商品',
			href:path,
			width :  1000,
			height : 580,
			buttons:[{
				text:"选择并继续",
				handler:function(){
					//var datas =parent.$("#product_grid_ref").datagrid("getSelections");
					var datas =parent.$("#product_grid_ref").datagrid("getChecked");
					handlerCheckData(datas,'N',dialog);
				}
			},{
				text:"选择",
				handler:function(){
				//var datas =parent.$("#product_grid_ref").datagrid("getSelections");
				var datas =parent.$("#product_grid_ref").datagrid("getChecked");
					handlerCheckData(datas,'Y',dialog);
				}
			},{
				text:"关闭",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}


function handlerCheckData(datas,isClose,dialog){
	if(datas.length==0){
		parent.$.messager.alert("提示","值不能为空!请选择!");
		return false;
	}else{
		var reStr="";
		var cg_num = 1; 
		for(var i=0;i<datas.length;i++){
			cg_num = parent.$("#check_goods_cg_num_"+datas[i].gp_goodsid).val();
			if(undefined == cg_num || null==cg_num || ''==cg_num){
				cg_num = 1;
			}
			var gp_cost_price  = datas[i].gp_cost_price;
			if(undefined == gp_cost_price ||null==gp_cost_price||''==gp_cost_price){
				 gp_cost_price = 0 ;
			}
			var gp_price = datas[i].gp_price;
			if(undefined == gp_price ||null==gp_price||''==gp_price){
				gp_price = 0 ;
			}
			//箱规价
			var gp_relation_price = datas[i].gp_relation_price;
			if(undefined == gp_relation_price ||null==gp_relation_price||''==gp_relation_price){
				gp_relation_price = 0 ;
			}
			//批发价
			var gp_wholesale_price = datas[i].gp_wholesale_price;
			if(undefined == gp_wholesale_price ||null==gp_wholesale_price||''==gp_wholesale_price){
				gp_wholesale_price = 0 ;
			}
			//箱规批发价
			var gp_wholesale_relation_price = datas[i].gp_wholesale_relation_price;
			if(undefined == gp_wholesale_relation_price ||null==gp_wholesale_relation_price||''==gp_wholesale_relation_price){
				gp_wholesale_relation_price = 0 ;
			}
			var gp_carton_num = datas[i].gp_carton_num;
			if(undefined == gp_carton_num ||null==gp_carton_num||''==gp_carton_num){
				gp_carton_num = 0 ;
			}
			
			reStr+=datas[i].gp_goodsid+","+datas[i].goods_code+","+datas[i].goods_international_code+","
			+datas[i].goods_title+","+datas[i].gp_stock+","+gp_cost_price+","+gp_price+","+cg_num+","+datas[i].gp_shopid_nameref
			+","+datas[i].gp_source+","+datas[i].gp_source_nameref
			+","+gp_wholesale_price+","+gp_relation_price+","+gp_wholesale_relation_price+","+gp_carton_num+","+datas[i].sgb_plannedprice;
			if(i < datas.length-1){
				reStr+="=";
			}
		}
		choiseGoodsCallBack(reStr);
		if(isClose=='Y'){
			dialog.dialog('destroy');
		}
	}
}
//回调
function choiseGoodsCallBack(data){}


/**
 * 审核弹出窗口
 * @param loc_path
 * @param sgh_generalhid 申请单ID
 */
function checkApplyShowWindow(loc_path,sgh_generalhid,version){
	var path=loc_path + '/management/stock/apply_check_ref.action?sgh_generalhid='+sgh_generalhid+'&sgh_version='+version;
	var dialog = parent.sy.modalDialog({
		title:'申请审核',
		href:path,
		width :  500,
		height : 300,
		buttons:[{
			text:"审核通过",
			handler:function(){
				var sgh_comments = parent.$("#sgh_comments").val();
				var sgh_version = parent.$("#sgh_version").val();
				if(undefined==sgh_comments || sgh_comments==''){
					parent.$.messager.alert("提示","请填写审核意见!","info");
					return false;
				}else{
					parent.$.messager.confirm('询问', '您确定要审核通过此条记录吗？', function(r) {
						if (r) {
							checkApplyCallBack_valid(5,sgh_version);
							dialog.dialog('destroy');
						}
					});
				}
			}
		},{
			text:"审核不通过",
			handler:function(){
				var sgh_comments = parent.$("#sgh_comments").val();
				var sgh_version = parent.$("#sgh_version").val();
				if(undefined==sgh_comments || sgh_comments==''){
					parent.$.messager.alert("提示","请填写审核意见!","info");
					return false;
				}else{
					parent.$.messager.confirm('询问', '您确定要审核不通过此条记录吗？', function(r) {
						if (r) {
							checkApplyCallBack_valid(6,sgh_version);
							dialog.dialog('destroy');
						}
					});
				}
			}
		},{
			text:"取消",
			handler:function(){
				dialog.dialog('destroy');
			}
		}]
	});
}
//回调
function checkApplyCallBack_valid(check_status,sgh_version){
	var sgh_generalhid = parent.$("#sgh_generalhid").val();
	var sgh_comments = parent.$("#sgh_comments").val();
	if(undefined==sgh_generalhid || sgh_generalhid==''){
		parent.$.messager.alert("提示","未检测到申请单信息,请刷新页面再尝试一下!","info");
		return false;
	}
	if(undefined==sgh_comments || sgh_comments==''){
		parent.$.messager.alert("提示","请填写审核意见!","info");
		return false;
	}
	checkApplyCallBack(check_status,sgh_generalhid,sgh_comments,sgh_version);
}
function checkApplyCallBack(check_status,sgh_generalhid,sgh_comments,sgh_version){}


/**
 * 根据条件查询商品信息（单个商品信息）
 * @param gb_code_all
 * @param shop_id
 */
function querySingleGoodsByCode(loc_path,gb_code_all,shop_id){
	if(''==gb_code_all){
		$.messager.alert("提示","请输入商品编号或国际编码!","info");
		return false;
	}
	if(''==shop_id){
		$.messager.alert("提示","请选择店铺信息!","info");
		return false;
	}
	var url = loc_path + "/management/product/queryGoodsInfo.action";
	$.messager.progress({
		text : '数据查询中....'
	});
	$.post(url,{gb_code_all:gb_code_all,shop_id:shop_id},function(data){
		$.messager.progress('close');
		if(data.success || data.success=='true'){
			querySingleGoodsByCodeCallBack(data.obj);
		}else{
			$.messager.alert("提示","商品信息不存在或已下架,请确定商品信息的准确性!","info");
		}
	},"json");
}

/**
 * 根据条件查询加盟商调整的商品信息（单个商品信息）
 * @param gb_code_all
 * @param shop_id
 */
function queryAdjustSingleGoodsByCode(loc_path,gb_code_all,shop_id){
	if(''==gb_code_all){
		$.messager.alert("提示","请输入商品编号或国际编码!","info");
		return false;
	}
	if(''==shop_id){
		$.messager.alert("提示","请选择店铺信息!","info");
		return false;
	}
	var url = loc_path + "/management/product/queryGoodsInfo.action?isAdjust=1";
	$.messager.progress({
		text : '数据查询中....'
	});
	$.post(url,{gb_code_all:gb_code_all,shop_id:shop_id},function(data){
		$.messager.progress('close');
		if(data.success || data.success=='true'){
			querySingleGoodsByCodeCallBack(data.obj);
		}else{
			$.messager.alert("提示","商品信息不存在或已下架或者该商品属于自采你只能查询零采的商品,请确定商品信息的准确性!","info");
		}
	},"json");
}


function querySingleGoodsByCodeCallBack(datas){}



/**
 * 选择供货商信息
 * @param loc_path
 * @param sc_type
 */
function choiseCustomer(loc_path,sc_type,mulit_check){
	var path=loc_path + '/sysCustomer/sysCustomerControl/listPageRef.action?sc_type='+sc_type+'&mulit_check='+mulit_check;
	var dialog = parent.sy.modalDialog({
			title:'选择供货商',
			href: path,
			width :  780,
			height : 450,
			buttons:[{
				text:"选择",
				handler:function(){
					var datas =parent.$("#customer_grid_ref").datagrid("getSelections");
					if(datas.length==0){
						parent.$.messager.alert("提示","请选择要添加的数据!");
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].sc_id+","+datas[i].sc_name+","+datas[i].sc_short_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						handlerCustomerData(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"关闭",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
function handlerCustomerData(res){}
/**
 * 选择采购单信息
 * @param loc_path
 * @param sc_type
 */
function choiseSupplier(loc_path,mulit_check,bussinss_type,check_filter){
	var path=loc_path + '/management/stockBillPurchaseControl/listPageRef.action?bussinss_type='+bussinss_type+'&mulit_check='+mulit_check+'&check_filter='+check_filter;
	var dialog = parent.sy.modalDialog({
		title:'选择采购单',
		href: path,
		width :  780,
		height : 450,
		buttons:[{
			text:"选择",
			handler:function(){
				var datas =parent.$("#supplier_grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","请选择要添加的数据!");
				}else{
					var reStr="";
					for(var i=0;i<datas.length;i++){
						reStr+=datas[i].sgh_generalhid+","+datas[i].sgh_billcode + "," +datas[i].sgh_customerid;
						if(i < datas.length-1){
							reStr+="=";
						}
					}
					handlerSupplierData(reStr);
					dialog.dialog('destroy');
				}
			}
		},{
			text:"关闭",
			handler:function(){
				dialog.dialog('destroy');
			}
		}]
	});
}

/**
 * 选择订货单
 * @param loc_path
 * @param sc_type
 */
function choisedinghuoSupplier(loc_path,mulit_check,bussinss_type,check_filter){
	var path=loc_path + '/management/stockBillOrderControl/listPageRef.action?bussinss_type='+bussinss_type+'&mulit_check='+mulit_check+'&check_filter='+check_filter;
	var dialog = parent.sy.modalDialog({
		title:'选择订货单',
		href: path,
		width :  780,
		height : 450,
		buttons:[{
			text:"选择",
			handler:function(){
				var datas =parent.$("#supplier_grid_ref").datagrid("getSelections");
				if(datas.length==0){
					parent.$.messager.alert("提示","请选择要添加的数据!");
				}else{
					var reStr="";
					for(var i=0;i<datas.length;i++){
						reStr+=datas[i].sgh_generalhid+","+datas[i].sgh_billcode + "," +datas[i].sgh_customerid;
						if(i < datas.length-1){
							reStr+="=";
						}
					}
					handlerSupplierData(reStr);
					dialog.dialog('destroy');
				}
			}
		},{
			text:"关闭",
			handler:function(){
				dialog.dialog('destroy');
			}
		}]
	});
}

function handlerSupplierData(res){}



/**
 * 选择社区信息弹框
 * @param loc_path
 * @param sc_type
 */
function choiseCommunity(loc_path,mulit_check){
	var path=loc_path + '/management/communityManagerControl/listPage_ref.action';
	var dialog = parent.sy.modalDialog({
			title:'选择社区信息',
			href: path,
			width :  780,
			height : 450,
			buttons:[{
				text:"选择",
				handler:function(){
					var datas =parent.$("#community_grid_ref").datagrid("getSelections");
					if(datas.length==0){
						parent.$.messager.alert("提示","请选择要添加的数据!");
					}else{
						var reStr="";
						for(var i=0;i<datas.length;i++){
							reStr+=datas[i].bcm_id+","+datas[i].bcm_name;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						handlerCommunityData(reStr);
						dialog.dialog('destroy');
					}
				}
			},{
				text:"关闭",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}
function handlerCommunityData(res){}


/**
 * 选择店铺
 * @param loc_path
 * @param shop_id
 * @param isClose
 */
function choiseShops(loc_path,isClose,ms_shop_pattern){
	var path=loc_path + '/management/merchantShopManagerControl/getShoplists.action?ms_shop_pattern='+ms_shop_pattern;
	var dialog = parent.sy.modalDialog({
			title:'选择店铺',
			href:path,
			width :  500,
			height : 380,
			buttons:[{
				text:"选择",
				handler:function(){
				var datas =parent.$("#product_grid_ref").datagrid("getChecked");
					handlerShopData(datas,'Y',dialog);
				}
			},{
				text:"关闭",
				handler:function(){
					dialog.dialog('destroy');
				}
			}]
	});
}

function handlerShopData(datas,isClose,dialog){
	if(datas.length==0){
		parent.$.messager.alert("提示","值不能为空!请选择!");
		return false;
	}else{
		var reStr="";
		for(var i=0;i<datas.length;i++){
			reStr+=datas[i].ms_id+","+datas[i].ms_name;
			if(i < datas.length-1){
				reStr+="=";
			}
		}
		choiseShopsCallBack(reStr);
		if(isClose=='Y'){
			dialog.dialog('destroy');
		}
	}
}
//回调
function choiseShopsCallBack(data){}


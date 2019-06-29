/*   多渠道商户弹窗
* 	  调用函数   showBpantersWin
*	  回调函数   BpanterCallBack
*/
function showBantersWin(loc_path,chkType){
	var path=loc_path+"/base/bpantersControl/listPageRef.htm?chkType="+chkType;
	var dialog = parent.sy.modalDialog({
		title:'选择商户',
		href:path,
		width:780,
		height : 500,
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
						reStr+=datas[i].panterid+","+datas[i].namechinese+","+datas[i].businesstype;
						if(i < datas.length-1){
							reStr+="=";
						}
					}
					BpanterCallBack(reStr);
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
function  BpanterCallBack(res){}


/*
 * 多渠道终端弹窗
 * 调用函数showBterminalsWin
 * 回调函数BterminalsCallBack
 */
 function showBterminalsWin(loc_path,chkType,panterid){
	 var path=loc_path+"/base/bterminalsControl/listPageRef.htm?chkType="+chkType+"&panterid="+panterid;
		var dialog = parent.sy.modalDialog({
			title:'选择POS终端号',
			href:path,
			width:780,
			height : 500,
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
							reStr+=datas[i].terminalno+","+datas[i].description;
							if(i < datas.length-1){
								reStr+="=";
							}
						}
						BterminalsCallBack(reStr);
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
 function  BterminalsCallBack(res){}
 
 
 //---------------多渠道平台---------------------------------
 /*
  * 机构弹窗
  * 调用函数showOrganAreaWin
  * 回调函数findOrganAreaCallBack
  */
  function showOrganAreaWin(loc_path,chkType){
 	 var path=loc_path+"/base/borganControl/listPageRef.htm?chkType="+chkType;
 		var dialog = parent.sy.modalDialog({
 			title:'选择机构',
 			href:path,
 			width:600,
 			height : 500,
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
 							reStr+=datas[i].organid+","+datas[i].namechinese;
 							if(i < datas.length-1){
 								reStr+="=";
 							}
 						}
 						findOrganAreaCallBack(reStr);
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
  function  findOrganAreaCallBack(res){}
  
  /*
   * 商户弹窗
   * 调用函数showMerchantAreaWin
   * 回调函数findMerchantAreaCallBack
   */
   function showMerchantAreaWin(loc_path,chkType,organ_id){
  	 var path=loc_path+"/base/borganMerchantControl/listPageRef.htm?chkType="+chkType+"&organ_id="+organ_id;
  		var dialog = parent.sy.modalDialog({
  			title:'选择商户',
  			href:path,
  			width:600,
  			height : 500,
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
  							reStr+=datas[i].merchant_id+","+datas[i].merchant_name;
  							if(i < datas.length-1){
  								reStr+="=";
  							}
  						}
  						findMerchantAreaCallBack(reStr);
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
   function  findMerchantAreaCallBack(res){}
   
   /*
    * 终端弹窗
    * 调用函数showMerchantAreaWin
    * 回调函数findMerchantAreaCallBack
    */
    function showTerminalAreaWin(loc_path,chkType,merchant_id,organ_id){
   	 var path=loc_path+"/base/borganTerminalControl/listPageRef.htm?chkType="+chkType+"&organ_id="+organ_id+"&merchant_id="+merchant_id;
   		var dialog = parent.sy.modalDialog({
   			title:'选择终端',
   			href:path,
   			width:600,
   			height : 500,
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
   							reStr+=datas[i].terminal_id+","+datas[i].merchant_id+","+datas[i].organ_id+","+datas[i].zmk;
   							if(i < datas.length-1){
   								reStr+="=";
   							}
   						}
   						findTerminalAreaCallBack(reStr);
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
    function  findTerminalAreaCallBack(res){}

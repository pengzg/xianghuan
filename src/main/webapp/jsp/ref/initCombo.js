
/**
 * JS工具
 * 
 */

/**
 * 获取当前时间
 */
function getNowDate(){
	return new Date().getTime();
}

/**
 * 初始化配送员数据下拉选择框
 * @param input_id
 * @param isSingleSelect
 */
function initCourierDatas(input_id,shopId,isSingleSelect){
	try{
		$("#"+input_id).combogrid({
			width:200,
			height:30,
			panelWidth:450,   
			panelHeight:350,
			idField:'msc_member_id',   
			textField:'userName',
			url:sy.contextPath + '/storeclient/order/queryCourier.action?shopId='+shopId,   
			pagination:true,
			rownumbers:true,
			mode:"remote",
			singleSelect:isSingleSelect,
			sortName : ' msc_member_id',
			sortOrder : 'asc',
			delay:120,
			columns : [ [ 
				{width : '100', title : '主键', field :'msc_member_id', sortable : true,hidden:true},  
				{width : '200', title : '名称', field :'userName', sortable : true,hidden:false}, 
				{width : '200', title : '手机', field :'userTel', sortable : true,hidden:false}, 
					] ],
			onSelect: function (rowIndex, rowData){  
				initCourierCallBack(rowData);
			}
		});
	}catch(e){console.log(e);}
}
function initCourierCallBack(res){};

/**
 * 初始化地区选择框
 */
function initAreaCombox(pval,cval,dval,isReq){
	if( undefined ==pval || null==pval|| 'null'==pval || ''==pval || pval==0){
		pval = 0;
	}
	if( undefined ==cval || null==cval|| 'null'==cval || ''==cval || cval==0){
		cval = 0;
	}
	if( undefined ==dval || null==dval|| 'null'==dval || ''==dval || dval==0){
		dval = 0;
	}
	var url =sy.contextPath +"/baseArea/baseAreaControl/queryArea.action?level=";
	$("#area_1").combobox({"url":url+"1","required":isReq,"width":"100","valueField":"ba_id","textField":"ba_name",onChange:function(newValue,oldValue){
		$("#area_2").combobox("setValue","");
		$("#area_2").combobox("reload",url+"2&parentId="+newValue);
	}});
	$("#area_2").combobox({"url":url+"2&parentId="+pval,"required":isReq,"width":"100","valueField":"ba_id","textField":"ba_name",onChange:function(newValue,oldValue){
		$("#area_3").combobox("setValue","");
		$("#area_3").combobox("reload",url+"3&parentId="+newValue);
	}});
	$("#area_3").combobox({"url":url+"3&parentId="+cval,"required":isReq,"width":"100","valueField":"ba_id","textField":"ba_name"});
	
	if(pval!=0){
		$("#area_1").combobox("setValue",pval);
	}
	if(cval!=0){
		$("#area_2").combobox("setValue",cval);
	}
	if(dval!=0){
		$("#area_3").combobox("setValue",dval);
	}
}


/**
 * 自定义下拉框   选项平铺选择
 * 
 */

(function($){
	$.fn.combodrop=function(option){
		var $this = $(this);
		if( typeof option=="string"){
			getValues($this);
		}else{
			var id= $this.attr("id");
			$.ajax({  
		        url : option.path + '/base/baseDataControl/detailItem.action?codekey='+option.codeKey,  
		        async : true, // 注意此处需要同步，因为返回完数据后，下面才能让结果的第一条selected  
		        type : "POST",  
		        dataType : "json",  
		        success : function(data) {  
		        	if(data.length>0){
						var htm="";
						var check_type = option.checkType;
						var isChecked ="";
						for(var i=0;i<data.length;i++){
							var dval = option.defaultVal;
							isChecked="";
							if(undefined!=dval && dval.length>0){
								if(dval.indexOf(data[i].bd_code) >= 0){
									isChecked ='checked="checked"';
								}
							}
							htm+='<input type="checkbox" class="combodrop_'+id+'" id="combodrop_'+i+'_'+data[i].bdt_code+'" name="combodrop_'+data[i].bdt_code+'" value="'+data[i].bd_code+'" checkType="'+check_type+'" '+isChecked+' onclick="checkCombodrop(this);"/>';
							htm+='<label for="combodrop_'+i+'_'+data[i].bdt_code+'">'+data[i].bd_name+'</label>&nbsp;';
						}
						$this.append(htm);
					} 
		        }  
		    });  
		}
	};
	
})(jQuery);

//获取选中值
function getCombodropValues(comboId){
	var idArr = [];
	$(".combodrop_"+comboId).each(function(){
		if($(this).is(":checked") == true){
			idArr.push($(this).val());
		}
	});
	var ret = idArr.join(",");
	return ret;
}

//处理多选和单选
function checkCombodrop(obj){
	var $this =$(obj);
	var checkType = $this.attr("checkType");
	var name= $this.attr("name");
	var checked = $this.is(":checked");
	//如果是单选则 除去其他选中项
	if(checked== true && checkType=='s'){
		$("input[name='"+name+"']").each(function(){
			$(this).prop("checked",false);
		});
		$this.prop("checked",true);
	}
}
//重置选择值
function resetCombdrop(){
	$("input[name^='combodrop_']").each(function(){
		$(this).prop("checked",false);
	});
}
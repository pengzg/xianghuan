//验证身份证号
var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
function isCardID(sId){   
    var iSum=0 ; 
    var info="" ;  
    if(!/^\d{17}(\d|x)$/i.test(sId)) return "你输入的身份证长度或格式错误";   
    sId=sId.replace(/x$/i,"a");   
    if(aCity[parseInt(sId.substr(0,2))]==null) return "你的身份证地区非法";   
    sBirthday=sId.substr(6,4)+"-"+Number(sId.substr(10,2))+"-"+Number(sId.substr(12,2));   
    var d=new Date(sBirthday.replace(/-/g,"/")) ;  
    if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))return "身份证上的出生日期非法";   
    for(var i = 17;i>=0;i --) iSum += (Math.pow(2,i) % 11) * parseInt(sId.charAt(17 - i),11) ;  
    if(iSum%11!=1) return "你输入的身份证号非法";   
    return true; 
}

$.extend($.fn.validatebox.defaults.rules, { 
	//手机号码验证
    mobile: {    
        validator: function(value){    
        	var reg = /^(13[0-9]{2}|14[7][0-9]|15[012356789][0-9]|170[059]|18[0-9]{2})[0-9]{7}$/;
    		if(reg.test(value)){
    		  return true;
    		}    
        },    
        message: '请输入有效的手机号码.'   
    },
    //验证身份证号
    idcared: {
        validator: function(value,param){    
            var flag= isCardID(value);  
            return flag==true?true:false;    
        },
        message: '不是有效的身份证号码'    
    },
    //验证邮编
	zipcode: {
        validator: function (value) {
            var reg = /^[1-9]\d{5}$/;
            return reg.test(value);
        },
        message: '邮编必须是非0开始的6位数字.'
    },
 	// 验证电话号码 
    phone: {
        validator : function(value) { 
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value); 
        }, 
        message : '格式不正确,请使用下面格式:020-88888888' 
    },
 	// 验证QQ,从10000开始 
    qq: {
        validator : function(value) {
            return /^[1-9]\d{4,11}$/i.test(value); 
        }, 
        message : 'QQ号码格式不正确' 
    },
 	// 验证传真 
    faxno: {
        validator : function(value) { 
        	//	return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/i.test(value);
            return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i.test(value); 
        }, 
        message : '传真号码不正确' 
    },
}); 

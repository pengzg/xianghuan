


/*============================== 金额的验证方法 Start ==============================*/
/********************
* 金额框失去焦点格式化、验证方法。
* 将金额三位一逗。（金额可以为空的验证。）
* Add by qinchangying
* 2009-03-28
********************/
function checkAmt( obj, inputName ) {
    if( completeCheckAmt( obj, inputName ) ) {
        obj.value = formatMoney(money);
        return true;
    } else {
        changeStyle(obj, false);
        return false;
    }
}


function checkAmount(value,msg){
     var temp=/^\d+(\.\d+)?$/;
     if(temp.test(value)==false){
        $.messager.alert('',"输入的["+msg+"]金额不能为【负数】，【字母】，及【标点符号】，输入的格式为：12345678.0000。请检查！ ");
        return false;
     }
}


//格式 化小数 s为小数可以数字 也可以是字符串 ，n为 四舍五入 保留几位小数
function fmoney(s, n) {
	n = n > 0 && n <= 20 ? n : 2;
	s = parseFloat((s + '').replace(/[^\d\.-]/g, '')).toFixed(n) + '';
	var l = s.split('.')[0].split('').reverse(), r = s.split('.')[1];
	t = '';
	for(var i = 0; i < l.length; i++) {
		t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length && l[i+1] != '-' ? ',' : '');
	}
	return t.split('').reverse().join('') + '.' + r;
}

//小数四舍五入截取
function   ForDight(Dight,How) 
{ 
    Dight   =   Math.round   (Dight*Math.pow(10,How))/Math.pow(10,How); 
    return   Dight; 
}

/********************
* 金额框失去焦点格式化、验证方法。

* 将金额三位一逗。（金额不能为空的验证。）

* Add by qinchangying
* 2009-03-28
********************/
function checkAmtNotNull( obj, inputName ) {
    if( obj.value != "" ) {
        if( completeCheckAmt( obj, inputName ) ) {
            obj.value = formatMoney(money);
            changeStyle(obj, true);
            return true;
        } else {
            changeStyle(obj, false);
            return false;
        }
    } else {
        $.messager.alert('',inputName+"不能为空。");
        changeStyle(obj, false);
        return false;
    }
}



/********************
* 金额的完整验证方法。
* 验证范围：1、对象内容是否为0-9或逗号，且不能为负数。
*         2、若为整数，则总长不能超过11位，小于11位则首位不能为0。
          3、若为小数，验证是否只有一个小数点，且小数点不能在首尾。
          4、小数的整数部分若长度大于1则首位不能为0。
          5、小数中只能有11为整数，2位小数。
* @param obj 要验证内容的对象。
* （金额可以为空的验证。）
* Add by qinchangying
* 2009-03-28
********************/
function completeCheckAmt( obj, inputName ){
    money = unFormatMoney( obj.value );
    if( money != "" ){  //如果金额框不为空，验证合法性。
            if( checkStringFormat(money, "0123456789.") ) { //如果内容为数字和“.”
                if( money.indexOf(".")>-1 ){    //如果是小数。
                    if( isFormatFloat(money, 15, 4) ) {
                        return true;
                    } else {
                        return false;
                    }
                } else  {   //是整数。
                    if( money.length <= 11 ){
                        if( money.length>1 && money.substring(0,1) == "0" ) {
                        	$.messager.alert('',"整数首位不能为0。");
                            return false;
                        } else {
                            return true;
                        }
                    } else {
                    	$.messager.alert('',inputName+"过长。只能输入15位整数。");
                        return false;
                    }
                }
            } else {
                if(money.substring(0,1)=="-"){
                    $.messager.alert('',"注意："+inputName+"不能为负数。");
                } else {
                    $.messager.alert('',"请正确填写"+inputName+"。");
                }
                return false;
            }
        
    }
    return true;
}

/********************
* 检查str参数中字符是否全都在mode范围内。
*例：验证数字合法性。str="12347892.89"    mode="1234567890."  
*   验证str字符串中是否只包含1234567890.的字符。

* Add by qinchangying
* 2009-03-28
********************/
function checkStringFormat( str, mode ) {
    if( str.length > 0 && mode.length > 0 ){
        var i = 0;
        while ((i < str.length)) {
            var c = str.charAt(i);
            if (mode.indexOf(c) == -1){
                return false;
            }
            i++;
        }
    }
    return true;
}

/********************
* 小数合法性的验证。共completeCheckAmt方法使用。
* Add by qinchangying
* 2009-03-28
********************/
function isFormatFloat(str, intCount, scale) {
    if(str.indexOf(".") == str.lastIndexOf(".")) {  //就一个小数点。
        if(str.substring(0,1)=="." || str.substring(str.length-1,str.length)=="."){
            $.messager.alert('',"数字格式不合法，小数点不能在数字的首尾。");
            return false;
        } else {
            var intNum = money.substring(0, money.indexOf("."));
            var floatNum = money.substring(money.indexOf(".")+1);
            if( intNum.length <=11 ){   //如果小数的整数部分小于等于11位。
                if( intNum.length >1 && intNum.substring(0,1)=="0" ) {  //如果小数的整数部分大于1位且第一位等于0。
                    $.messager.alert('',"数字不能以0开头。");
                    return false;
                } else {
                    if( floatNum.length>scale ){
                        $.messager.alert('',"小数部分只能输入"+scale+"位。");
                        return false;
                    } else {
                        return true;
                    }
                }
            } else {
                $.messager.alert('',"数字的整数部分过长。只能输入"+intCount+"位整数。");
                return false;
            }
        }
    } else {
        $.messager.alert('',"数字格式不合法，小数点多于一个。");
        return false;
    }
}

/********************
* “确认金额”框失去焦点验证两个框的金额的方法。
* 比较两个字符串是否相等，将值变为大写显示，将确认金额框的值三位一逗。

* Add by qinchangying
* 2009-03-28
********************/
function checkAmtOK( objAmt, objOK ) {
    var amt = objAmt.value;     //正常格式金额。
    if( checkAmtNotNull( objOK, "确认金额" ) ) {        //检查确认金额格式。
        var unAmt = unFormatMoney(amt);
        var unAmtOK = unFormatMoney(objOK.value);
        if( unAmt != unAmtOK ) {
            $.messager.alert('',"“确认金额”与“金额”不一致。请检查。");
            changeStyle(objOK, false);
            if( document.getElementById("great") != null ) {
                document.getElementById("great").innerHTML = "";
            }
            return false;
        } else {
            if( document.getElementById("great") != null ) {
                amt = unFormatMoney(objAmt.value);
                document.getElementById("great").innerHTML = formatMoneyString(amt);
            }
            changeStyle(objAmt, true);
            changeStyle(objOK, true);
        }
    } else {
        changeStyle(objOK, false);
        if( document.getElementById("great") != null ) {
            document.getElementById("great").innerHTML = "";
        }
        return false;
    }
}



/********************
* 比较“金额”与“确认金额”是否相等。

* 提交时使用的金额验证方法。

* 首先验证两个金额是否合法，在看金额是否相等。

* Add by qinchangying
* 2009-03-28
********************/
function amtEquals( objAmt, objOK ) {

    if( checkAmtNotNull( objAmt, "金额" ) ) { //检查金额格式。
        if( checkAmtNotNull( objOK, "确认金额" ) ) {        //检查确认金额格式。
            if( objAmt.value != objOK.value ) {
                $.messager.alert('',"“确认金额”与“金额”不一致。请检查。");
                changeStyle(objOK, false);
                document.getElementById("great").innerHTML = "";
                return false;
            } else {
                if( document.getElementById("great") != null ) {
                    money = unFormatMoney(objAmt.value);
                    document.getElementById("great").innerHTML = formatMoneyString(money);
                }
                changeStyle(objAmt, true);
                changeStyle(objOK, true);
                return true;
            }
        } else {
            changeStyle(objOK, false);
            document.getElementById("great").innerHTML = "";
            return false;
        }
    } else {
        changeStyle(objAmt, false);
        return false;
    }
}

/********************
* 检查支付限额的方法。

* Add by qinchangying
* 2009-03-28
********************/
function checkLimited( obj, obj_limited ) {
    //支付限额验证。
    var amt= unFormatMoney(obj.value);
    if( obj_limited.value != "-1.00" ) {
        if( parseFloat(amt) > parseFloat(obj_limited.value) ) {
            changeStyle(obj, false);
            obj.focus();
            $.messager.alert('',"填写金额超过该账户支付限额，该账户单笔支付限额为："+formatMoney(obj_limited.value));
            return false;
        } else {
            changeStyle(obj, true);
            return true;
        }
    } else {
        changeStyle(obj, true);
        return true;
    }
}



/********************
* 金额框获得焦点时，还原原始格式。
* 金额框中若有数据，在获得焦点时，将三位一逗变为原格式。

* Add by qinchangying
* 2009-03-28
********************/
function resetAmt(obj){
    var money = unFormatMoney(obj.value);
    obj.value = money;
    changeStyle(obj, true);
    
}
/*============================== 金额的验证方法 End ==============================*/


/********************
* 改变操作框边框样式的方法。

* Add by qinchangying
* 2009-03-25
********************/
function changeStyle( obj, flag ) {
    if( flag ){
        obj.style.borderStyle="";
        obj.style.borderColor="";
    } else {
        obj.style.borderStyle="dashed";
        obj.style.borderColor="rgb(255,50,0)";
    }
}

/********************
* 验证身份证号的方法。（内容可以为空的验证。）

* Add by qinchangying
* 2009-03-25
********************/
function checkCardId( obj ) {
    var card = obj.value;
    if( card != "" ) {
        if( card.length == 15 || card.length == 18 ) {
            if( checkStringFormat(card, "0123456789") ) {
                changeStyle( obj, true );
                return true;
            } else {
                
                if( card.length == 18 ) {
                    var cardStr = card.substring(0, card.length-1);
                    var endStr = card.substring(card.length-1, card.length);
                    if( checkStringFormat(cardStr, "0123456789") && endStr == "x" ) {
                        changeStyle( obj, true );
                        return true;
                    } else {
                        $.messager.alert('',"身份证号格式不正确，身份证号应全为数字，或18位数字以“x”结尾。");
                        changeStyle( obj, false );
                        return false;
                    }
                } else {
                    $.messager.alert('',"身份证号格式不正确，身份证号应全为数字，或18位数字以“x”结尾。");
                    changeStyle( obj, false );
                    return false;
                }
            }
        } else {
            $.messager.alert('',"身份证号位数不正确，身份证只能为15位或18位。");
            changeStyle( obj, false );
            return false;
        }
    }
    return true;
}

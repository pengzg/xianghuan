/********************
* 禁用当前操作控件。（禁用单个控件）。

* Add by qinchangying
* 2009－03－25
********************/
function disabledButton() {
    window.event.srcElement.disabled=true;
}

/********************
* 启用当前操作控件。（启用单个控件）。


* Add by qinchangying
* 2009－03－25
********************/
function ableButton() {
    window.event.srcElement.disabled=false;
}

/********************
* 禁用页面所有button。


* Add by qinchangying
* 2009－03－25
********************/
function disabledAllButton() {
    var forms = document.getElementsByTagName("form");
    if(forms != null){
        var form1 = forms[0];
        for(i=0;i<form1.length;i++){
            if( form1.elements[i].type == "button" ){
                form1.elements[i].disabled = true;
            }
        }
    }
}

/********************
* 启用页面所有button。


* Add by qinchangying
* 2009－03－25
********************/
function ableAllButton() {
    var forms = document.getElementsByTagName("form");
    if(forms != null){
        var form1 = forms[0];
        for(i=0;i<form1.length;i++){
            if( form1.elements[i].type == "button" ){
                form1.elements[i].disabled = false;
            }
        }
    }
}

/********************
* 
* Add by qinchangying
* 2009－03－27
********************/
function getRadioValue( radio_name) {
    var obj = document.getElementsByName(radio_name);
    for(i=0;i<obj.length;i++){
        if(obj[i].checked== true){
            return obj[i].value;
            break;
        }
    }
}

function setRadioValue( radio_name,value) {
    var obj = document.getElementsByName(radio_name);
    for(i=0;i<obj.length;i++){
        if(obj[i].value==value){
            return obj[i].checked = true;
            break;
        }
    }
}


/********************
* 支持回车移动光标，相当于Tab键。

* Add by qinchangying
* 2009－03－25
********************/
function next(){
    if(event.keyCode==13)event.keyCode=9;
}

/********************
* 返回字符串长度，一个汉字为2，英文和数字为1。

* Add by qinchangying
* 2009－03－25
********************/
function blength(str) {
    return str.replace(/[^\x00-\xff]/g,"**").length;
}

/********************
* 格式化金额，将数字头的"0"去掉。
* 
* Add by qinchangying
* 2009－03－25
********************/
function formatNumber(num) {
    //去掉头部的0。

    while(num.substring(0,1)=="0") {
        num = num.substring(1);
    }
    return num;
}

/********************
*
*格式化金额 三位一逗 输入的金额必须为合法的金额

*
*Add by sunzuolei
*
*********************/
function trim(s){   
return  s.replace(/^\s+|\s+$/g,"");   
  } 
  
function formatMoney(amt)
{      
    var intstr='';
    var decstr='';
    trim(amt);
    if(amt==null||amt=='')
       return '';
       amt=parseFloat(amt);
    var amtstr=new String(amt);
    
    if(amtstr.indexOf('.')<0)
    {
       intstr=amtstr;
       decstr='0000';
    }
    else
    {
       intstr=amtstr.substring(0,amtstr.indexOf('.'));
       decstr=amtstr.substring(amtstr.indexOf('.')+1);
       
       //补齐小数位数
       if(decstr==null||decstr.length==0)
       {
          decstr='0000';
       }
       else if(decstr.length==3)
       {
          decstr=decstr+'0';   
       }
       else if(decstr.length==2)
       {
          decstr=decstr+'00';   
       }
       else if(decstr.length==1)
       {
          decstr=decstr+'000';   
       }
    }
    
    var negative = '' ;
    if (intstr.indexOf('-')!=-1)
    {
        negative = '-'; 
        intstr= intstr.substring(1,intstr.length);
    }
    
    if(intstr.length<=3)
    {
      return negative + intstr+'.'+decstr;    
    }   
    
    var result='';
    for(var i=intstr.length;i>0;i=i-3)
    {
       var threeChar=intstr.substring(i-3,i);
       if(i==intstr.length)
       {
          result=threeChar;
       }
       else
       {
          result=threeChar+','+result;
       }       
    }   
    if(decstr!=null&&decstr.length>0)
    {
       result=result+'.'+decstr;
    }
    result = negative + result ;
    return result;
}

/********************
*
*格式化金额 数字转大写 输入的金额必须为合法的金额

*
*Add by liuyahui
*2007－04－11
*********************/
function formatMoneyString(amt){    
    var n = parseFloat(amt);
    
    //检查是不是数字
    if(isNaN(n)){
        alert("金额格式不正确");
        return "---";
    }
    if(n == 0){
        return "零圆";
    }
    if(typeof(n) == "number"){
        if(-1 == n.toString().indexOf(".")){
            return seti2c(n)+"整";
        }else{
            var i,istr,f,fstr,a,rstr;
            a = n.toString().split(".");
            i = a[0];
            f = a[1];
            istr = seti2c(i);
            fstr = setf2c(f);
            rstr = istr+fstr;
            rstr = rstr.replace(/^圆/,"");
            return rstr;
        }
    }else{
        return "---";
    }
}


    /**
         * 
         * 金额去掉三位一逗的方法。
         * 
        **/
function unFormatMoney(money){
    return money.replace(/[\,]/g, '');
}


function seti2c(n){
    var ns = n.toString();
    var tempstr = "";
    for(var i=1;i<ns.length+1;i++){
        switch(i){
            case 1:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"圆"+tempstr;
            }else{
                tempstr = "圆"+tempstr;
            }
            break;
            case 2:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>拾</strong>"+tempstr;
            }else{
                tempstr = "0"+tempstr;
            }
            break;
            case 3:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>佰</strong>"+tempstr;
            }else{
                tempstr = "0"+tempstr;
            }
            break;
            case 4:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>仟</strong>"+tempstr;
            }else{
                tempstr = "0"+tempstr;
            }
            break;
            case 5:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>万</strong>"+tempstr;
            }else{
                var ex1 = /^[0]+$/;
                var _tem;
                if(ns.length>8){
                    _tem = ns.substr(ns.length-8,3);
                }else{
                   _tem = ns.substr(0,ns.length-5);
                }
                if(!ex1.test(_tem)){
                    tempstr = "<strong>万</strong>"+tempstr;
                }
            }
            break;
            case 6:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>拾</strong>"+tempstr;
            }else{
                var _tem = ns.substr(ns.length-i+1,1);
                if(_tem!='0'){
                    tempstr = "0"+tempstr;
                }
            }
            break;
            case 7:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>佰</strong>"+tempstr;
            }else{
                var _tem = ns.substr(ns.length-i+1,1);
                if(_tem!='0'){
                    tempstr = "0"+tempstr;
                }
            }
            break;
            case 8:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>仟</strong>"+tempstr;
            }else{
                tempstr = "0"+tempstr;
            }
            break;
            case 9:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>亿</strong>"+tempstr;
            }else{
                var ex1 = /^[0]+$/;
                var _tem = ns.substr(0,ns.length-9);
                
                if(!ex1.test(_tem)){
                    tempstr = "<strong>亿</strong>"+tempstr;
                }
            }
            break;
            case 10:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>拾</strong>"+tempstr;
            }else{
                var _tem = ns.substr(ns.length-i+1,1);
                if(_tem!='0'){
                    tempstr = "0"+tempstr;
                }
            }
            break;
            case 11:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>佰</strong>"+tempstr;
            }else{
                var _tem = ns.substr(ns.length-i+1,1);
                if(_tem!='0'){
                    tempstr = "0"+tempstr;
                }
            }
            break;
            case 12:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>仟</strong>"+tempstr;
            }else{
                tempstr = "0"+tempstr;
            }
            break;
            case 13:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>万</strong>"+tempstr;
            }else{
                var _tem = ns.substr(0,1);
                if(_tem != "0"){
                    tempstr = "<strong>万</strong>"+tempstr;
                }
            }
            break;
            case 14:
            var t = ns.substr(ns.length-i,1);
            if(t!="0"){
                tempstr = t+"<strong>拾</strong>"+tempstr;
            }else{
                tempstr = "0"+tempstr;
            }
            break;
            default:break;
        }
    }
    return g2b(tempstr);
}

function setf2c(n){
    var ns = n.toString();
    var tempstr = "";
    for(var i=0;i<ns.length;i++){
        switch(i){
            case 0:
            var t = ns.substr(i,1);
            if(t!="0"){
                tempstr += t+"角";
            }else{
                tempstr += "0";
            }
            break;
            case 1:
            var t = ns.substr(i,1);
            if(t!="0"){
                tempstr += t+"分";
            }
            break;
            default:break;
        }
    }
    return g2b(tempstr);
}

function g2b(s){
    rs = s.replace(/0+/g,"0");
    rs = rs.replace(/0(圆|万|亿)/g,"$1");
    rs = rs.replace("亿万","亿");
    rs = rs.replace(/0/g,"零");
    rs = rs.replace(/1/g,"壹");
    rs = rs.replace(/2/g,"贰");
    rs = rs.replace(/3/g,"叁");
    rs = rs.replace(/4/g,"肆");
    rs = rs.replace(/5/g,"伍");
    rs = rs.replace(/6/g,"陆");
    rs = rs.replace(/7/g,"柒");
    rs = rs.replace(/8/g,"捌");
    rs = rs.replace(/9/g,"玖");
    return rs;
}


/* 数据行原背景色 */
var bgColor="#FFFFFF";

/* 鼠标停留行高亮显示背景色 */
var highColor="#dcf0ee";

/********************
* 鼠标停留行上的颜色。 
* Add by qinchangying
* 2009－03－25
********************/
function overColor(rowObj){
    rowObj.style.background=highColor;
}

/********************
* 鼠标移开时还原颜色。 
* Add by qinchangying
* 2009－03－25
********************/
function outColor(rowObj){
    rowObj.style.background=bgColor;
}

/********************
* 鼠标单击某行进入明细的方法。

* Add by qinchangying
* 2009－03－25
********************/


/********************
* 验证参数中是否包含非法字符的方法。

* 
* Add by qinchangying
* 2009－03－25
********************/
function isSearch( str ) {
    var badChar = "";
    badChar += "`~!@#$%^&()-_=+[]{}\\\\|:;\"\\'<,>?/*. ";   //英文字符。

    badChar += "·~！@#￥%……&*（）-——=+【】{}、|；：‘“’”，《。》、？ "; //中文字符。

    badChar += "·～！＠＃￥％……＆×（）－——＝＋【】｛｝＼｜；：‘“’”，《。》、？　"; //全角字符。

    badChar += "１２３４５６７８９０";    //全角数字。

    badChar += "ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ";    //全角小写英文字符。

    badChar += "ＡＢＣＤＥＦＧＨＩＪＫＩＭＮＯＰＱＲＳＴＵＶＷＸＹＺ";    //全角大些英文字符。

    for(var i=0;i<str.length;i++){ 
        var c = str.charAt(i);
        if(badChar.indexOf(c) > -1){ 
            return false; 
        } 
    }
    return true;
}

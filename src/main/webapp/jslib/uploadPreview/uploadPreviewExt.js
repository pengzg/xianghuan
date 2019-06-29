/**
 * 图片上传 说明
 * 例：
 * <input type="file" id="uploadImg" name="uploadImg" onchange="singleUpLoadImg(this,false,'imgdiv','imgShow');"/>
 * <div id="imgdiv" style="display:none;"><img id="imgShow" width="100" height="100" src="#"/></div>
 */

/**
 * 图片上传
 * @param obj this
 * @param isView 是否显示预览图
 * @param imgdiv 显示图片 div ID
 * @param img  img标签ID
 */
function singleUpLoadImg(obj,isView,imgdiv,img){
	var fileElementId = $(obj).attr("id");
	var show_div= $("#"+imgdiv+" img").attr("src");
	if(isView){
		if(undefined == show_div || null==show_div || ""==show_div){
			alert("请在上传图片的文本框后面添加展示预览图的div/img元素!");
			return false;
		}
	}
	try {
		$.ajaxFileUpload({
			url:sy.contextPath  + '/fileController/upload_img.htm',//用于文件上传的服务器端请求地址
			secureuri:false,//一般设置为false
			fileElementId: fileElementId,//文件上传空间的id属性  <input type="file" id="file" name="file" /> 
			dataType: 'json',//返回值类型 一般设置为json
			data: {filepath:'upload_img'},//扩展参数, 此处注意一定要使用json格式,并且注意中文乱码问题，对中文编码或者更改tomcat服务器server.xml文件
			type:'post',
			success: function (data){  //服务器成功响应处理函数
				//是否显示预览图
				if(isView){
					if (navigator.userAgent.indexOf("MSIE") > -1) {
	                    try {
	                        document.getElementById(img).src = getObjectURL(fileElementId);
	                    } catch (e) {
	                        var div = document.getElementById(imgdiv);
	                        this.select();
	                        top.parent.document.body.focus();
	                        var src = document.selection.createRange().text;
	                        document.selection.empty();
	                        document.getElementById(img).style.display = "none";
	                        div.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
	                        div.style.width = _self.Setting.Width + "px";
	                        div.style.height = _self.Setting.Height + "px";
	                        div.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = src;
	                    }
	                } else {
	                    document.getElementById(img).src = getObjectURL(fileElementId);
	                }
					$("#"+imgdiv).show();
				}
				singleUpLoadImgCallBack(data.obj);
				alert(data.msg);
			},
			error: function(XMLHttpRequest, textStatu, e) {
				alert(e);
			}
		}); 
	} catch (e) {alert(e);}
}
//回调函数
function singleUpLoadImgCallBack(){}


//获取文本框URL路径
function getObjectURL(fileElementId){
	var fileVal = document.getElementById(fileElementId);
	var file = fileVal.files[0];
	var url = null;
    if (window.createObjectURL != undefined) {
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) {
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) {
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}
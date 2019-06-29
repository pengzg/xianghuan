function uplaod(module,shrink) {
	var val = $("#fileToUpload").val();
	/*if(val.endWith(".gif") || val.endWith(".GIF") || val.endWith(".jpg") || val.endWith(".JPG")){
		$("#file").parent().next().next().empty();
	}else {
		$("#file").parent().next().next().html("请选择正确的文件");
		return;
	}*/
	$.ajaxFileUpload({
		url:sy.contextPath  + '/fileController/'+module+'/upload?shrink='+shrink,//用于文件上传的服务器端请求地址
		secureuri:false,//一般设置为false
		fileElementId: 'fileToUpload',//文件上传空间的id属性  <input type="file" id="file" name="file" /> 
		dataType: 'json',//返回值类型 一般设置为json
		data: {},//扩展参数, 此处注意一定要使用json格式,并且注意中文乱码问题，对中文编码或者更改tomcat服务器server.xml文件
		type:'post',
		success: function (data, status){  //服务器成功响应处理函数
			var data = eval(data);
			if(data.error==0){
				$("#sfi_save_url").val(data.relativeUrl);
				$("#uperr").text("");
			}else{
				$("#uperr").text(data.message);
				console.log(data);
				//uploadBack(data);
			}
			//var path = data[0].path;
			/*$("input[name='image']").val(path);
			$("#file").val("");
			$("#equipImageFN").val("");
			
			$("input[name='image']").parent().next().empty();*/
		},
		error: function(XMLHttpRequest, textStatu, e) {
			/*$.ajaxException(XMLHttpRequest, textStatu, e);*/
			alert(e);
		}
	});
	return false;
}
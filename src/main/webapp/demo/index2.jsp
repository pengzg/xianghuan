<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include page="../inc.jsp"></jsp:include>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath }/plugin/ueditor1_4_3-utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/plugin/ueditor1_4_3-utf8-jsp/ueditor.all.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/plugin/ueditor1_4_3-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.0.3.js"></script>
	 --%>
	<script type="text/plain" id="myEditor"></script>
	<script type="text/plain" id="upload_ue"></script>
	
	<script type="text/javascript">
	    var editor = UE.getEditor('myEditor', {
	        initialFrameWidth: 800,
	        initialFrameHeight: 300,
	    });
	</script>
	
	<script type="text/javascript">
		
	 //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
	    var _editor = UE.getEditor('upload_ue');
	    _editor.ready(function () {
	        //设置编辑器不可用
	        _editor.setDisabled();
	        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
	        _editor.hide();
	        //侦听图片上传
	        _editor.addListener('beforeInsertImage', function (t, arg) {
	            //将地址赋值给相应的input,只去第一张图片的路径
	            $("#picture").attr("value", arg[0].src);
	            //图片预览
	           // $("#preview").attr("src", arg[0].src);
	        })
	        //侦听文件上传，取上传文件列表中第一个上传的文件的路径
	        _editor.addListener('afterUpfile', function (t, arg) {
	            $("#file").attr("value", _editor.options.filePath + arg[0].url);
	        })
	    });
	    //弹出图片上传的对话框
	    function upImage() {
	        var myImage = _editor.getDialog("insertimage");
	        myImage.open();
	    }
	    //弹出文件上传的对话框
	    function upFiles() {
	        var myFiles = _editor.getDialog("attachment");
	        myFiles.open();
	    }
	</script>
  </head>
  <body>
  	<input type="text" id="picture" name="cover" /><a href="javascript:void(0);" onclick="upImage();">上传图片</a>
	<input type="text" id="file" /><a href="javascript:void(0);" onclick="upFiles();">上传文件</a>
  </body>
</html>

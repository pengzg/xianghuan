<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include page="../inc.jsp"></jsp:include>
	<script type="text/javascript">
		var _editor = UE.getEditor("myeditor");
		_editor.ready(function () {
		//_editor.setDisabled();
		//_editor.hide();
		_editor.addListener("beforeInsertImage", function (t, arg) {
				var imgs="";
				for(var i=0;i<arg.length;i++){
					imgs += arg[i].src+"|"+arg[i].title;
					alert(arg[i].src);
					if(i<arg.length-1){
						imgs +=",";
					}
				}
				uploadImgCallBack(imgs);
			});
		});
		function upImage() {
			var myImage = _editor.getDialog("insertimage");
			myImage.open();
		}
		function uploadImgCallBack(imgsInfo){
			var table = $("#show_img_tlb");
			var html="";
			var imgs = imgsInfo.split(",");
			for(var i=0;i<imgs.length;i++){
				var img = imgs[i].split("|");
				var path = img[0];
				var _id = getNowDate()+i;
				html +="<tr id='"+_id+"'>";
				html +="<td>sort: ["+(i+1)+"]["+_id+"] </td>";
				html +="<td>";
				html +="<img id='"+_id+"_img' src='"+path+"' style='width:320px;height:250px'/>";
				html +="</td>";
				html +="<td>";
				html +="<input id='"+_id+"' value='"+path+"'style='width:400px'/>";
				html +="</td>";
				html +="<td> <a href='javascript:jumpImg("+_id+",0);'>UP</a>  | <a href='javascript:jumpImg("+_id+",1);'> DOWN </a> | <a href='javascript:removeImg("+_id+");'>Del</a></td>";
				html +="</tr>";
			}
			table.append(html);
		}
		function jumpImg(id,action_type){
			var trId = $("#"+id);

			var img_old =trId.find("img"); 
			var input_old =trId.find("input"); 
			var img_new;
			var input_new;
			var msg="";
			if("0"==action_type){
				img_new =trId.prev().find("img");
				input_new=trId.prev().find("input");
				msg="已经是第一个 了，不能再向上移动了.";
			}else{
				img_new = trId.next("tr").find("img");
				input_new=trId.next("tr").find("input");
				msg="已经是最后一个 了，不能再向下移动了.";
			}
			
			if(img_new.length==0){
				alert(msg);
			}else{
				//图片路径
				var old_src=img_old.attr("src");
				var new_src=img_new.attr("src");
				//文本框值
				var old_val=input_old.val();
				var new_val=input_new.val();
				
				img_old.prop("src",new_src);
				img_new.prop("src",old_src);
				
				input_old.val(new_val);
				input_new.val(old_val);
			}
			
		}
		function removeImg(id){
			$("#"+id).remove();
		}
		function getNowDate(){
			return new Date().getTime();
		}
		
		function getImgInfos(){
			var imgs = $("#show_img_tlb input");
			var res ="";
			imgs.each(function(i,e){
				res+=$(e).val()+"|"+(i+1);
				if(i < imgs.length-1){
					res+=",";
				}
			});
			alert(res);
		}
	</script>
  </head>
  <body>
  	<textarea id="myeditor" name="myeditor"></textarea>
  	<input type="button" value="上传图片" onclick="upImage()"/>
  	<input type="button" value="获取图片结果" onclick="getImgInfos()"/>
	<table id="show_img_tlb"></table>  	
	<br/>
  </body>
</html>

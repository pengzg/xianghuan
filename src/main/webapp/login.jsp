<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>社区快线-商家登录</title>
	<jsp:include page="inc.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/css.css">
	<style>
        .dialog-body{position:relative;top:0px;left:0;top:0px;right:0px;}
        .dialog_zc{position:fixed;top:0;left:0;bottom:0;right:0;background-color:#000;opacity:0.3;filter:Alpha(opacity=30);}
        .dialog_nerong{width:400px;min-height:200px;background-color:#fff;position:fixed;top:50%;left:50%;transform:translate(-50%,-50%);-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%);}
        #select{width:150px;height:35px;margin-left:85px;text-indent:6px;font-size:14px;font-family:'Microsoft YaHei';}
         #select option{height:35px;line-height:35px;display: block;}
        .hheader{height:50px;line-height:50px;width:100%;text-indent:5px;font-size:16px;color:#666;font-weight:500;font-family:'Microsoft YaHei';background-color:#f5f5f5;margin-bottom: 10px; }
        .sureBtn{width:auto;height:40px;position:absolute;bottom:0px;right:0px;}
        .btnAn{width:78px;height:36px;line-height:36px;text-align:center;float:left;font-size:14px;font-family:'Microsoft YaHei';cursor:pointer;}
        .surebtn{background-color:#eb8900;color:#fff;margin-right: 10px;}
        .surebtn:hover{background-color:#d4871c;}
        .canclebtn{background-color:#e4e9eb;color:#555;margin-right: 10px;}
        .canclebtn:hover{background-color:#e0e3e4;}
	</style>
</head>
<script type="text/javascript">
	$(document).keydown(function (e) {
		var theEvent = e || window.event;
		var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
	    if(code==13){
	    	loginFunction();
	    }
	});
	function loginFunction(){
		$form = $(".form");
		$.post(sy.contextPath + '/system/loginController/doLogin.action?validatecode='+$("#validatecode").val(), $form.serialize(), function(result) {
			if (result.success) {
				location.replace(sy.contextPath + '/index.jsp');
			} else {
				$.messager.alert('提示', result.msg, 'error', function() {
					$('#loginBtn').linkbutton('enable');
				});
			}
		}, 'json');
	}
	function code_change(_this) {
		$(_this).attr("src",'${pageContext.request.contextPath}/ImageServlet?t='+new Date().getTime());
	}
	
</script>
<body>
<div class="logo"><a href="javascript:void(0)"><img src="images/logopic.jpg"></a></div>
<form method="post" class="form">
	<div class="main">
			<div class="content">
				<div class="left"><img src="images/pic_left.png"></div>
				<div class="login-box">
					<h1>商家登录</h1>
					<div class="box">
							<input id="userType" name="userType" value="01" type = "hidden">
						<ul>
							<li class="user"><input name = "loginname" type="text" placeholder="请输入用户名"></li>
							<li class="password"><input name = "loginPwd" type="password" placeholder="请输入密码"></li>
						</ul>
						<!-- <ul class="code">
							<div class="left"><input type="text" value="请输入验证码"></div>
							<div class="right"><a href="javascript:void(0)"><img src="images/pic_num.jpg"></a></div>
						</ul> -->
					</div>
				</div>
				<div class="choice">
					<ul>
						<!-- <li><input name = "AutoLogin" type="checkbox" value="1" />自动登录</li> -->
						<li><input name = "rememberLoginInfo" type="checkbox" value="1" />记住用户名</li>
						<a href="javascript:void(0)">忘记密码?</a>
					</ul>
				</div>
				<a href="javascript:loginFunction();" class="btn">立即登录</a>
			</div>
	</div>
</form>
<footer>COPYRIGHT © 2014-2016 社区快线 版权所有</footer>
	<div class="dialog-body" style="display: none">
        <div class="dialog_zc"></div>
        <div class="dialog_nerong">
            <div class="hheader">请选择中心仓</div>
                <div>
                    <select name="" id="select" >
                        <option style="height:100px" value="">超白点</option>
                        <option value="">中心点</option>
                        <option value="">燕郊点</option>
                                            <option value="">超白点</option>
                        <option value="">中心点</option>
                        <option value="">燕郊点</option>
                                            <option value="">超白点</option>
                        <option value="">中心点</option>
                        <option value="">燕郊点</option>
                    </select>
                </div>

                <div class="sureBtn">
                    <div class="btnAn surebtn">确定</div>
                    <div class="btnAn canclebtn">取消</div>
                </div>
        </div>
    </div>
</body>
</html>
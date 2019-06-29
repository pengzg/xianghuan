<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.xianghuan.web.model.SessionInfo"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>
//话题栏目id
	private Integer bbsChannelId;
	//发布话题内容
	private String topicContent;
	//发布范围
	private Integer topicRangeCode;
	//话题类型  分享 转卖闲置 求购闲置 紧急通知 紧急求助 
	private String topicCateCode;
	//闲置 紧急情况分类 
	private String topic2CateId;
	//闲置 交易
	private Integer tradeCode;
	//商品名
	private String goods_name;
	//商品原价 
	private String market_price;
	//商品卖价
	private String real_price;
	//紧急情况 发生地点
	private String address;
	//经度
	private String longitude;
	//维度
	private String latitude;
	//图片上传地址 
	private String imagePath;

</title>
</head>
<body>
	<form action="/app/bbsTopic/publishTopic_login.action"  method="post" enctype="multipart/form-data">
	<input name="reqCode" type="hidden" value="0802"/>
	<input name="device" type="hidden" value="1"/>
	<input name="deviceType" type="hidden" value="ios"/>
	话题栏目id：<input name="bbsChannelId"  value=""/></br>
	话题内容：<input name="topicContent"  value=""/></br>
	发布范围：<input name="topicRangeCode"  value=""/></br>
	话题类型：<input name="topicCateCode"  value=""/></br>
	闲置 紧急情况分类：<input name="topic2CateId"  value=""/></br>
	闲置 交易：<input name="tradeCode"  value=""/></br>
	商品名：<input name="goods_name"  value=""/></br>
	商品原价：<input name="market_price"  value=""/></br>
	商品卖价：<input name="real_price"  value=""/></br>
	紧急情况 发生地点：<input name="address"  value=""/></br>
	经度：<input name="longitude"  value=""/></br>
	维度：<input name="latitude"  value=""/></br>
	
	图片上传地址：<input name="imagePath"  value=""/></br>
	
	用户:<input name="user" value="47759"/></br>
	社区:<input name="community"  value="100032"/></br>
	 <td><input type="submit" value="发布"/></td>
    </form>
</body>
</html>
package org.xianghuan.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.ClientConfig;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

/**
 * 极光推送工具类
 * @author panyf
 *
 */
public class JPushMsgUtils implements Serializable{
	
	private static final Logger LOG = Logger.getLogger(JPushMsgUtils.class);
	private static final long serialVersionUID = 1L;
	
	
	private static final String APPKEY = "aecb8cf7c0ffccef25ea7cd1";
	private static final String MASTERSECRET = "8963914ecfa3ae3e1d97d8c6";
	private static final Boolean APNsFlag = true;
	
	private static JPushClient jpushClient = null;
	
	private static ClientConfig config = null;
	
	/**
	 * 静态块
	 */
	static{
		config = ClientConfig.getInstance();
        
		jpushClient = new JPushClient(MASTERSECRET, APPKEY, 3, null, config);
	}
	
	/**
	 * 推送消息 部分设备  
	 * @param title
	 * @param alertMsg
	 * @param alias
	 * @param tags
	 * @param extrasMap
	 * @param incrBadge
	 */
	public static boolean pushAlertMsg(String alertMsg){

		// Setup the custom hostname
        config.setPushHostName("https://api.jpush.cn");
        
        
        PushPayload payload= PushPayload.alertAll(alertMsg);
        
        try {
            PushResult result = jpushClient.sendPush(payload);
            LOG.info("Got result - " + result.getResponseCode());
            if(result.getResponseCode() ==200){
            	return true;
            }

        } catch (APIConnectionException e) {
            LOG.error("Connection error. Should retry later. ", e);

        } catch (APIRequestException e) {
            LOG.error("Error response from JPush server. Should review and fix it. ", e);
            LOG.info("HTTP Status: " + e.getStatus());
            LOG.info("Error Code: " + e.getErrorCode());
            LOG.info("Error Message: " + e.getErrorMessage());
            LOG.info("Msg ID: " + e.getMsgId());
        }
        return false;
	}
	
	/**
	 * 推送消息  
	 * @param title
	 * @param alertMsg
	 * @param alias
	 * @param tags
	 * @param extrasMap
	 * @param incrBadge
	 */
	public static boolean pushAlertMsg_IOS_ANDROID(String title,String alertMsg,String[]alias ,String [] tags ,Map<String, String> extrasMap,int incrBadge){

		// Setup the custom hostname
        config.setPushHostName("https://api.jpush.cn");
        
        
        PushPayload payload = bulidAlertPushPayload(title,alertMsg,alias ,tags ,extrasMap,incrBadge);
        
        try {
            PushResult result = jpushClient.sendPush(payload);
            LOG.info("Got result - " + result);
            if(result.getResponseCode() ==200){
            	return true;
            }

        } catch (APIConnectionException e) {
            LOG.error("Connection error. Should retry later. ", e);

        } catch (APIRequestException e) {
            LOG.error("Error response from JPush server. Should review and fix it. ", e);
            LOG.info("HTTP Status: " + e.getStatus());
            LOG.info("Error Code: " + e.getErrorCode());
            LOG.info("Error Message: " + e.getErrorMessage());
            LOG.info("Msg ID: " + e.getMsgId());
        }
        return false;
	}
	
	/**
	 * 构建推送对象
	 * @return
	 */
	public static PushPayload bulidAlertPushPayload(String title,String alertMsg,String[]alias ,String [] tags ,Map<String, String> extrasMap,int incrBadge){
		if(null!=alias && alias.length>0 && (null== tags || tags.length==0)){
			return PushPayload.newBuilder()
	                .setPlatform(Platform.android_ios())
	                .setAudience(Audience.alias(alias))
	                .setNotification(Notification.newBuilder()
	                		.setAlert(alertMsg)
	                		.addPlatformNotification(AndroidNotification.newBuilder()
	                				.setTitle(title).addExtras(extrasMap).build())
	                		.addPlatformNotification(IosNotification.newBuilder()
//	                				.incrBadge(incrBadge)
	                				.setBadge(incrBadge)
	                				.addExtras(extrasMap)
	                				.build())
	                		.build())
			                .setOptions(Options.newBuilder()
			                         .setApnsProduction(APNsFlag)
			                         .build())
			                 .build();
		}else if((null==alias || alias.length==0) && null!= tags && tags.length>=0){
			return PushPayload.newBuilder()
	                .setPlatform(Platform.android_ios())
	                .setAudience(Audience.tag(tags))
	                .setNotification(Notification.newBuilder()
	                		.setAlert(alertMsg)
	                		.addPlatformNotification(AndroidNotification.newBuilder()
	                				.setTitle(title).addExtras(extrasMap).build())
	                		.addPlatformNotification(IosNotification.newBuilder()
	                				.setBadge(incrBadge)
//	                				.incrBadge(incrBadge)
	                				.addExtras(extrasMap)
	                				.build())
	                		.build())
			                .setOptions(Options.newBuilder()
			                         .setApnsProduction(APNsFlag)
			                         .build())
			                 .build();
		}else{
			return PushPayload.newBuilder()
	                .setPlatform(Platform.android_ios())
	                .setAudience(Audience.alias(alias))
	                .setAudience(Audience.tag_and(tags))
	                .setNotification(Notification.newBuilder()
	                		.setAlert(alertMsg)
	                		.addPlatformNotification(AndroidNotification.newBuilder()
	                				.setTitle(title).addExtras(extrasMap).build())
	                		.addPlatformNotification(IosNotification.newBuilder()
	                				.incrBadge(incrBadge)
	                				.addExtras(extrasMap)
	                				.build())
	                		.build())
	                .setOptions(Options.newBuilder()
	                         .setApnsProduction(APNsFlag)
	                         .build())
	                 .build();
		}
	}
	
	public static void main(String[] args) {
		
		
		/**
		 * jumpType 跳转类型 
				1- APP
				2- H5 
		   jumpValue  值 或 H5 地址
		   shopId   店铺ID
		   model 模块
				1- 活动 
				2- 生鲜列表
				3- 快消品及生鲜单品详情
				4- 生鲜套餐详情
				5- 订单详情 
				6- 系统消息
		 */
		Map<String, String> extInfoMap = new HashMap<>();
		//H 5
//    	extInfoMap.put("jumpType", "2");
//    	extInfoMap.put("jumpValue", "http://testapp.sqkx.net/html/index.html");
//    	extInfoMap.put("shopId", "0");
//    	extInfoMap.put("model", "1");
    	//活动
//		extInfoMap.put("jumpType", "1");
//    	extInfoMap.put("jumpValue", "97");
//    	extInfoMap.put("shopId", "0");
//    	extInfoMap.put("model", "1");
    	//生鲜列表
//    	extInfoMap.put("jumpType", "1");
//    	extInfoMap.put("jumpValue", "0");
//    	extInfoMap.put("shopId", "0");
//    	extInfoMap.put("model", "2");
    	//单品详情
//    	extInfoMap.put("jumpType", "1");
//    	extInfoMap.put("jumpValue", "98");
//    	extInfoMap.put("shopId", "31");
//    	extInfoMap.put("model", "3");
    	//订单详情
//    	extInfoMap.put("jumpType", "1");
//    	extInfoMap.put("jumpValue", "4587");
//    	extInfoMap.put("shopId", "31");
//    	extInfoMap.put("model", "5");
    	//系统消息
    	extInfoMap.put("jumpType", "1");
    	extInfoMap.put("jumpValue", "2");
    	extInfoMap.put("shopId", "0");
    	extInfoMap.put("model", "6");
		//优惠券列表
//    	extInfoMap.put("jumpType", "1");
//    	extInfoMap.put("jumpValue", "2");
//    	extInfoMap.put("shopId", "0");
//    	extInfoMap.put("model", "7");
    	
//		pushAlertMsg_IOS_ANDROID("元旦特价促销", "元旦特价促销1234567890", new String[]{"48508"}, null, extInfoMap, 8);
		pushAlertMsg_IOS_ANDROID("元旦特价促销", "元旦特价促销1234567890", null, new String[]{"13426228493"}, extInfoMap, 1);
//    	pushAlertMsg("满载回归");
	}
}

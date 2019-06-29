package org.xianghuan.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.json.JSONArray;
import org.json.JSONObject;

import push.AndroidNotification;
import push.PushClient;
import push.android.AndroidBroadcast;
import push.android.AndroidCustomizedcast;
import push.android.AndroidFilecast;
import push.android.AndroidGroupcast;
import push.android.AndroidUnicast;
import push.ios.IOSBroadcast;
import push.ios.IOSCustomizedcast;
import push.ios.IOSFilecast;
import push.ios.IOSGroupcast;
import push.ios.IOSUnicast;

import com.xianghuan.auth.base.cache.BaseParameterCache;

public class Upush {
	private static String appkey = "585cd26a07fe65466d001196";
	private static String appMasterSecret = "dvvxfrd7m8dg1l9gqs5b3xitu4bv7pex";
	private static String timestamp = null;
	private static PushClient client = new PushClient();
	private static boolean testFlag = true;
	public Upush(String project){
		String message_model = BaseParameterCache.getInstance().getKeyValue("message_model");
		if("test".equals(message_model)){
			testFlag = true;
		}
		if("production".equals(message_model)){
			testFlag = false;
		}
		switch (project) {
		case 2+""://社区盒子
			appkey = "585cd26a07fe65466d001196";
			appMasterSecret = "dvvxfrd7m8dg1l9gqs5b3xitu4bv7pex";
			break;
		case 3+""://批发商平台
			appkey = "585cd26a07fe65466d001196";
			appMasterSecret = "dvvxfrd7m8dg1l9gqs5b3xitu4bv7pex";
			break;
		default:
			break;
		}
	}
	/**
	 * 安卓广播
	 * @throws Exception
	 */
	public  void sendAndroidBroadcast(UpushModel upushModel) throws Exception {
		AndroidBroadcast broadcast = new AndroidBroadcast(appkey,appMasterSecret);
		broadcast.setTicker(upushModel.getTicker());
		broadcast.setTitle(upushModel.getTitle());
		broadcast.setText(upushModel.getText());
		for (Entry<String, String> entry : upushModel.getMap().entrySet()) {
            System.out.println("key= " + entry.getKey() + " and value= "
                   + entry.getValue());
            broadcast.setExtraField(entry.getKey(), entry.getValue());
		}
		broadcast.goCustomAfterOpen("");
		broadcast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		if(testFlag){
			broadcast.setTestMode();
		}else{
			broadcast.setProductionMode();
		}
		// Set customized fields
		client.send(broadcast);
	}
	
	/**
	 * 单播
	 * @throws Exception
	 */
	public  void sendAndroidUnicast(UpushModel upushModel) throws Exception {
		AndroidUnicast unicast = new AndroidUnicast(appkey,appMasterSecret);
		// TODO Set your device token
		unicast.setDeviceToken(upushModel.getDeviceToken());
		unicast.setTicker(upushModel.getTicker());
		unicast.setTitle(upushModel.getTitle());
		unicast.setText(upushModel.getText());
		unicast.goAppAfterOpen();
		unicast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		if(testFlag){
			unicast.setTestMode();
		}else{
			unicast.setProductionMode();
		}
		// Set customized fields
		for (Entry<String, String> entry : upushModel.getMap().entrySet()) {
            System.out.println("key= " + entry.getKey() + " and value= "
                   + entry.getValue());
            unicast.setExtraField(entry.getKey(), entry.getValue());
		}
		client.send(unicast);
	}
	
	/**
	 * 组播
	 * @throws Exception
	 */
	public  void sendAndroidGroupcast(UpushModel upushModel) throws Exception {
		AndroidGroupcast groupcast = new AndroidGroupcast(appkey,appMasterSecret);
		/*  TODO
		 *  Construct the filter condition:
		 *  "where": 
		 *	{
    	 *		"and": 
    	 *		[
      	 *			{"tag":"test"},
      	 *			{"tag":"Test"}
    	 *		]
		 *	}
		 */
		JSONObject filterJson = new JSONObject();
		JSONObject whereJson = new JSONObject();
		JSONArray tagArray = new JSONArray();
		JSONObject testTag = new JSONObject();
		
		testTag.put("tag", upushModel.getTag());
		tagArray.put(testTag);
		whereJson.put("and", tagArray);
		filterJson.put("where", whereJson);
		System.out.println(filterJson.toString());
		
		groupcast.setFilter(filterJson);
		groupcast.setTicker(upushModel.getTicker());
		groupcast.setTitle(upushModel.getTitle());
		groupcast.setText(upushModel.getText());
		groupcast.goCustomAfterOpen("");
		groupcast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		if(testFlag){
			groupcast.setTestMode();
		}else{
			groupcast.setProductionMode();
		}
		for (Entry<String, String> entry : upushModel.getMap().entrySet()) {
            System.out.println("key= " + entry.getKey() + " and value= "
                   + entry.getValue());
            groupcast.setExtraField(entry.getKey(), entry.getValue());
		}
		client.send(groupcast);
	}
	
	/**
	 * 指定
	 * @throws Exception
	 */
	public  void sendAndroidCustomizedcast(UpushModel um) throws Exception {
		AndroidCustomizedcast customizedcast = new AndroidCustomizedcast(appkey,appMasterSecret);
		// TODO Set your alias here, and use comma to split them if there are multiple alias.
		// And if you have many alias, you can also upload a file containing these alias, then 
		// use file_id to send customized notification.
		customizedcast.setAlias(um.getAliasValue(), um.getAlias());
		customizedcast.setTicker(um.getTicker());
		customizedcast.setTitle(um.getTitle());
		customizedcast.setText(um.getText());
		customizedcast.goCustomAfterOpen("");
		customizedcast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		if(testFlag){
			customizedcast.setTestMode();
		}else{
			customizedcast.setProductionMode();
		}
		for (Entry<String, String> entry : um.getMap().entrySet()) {
            System.out.println("key= " + entry.getKey() + " and value= "
                   + entry.getValue());
            customizedcast.setExtraField(entry.getKey(), entry.getValue());
		}
		client.send(customizedcast);
	}
	
	public  void sendAndroidCustomizedcastFile() throws Exception {
		AndroidCustomizedcast customizedcast = new AndroidCustomizedcast(appkey,appMasterSecret);
		// TODO Set your alias here, and use comma to split them if there are multiple alias.
		// And if you have many alias, you can also upload a file containing these alias, then 
		// use file_id to send customized notification.
		String fileId = client.uploadContents(appkey,appMasterSecret,"aa"+"\n"+"bb"+"\n"+"alias");
		customizedcast.setFileId(fileId, "alias_type");
		customizedcast.setTicker( "Android customizedcast ticker");
		customizedcast.setTitle(  "中文的title");
		customizedcast.setText(   "Android customizedcast text");
		customizedcast.goAppAfterOpen();
		customizedcast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
		// TODO Set 'production_mode' to 'false' if it's a test device. 
		// For how to register a test device, please see the developer doc.
		if(testFlag){
			customizedcast.setTestMode();
		}else{
			customizedcast.setProductionMode();
		}
		client.send(customizedcast);
	}
	
	public  void sendAndroidFilecast() throws Exception {
		AndroidFilecast filecast = new AndroidFilecast(appkey,appMasterSecret);
		// TODO upload your device tokens, and use '\n' to split them if there are multiple tokens 
		String fileId = client.uploadContents(appkey,appMasterSecret,"aa"+"\n"+"bb");
		filecast.setFileId( fileId);
		filecast.setTicker( "Android filecast ticker");
		filecast.setTitle(  "中文的title");
		filecast.setText(   "Android filecast text");
		filecast.goAppAfterOpen();
		filecast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
		if(testFlag){
			filecast.setTestMode();
		}else{
			filecast.setProductionMode();
		}
		client.send(filecast);
	}
	
	public  void sendIOSBroadcast() throws Exception {
		IOSBroadcast broadcast = new IOSBroadcast(appkey,appMasterSecret);

		broadcast.setAlert("IOS 广播测试");
		broadcast.setBadge( 0);
		broadcast.setSound( "default");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		if(testFlag){
			broadcast.setTestMode();
		}else{
			broadcast.setProductionMode();
		}
		// Set customized fields
		broadcast.setCustomizedField("test", "helloworld");
		client.send(broadcast);
	}
	
	public  void sendIOSUnicast() throws Exception {
		IOSUnicast unicast = new IOSUnicast(appkey,appMasterSecret);
		// TODO Set your device token
		unicast.setDeviceToken( "xx");
		unicast.setAlert("IOS 单播测试");
		unicast.setBadge( 0);
		unicast.setSound( "default");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		if(testFlag){
			unicast.setTestMode();
		}else{
			unicast.setProductionMode();
		}
		// Set customized fields
		unicast.setCustomizedField("test", "helloworld");
		client.send(unicast);
	}
	
	public  void sendIOSGroupcast() throws Exception {
		IOSGroupcast groupcast = new IOSGroupcast(appkey,appMasterSecret);
		/*  TODO
		 *  Construct the filter condition:
		 *  "where": 
		 *	{
    	 *		"and": 
    	 *		[
      	 *			{"tag":"iostest"}
    	 *		]
		 *	}
		 */
		JSONObject filterJson = new JSONObject();
		JSONObject whereJson = new JSONObject();
		JSONArray tagArray = new JSONArray();
		JSONObject testTag = new JSONObject();
		testTag.put("tag", "iostest");
		tagArray.put(testTag);
		whereJson.put("and", tagArray);
		filterJson.put("where", whereJson);
		System.out.println(filterJson.toString());
		
		// Set filter condition into rootJson
		groupcast.setFilter(filterJson);
		groupcast.setAlert("IOS 组播测试");
		groupcast.setBadge( 0);
		groupcast.setSound( "default");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		if(testFlag){
			groupcast.setTestMode();
		}else{
			groupcast.setProductionMode();
		}
		client.send(groupcast);
	}
	
	public  void sendIOSCustomizedcast() throws Exception {
		IOSCustomizedcast customizedcast = new IOSCustomizedcast(appkey,appMasterSecret);
		// TODO Set your alias and alias_type here, and use comma to split them if there are multiple alias.
		// And if you have many alias, you can also upload a file containing these alias, then 
		// use file_id to send customized notification.
		customizedcast.setAlias("alias", "alias_type");
		customizedcast.setAlert("IOS 个性化测试");
		customizedcast.setBadge( 0);
		customizedcast.setSound( "default");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		if(testFlag){
			customizedcast.setTestMode();
		}else{
			customizedcast.setProductionMode();
		}
		client.send(customizedcast);
	}
	
	public  void sendIOSFilecast() throws Exception {
		IOSFilecast filecast = new IOSFilecast(appkey,appMasterSecret);
		// TODO upload your device tokens, and use '\n' to split them if there are multiple tokens 
		String fileId = client.uploadContents(appkey,appMasterSecret,"aa"+"\n"+"bb");
		filecast.setFileId( fileId);
		filecast.setAlert("IOS 文件播测试");
		filecast.setBadge( 0);
		filecast.setSound( "default");
		// TODO set 'production_mode' to 'true' if your app is under production mode
		if(testFlag){
			filecast.setTestMode();
		}else{
			filecast.setProductionMode();
		}
		client.send(filecast);
	}
	
	public static void main(String[] args) {
		// TODO set your appkey and master secret here
		try {
			/**
			 * 1 跳转类型(1 h5 2 app) jumpType
			 * 2 模块(1 商品详情 2 活动页 3 首页标签分类推荐 4 订单详情) model
			 * 3 跳转值 jumpValue
			 * 4 h5 标题 title
			 */
			Map<String,String> map = new HashMap<>();
			map.put("jumpType", "1");
			map.put("jumpValue", "http://testapp.sqkx.net/html/b2b/appdown/appdown.html");
			UpushModel um = new UpushModel();
			um.setTicker("订单");
			um.setTitle("社区盒子");
			um.setText("社区盒子上线啦");
			Upush up = new Upush("2");
			//up.sendAndroidBroadcast(um);
			map.clear();
			UpushModel um1 = new UpushModel();
			map.put("jumpType", "2");
			map.put("model", "1");
			map.put("jumpValue", "1729");
			um1.setMap(map);
			um1.setTicker("商品");
			um1.setTitle("社区盒子");
			um1.setText("露露杏仁露听装240ML");
			//Upush.sendAndroidBroadcast(um1);
			
			map.clear();
			UpushModel um2 = new UpushModel();
			map.put("jumpType", "2");
			map.put("model", "2");
			map.put("jumpValue", "400");
			um2.setMap(map);
			um2.setTicker("活动");
			um2.setTitle("社区盒子");
			um2.setText("订单满300元加28.5换美汁源一箱");
			//Upush.sendAndroidBroadcast(um2);
			
			map.clear();
			UpushModel um3 = new UpushModel();
			map.put("jumpType", "2");
			map.put("model", "3");
			map.put("jumpValue", "1");
			um3.setMap(map);
			um3.setTicker("首页标签活动");
			um3.setTitle("社区盒子");
			um3.setText("熟食火腿");
			//Upush.sendAndroidBroadcast(um3);
			
			map.clear();
			UpushModel um4 = new UpushModel();
			map.put("jumpType", "2");
			map.put("model", "4");
			map.put("jumpValue", "1");
			um4.setMap(map);
			um4.setTicker("订单");
			um4.setTitle("社区盒子");
			um4.setText("熟食火腿");
			um4.setAlias("USER_ID");
			um4.setAliasValue("166");
			Upush u = new Upush("2") ;
			u.sendAndroidCustomizedcast(um4);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	

}

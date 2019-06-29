package org.xianghuan.util;

import java.util.HashMap;
import java.util.Map;

public class UpushModel {
	//描述 (统计区分用)
	private String ticker;
	//标题
	private String title;
	//内容
	private String text;
	//自定义参数
	private Map<String,String> map = new HashMap<>();
	//组播
	private String tag;
	//单播
	private String deviceToken;
	//别名
	private String alias;
	//别名值
	private String aliasValue;
	
	
	public String getAliasValue() {
		return aliasValue;
	}
	public void setAliasValue(String aliasValue) {
		this.aliasValue = aliasValue;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getDeviceToken() {
		return deviceToken;
	}
	public void setDeviceToken(String deviceToken) {
		this.deviceToken = deviceToken;
	}
	public String getTicker() {
		return ticker;
	}
	public void setTicker(String ticker) {
		this.ticker = ticker;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Map<String, String> getMap() {
		return map;
	}
	public void setMap(Map<String, String> map) {
		this.map = map;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
}

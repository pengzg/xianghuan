package org.xianghuan.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
/**
 * 
 * @author hehh
 *
 */
public class PropertiesUtil {
	private final static PropertiesUtil instance = new PropertiesUtil();
	Properties properties = new Properties();
	
	private void  loadFile(String propertiesFilePath) {
		InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream(propertiesFilePath);
		try {
			properties.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public  String getProperty(String filePath,String key) {
		loadFile(filePath);
		return properties.getProperty(key);
	}
	
	public static  PropertiesUtil getInstance() {
		return instance;
	}
}

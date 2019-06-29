package org.xianghuan.util.csv;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

/**
 * 解析CSV文件
 * @author jupinguoji
 *
 */
public class ParseCSVUtil {

	/**
	 * 读取CSV文件 并转换 数据格式
	 * @param clazz 转换对象
	 * @param propertys 转换对象属性
	 * @param filePath 文件路径
	 * @param readRow  从第几行读取
	 * @return
	 * @throws Exception
	 */
	public static <T> List<T> bulidbyProperty(Class<T> clazz, String[] propertys,String filePath,int readRow) throws Exception{
		List<T> t = new ArrayList<T>();
		ArrayList<ArrayList<String>> dataList = parseCsvData(filePath, readRow);
		for (ArrayList<String> data : dataList) {
			T obj = clazz.newInstance();
			int index = 0;
			for (String v : data) {
				if (v != null)
					v = v.trim();
				BeanUtils.copyProperty(obj, propertys[index], v);
				index++;
			}
			t.add(obj);
		}
		return t;
	}
	
	/**
	 * 解析文件数据
	 * @param filePath 文件路径
	 * @param readRow 从第几行读取数据
	 * @return
	 * @throws Exception 
	 */
	public static ArrayList<ArrayList<String>> parseCsvData(String filePath,int readRow) throws Exception {
		ArrayList<ArrayList<String>> dataList = new ArrayList<>();
		ArrayList<String> strList = null;
		BufferedReader br=null;
		 try { 
	            br = new BufferedReader(new InputStreamReader(new FileInputStream(new File(filePath)),"GBK"));
	            String line = ""; 
	            int index =0 ;
	            String [] tmp=null;
	            while ((line = br.readLine()) != null) {
	            	if(index>=readRow){
	            		if(StringUtils.isNotBlank(line)){
	            			tmp = line.split(",");
	            			strList = new ArrayList<>();
	            			for(String d : tmp){
	            				strList.add(d);
	            			}
	            			dataList.add(strList);
	            		}
	            	}
	            	index++;
	            }
	        }catch (Exception e) {
	        	throw new Exception("解析CSV文件数据失败!");
	        }finally{
	            if(br!=null){
	                try {
	                    br.close();
	                    br=null;
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
		return dataList;
	}
}

package com.xianghuan.util;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;


public class CsvWriter {  
	  
    /** CSV文件列分隔符 */  
    private static final String CSV_COLUMN_SEPARATOR = ",";  
  
    /** CSV文件列分隔符 */  
    private static final String CSV_RN = "\r\n";  
  
    /** 
     *  
     * 将检索数据输出的对应的csv列中 
     * */  
    public static String formatCsvData(List<Map<String, Object>> data,  
            String displayColNames, String matchColNames) {  
  
        StringBuffer buf = new StringBuffer();  
  
        String[] displayColNamesArr = null;  
        String[] matchColNamesMapArr = null;  
  
        displayColNamesArr = displayColNames.split(",");  
        matchColNamesMapArr = matchColNames.split(",");  
  
        // 输出列头  
        for (int i = 0; i < displayColNamesArr.length; i++) {  
            buf.append(displayColNamesArr[i]).append(CSV_COLUMN_SEPARATOR);  
        }  
        buf.append(CSV_RN);  
  
        if (null != data) {  
            // 输出数据  
            for (int i = 0; i < data.size(); i++) {  
  
                for (int j = 0; j < matchColNamesMapArr.length; j++) {  
                    buf.append(data.get(i).get(matchColNamesMapArr[j])).append(  
                            CSV_COLUMN_SEPARATOR);  
                }  
                buf.append(CSV_RN);  
            }  
        }  
        return buf.toString();  
    }  
    public static String formatCsvDataObjList(List data,  
            String displayColNames, String matchColNames) { 
    	List<Map<String,Object>> mapList = new ArrayList<>();
    	String[] fileds = matchColNames.split(",");
    	try{
    		for (int i = 0; i<data.size();i++){
    			Object obj = data.get(i);
    			HashMap<String, Object> map = new HashMap<>();
    			for(int j= 0;j<fileds.length;j++){
    				Object ob = BeanUtils.getProperty(obj, fileds[j]);
    				if(ob==null){
    					ob = "";
    				}
    				map.put(fileds[j],ob );
    			}
    			mapList.add(map);
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return formatCsvData(mapList, displayColNames, matchColNames);
    }
    public static void exportCsv(String fileName, String content,  
            HttpServletResponse response) throws IOException {  
  
        // 设置文件后缀  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhh24mmss");  
        String fn = fileName.concat(sdf.format(new Date()).toString() + ".csv");  
  
        // 读取字符编码  
        String csvEncoding = "UTF-8";  
  
        // 设置响应  
        response.setCharacterEncoding(csvEncoding);  
        response.setContentType("text/csv; charset=" + csvEncoding);  
        response.setHeader("Pragma", "public");  
        response.setHeader("Cache-Control", "max-age=30");  
        response.setHeader("Content-Disposition", "attachment; filename="  
                + new String(fn.getBytes(), csvEncoding));  
  
        // 写出响应  
        OutputStream os = response.getOutputStream();  
        os.write(content.getBytes("GBK"));  
        os.flush();  
        os.close();  
    }  
    
} 
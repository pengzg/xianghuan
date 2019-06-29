package org.xianghuan.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.log4j.Logger;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;

public class HttpRequestUtil {
	private static final Logger log = Logger.getLogger(HttpRequestUtil.class);
	/**
     * 向指定URL发送GET方法的请求
     * 
     * @param url
     *            发送请求的URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(),"UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     * 
     * @param url
     *            发送请求的 URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            //conn.setRequestProperty("content-type", "application/x-www-form-urlencoded;charset=UTF-8");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(),"UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            log.error("发送 POST 请求出现异常！",e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result;
    }    
    
    /**  
     * 发送xml数据请求到server端  
     * @param url xml请求数据地址  
     * @param xmlString 发送的xml数据流  
     * @return null发送失败，否则返回响应内容  
     */    
    @SuppressWarnings("deprecation")
	public static String post(String url,Object xmlObj){   
    	
    	//解决XStream对出现双下划线的bug
        XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));

        //将要提交给API的数据对象转换成XML格式数据Post给API
        String xmlString = xStreamForRequestPostData.toXML(xmlObj);
        log.info("======11111111111111111=============================================");
        log.info("======"+xmlString+"=============================================");
        log.info("======22222222222222222=============================================");
    	
        //创建httpclient工具对象   
        HttpClient client = new HttpClient();    
        //创建post请求方法   
        PostMethod myPost = new PostMethod(url);   
        log.info("====url:=="+url+"=============================================");
        //设置请求超时时间   
        client.setConnectionTimeout(300*1000);  
        String responseString = null;    
        try{    
            //设置请求头部类型   
            myPost.setRequestHeader("Content-Type","text/xml");  
            myPost.setRequestHeader("charset","utf-8");  
              
            //设置请求体，即xml文本内容，注：这里写了两种方式，一种是直接获取xml内容字符串，一种是读取xml文件以流的形式   
            myPost.setRequestBody(xmlString);   
              
            /*InputStream body=this.getClass().getResourceAsStream("/"+xmlFileName);  
            myPost.setRequestBody(body);*/  
            myPost.setRequestEntity(new StringRequestEntity(xmlString,"text/xml","utf-8"));     
            int statusCode = client.executeMethod(myPost);    
            if(statusCode == HttpStatus.SC_OK){    
                BufferedInputStream bis = new BufferedInputStream(myPost.getResponseBodyAsStream());    
                byte[] bytes = new byte[1024];    
                ByteArrayOutputStream bos = new ByteArrayOutputStream();    
                int count = 0;    
                while((count = bis.read(bytes))!= -1){    
                    bos.write(bytes, 0, count);    
                }    
                byte[] strByte = bos.toByteArray();    
                responseString = new String(strByte,0,strByte.length,"gbk");    
                log.info("======"+responseString+"=============================================");
                bos.close();    
                bis.close();    
            }    
        }catch (Exception e) {
        	log.error("发送 POST 请求出现异常！"+e.getMessage(),e);
            e.printStackTrace();  
        }    
        myPost.releaseConnection();    
        return responseString;    
    }
    
    /**  
     * 发送xml数据请求到server端  
     * @param url xml请求数据地址  
     * @param xmlString 发送的xml数据流  
     * @return null发送失败，否则返回响应内容  
     */    
    @SuppressWarnings("deprecation")
	public static String stringPost(String url,String xmlObj){   
    	
    	//解决XStream对出现双下划线的bug
        //XStream xStreamForRequestPostData = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));

        //将要提交给API的数据对象转换成XML格式数据Post给API
        String xmlString = xmlObj;//xStreamForRequestPostData.toXML(xmlObj);
    	
        //创建httpclient工具对象   
        HttpClient client = new HttpClient();    
        //创建post请求方法   
        PostMethod myPost = new PostMethod(url);    
        //设置请求超时时间   
        client.setConnectionTimeout(300*1000);  
        String responseString = null;    
        try{    
            //设置请求头部类型   
            myPost.setRequestHeader("Content-Type","text/xml");  
            myPost.setRequestHeader("charset","utf-8");  
              
            //设置请求体，即xml文本内容，注：这里写了两种方式，一种是直接获取xml内容字符串，一种是读取xml文件以流的形式   
            myPost.setRequestBody(xmlString);   
              
            /*InputStream body=this.getClass().getResourceAsStream("/"+xmlFileName);  
            myPost.setRequestBody(body);*/  
            myPost.setRequestEntity(new StringRequestEntity(xmlString,"text/xml","utf-8"));     
            int statusCode = client.executeMethod(myPost);    
            if(statusCode == HttpStatus.SC_OK){    
                BufferedInputStream bis = new BufferedInputStream(myPost.getResponseBodyAsStream());    
                byte[] bytes = new byte[1024];    
                ByteArrayOutputStream bos = new ByteArrayOutputStream();    
                int count = 0;    
                while((count = bis.read(bytes))!= -1){    
                    bos.write(bytes, 0, count);    
                }    
                byte[] strByte = bos.toByteArray();    
                responseString = new String(strByte,0,strByte.length,"utf-8");    
                bos.close();    
                bis.close();    
            }    
        }catch (Exception e) {
        	log.error("发送 POST 请求出现异常！",e);
            e.printStackTrace();    
        }    
        myPost.releaseConnection();    
        return responseString;    
    }  
    
    public static void main(String[] args) {
        //发送 GET 请求
        /*String s= sendGet("http://localhost:6144/Home/RequestString", "key=123&v=456");
        System.out.println(s);*/
        
        //发送 POST 请求
        /*String sr= sendPost("http://testapp.sqkx.net/app/user/getUserInfo.action", "reqCode=0111&device=1&deviceType=1&user=47568");
        System.out.println(sr);*/
    	//UnifiedOrderData u = new UnifiedOrderData();
    	//String sr= stringPost("http://localhost:8080/sqkx_platform/app/weiXinPay/wxPayNotifyNotic.action", getXmlInfo1());
    	//HttpsRequest http = new HttpsRequest("http://localhost:8080/sqkx_platform/app/weiXinPay/wxPayNotifyNotic.action");
    	//String sr= stringPost(SystemConstants.NOTIFY_URL, getXmlInfo1());
    	//String sr= http.post(getXmlInfo1());
    	BigDecimal sr = new BigDecimal(100);
        System.out.println(sr);
    }
    
    private static String getXmlInfo1() {  
        StringBuilder sb = new StringBuilder();  
        sb.append("<xml><appid><![CDATA[wx2421b1c4370ec43b]]></appid>");  
        sb.append("<attach><![CDATA[支付测试]]></attach>");  
        sb.append("<bank_type><![CDATA[CFT]]></bank_type>");  
        sb.append("<fee_type><![CDATA[CNY]]></fee_type>");  
        sb.append("<is_subscribe><![CDATA[Y]]></is_subscribe>");  
        sb.append("<mch_id><![CDATA[10000100]]></mch_id>");  
        sb.append("<nonce_str><![CDATA[5d2b6c2a8db53831f7eda20af46e531c]]></nonce_str>");  
        sb.append("<openid><![CDATA[oUpF8uMEb4qRXf22hE3X68TekukE]]></openid>");  
        sb.append("<out_trade_no><![CDATA[1409811653]]></out_trade_no>");  
        sb.append("<result_code><![CDATA[SUCCESS]]></result_code>");  
        sb.append("<return_code><![CDATA[SUCCESS]]></return_code>");  
        sb.append("<sign><![CDATA[B552ED6B279343CB493C5DD0D78AB241]]></sign>");  
        sb.append("<sub_mch_id><![CDATA[10000100]]></sub_mch_id>");  
        sb.append("<time_end><![CDATA[20140903131540]]></time_end>");  
        sb.append("<total_fee>1</total_fee>");
        sb.append("<trade_type><![CDATA[JSAPI]]></trade_type>");
        sb.append("<transaction_id><![CDATA[1004400740201409030005092168]]></transaction_id></xml>");
        return sb.toString();  
    } 
    private static String getXmlInfo2() {  
        StringBuilder sb = new StringBuilder();  
        sb.append("<com.sqkx.mobile.pay.weixin.vo.UnifiedOrderData>");  
        sb.append("<appid>wx2421b1c4370ec43b</appid>");  
        sb.append("<attach>支付测试</attach>");  
        sb.append("<body>JSAPI支付测试</body>");  
        sb.append("<mch_id>10000100</mch_id>");  
        sb.append("<nonce_str>1add1a30ac87aa2db72f57a2375d8fec</nonce_str>");  
        sb.append("<notify_url>http://wxpay.weixin.qq.com/pub_v2/pay/notify.v2.php</notify_url>");  
        sb.append("<openid>oUpF8uMuAJO_M2pxb1Q9zNjWeS6o</openid>");  
        sb.append("<out_trade_no>1415659990</out_trade_no>");  
        sb.append("<spbill_create_ip>14.23.150.211</spbill_create_ip>");  
        sb.append(" <total_fee>1</total_fee>");  
        sb.append("<trade_type>JSAPI</trade_type>");  
        sb.append("<sign>0CB01533B8C1EF103065174F50BCA001</sign>");  
        sb.append("</com.sqkx.mobile.pay.weixin.vo.UnifiedOrderData>");  
          
        return sb.toString();  
    } 
}

package org.xianghuan.util;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.Logger;

/**
 * 加密工具类
 * 
 * @author panyf
 * 
 */
public class MD5Util implements Serializable{
	
	private static final Logger log = Logger.getLogger(MD5Util.class);

	/**
	 * 
	 */
	private static final long serialVersionUID = -3549859520468251246L;
	/**
	 * md5加密
	 * 
	 * @param str
	 * @return
	 */
	public static String md5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte[] byteDigest = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < byteDigest.length; offset++) {
				i = byteDigest[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			// 32位加密
			return buf.toString();
			// 16位的加密
			// return buf.toString().substring(8, 24);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * md5加密
	 * 
	 * @param str
	 * @return
	 */
	public static String md5(String str,String charset) {
		try {
            byte[] btInput = str.getBytes(charset);
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            mdInst.update(btInput);
            byte[] md = mdInst.digest();
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < md.length; i++) {
                int val = ((int) md[i]) & 0xff;
                if (val < 16){
                    sb.append("0");
                }
                sb.append(Integer.toHexString(val));
            }
            return sb.toString();
        } catch (Exception e) {
            log.error("MD5加密失败!",e);
        }
		return "";
	}
	
	public static void main(String[] args) {
		System.out.println(md5("0100F9988C56-8CD4-43E9-AA92-F9FE819391DE12345678", "UTF-8"));
	}
}

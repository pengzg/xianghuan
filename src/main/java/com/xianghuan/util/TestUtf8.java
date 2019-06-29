package com.xianghuan.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class TestUtf8 {

	public static void main(String[] args) throws UnsupportedEncodingException {
		String s = "http%3A%2F%2Fdemo.taodaqing.com%2Fzksrb2c-wx%2Fwxshop%2FgetOpenid&response_type=code&scope=snsapi_base&state=123#wechat_redirect ";
		s = URLDecoder.decode(s, "utf-8");
		System.out.println(s);

		String china = "%31%32%36%2E%61%6D/hEeGv4";
		china = URLDecoder.decode(china, "utf-8");
		System.out.println(china);

	}

}

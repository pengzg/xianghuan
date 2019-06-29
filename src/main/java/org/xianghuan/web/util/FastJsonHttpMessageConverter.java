package org.xianghuan.web.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;

import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class FastJsonHttpMessageConverter
  extends AbstractHttpMessageConverter<Object>
{
  public static final Charset UTF8 = Charset.forName("UTF-8");
  private Charset charset = UTF8;
  private SerializerFeature[] serializerFeature;
  
  protected boolean supports(Class<?> clazz)
  {
    return true;
  }
  
  protected Object readInternal(Class<? extends Object> clazz, HttpInputMessage inputMessage)
    throws IOException, HttpMessageNotReadableException
  {
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    
    InputStream in = inputMessage.getBody();
    
    byte[] buf = new byte[1024];
    for (;;)
    {
      int len = in.read(buf);
      if (len == -1) {
        break;
      }
      if (len > 0) {
        baos.write(buf, 0, len);
      }
    }
    byte[] bytes = baos.toByteArray();
    if (this.charset == UTF8) {
      return JSON.parseObject(bytes, clazz, new Feature[0]);
    }
    return JSON.parseObject(bytes, 0, bytes.length, this.charset.newDecoder(), clazz, new Feature[0]);
  }
  
  protected void writeInternal(Object obj, HttpOutputMessage outputMessage)
    throws IOException, HttpMessageNotWritableException
  {
    OutputStream out = outputMessage.getBody();
    // byte[] bytes1;
    byte[] bytes;
    if (this.charset == UTF8)
    {
      // byte[] bytes;
      if (this.serializerFeature != null) {
        bytes = JSON.toJSONBytes(obj, this.serializerFeature);
      } else {
        bytes = JSON.toJSONBytes(obj, new SerializerFeature[] { SerializerFeature.WriteDateUseDateFormat });
      }
    }
    else
    {
     //  String text1;
      String text;
      if (this.serializerFeature != null) {
        text = JSON.toJSONString(obj, this.serializerFeature);
      } else {
        text = JSON.toJSONString(obj, new SerializerFeature[] { SerializerFeature.WriteDateUseDateFormat });
      }
      bytes = text.getBytes(this.charset);
    }
    out.write(bytes);
  }
}

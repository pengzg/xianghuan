package org.xianghuan.jdbc.exception;

import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;


public class BusinessExceptionMessage
{
	private static HashMap hashExpMessage = null;

	private static boolean blnHasInit = false;

	public BusinessExceptionMessage()
	{
	}

	static
	{
		if (!blnHasInit)
		{
			blnHasInit = true;
			try
			{
				initExceptionMsg();
			} catch (Exception e)
			{
				blnHasInit = false;
				e.printStackTrace();
			}
		}
	}

	/*
	 * 初始化异常信息，从XML文件中取得
	 */
	private static void initExceptionMsg()
	{
		hashExpMessage = new HashMap();
		try
		{
			String strIExceptionMessageXmlUrl = BusinessExceptionMessage.class.getResource("/IExceptionMessage.xml").getPath();
			System.out.println("-------------strIExceptionMessageXmlUrl="+strIExceptionMessageXmlUrl);
			readXMLFile(strIExceptionMessageXmlUrl);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}	 
	/**
	 * 读XML文件
	 * 
	 * @author yychen
	 * @param inFile
	 * @return Document
	 * @throws Exception
	 */
	private static void readXMLFile(String inFile) throws Exception
	{
		SAXBuilder builder = new SAXBuilder(); 
        Document read_doc = builder.build(inFile);
        Element stu = read_doc.getRootElement(); 
        List list = stu.getChildren("Exception"); 
        for(int i = 0;i < list.size();i++) 
        {
            Element e = (Element)list.get(i); 
            String strCode = e.getChildText("Code"); 
            String strMsg = e.getChildText("Message"); 
            System.out.println("Exception Code = " + strCode); 
            System.out.println("Exception Message = " + strMsg);
            if (strCode != null && strMsg != null)
			{
				hashExpMessage.put(strCode, strMsg);
			}
        }  
	}

	/**
	 * 
	 * 
	 * @param strExceptionCode
	 * @param sParams
	 * @return
	 */
	private static String getExceptionMessage(String strExceptionCode, String[] sParams)
	{
		String strExceptionMessage = null;
		if (hashExpMessage.get(strExceptionCode) != null)
		{
			strExceptionMessage = hashExpMessage.get(strExceptionCode).toString();
		}

		if (strExceptionMessage == null)
		{
			return null;
		}
		StringBuffer sbExceptionMsg = new StringBuffer();
		StringTokenizer st = new StringTokenizer(strExceptionMessage, "?");

		if (sParams == null || st.countTokens() - 1 != sParams.length)
		{
			return strExceptionMessage;
		}

		// 将其中的?号替换对应的sParams
		for (int i = 0; i < sParams.length; i++)
		{
			sbExceptionMsg.append(st.nextToken()).append(sParams[i]);
		}
		sbExceptionMsg.append(st.nextToken());

		return sbExceptionMsg.toString();
	}

//	private static String UnicodeToGBK(String s)
//	{
//		try
//		{
//			if (s == null || s.equals(""))
//				return "";
//			String newstring = null;
//			newstring = new String(s.getBytes("ISO8859_1"), "GBK");
//			return newstring;
//		} catch (UnsupportedEncodingException e)
//		{
//			return s;
//		}
//	}

	/*
	 * 取得“异常Exception”中的错误信息
	 * 
	 */
	public static String getExceptionMSG(Exception e)
	{
		String strErrorMessage = null;

		String strErrorCode = null;

		String[] strParams = null;

		Exception orgException = null;

		if (e instanceof BusinessException)
		{
			strErrorCode = ((BusinessException) e).getErrorCode();
			orgException = ((BusinessException) e).getOrgException();
			strParams = ((BusinessException) e).getMessageArgs();
		} else
		{
			strErrorCode = "Gen_E001";
			orgException = e;
			strParams = new String[] { e.getMessage() };

		}

		if (strErrorCode != null)
		{
			strErrorMessage = "[" + strErrorCode + "] ";

			strErrorMessage += BusinessExceptionMessage.getExceptionMessage(strErrorCode, strParams);

			String originalMsg = "originalException is null.";
			if (orgException != null)
			{
				originalMsg = orgException.getMessage();
				int index = originalMsg.indexOf("Start server side"); // Start server
				if (index != -1)
				{
					originalMsg = originalMsg.substring(0, index);
				}
			}
		} else
		{
			strErrorMessage = e.getMessage();
		}

		return strErrorMessage;
	}
}

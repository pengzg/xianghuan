package org.xianghuan.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import com.xianghuan.auth.base.model.BaseData;

public class ObjectsTranscoder {
	public static byte[] listToByteArray(List<Object> value)  {
		if (value == null) {
			throw new NullPointerException("Can't serialize null");
		}
		byte[] rv = null;
		ByteArrayOutputStream bos = null;
		ObjectOutputStream os = null;
		try {
			bos = new ByteArrayOutputStream();
			os = new ObjectOutputStream(bos);
			for (Object bd : value) {
				os.writeObject(bd);
			}
			os.writeObject(null);
			rv = bos.toByteArray();
		} catch (IOException e) {
			throw new IllegalArgumentException("Non-serializable object", e);
		} finally {
			if(bos != null) {
				try {
					bos.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(os != null) {
				try {
					os.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return rv;
	}

	public static List<Object> byteArrayToList(byte[] in)  {
		List<Object> list = new ArrayList<Object>();
		ByteArrayInputStream bis = null;
		ObjectInputStream is = null;
		try {
			if (in != null) {
				bis = new ByteArrayInputStream(in);
				is = new ObjectInputStream(bis);
				while (true) {
					Object bd = is.readObject();
					if (bd == null) {
						break;
					} else {
						list.add(bd);
					}
				}
			}
		} catch (IOException e) {
			
		} catch (ClassNotFoundException e) {
			
		} finally {
			if(bis != null) {
				try {
					bis.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(is != null) {
				try {
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return list;
	}


	public static byte[] objectToByteArray(Object o) { 
        ObjectOutputStream oos = null; 
        ByteArrayOutputStream outputStream = null; 
        try { 
            outputStream = new ByteArrayOutputStream(); 
            oos = new ObjectOutputStream(outputStream); 
            oos.writeObject(o); 
            return outputStream.toByteArray(); 
        } catch (IOException e) { 
        	
        } finally { 
            if (oos != null) { 
                try { 
                    oos.close(); 
                } catch (IOException e) { 
                	
                } 
            } 
            if (outputStream != null) { 
                try { 
                    outputStream.close(); 
                } catch (IOException e) { 
                	
                } 
            } 
        } 
        return null; 
    } 
 

	 public static <T> T byteArrayToObject(byte[] bytes) { 
	        ObjectInputStream ois = null; 
	        ByteArrayInputStream bis = null; 
	        try { 
	            bis = new ByteArrayInputStream(bytes); 
	            ois = new ObjectInputStream(bis); 
	            T object = (T) ois.readObject(); 
	            return object; 
	        } catch (Exception e) { 
	        } finally { 
	            if (ois != null) { 
	                try { 
	                    ois.close(); 
	                } catch (IOException e) { 
	                } 
	            } 
	            if (bis != null) { 
	                try { 
	                    bis.close(); 
	                } catch (IOException e) { 
	                } 
	            } 
	        } 
	        return null; 
	    }
	 public static void main(String[] args) throws IOException {
			/*List<Object> bds = new ArrayList<Object>();
			BaseData bd1 = new BaseData();
			bd1.setBd_name("test1");
			bd1.setBd_code("1");
			BaseData bd2 = new BaseData();
			bd2.setBd_name("test12");
			bd2.setBd_code("2");
			bds.add(bd1);
			bds.add(bd2);
			List<Object> re = deserialize(serialize(bds));
			System.out.println(re.size());
			BaseData b = byteArrayToObject(objectToByteArray(bd1));
			System.out.println(b);*/
		}
}

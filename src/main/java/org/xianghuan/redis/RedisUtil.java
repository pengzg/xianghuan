package org.xianghuan.redis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.xianghuan.util.ObjectsTranscoder;
import org.xianghuan.util.OnlineListener;

public class RedisUtil extends AbstractBaseRedis<String, Object>{
	
	private static RedisUtil instance = null;
	private static Object lock = new Object();
	public static RedisUtil getInstance() {
		if (instance == null) {
			synchronized (lock) {
				if (instance == null) {
					instance = (RedisUtil) OnlineListener.ctx.getBean("redisUtil");
				}
			}
		}
		return instance;
	}
	public  void put(String key,Object value) {
		if(value instanceof List) {
			putList(key,(List<Object>)value);
		}else if(value instanceof String) {
			put(key, value);
		}else if(value instanceof Integer) {
			put(key, String.valueOf(value));
		}else if(value instanceof Double) {
			put(key, String.valueOf(value));
		}else {
			putObj(key,value);
		}
	}
	/**
	 * value 字符 型
	 * @param key
	 * @param value
	 */
	private void put(final String key,final String value) {

		redisTemplate.execute(new RedisCallback<Object>() {  
	        @Override  
	        public Object doInRedis(RedisConnection connection)  
	                throws DataAccessException {  
	            connection.set(  
	                    redisTemplate.getStringSerializer().serialize(  
	                    		key), 
	                    redisTemplate.getStringSerializer().serialize(  
	                            value));  
	            return null;  
	        }  
	    });  
	}
	/**
	 * value 对象型 
	 * @param key
	 * @param value
	 */
	private void putObj(final String key,final Object value) {

		redisTemplate.execute(new RedisCallback<Object>() {  
	        @Override  
	        public Object doInRedis(RedisConnection connection)  
	                throws DataAccessException {  
	            connection.set(  
	                    redisTemplate.getStringSerializer().serialize(  
	                    		key), 
	                    		ObjectsTranscoder.objectToByteArray(value));  
	            return null;  
	        }  
	    });  
	}
	/**
	 *	value  List 型 
	 * @param key
	 * @param value
	 */
	private void putList(final String key,final List<Object> value) {

		redisTemplate.execute(new RedisCallback<Object>() {  
	        @Override  
	        public Object doInRedis(RedisConnection connection)  
	                throws DataAccessException {  
	            connection.set( redisTemplate.getStringSerializer().serialize(  
	                    		key), 
	                    		ObjectsTranscoder.listToByteArray(value));  
	            return null;  
	        }  
	    });  
	}
	public Object getObj(final String keyStr) {  
		Object result = redisTemplate.execute(new RedisCallback<Object>() {  
            public Object doInRedis(RedisConnection connection)  
                    throws DataAccessException {  
                RedisSerializer<String> serializer = getRedisSerializer();  
                byte[] key = serializer.serialize(keyStr);  
                if (connection.exists(key)) { 
	                byte[] value = connection.get(key);  
	                if (value == null) {  
	                    return null;  
	                }  
	                Object obj = ObjectsTranscoder.byteArrayToObject(value);
	                return obj;
	                }
                return null;
            }  
        }); 
        return result;  
    } 
	public List<Object> getList(final String keyStr) {  
		List<Object> result = redisTemplate.execute(new RedisCallback<List<Object>>() {  
            public List<Object> doInRedis(RedisConnection connection)  
                    throws DataAccessException {  
                RedisSerializer<String> serializer = getRedisSerializer();  
                byte[] key = serializer.serialize(keyStr);  
                if (connection.exists(key)) { 
	                byte[] value = connection.get(key);  
	                if (value == null) {  
	                    return null;  
	                }  
	                List<Object> list = ObjectsTranscoder.byteArrayToList(value);
	                return list;  
                }
                return null;
            }  
        }); 
    return result;  
  }
	/**
	 * 删除操作
	 * @param keyStr 
	 */
	 public void remove(final String keyStr) {  
	        redisTemplate.execute(new RedisCallback<String>() {  
	            public String doInRedis(RedisConnection connection)  
	                    throws DataAccessException {  
	                RedisSerializer<String> serializer = getRedisSerializer();  
	                byte[] key = serializer.serialize(keyStr);  
	                Long value = connection.del(key);  
	                return value.toString();  
	            }  
	        });  
     } 
	 /**
		 * 删除操作
		 * @param keyStr 
		 */
	public void removeAll() {  
        redisTemplate.execute(new RedisCallback<String>() {  
            public String doInRedis(RedisConnection connection)  
                    throws DataAccessException {  
                RedisSerializer<String> serializer = getRedisSerializer();  
                 connection.flushAll();  
                 return "";
            }  
        });  
     } 
}

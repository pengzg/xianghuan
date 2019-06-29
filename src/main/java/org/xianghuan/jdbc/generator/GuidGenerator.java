package org.xianghuan.jdbc.generator;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import org.xianghuan.jdbc.generator.model.GuidCounter;

public class GuidGenerator {
	
	private Object lock;
	/** 哈希表，公司为键值，存放该公司进程锁  */
	private Map<String, Lock> locks = new HashMap<String, Lock>();
	/** 哈希表，公司为键值，存放该公司当前 OidBase 和已取数量 */
	private static Map<String, GuidCounter> guidMap = new ConcurrentHashMap<String, GuidCounter>();
	/** 全局公司 ID，4 字节 */
	public static final String GROUP_PK_CORP = "0001";

	/** 单例 */
	private static GuidGenerator instance = null;
	
	static {
		instance = new GuidGenerator();
	}
	
	/** 静态工厂方法 */
	public static GuidGenerator getInstance() {
		return instance;
	}
	private GuidGenerator() {
		// TODO Auto-generated constructor stub
		lock = new Object();
	}
	
	
	public final String nextGuid() {
		return nextGuid(GROUP_PK_CORP);
	}

	/**
	 * 取得下一个公司 OID，参数指定公司 ID
	 * 
	 * @param pk_corp
	 *            String 公司 ID
	 * @return combine型主键：uuid做前缀+时间时间(偏移量)+流水号
	 */
	public String nextGuid(String pkcorp) {
		GuidCounter idCounter = null;
		String guidBase = null;
		int amount = 0;
		Lock l = getLock(pkcorp);
		l.lock();
		try {
			idCounter = (GuidCounter) guidMap.get(pkcorp);
			if (idCounter == null) {
				idCounter = new GuidCounter();
				guidMap.put(pkcorp, idCounter);
			}

			guidBase = idCounter.getGuidBase();
			amount = idCounter.getAmount();
			idCounter.setAmount(amount + 1);
		} finally {
			l.unlock();
		}
		return getWholeGuid(guidBase, amount);
	}
	
	private Lock getLock(String corp) {
		String lockKey = corp;
		Lock l = locks.get(lockKey);
		if (l == null) {
			synchronized (lock) {
				l = locks.get(lockKey);
				if (l == null) {
					l = new ReentrantLock();
					locks.put(lockKey, l);
				}
			}
		}
		return l;
	}
	
	/**
	 * 取得当前的编码 FIXED BY HEGY, ADD PARAMETER oidMark binded with datasource,
	 * combine型主键：uuid做前缀+时间(偏移量)+流水号 
	 */
	private final String getWholeGuid(String idBase, int count) {
		byte[] offset = Long.toString(System.currentTimeMillis()).getBytes();
		byte[] begin = idBase.getBytes();
		for (int i = 0; i < begin.length; i++) {
			begin[i] = (byte) (begin[i] & offset[i]);
		}
		String id = new String(begin);
		return id.concat(count + "");
	}
}

/**
 * 
 */
package org.xianghuan.jdbc.generator.model;

import java.security.SecureRandom;
import java.util.Random;

/**
 * @author henry
 *
 */
public class GuidCounter {

	private String guidBase;
	private int amount;
	/**
	 * 
	 */
	public GuidCounter() {
		// TODO Auto-generated constructor stub
		amount = 0;
		Random rm = new SecureRandom();
		rm.setSeed(System.currentTimeMillis());
		guidBase = String.valueOf(rm.nextInt(Integer.MAX_VALUE));
	}
	public String getGuidBase() {
		return guidBase;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}

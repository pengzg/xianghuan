package org.xianghuan.util.excel;

import java.math.BigDecimal;

public class ImportExcelModel {

	private String merchantid;//商户id
	private String cuf_type;//费用类型
	private String type1;//固定金额
	private BigDecimal pay1;//金额
	private String type2;//百分比
	private BigDecimal pay2;//金额
	private String type3;//浮动
	private BigDecimal pay3;//金额
	public String getType3() {
		return type3;
	}
	public void setType3(String type3) {
		this.type3 = type3;
	}
	public BigDecimal getPay3() {
		return pay3;
	}
	public void setPay3(BigDecimal pay3) {
		this.pay3 = pay3;
	}
	public String getMerchantid() {
		return merchantid;
	}
	public void setMerchantid(String merchantid) {
		this.merchantid = merchantid;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public BigDecimal getPay1() {
		return pay1;
	}
	public void setPay1(BigDecimal pay1) {
		this.pay1 = pay1;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	public BigDecimal getPay2() {
		return pay2;
	}
	public void setPay2(BigDecimal pay2) {
		this.pay2 = pay2;
	}
	public String getCuf_type() {
		return cuf_type;
	}
	public void setCuf_type(String cuf_type) {
		this.cuf_type = cuf_type;
	}
}

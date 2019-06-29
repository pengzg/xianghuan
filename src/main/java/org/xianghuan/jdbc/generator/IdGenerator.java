package org.xianghuan.jdbc.generator;

public interface IdGenerator {
	public abstract String generate();

	public abstract String generate(String pk_corp);

	public abstract String[] generate(String pk_corp, int i) throws Exception;

	public abstract String[] generate(int i);

	//指定长度位数
	public abstract String[] generateAndPrefix(String pk_corp, int i,int width);
	
	//默认为36位
	public abstract String[] generateAndPrefix(String pk_corp, int i);

	//默认为36位
	public abstract String[] generateAndPerfix(int i);
	
	
	
}

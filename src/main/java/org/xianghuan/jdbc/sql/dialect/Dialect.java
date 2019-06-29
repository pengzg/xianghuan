package org.xianghuan.jdbc.sql.dialect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * 类似hibernate的Dialect,但只精简出分页部
 * @author administrator
 */
public abstract class Dialect {
	
	public boolean supportsLimit() {
		return false;
	}

	public boolean supportsLimitOffset() {
		return false;
	}

	public abstract void setLimitParamters(PreparedStatement ps, int parameterSize, int offset, int limit)
			throws SQLException;

    /**
     * 将sql变成分页sql语句,直接使用offset,limit的?作为占位
     * 源代码为: getLimitString(sql,offset,String.valueOf(offset),limit,String.valueOf(limit))
     */
	public String getLimitString(String sql, boolean hasOffset){
	    throw new UnsupportedOperationException(new StringBuilder().append("Paged queries not supported by ").append(getClass().getName()).toString());
	}
    
    /**
     * 将sql变成分页sql语句,提供将offset及limit使用占位?placeholder)替换.
     * <pre>
     * 如mysql
     * dialect.getLimitString("select * from user", 12, ":offset",0,":limit") 将返
     * select * from user limit :offset,:limit
     * </pre>
     * @return 不包含占位符的分页sql
     */
	public String getLimitString(String sql, int offset, int limit) {
		return getLimitString(sql, (offset > 0) || (forceLimitUsage()));
	}

	public boolean forceLimitUsage() {
		return false;
	}
}

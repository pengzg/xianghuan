package org.xianghuan.jdbc.sql.dialect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Dialect for HSQLDB
 * 
 * @author badqiu
 */
public class HSQLDialect extends Dialect {

	@Override
	public String getLimitString(String sql, int offset, int limit) {
		boolean hasOffset = offset > 0;
		return new StringBuffer(sql.length() + 10)
				.append(sql)
				.insert(sql.toLowerCase().indexOf("select") + 6, hasOffset ? " limit " + offset + " " + limit : " top " + limit).toString();
	}

	@Override
	public boolean supportsLimit() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean supportsLimitOffset() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public void setLimitParamters(PreparedStatement ps, int parameterSize, int offset, int limit) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getLimitString(String sql, boolean hasOffset) {
		// TODO Auto-generated method stub
		return new StringBuilder().append(sql).append(hasOffset ? " offset ? limit ?" : " limit ?").toString();
	}
}

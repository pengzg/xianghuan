package org.xianghuan.jdbc.sql.dialect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author badqiu
 */
public class PostgreSQLDialect extends Dialect {

	public boolean supportsLimit() {
		return true;
	}

	public boolean supportsLimitOffset() {
		return true;
	}

	public String getLimitString(String sql, int offset, int limit) {
		return new StringBuffer(sql.length() + 20).append(sql).append(offset > 0 ? " limit " + limit + " offset " + offset : " limit " + limit).toString();
	}

	@Override
	public void setLimitParamters(PreparedStatement ps, int parameterSize, int offset, int limit) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getLimitString(String sql, boolean hasOffset) {
		// TODO Auto-generated method stub
		return new StringBuilder().append(sql).append(hasOffset ? " limit ? offset ?" : " limit ?").toString();
	}
}

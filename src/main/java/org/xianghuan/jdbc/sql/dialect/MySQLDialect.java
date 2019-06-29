package org.xianghuan.jdbc.sql.dialect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author badqiu
 */
public class MySQLDialect extends Dialect {
	
	@Override
	public String getLimitString(String sql, int offset, int limit) {
		if (offset > 0) {
			return sql + " limit " + offset + "," + limit;
		} else {
			return sql + " limit " + limit;
		}
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
		return new StringBuilder().append(sql).append(hasOffset ? " limit ?, ?" : " limit ?").toString();
	}
}

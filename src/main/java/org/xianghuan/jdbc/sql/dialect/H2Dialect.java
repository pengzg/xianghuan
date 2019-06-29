package org.xianghuan.jdbc.sql.dialect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * A dialect compatible with the H2 database.
 * 
 * @author Thomas Mueller
 * 
 */
public class H2Dialect extends Dialect {

	public boolean supportsLimit() {
		return true;
	}

	public String getLimitString(String sql, int offset, int limit) {
		return new StringBuffer(sql.length() + 40)
					.append(sql)
					.append((offset > 0) ? " limit " + limit + " offset " + offset : " limit " + limit).toString();
	}

	@Override
	public boolean supportsLimitOffset() {
		return true;
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
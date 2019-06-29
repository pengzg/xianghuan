package org.xianghuan.jdbc.sql.dialect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author badqiu
 */
public class SQLServerDialect extends Dialect {

	public boolean supportsLimitOffset() {
		return false;
	}

	public boolean supportsLimit() {
		return true;
	}

	public int getAfterSelectInsertPoint(String sql) {
		int selectIndex = sql.toLowerCase().indexOf("select");
		final int selectDistinctIndex = sql.toLowerCase().indexOf("select distinct");
		return selectIndex + (selectDistinctIndex == selectIndex ? 15 : 6);
	}

	public String getLimitString(String querySelect, int offset, int limit) {
		if (offset > 0) {
			throw new UnsupportedOperationException("sql server has no offset");
		}

		return new StringBuffer(querySelect.length() + 8)
					.append(querySelect)
					.insert(getAfterSelectInsertPoint(querySelect), " top " + limit).toString();
	}

	@Override
	public void setLimitParamters(PreparedStatement ps, int parameterSize, int offset, int limit) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
}

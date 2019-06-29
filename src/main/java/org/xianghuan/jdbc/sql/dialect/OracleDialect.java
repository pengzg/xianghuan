package org.xianghuan.jdbc.sql.dialect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author badqiu
 */
public class OracleDialect extends Dialect {

	@Override
	public String getLimitString(String sql, int offset, int limit) {
		sql = sql.trim();
		boolean isForUpdate = false;
		if (sql.toLowerCase().endsWith(" for update")) {
			sql = sql.substring(0, sql.length() - 11);
			isForUpdate = true;
		}

		StringBuffer pagingSelect = new StringBuffer(sql.length() + 100);
		if (offset > 0) {
			pagingSelect.append("select * from ( select row_.*, rownum rownum_ from ( ");
		} else {
			pagingSelect.append("select * from ( ");
		}
		pagingSelect.append(sql);
		if (offset > 0) {
			// int end = offset+limit;
			String endString = offset + "+" + limit;
			pagingSelect.append(" ) row_ ) where rownum_ <= " + endString + " and rownum_ > " + offset);
		} else {
			pagingSelect.append(" ) where rownum <= " + limit);
		}

		if (isForUpdate) {
			pagingSelect.append(" for update");
		}
		return pagingSelect.toString();
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
	    sql = sql.trim();
	    String forUpdateClause = null;
	    boolean isForUpdate = false;
	    int forUpdateIndex = sql.toLowerCase().lastIndexOf("for update");
	    if (forUpdateIndex > -1)
	    {
	      forUpdateClause = sql.substring(forUpdateIndex);
	      sql = sql.substring(0, forUpdateIndex - 1);
	      isForUpdate = true;
	    }

	    StringBuilder pagingSelect = new StringBuilder(sql.length() + 100);
	    if (hasOffset) {
	      pagingSelect.append("select * from ( select row_.*, rownum rownum_ from ( ");
	    }
	    else {
	      pagingSelect.append("select * from ( ");
	    }
	    pagingSelect.append(sql);
	    if (hasOffset) {
	      pagingSelect.append(" ) row_ where rownum <= ?) where rownum_ > ?");
	    }
	    else {
	      pagingSelect.append(" ) where rownum <= ?");
	    }

	    if (isForUpdate) {
	      pagingSelect.append(" ");
	      pagingSelect.append(forUpdateClause);
	    }

	    return pagingSelect.toString();
	}

}

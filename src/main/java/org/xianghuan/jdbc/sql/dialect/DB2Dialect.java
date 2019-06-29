package org.xianghuan.jdbc.sql.dialect;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author badqiu
 */
public class DB2Dialect extends Dialect{

	@Override
	public String getLimitString(String sql, int offset, int limit) {
		int startOfSelect = sql.toLowerCase().indexOf("select");

		StringBuffer pagingSelect = new StringBuffer(sql.length() + 100);
		pagingSelect.append(sql.substring(0, startOfSelect)); // add the comment
		pagingSelect.append("select * from ( select "); // nest the main query in an outer select
		pagingSelect.append(getRowNumber(sql)); // add the rownnumber bit into the outer query select list

		if ( hasDistinct(sql) ) {
			pagingSelect.append(" row_.* from ( ") //add another (inner) nested select
				.append( sql.substring(startOfSelect) ) //add the main query
				.append(" ) as row_"); //close off the inner nested select
		} else {
			pagingSelect.append(sql.substring(startOfSelect + 6)); // add the main query
		}
		pagingSelect.append(" ) as temp_ where rownumber_ ");

		//add the restriction to the outer select
		if (offset > 0) {
			// int end = offset + limit;
			String endString = offset + "+" + limit;
			pagingSelect.append("between " + offset + "+1 and " + endString);
		} else {
			pagingSelect.append("<= " + limit);
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
	
	private static String getRowNumber(String sql) {
		StringBuffer rownumber = new StringBuffer(50).append("rownumber() over(");

		int orderByIndex = sql.toLowerCase().indexOf("order by");

		if (orderByIndex > 0 && !hasDistinct(sql)) {
			rownumber.append(sql.substring(orderByIndex));
		}
		rownumber.append(") as rownumber_,");
		return rownumber.toString();
	}
	
	private static boolean hasDistinct(String sql) {
		return sql.toLowerCase().indexOf("select distinct") >= 0;
	}

}

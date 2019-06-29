package org.xianghuan.jdbc.third.mybatis.interceptor;

import java.lang.reflect.Field;

import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ReflectionUtils;
import org.xianghuan.jdbc.sql.dialect.Dialect;

public abstract class AbstractStatementHandlerInterceptor implements Interceptor {

	@Autowired
	protected Dialect dialect;
	protected final static String _sql_regex = ".*GenericDao.*";
	protected final Logger log = LoggerFactory.getLogger(this.getClass());

	public AbstractStatementHandlerInterceptor() {
		super();
	}

	protected StatementHandler getStatementHandler(Invocation invocation) {
		StatementHandler statement = (StatementHandler) invocation.getTarget();
		if (statement instanceof RoutingStatementHandler) {
			statement = (StatementHandler) getFieldValue(statement, "delegate");
		}
		return statement;
	}

	protected RowBounds getRowBounds(StatementHandler statement) {
		return (RowBounds) getFieldValue(statement, "rowBounds");
	}

	protected boolean hasBounds(RowBounds rowBounds) {
		return (rowBounds != null && rowBounds.getLimit() > 0 && rowBounds.getLimit() < RowBounds.NO_ROW_LIMIT);
	}

	protected boolean hasField(Object target, String fieldName, Class<?> type) {
		return ReflectionUtils.findField(target.getClass(), fieldName, type) == null;
	}

	protected Object getFieldValue(Object target, String fieldName) {
		Field field = ReflectionUtils.findField(target.getClass(), fieldName);
		ReflectionUtils.makeAccessible(field);
		return ReflectionUtils.getField(field, target);
	}

	protected void setFieldValue(Object target, String fieldName, Object value) {
		Field field = ReflectionUtils.findField(target.getClass(), fieldName);
		ReflectionUtils.makeAccessible(field);
		ReflectionUtils.setField(field, target, value);
	}
}

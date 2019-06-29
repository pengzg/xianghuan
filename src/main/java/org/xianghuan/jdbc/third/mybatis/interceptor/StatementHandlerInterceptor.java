package org.xianghuan.jdbc.third.mybatis.interceptor;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.builder.SqlSourceBuilder;
import org.apache.ibatis.executor.statement.PreparedStatementHandler;
import org.apache.ibatis.executor.statement.SimpleStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;
import org.xianghuan.jdbc.third.mybatis.MapperSqlHelper;

@Intercepts({ 
	@Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class }),
	@Signature(type = StatementHandler.class, method = "parameterize", args = { Statement.class }) })
public class StatementHandlerInterceptor extends AbstractStatementHandlerInterceptor{

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		// 负责自动生成sql
		Method m = invocation.getMethod();
		if ("prepare".equals(m.getName())) {
			return prepare(invocation);
		} else if ("parameterize".equals(m.getName())) {
			return parameterize(invocation);
		}
		return invocation.proceed();
	}

	@Override
	public Object plugin(Object target) {
		// TODO Auto-generated method stub
		if (target instanceof StatementHandler) {
			return Plugin.wrap(target, this);
		} else {
			return target;
		}
	}

	@Override
	public void setProperties(Properties properties) {
		// TODO Auto-generated method stub
	}

	private Object prepare(Invocation invocation) throws Throwable {
		StatementHandler statement = getStatementHandler(invocation);
		if (statement instanceof SimpleStatementHandler || statement instanceof PreparedStatementHandler) {
			BoundSql boundSql = statement.getBoundSql();
			String mapperSQL = boundSql.getSql();
			// 公共Dao接口方法
			boolean interceptor = mapperSQL.matches(_sql_regex);
			Object parameterObject = boundSql.getParameterObject();
			if (interceptor) {
//			if (parameterObject!=null) {
				// 参数判断
				if (parameterObject == null) {
					throw new RuntimeException("使用公共dao必須給mapper接口的@TableMapperAnnotation(Dto.class) 注解設置值.");
				}
				// 自动创建sql
				String newSQL = MapperSqlHelper.getExecuSQL(parameterObject, mapperSQL);
				log.debug("Auto generated sql:" + newSQL);

				SqlSourceBuilder builder = new SqlSourceBuilder((Configuration) getFieldValue(statement,
						"configuration"));
				SqlSource sqlSource = builder.parse(newSQL, parameterObject.getClass(), null);
				List<ParameterMapping> parameterMappings = sqlSource.getBoundSql(parameterObject)
						.getParameterMappings();
				setFieldValue(boundSql, "sql", sqlSource.getBoundSql(parameterObject).getSql());
				setFieldValue(boundSql, "parameterMappings", parameterMappings);
				// 调用原始statementHandler的prepare方法
				statement.prepare((Connection) invocation.getArgs()[0]);
			}
		}
		// 传递给下一个拦截器处理
		return invocation.proceed();
	}

	private Object parameterize(Invocation invocation) throws Throwable {
		Statement statement = (Statement) invocation.getArgs()[0];

		Object obj = invocation.proceed();

		if (statement instanceof PreparedStatement) {
			PreparedStatement ps = (PreparedStatement) statement;
			StatementHandler statementHandler = getStatementHandler(invocation);
			RowBounds rowBounds = getRowBounds(statementHandler);

			if (hasBounds(rowBounds)) {
				BoundSql boundSql = statementHandler.getBoundSql();
				int parameterSize = boundSql.getParameterMappings().size();
				dialect.setLimitParamters(ps, parameterSize, rowBounds.getOffset(), rowBounds.getLimit());
			}
		}
		return obj;
	}
}

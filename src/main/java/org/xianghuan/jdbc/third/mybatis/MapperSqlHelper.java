package org.xianghuan.jdbc.third.mybatis;

import java.util.Map;

import org.springframework.util.ObjectUtils;
import org.xianghuan.jdbc.sql.builder.SqlBuilder;
import org.xianghuan.web.model.Query;

public class MapperSqlHelper {

	public String getUpdateSQL() {
		return null;
	}

	/**
	 * 传入mapper接口class
	 * 
	 * @param mapperclazz
	 * @return
	 */
	private String insertEntity(Object args) throws Exception {
		return SqlBuilder.buildInsertSqlWithValue(args);

	}

	/**
	 * 传入mapper接口class
	 * 
	 * @param mapperclazz
	 * @return
	 */
	private String updateEntityById(Object args) throws Exception {
		return SqlBuilder.buildUpdateSqlWithValue(args);
	}

	private String findEntityAll(Object args, boolean islike) throws Exception {
		if (args == null)
			throw new RuntimeException("Sorry,I refuse to build sql for a null object!");
		StringBuilder sql = new StringBuilder();
		StringBuilder whereSQL = new StringBuilder(" where 1=1 ");
		StringBuffer orderby = new StringBuffer();
		Object[] paramObjs = (Object[]) ((Map) args).get("array");
		if (!ObjectUtils.isEmpty(paramObjs)) {
			// 根据实体类class 构建查询sql
			if (paramObjs[0] != null && paramObjs[0] instanceof Class) {
				sql.append(SqlBuilder.buildSelectSql((Class) paramObjs[0]));
				// 判断是否传入查询条件
				if (paramObjs.length > 1) {
					if (paramObjs[1] instanceof Map) {
						Map<String, Object> map = (Map) paramObjs[1];
						if (map.containsKey("orderby")) {
							orderby.append(" order by " + map.get("orderby"));
						}
						if (map.containsKey("sortby")) {
							orderby.append(" " + map.get("sortby") + " ");
						}
						for (String key : map.keySet()) {
							if (islike)
								whereSQL.append(" and " + key + " like '%" + map.get(key) + "%',");
							else
								whereSQL.append(" and " + key + " = '" + map.get(key) + "',");
						}
						sql.append(whereSQL.subSequence(0, whereSQL.length() - 1)).append(orderby);
					} else if (paramObjs[1] instanceof Query) {
						Map<String, Object> map = ((Query) paramObjs[1]).getQueryParams();
						if (map.containsKey("orderby")) {
							orderby.append(" order by " + map.get("orderby"));
						}
						if (map.containsKey("sortby")) {
							orderby.append(" " + map.get("sortby") + " ");
						}
						for (String key : map.keySet()) {
							if (islike)
								whereSQL.append(" and " + key + " like '%" + map.get(key) + "%',");
							else
								whereSQL.append(" and " + key + " = '" + map.get(key) + "',");
						}
						sql.append(whereSQL.subSequence(0, whereSQL.length() - 1)).append(orderby);
					}
				}
			}
		}
		return sql.toString();
	}

	private String findEntityById(Object args) throws Exception {
		return SqlBuilder.buildSelectSqlByUniqueKey(args);
	}

	public String deleteById(Object args) throws Exception {
		return SqlBuilder.buildDeleteSqlByUniqueKey(args);
	}

	public String queryByVo(Object args, boolean islike) throws Exception {
		return null;

	}

	public String count(Object args) throws Exception {
		return null;
	}

	public String deleteByCondition(Object param) throws Exception {
		return null;
	}

	private static MapperSqlHelper App() {
		return new MapperSqlHelper();
	}

	public static String getExecuSQL(Object param, String mapperDBsql) throws Exception {
		if (mapperDBsql.equals("GenericDao.find.entitys")) {
			return MapperSqlHelper.App().findEntityAll(param, false);// 条件查询实体列表
		} else if (mapperDBsql.equals("GenericDao.find.entityById")) {
			return MapperSqlHelper.App().findEntityById(param);// id查询实体
		} else if (mapperDBsql.equals("GenericDao.find.ListByLike")) {
			return MapperSqlHelper.App().findEntityAll(param, true);// 条件查询实体列表
		} else if (mapperDBsql.equals("GenericDao.insert.entity")) {
			return MapperSqlHelper.App().insertEntity(param);// 保存单一实体
		} else if (mapperDBsql.equals("GenericDao.update.entity")) {
			return MapperSqlHelper.App().updateEntityById(param);// 保存单一实体
		} else if (mapperDBsql.equals("GenericDao.update.entity.condistion")) {
			return mapperDBsql;
		} else if (mapperDBsql.equals("GenericDao.delete.id")) {
			return MapperSqlHelper.App().deleteById(param);
		} else if (mapperDBsql.equals("GenericDao.delete.condition")) {
			return MapperSqlHelper.App().deleteByCondition(param);
		} else if (mapperDBsql.equals("GenericDao.count.condition")) {
			return MapperSqlHelper.App().count(param);
		} else if (mapperDBsql.equals("GenericDao.find.entity.queryByVo")) {
			return MapperSqlHelper.App().queryByVo(param, false);
		} else if (mapperDBsql.equals("GenericDao.find.entity.queryByVoLike")) {
			return MapperSqlHelper.App().queryByVo(param, true);
		}
		return null;
	}

	// 预留接口
	private String updateEntityByConditions(Class<?> clazz, Object param) {

		return null;
	}

	public void getParam(Object param) {
		StringBuffer bf = new StringBuffer();
		if (isPrimitiveType(param.getClass())) {
			bf.append(param);
		} else if (param instanceof Map) {
			Map<String, Object> map = (Map) param;
		}
	}

	public static boolean isPrimitiveType(Class clazz) {
		return clazz != null
				&& (clazz.isPrimitive() || clazz.equals(Long.class) || clazz.equals(Integer.class)
						|| clazz.equals(Short.class) || clazz.equals(Byte.class) || clazz.equals(Double.class)
						|| clazz.equals(Float.class) || clazz.equals(Boolean.class) || clazz.equals(Character.class) || clazz
							.equals(String.class));
	}
}

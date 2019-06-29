package org.xianghuan.jdbc.third.mybatis;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.xianghuan.jdbc.DynamicSqlParameter;
import org.xianghuan.jdbc.exception.DBException;
import org.xianghuan.web.model.DataGrid;

/**
 * MyBatis DAO层泛型基类，实现了基本的DAO功能 利用了Spring的DaoSupport功能
 * 
 * @author administrator
 * @since 0.1
 * @param <T> 实体类
 * @param <PK>主键类，必须实现Serializable接口
 * @see org.jpgj.jdbc.framework.third.mybatis.IGenericDao
 * @see org.mybatis.spring.support.SqlSessionDaoSupport
 */
public abstract class GenericIbatisDao<T, PK extends Serializable> extends SqlSessionDaoSupport implements
		IGenericDao<T, PK> {

	private static final Logger log = Logger.getLogger(GenericIbatisDao.class);
	
	// sqlmap.xml定义文件中对应的sqlid
	public static final String SQLID_INSERT = "insert";
	public static final String SQLID_INSERT_BATCH = "insertBatch";
	public static final String SQLID_UPDATE = "update";
	public static final String SQLID_UPDATE_PARAM = "updateParam";
	public static final String SQLID_UPDATE_BATCH = "updateBatch";
	public static final String SQLID_DELETE = "delete";
	public static final String SQLID_DELETE_PARAM = "deleteParam";
	public static final String SQLID_DELETE_BATCH = "deleteBatch";
	public static final String SQLID_TRUNCATE = "truncate";
	public static final String SQLID_SELECT = "select";
	public static final String SQLID_SELECT_PK = "selectPk";
	public static final String SQLID_SELECT_PARAM = "selectParam";
	
	
	public static final String SQLID_SELECT_FK = "selectFk";
	public static final String SQLID_COUNT = "count";
	public static final String SQLID_COUNT_PARAM = "countParam";

	private String sqlmapNamespace = "";
	protected Class<T> clazz;
		
	public GenericIbatisDao() {
		// 通过范型反射，取得在子类中定义的class.
		clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		sqlmapNamespace = clazz.getSimpleName();
	}

	/**
	 * sqlmapNamespace，对应sqlmap.xml中的命名空间
	 * 
	 * @return
	 */
	public String getSqlmapNamespace() {
		return sqlmapNamespace;
	}

	/**
	 * sqlmapNamespace的设置方法，可以用于spring注入
	 * 
	 * @param sqlmapNamespace
	 */
	public void setSqlmapNamespace(String sqlmapNamespace) {
		this.sqlmapNamespace = sqlmapNamespace;
	}

	@Override
	public int insert(T entity) {
		int rows = 0;
		try {
			rows = getSqlSession().insert(sqlmapNamespace + "." + SQLID_INSERT, entity);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
		}
		return rows;
	}

	@Override
	public int update(T entity) {
		int rows = 0;
		try {
			rows = getSqlSession().update(sqlmapNamespace + "." + SQLID_UPDATE, entity);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
		}
		return rows;
	}

	@Override
	public int update(DynamicSqlParameter param) throws Throwable{
		if (param == null || param.getUpdateValueList() == null)
			throw new Exception("参数设置错误:使用带参数的update必须设定update的column！");
		int rows = 0;
		try {
			rows = getSqlSession().update(sqlmapNamespace + "." + SQLID_UPDATE_PARAM, param);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
		}
		return rows;
	}

	@Override
	public int delete(PK primaryKey) {
		int rows = 0;
		try {
			rows = getSqlSession().delete(sqlmapNamespace + "." + SQLID_DELETE, primaryKey);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
		}
		return rows;
	}

	@Override
	public int delete(DynamicSqlParameter param) {
		int rows = 0;
		try {
			rows = getSqlSession().delete(sqlmapNamespace + "." + SQLID_DELETE_PARAM, param);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
		}
		return rows;
	}

	@Override
	public int truncate() {
		int rows = 0;
		try {
			rows = getSqlSession().delete(sqlmapNamespace + "." + SQLID_TRUNCATE);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
		}
		return rows;
	}

	@Override
	public int count() {
		int result = 0;
		try {
			result = getSqlSession().selectOne(sqlmapNamespace + "." + SQLID_COUNT);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
		}
		return result;
	}

	@Override
	public int count(DynamicSqlParameter param) {
		int result = 0;
		try {
			result = getSqlSession().selectOne(sqlmapNamespace + "." + SQLID_COUNT_PARAM, param);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
		}
		return result;
	}

	@Override
	public T find(PK primaryKey) {
		try {
			return getSqlSession().selectOne(sqlmapNamespace + "." + SQLID_SELECT_PK, primaryKey);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
			return null;
		}
	}

	@Override
	public List<T> select() {
		try {
			return getSqlSession().selectList(sqlmapNamespace + "." + SQLID_SELECT);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
			return null;
		}

	}

	@Override
	public List<T> select(DynamicSqlParameter param) {
		try {
			return getSqlSession().selectList(sqlmapNamespace + "." + SQLID_SELECT_PARAM, param);
		} catch (Exception e) {
			e.printStackTrace();
			//return null;
			log.debug(e.getMessage(), e);
			throw new DBException("数据查询出错，请联系管理员！");
		}
	}
	
	public T load(PK primaryKey) throws Throwable {
		Object o = getSqlSession().selectOne(sqlmapNamespace + "." + SQLID_SELECT_PK, primaryKey);
		if (o == null)	throw new Exception("数据查询异常：无法查询出主键数据");
		return (T) o;
	}

	public DataGrid<T> selectPagination(DynamicSqlParameter param) {

		DataGrid<T> result = new DataGrid<T>();
		int count = count(param);
		result.setTotal(count);
		if (count > 0) {
			List<T> data = getSqlSession().selectList(sqlmapNamespace + "." + SQLID_SELECT_PARAM, param);
			result.setRows(data);
		}

		return result;
	}

	@Override
	public List<T> selectFk(DynamicSqlParameter param) {
		try {
			return getSqlSession().selectList(sqlmapNamespace + "." + SQLID_SELECT_FK, param);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
			return null;
		}
	}

	public DataGrid<T> selectFkPagination(DynamicSqlParameter param) {

		DataGrid<T> result = new DataGrid<T>();
		int count = count(param);
		result.setTotal(count);
		if (count > 0) {
			List<T> data = getSqlSession().selectList(sqlmapNamespace + "." + SQLID_SELECT_FK, param);
			result.setRows(data);
		}
		return result;
	}

	@Override
	public int insertBatch(List<T> list) {
		try {
			return getSqlSession().insert(sqlmapNamespace + "." + SQLID_INSERT_BATCH, list);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
			return 0;
		}
	}

	@Override
	public int updateBatch(List<T> list) {
		int rows = 0;
		try {
			for (T t : list) {
				rows = rows + getSqlSession().update(sqlmapNamespace + "." + SQLID_UPDATE, t);
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
		}
		return rows;
	}

	@Override
	public int deleteBatch(List<PK> list) {
		try {
			return getSqlSession().delete(sqlmapNamespace + "." + SQLID_DELETE_BATCH, list);
		} catch (Exception e) {
			e.printStackTrace();
			log.debug(e.getMessage(), e);
			return 0;
		}
	}
}

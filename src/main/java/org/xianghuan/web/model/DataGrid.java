package org.xianghuan.web.model;

import java.util.ArrayList;
import java.util.List;

/**
 * EasyUI DataGrid模型
 * 
 * @author yxf
 * 
 */
public class DataGrid<T> {

	/**
	 * total 表示: 记录总数
	 */
	private Integer total = 0;
	/**
	 * rows 表示: 数据列表
	 */
	private List<T> resultList = new ArrayList<T>();

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<T> getRows() {
		return resultList;
	}

	public void setRows(List<T> resultList) {
		this.resultList = resultList;
	}
}

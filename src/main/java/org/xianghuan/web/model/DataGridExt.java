package org.xianghuan.web.model;

import java.util.List;

public class DataGridExt<T> extends DataGrid<T> {
	private List<T> footer;

	public List<T> getFooter() {
		return footer;
	}

	public void setFooter(List<T> footer) {
		this.footer = footer;
	}
	
}

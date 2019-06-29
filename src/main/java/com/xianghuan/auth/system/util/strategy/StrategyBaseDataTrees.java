package com.xianghuan.auth.system.util.strategy;

import java.util.ArrayList;
import java.util.List;

import org.xianghuan.util.strategy.IStrategy;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.base.model.BaseData;

public class StrategyBaseDataTrees implements IStrategy {

	/**
	 *
	 * @Description: 字典数
	 * @param @param list
	 * @author hhh
	 * @return List<Tree>
	 * @throws
	 */
	@SuppressWarnings("rawtypes")
	public List<Tree> getTrees(List list) {
		List<Tree> treeList1 = new ArrayList<Tree>();
		int lenght = list == null ? 0 : list.size();
		for (int i = 0; i < lenght; i++) {
			BaseData sr = (BaseData) list.get(i);
			Tree node = new Tree();
			node.setId(sr.getBd_id());
			node.setText(sr.getBd_name());
			node.setPid(sr.getBd_pid());
			treeList1.add(node);
		}
		return treeList1;
	}

}

package com.xianghuan.auth.system.util.strategy;

import java.util.ArrayList;
import java.util.List;

import org.xianghuan.util.strategy.IStrategy;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.system.model.SysSystem;

public class StrategySystemTrees implements IStrategy  {
	
	/**
	 * @Title: getTrees
	 * @Description: 所属系统
	 * @param @param list
	 * @author shenwu
	 * @return List<Tree>
	 * @throws
	 */
	@SuppressWarnings("rawtypes")
	public List<Tree> getTrees(List list) {
		List<Tree> treeList1 = new ArrayList<Tree>();
		int lenght = list == null ? 0 : list.size();
		for (int i = 0; i < lenght; i++) {
			SysSystem sr = (SysSystem) list.get(i);
			Tree node = new Tree();
			node.setId(sr.getSs_id());
			node.setText(sr.getSs_name());
			treeList1.add(node);
		}
		return treeList1;
	}

}

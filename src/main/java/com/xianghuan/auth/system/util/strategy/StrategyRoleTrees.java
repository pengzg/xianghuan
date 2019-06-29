package com.xianghuan.auth.system.util.strategy;

import java.util.ArrayList;
import java.util.List;

import org.xianghuan.util.strategy.IStrategy;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.system.model.SysRole;

public class StrategyRoleTrees implements IStrategy {

	/**
	 * @Title: getRoleTrees
	 * @Description: 角色树
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
			SysRole sr = (SysRole) list.get(i);
			Tree node = new Tree();
			node.setId(sr.getSr_id());
			node.setText(sr.getSr_name()+"["+sr.getSr_so_orgid_nameref()+"]");
			node.setPid(sr.getSr_pid());
			treeList1.add(node);
		}
		return treeList1;
	}

}

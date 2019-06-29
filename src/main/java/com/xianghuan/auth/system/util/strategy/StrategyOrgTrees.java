package com.xianghuan.auth.system.util.strategy;

import java.util.ArrayList;
import java.util.List;

import org.xianghuan.util.strategy.IStrategy;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.system.model.SysOrg;

public class StrategyOrgTrees implements IStrategy {

	@SuppressWarnings("rawtypes")
	public List<Tree> getTrees(List list) {
		List<Tree> treeList = new ArrayList<Tree>();
		int lenght = list == null ? 0 : list.size();
		for (int i = 0; i < lenght; i++) {
			SysOrg org = (SysOrg) list.get(i);
			Tree node = new Tree();
			node.setId(org.getSo_orgid());
			node.setText(org.getSo_orgname());
			node.setPid(org.getSo_orgparid());
			// Map<String, String> attributes = new HashMap<String, String>();
			// attributes.put("url", "");
			// attributes.put("target", "");
			// node.setAttributes(attributes);
			treeList.add(node);
		}
		return treeList;
	}
	
}

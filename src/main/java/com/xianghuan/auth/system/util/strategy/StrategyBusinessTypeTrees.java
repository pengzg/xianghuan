package com.xianghuan.auth.system.util.strategy;

import java.util.ArrayList;
import java.util.List;

import org.xianghuan.util.strategy.IStrategy;
import org.xianghuan.web.model.Tree;


public class StrategyBusinessTypeTrees implements IStrategy {

	@Override
	public List<Tree> getTrees(@SuppressWarnings("rawtypes") List list) {
		List<Tree> treeList = new ArrayList<Tree>();
		int lenght = list == null ? 0 : list.size();
		for (int i = 0; i < lenght; i++) {
//			BaseBusinessType t = (BaseBusinessType) list.get(i);
			Tree node = new Tree();
//			node.setId(t.getBbt_id());
//			node.setText(t.getBbt_name());
//			node.setPid(t.getBbt_parent_id());
//			if (StringUtils.isNotBlank(t.getSm_url()))
//				node.setState("open");
//			else
//				node.setState("closed");
//			node.setIconCls(t.getSm_iconcls());
//			Map<String, String> attributes = new HashMap<String, String>();
//			attributes.put("url", t.getSm_url());
//			attributes.put("target", t.getSm_target());
//			node.setAttributes(attributes);
			treeList.add(node);
		}

		return treeList;
	}

}

package com.xianghuan.auth.system.util.strategy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.xianghuan.util.strategy.IStrategy;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.system.model.SysMenu;

public class StrategyMenuTrees implements IStrategy {

	@Override
	public List<Tree> getTrees(@SuppressWarnings("rawtypes") List list) {
		List<Tree> treeList = new ArrayList<Tree>();
		int lenght = list == null ? 0 : list.size();
		for (int i = 0; i < lenght; i++) {
			SysMenu t = (SysMenu) list.get(i);
			Tree node = new Tree();
			node.setId(t.getSm_id());
			node.setText(t.getSm_name());
			node.setPid(t.getSm_pid());
			if (t.getSm_pid().equals("0")) {
				node.setPid("");
			}
			
			if (StringUtils.isNotBlank(t.getSm_url()))
				node.setState("open");
			else
				node.setState("closed");
			node.setIconCls(t.getSm_iconcls());
			Map<String, String> attributes = new HashMap<String, String>();
			attributes.put("url", t.getSm_url());
			attributes.put("target", t.getSm_target());
			node.setAttributes(attributes);
			treeList.add(node);
		}

		return treeList;
	}

}

package org.xianghuan.util.strategy;

import java.util.List;

import org.xianghuan.web.model.Tree;

public interface IStrategy {
	@SuppressWarnings("rawtypes")
	public List<Tree> getTrees(List list);
	
}

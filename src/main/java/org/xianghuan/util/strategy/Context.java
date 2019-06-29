package org.xianghuan.util.strategy;

import java.util.List;

import org.xianghuan.web.model.Tree;

public class Context {
	private IStrategy strategy;

	public Context(IStrategy strategy) {
		this.strategy = strategy;
	}
	public List<Tree> getTrees(@SuppressWarnings("rawtypes") List list) {
		return this.strategy.getTrees(list);
	}
	
}

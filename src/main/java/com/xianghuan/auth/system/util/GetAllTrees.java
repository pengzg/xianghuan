package com.xianghuan.auth.system.util;

import java.util.List;

import org.xianghuan.util.strategy.Context;
import org.xianghuan.web.model.Tree;

import com.xianghuan.auth.system.util.strategy.StrategyBaseDataTrees;
import com.xianghuan.auth.system.util.strategy.StrategyBusinessTypeTrees;
import com.xianghuan.auth.system.util.strategy.StrategyMenuTrees;
import com.xianghuan.auth.system.util.strategy.StrategyOrgTrees;
import com.xianghuan.auth.system.util.strategy.StrategyRoleTrees;
import com.xianghuan.auth.system.util.strategy.StrategySystemTrees;

public class GetAllTrees {

	/**
	 * @Title: getRoleTree
	 * @Description: 角色树
	 * @param @param list
	 * @author shenwu
	 * @return List<Tree>
	 * @throws
	 */
	@SuppressWarnings("rawtypes")
	public List<Tree> getRoleTree(List list) {
		Context context;
		context = new Context(new StrategyRoleTrees());
		return context.getTrees(list);
	}
	
	/**
	 * @Title: getSystemTree
	 * @Description: 所属系统
	 * @param @param list
	 * @author shenwu
	 * @return List<Tree>
	 * @throws
	 */
	@SuppressWarnings("rawtypes")
	public List<Tree> getSystemTree(List list) {
		Context context;
		context = new Context(new StrategySystemTrees());
		return context.getTrees(list);
	}
	
	//机构树组装
	@SuppressWarnings("rawtypes")
	public List<Tree> getOrgTree(List list) {
		Context context;
		context = new Context(new StrategyOrgTrees());
		return context.getTrees(list);
	}
	
	//菜单树组装
	@SuppressWarnings("rawtypes")
	public List<Tree> getMenuTree(List list) {
		Context context;
		context = new Context(new StrategyMenuTrees());
		return context.getTrees(list);
	}
	
	
	//菜单树组装
	@SuppressWarnings("rawtypes")
	public List<Tree> getBusinessTypeTree(List list) {
		Context context;
		context = new Context(new StrategyBusinessTypeTrees());
		return context.getTrees(list);
	}
	
	//菜单树组装
	@SuppressWarnings("rawtypes")
	public List<Tree> getBaseDataTree(List list) {
		Context context;
		context = new Context(new StrategyBaseDataTrees());
		return context.getTrees(list);
	}
	
	
	

}

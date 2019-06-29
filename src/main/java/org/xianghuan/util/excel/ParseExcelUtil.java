package org.xianghuan.util.excel;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

public class ParseExcelUtil {
	// 测试Excel读取
	public static void testReadExcel(String filePath, int sheetIndex, String rows, String[] columns) throws IllegalAccessException, InvocationTargetException, InstantiationException {
		ImportiExcelUtil helper = getPoiExcelHelper(filePath);
		
		// 读取excel文件数据
		ArrayList<ArrayList<String>> dataList = helper.readExcel(filePath, sheetIndex, rows, columns);
		
		List<TestModel> list  = bulidbyProperty(TestModel.class, new String[] {"merchantid","type1","pay1","type2","pay2"}, dataList);
		System.out.println();
		/*for(Object l : list) {
			TestModel tm = (TestModel)l;
			System.out.println(tm.getMerchantid()+"    "+tm.getType1()+"      "+tm.getPay1()+"        "+tm.getType2()+"    "+tm.getPay2());
		}*/
	}
	
	// 获取Excel处理类
	public static ImportiExcelUtil getPoiExcelHelper(String filePath) {
		ImportiExcelUtil helper = null;
		if(filePath.indexOf(".xlsx")!=-1) {
			helper = new PoiExcel2k7Helper();
		}else {
			helper = new PoiExcel2k3Helper();
		}
		return helper;
	}
	@SuppressWarnings("all")
	public static <T> List<T> bulidbyProperty(Class<T> clazz, String[] propertys, ArrayList<ArrayList<String>> dataList) throws IllegalAccessException, InvocationTargetException, InstantiationException {
		//BaseChannelCost
		List<T> t = new ArrayList<T>();
		for (ArrayList<String> data : dataList) {
			T obj = clazz.newInstance();
			int index = 0;
			for (String v : data) {
				BeanUtils.copyProperty(obj, propertys[index], v);
				index++;
			}
			t.add(obj);
		}
		return t;
	}
}

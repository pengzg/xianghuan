package org.xianghuan.util.excel;



import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

/**
 * 导入excel测试类
 * Excel统一POI处理类（针对2003以前和2007以后两种格式的兼容处理）
 * @note	PoiHelper
 */
public  class ImportConfuserFeeExcel {
	// *************************************************
	// ================以下为测试代码====================
	// *************************************************
	public  List importExcel(String filepath) throws IllegalAccessException, InvocationTargetException, InstantiationException{
/*		// 获取Excel文件的sheet列表
		testGetSheetList("c:/test.xlsx");
		
		// 获取Excel文件的第1个sheet的内容
		testReadExcel("c:/test.xls", 0);
		
		// 获取Excel文件的第2个sheet的第2、4-7行和第10行及以后的内容
		testReadExcel("c:/test.xlsx", 1, "2,4-7,10-");
		
		// 获取Excel文件的第3个sheet中a,b,g,h,i,j等列的所有内容
		testReadExcel("c:/test.xls", 2, new String[] {"a","b","g","h","i","j"});*/
		
		// 获取Excel文件的第4个sheet的第2、4-7行和第10行及以后，a,b,g,h,i,j等列的内容
		//testReadExcel("c:/test.xlsx", 3, "2,4-7,10-", new String[] {"a","b","g","h","i","j"});
		//testReadExcel("c:/test.xls", 0, "2-", new String[] {"a","b","c","d","e"});
		return testReadExcel(filepath, 0, "3-", new String[] {"b","d","e","f","g","h","i"});
		
	}
	
	// 测试获取sheet列表
	private  void testGetSheetList(String filePath) {
		ImportiExcelUtil helper = getPoiExcelHelper(filePath);
		
		// 获取Sheet列表
		ArrayList<String> sheets = helper.getSheetList(filePath);
		
		// 打印Excel的Sheet列表
		printList(filePath, sheets);
	}
	
	// 测试Excel读取
	private static void testReadExcel(String filePath, int sheetIndex) {
		ImportiExcelUtil helper = getPoiExcelHelper(filePath);
		
		// 读取excel文件数据
		ArrayList<ArrayList<String>> dataList = helper.readExcel(filePath, sheetIndex);
		
		// 打印单元格数据
		printBody(dataList);
	}
	
	// 测试Excel读取
	private static void testReadExcel(String filePath, int sheetIndex, String rows) {
		ImportiExcelUtil helper = getPoiExcelHelper(filePath);
		
		// 读取excel文件数据
		ArrayList<ArrayList<String>> dataList = helper.readExcel(filePath, sheetIndex, rows);
		
		// 打印单元格数据
		printBody(dataList);
	}
	
	// 测试Excel读取
	private static void testReadExcel(String filePath, int sheetIndex, String[] columns) {
		ImportiExcelUtil helper = getPoiExcelHelper(filePath);
		
		// 读取excel文件数据
		ArrayList<ArrayList<String>> dataList = helper.readExcel(filePath, sheetIndex, columns);
		
		// 打印列标题
		printHeader(columns);
		
		// 打印单元格数据
		printBody(dataList);
	}
	
	// 测试Excel读取
	private static List testReadExcel(String filePath, int sheetIndex, String rows, String[] columns) throws IllegalAccessException, InvocationTargetException, InstantiationException {
		ImportiExcelUtil helper = getPoiExcelHelper(filePath);
		
		// 读取excel文件数据
		ArrayList<ArrayList<String>> dataList = helper.readExcel(filePath, sheetIndex, rows, columns);
		
		// 打印列标题
		printHeader(columns);
		
		// 打印单元格数据
		printBody(dataList);
		
		List<Object> list  = bulidbyProperty(ImportExcelModel.class, new String[] {"merchantid","type1","pay1","type2","pay2","type3","pay3"}, dataList);
		System.out.println();
		for(Object l : list) {
			ImportExcelModel tm = (ImportExcelModel)l;
			System.out.println(tm.getMerchantid()+"    "+tm.getCuf_type()+"      "+tm.getType1()+"      "+tm.getPay1()+"        "+tm.getType2()+"    "+tm.getPay2()+"        "+tm.getType3()+"    "+tm.getPay3());
		}
		return list;
	}
	
	// 获取Excel处理类
	private static ImportiExcelUtil getPoiExcelHelper(String filePath) {
		ImportiExcelUtil helper;
		if(filePath.indexOf(".xlsx")!=-1) {
			helper = new PoiExcel2k7Helper();
		}else {
			helper = new PoiExcel2k3Helper();
		}
		return helper;
	}

	// 打印Excel的Sheet列表
	private static void printList(String filePath, ArrayList<String> sheets) {
		System.out.println();
		for(String sheet : sheets) {
			System.out.println(filePath + " ==> " + sheet);
		}
	}

	// 打印列标题
	private static void printHeader(String[] columns) {
		System.out.println();
		for(String column : columns) {
			System.out.print("\t\t" + column.toUpperCase());
		}
	}

	// 打印单元格数据
	private static void printBody(ArrayList<ArrayList<String>> dataList) {
		int index = 0;
		for(ArrayList<String> data : dataList) {
			index ++;
			System.out.println();
			System.out.print(index);
			for(String v : data) {
				System.out.print("\t\t" + v);
			}
		}
	}
	@SuppressWarnings("all")
	private static List<Object> bulidbyProperty( Class clazz ,String[] propertys,ArrayList<ArrayList<String>> dataList) throws IllegalAccessException, InvocationTargetException, InstantiationException {
		//BaseChannelCost
		List<Object> t = new ArrayList<Object>();
		for(ArrayList<String> data : dataList) {
			Object obj = clazz.newInstance();
			int index = 0;
			for(String v : data) {
				BeanUtils.copyProperty(obj, propertys[index], v);
				index ++;
			}
			t.add(obj);
		}
		return t;
	}
}

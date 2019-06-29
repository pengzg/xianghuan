package org.xianghuan.util.excel;



import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.xianghuan.util.DateUtil;
/**
 * 
 * 导出Excel
 *
 */

@SuppressWarnings("all")
public class ExportExcelUtil {

	public static WritableWorkbook buildXls(OutputStream os, List<String> discrips, String titles[], String fileds[], List dataList, int[] widths) {
		if (dataList == null || dataList.size() == 0) {
			return null;
		} else {
			if (dataList.get(0) instanceof Map) {
				return buildXlsByMapList(os, discrips, titles, fileds, dataList, widths);
			} else {
				return buildXlsByObjList(os, discrips, titles, fileds, dataList, widths);
			}
		}
	}

	public static WritableWorkbook buildXlsByObjList(OutputStream os, List<String> discrips, String titles[], String fileds[], List dataList, int[] widths) {
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		try {
			for (int i = 0; i < dataList.size(); i++) {
				Object obj = dataList.get(i);
				HashMap<String, Object> map = new HashMap<String, Object>();
				for (int j = 0; j < fileds.length; j++) {
					map.put(fileds[j], BeanUtils.getProperty(obj, fileds[j]));
				}
				mapList.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buildXlsByMapList(os, discrips, titles, fileds, mapList, widths);
	}

	public static WritableWorkbook buildXlsByMapList(OutputStream os, List<String> discrips, String titles[], String fileds[], List<Map<String, Object>> dataList, int[] widths) {
		WritableWorkbook workbook = null;
		try {
			// 创建大字体：Arial,大小为10号,粗体，非斜体
			WritableFont font = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD, false);
			font.setColour(Colour.BLACK);
			// 创建单元格格式：设置水平对齐为居中对齐
			WritableCellFormat wcf = new WritableCellFormat(font);
			wcf.setAlignment(Alignment.CENTRE);
			wcf.setAlignment(Alignment.LEFT);

			workbook = Workbook.createWorkbook(os);
			WritableSheet sheet = workbook.createSheet("sheet1", 0);// 创建Sheet
			for (int i = 0; i < widths.length; i++) {
				sheet.setColumnView(i, widths[i]); // 设置列的宽度
			}

			//描述信息
			if (discrips != null) {
				WritableCellFormat discrip_style = new WritableCellFormat(new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, Colour.BLUE));
				for (int i = 0; i < discrips.size(); i++) {
					int discrip_row = sheet.getRows();
					Label label = new Label(0, discrip_row, discrips.get(i), discrip_style);
					sheet.mergeCells(0, discrip_row, fileds.length - 1, discrip_row);
					sheet.addCell(label);
				}
			}
			// 标题
			int title_row = sheet.getRows();
			for (int i = 0; i < titles.length; i++) {
				Label label = new Label(i, title_row, titles[i], wcf);
				sheet.addCell(label);
			}
			// 数据行
			for (int i = 0; i < dataList.size(); i++) {
				Map<String, Object> dataMap = dataList.get(i);
				int row_index = sheet.getRows();
				for (int j = 0; j < fileds.length; j++) {
					String cell_text = dataMap.get(fileds[j]) != null ? StringUtils.trimToEmpty(dataMap.get(fileds[j]).toString()) : "";
					Label label = new Label(j, row_index, cell_text);
					sheet.addCell(label);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return workbook;
	}

	public static void output(HttpServletResponse response, List<String> discrips, String titles[], String fileds[], List dataList, int[] widths, String fileName) {
		response.reset();
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-disposition", "attachment; filename=" + fileName);
		try {
			WritableWorkbook workbook = buildXls(response.getOutputStream(), discrips, titles, fileds, dataList, widths);
			workbook.write();
			workbook.close();
			response.flushBuffer();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void output(HttpServletResponse response, List<String> discrips, String titles[], String fileds[], List dataList, int[] widths) {
		String fileName = DateUtil.getCurrentDateToString3() + ".xls";
		output(response, discrips, titles, fileds, dataList, widths, fileName);
	}

	public static void output(HttpServletResponse response, String titles[], String fileds[], List dataList, int[] widths) {
		output(response, null, titles, fileds, dataList, widths);
	}

	public static void output(HttpServletResponse response, String titles[], String fileds[], List dataList, int[] widths, String fileName) {
		output(response, null, titles, fileds, dataList, widths, fileName);
	}
	public static void main(String[] args) {
		String titles = "订单号,付款时间,订单状态,真实姓名,手机,电话,购买数量,单价,付款金额,邮编,详细地址,买家留言,订单来源";
		String fileds = "orderNo,payTime,customStatus,name,mobile,phone,buyNum,price,orderCharge,postalCode,detailAddress,leaveWord,orderSource";
		int widths[] = { 20, 20, 20, 10, 15, 20, 10, 10, 10, 15, 30, 30, 10 };
		/*List dataList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			dataList.add(new CustomOtherOrderPojo(list.get(i)));
		}
		ExportExcelUtil.output(response, null, titles.split(","), fileds.split(","), dataList, widths, fileName);*/
	}
}

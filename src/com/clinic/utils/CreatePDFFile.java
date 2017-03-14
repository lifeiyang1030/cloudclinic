package com.clinic.utils;

import java.io.File;
import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * @description 
 * @version 20140822
 */
@SuppressWarnings("unused")
public class CreatePDFFile{
	// 建立一个Document对象
	Document document = new Document();

	// 设置字体大小
	private static Font headfont;
	// 设置字体大小
	private static Font keyfont;
	// 设置字体大小
	private static Font textfont;

	int maxWidth = 520;

	static {
		BaseFont bfChinese;
		try {
			bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
			// 设置字体大小
			headfont = new Font(bfChinese, 10, Font.BOLD);
			// 设置字体大小
			keyfont = new Font(bfChinese, 8, Font.BOLD);
			// 设置字体大小
			textfont = new Font(bfChinese, 8, Font.NORMAL);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public CreatePDFFile(File file) throws Exception {
		document.setPageSize(PageSize.A4);// 设置页面大小
		PdfWriter.getInstance(document, new FileOutputStream(file));
		document.open();
	}

	/**
	 * @description 设置表格单元格属性
	 * @param strValue:填充到单元格里的数据
	 * @param font:数据字体 eg:Font textfont = new Font(bfChinese, 8, Font.NORMAL)
	 * @param iAlign:排列方式 eg:Element.ALIGN_LEFT
	 * @return PdfPCell
	 */
	public PdfPCell createCell(String strValue, com.itextpdf.text.Font font, int iAlign) throws Exception {
		PdfPCell cell = new PdfPCell();
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setHorizontalAlignment(iAlign);
		cell.setPhrase(new Phrase(strValue, font));
		return cell;
	}

	/**
	 * @description 设置表格单元格属性
	 * @param strValue:填充到单元格里的数据
	 * @param font:数据字体 eg:Font textfont = new Font(bfChinese, 8, Font.NORMAL)
	 * @return PdfPCell
	 */
	public PdfPCell createCell(String strValue, com.itextpdf.text.Font font) throws Exception {
		PdfPCell cell = new PdfPCell();
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setPhrase(new Phrase(strValue, font));
		return cell;
	}

	/**
	 * @description 设置表格单元格属性
	 * @param strValue:填充到单元格里的数据
	 * @param font:数据字体 eg:Font textfont = new Font(bfChinese, 8, Font.NORMAL)
	 * @param iAlign:排列方式 eg:Element.ALIGN_LEFT
	 * @param iColspan:单元格合并数
	 * @return PdfPCell
	 */
	public PdfPCell createCell(String strValue, com.itextpdf.text.Font font, int iAlign, int iColspan) throws Exception {
		PdfPCell cell = new PdfPCell();
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setHorizontalAlignment(iAlign);
		cell.setColspan(iColspan);
		cell.setPhrase(new Phrase(strValue, font));
		return cell;
	}

	/**
	 * @description 设置表格单元格属性
	 * @param strValue:填充到单元格里的数据
	 * @param font:数据字体 eg:Font textfont = new Font(bfChinese, 8, Font.NORMAL)
	 * @param iAlign:排列方式 eg:Element.ALIGN_LEFT
	 * @param iColspan:单元格合并数
	 * @param isShowBorder:设置是否显示边框
	 * @return PdfPCell
	 */
	public PdfPCell createCell(String strValue, com.itextpdf.text.Font font, int iAlign, int iColspan, boolean isShowBorder) throws Exception {
		PdfPCell cell = new PdfPCell();
		cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		cell.setHorizontalAlignment(iAlign);
		cell.setColspan(iColspan);
		cell.setPhrase(new Phrase(strValue, font));
		cell.setPadding(3.0f);
		if (!isShowBorder) {
			cell.setBorder(0);
			cell.setPaddingTop(15.0f);
			cell.setPaddingBottom(8.0f);
		}
		return cell;
	}

	/**
	 * @description 创建表格，列数自定义
	 * @param iColCount:列数
	 * @return PdfPTable
	 */
	public PdfPTable createTable(int iColCount) throws Exception {
		PdfPTable table = new PdfPTable(iColCount);
		table.setTotalWidth(maxWidth);
		table.setLockedWidth(true);
		table.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.getDefaultCell().setBorder(1);
		return table;
	}

	/**
	 * @description 创建表格，列数按照自定义arrColWidth数组分配
	 * @param arrColWidth:列宽数组
	 * @return PdfPTable
	 */
	public PdfPTable createTable(float[] arrColWidth) throws Exception {
		PdfPTable table = new PdfPTable(arrColWidth);
		table.setTotalWidth(maxWidth);
		table.setLockedWidth(true);
		table.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.getDefaultCell().setBorder(1);
		return table;
	}
	
	/**
	 * @description 创建一个空白表格，列数为1
	 * @return PdfPTable
	 */
	public PdfPTable createBlankTable() throws Exception {
		PdfPTable table = new PdfPTable(1);
		table.getDefaultCell().setBorder(0);
		table.addCell(createCell("", keyfont));
		table.setSpacingAfter(20.0f);
		table.setSpacingBefore(20.0f);
		return table;
	}

//	public void generatePDF() throws Exception {
//		PdfPTable table = createTable(4);
//		table.addCell(createCell("张三症状记录", headfont, Element.ALIGN_CENTER, 4, false));
//
//		// table.addCell(createCell("日期", keyfont, Element.ALIGN_CENTER));
//		// table.addCell(createCell("星期", keyfont, Element.ALIGN_CENTER));
//		// table.addCell(createCell("症状", keyfont, Element.ALIGN_CENTER));
//		// table.addCell(createCell("记录", keyfont, Element.ALIGN_CENTER));
//
//		for (int i = 0; i < 5; i++) {
//			table.addCell(createCell("2012-12-5", textfont, Element.ALIGN_LEFT));
//			table.addCell(createCell("星期一", textfont, Element.ALIGN_LEFT));
//			table.addCell(createCell("轻微头疼，严重呕吐，严重腹泻", textfont, Element.ALIGN_LEFT, 2));
//			table.addCell(createCell("今天早上喝了一杯牛奶，在下午的时候感觉肚子不舒服，当时觉得没什么，但是到了晚上后发现越来越严重了，呕心，严重腹泻，没法，我打了120，直接去了抢救室。", keyfont, Element.ALIGN_LEFT, 4));
//		}
//		document.add(table);
//
//		document.close();
//	}
//
//	public static void main(String[] args) throws Exception {
//		File file = new File("D:\\text.pdf");
//		file.createNewFile();
//		new CreatePDFFile(file).generatePDF();
//	}
}
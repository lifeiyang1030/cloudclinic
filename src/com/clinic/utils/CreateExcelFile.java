package com.clinic.utils;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * @description 创建Excel文件
 * @version 20140822
 */
public class CreateExcelFile {

	private static final Logger logger = Logger.getLogger(CreateExcelFile.class);
	// 字符编码
	private final String ENCODING = "UTF-8";
	// 内容类型
	private final String CONTENT_TYPE = "text/html;charset=UTF-8";

	/**
	 * @description 下载生成的Excel文件
	 * @param request：request对象
	 * @param response：response对象
	 * @param strFileName：输出的文件名
	 * @param strSource：Excel内容源
	 * @return 
	 */
	public void downloadExcel(HttpServletRequest request, HttpServletResponse response, String strFileName, String strSource) {
		
		try {
			// 设置request对象的字符编码
			request.setCharacterEncoding(ENCODING);
			// 解决下载文件名中文乱码问题
			String userAgent = request.getHeader("User-Agent").toLowerCase();
			
			if (userAgent.indexOf("firefox") > 0 || userAgent.indexOf("chrome") > 0) {
				// firefox和chrome浏览器
				strFileName = new String(strFileName.getBytes("UTF-8"), "ISO8859-1");
			} else if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {
				// IE浏览器
				strFileName = URLEncoder.encode(strFileName, "UTF-8");
			} else {
			}

			if (strSource == null || strSource.trim().equals("")) {
				// 设置response对象的ContentType
				response.setContentType(CONTENT_TYPE);
				// 输出错误信息
				PrintWriter out = response.getWriter();
				out.println("<font color=red>下载文件出错！</font>");
				out.close();
			} else {
				response.setContentType("application/vnd.ms-excel");
				// 设置response的头信息
				response.setHeader("Content-disposition", "attachment;filename=\"" + strFileName + "\"");
				OutputStream os = null;
				try {
					// 定义输出字节流
					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					// 定义response的输出流
					os = new BufferedOutputStream(response.getOutputStream());
					// 从文件中读入数据并写到输出字节流中
					baos.write(strSource.getBytes());
					// 将输出字节流写到response的输出流中
					os.write(baos.toByteArray());
				} catch (IOException e) {
					//e.printStackTrace();
					logger.error(e);
				} finally {
					// 关闭输出字节流和response输出流
					os.close();
				}
			}
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error(e);
		}
	}
}
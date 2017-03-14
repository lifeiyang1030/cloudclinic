package com.clinic.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * @description 提供与日期时间相关的方法
 * @version 20140822
 */
public class DateTimeUtil {

	/**
	 * @description 由输入指定格式方式Eg:dateTimeUtil.format('yyyy-mm-dd hh:mm:ss',new
	 *              Date());
	 * @param formatstr
	 *            ：格式方式（Eg:yyyy-mm-dd hh:mm:ss,yyyy-mm-dd）等
	 * @param date
	 *            ：日期
	 * @return
	 * @throws BusinessException
	 */
	public static String format(String formatstr, Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(formatstr);
		return dateFormat.format(date);
	}

	/**
	 * @description 得到当前时间，格式为：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String getNowDateTime1() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dt = sdf.format(new Date());
		return dt;
	}

	/**
	 * @description 得到当前时间，格式为：yyyyMMdd-HHmmss
	 * @return
	 */
	public static String getNowDateTime2() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmss");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 得到当前时间，格式为：yyyyMMddHHmmss
	 * @return
	 */
	public static String getNowDateTime3() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 得到当前时间，格式为：yyyyMMddHHmmssSSSS
	 * @return
	 */
	public static String getNowDateTime4() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 得到当前日期，格式为：yyyy-MM-dd
	 * @return
	 */
	public static String getNowDate1() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 得到当前日期，格式为：yyyy年MM月dd
	 * @return
	 */
	public static String getNowDate2() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 得到当前日期，格式为：yyyyMMdd
	 * @return
	 */
	public static String getNowDate3() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 得到当前年份，格式为：yyyy
	 * @return
	 */
	public static String getNowYear() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 得到当前月份，格式为：MM
	 * @return
	 */
	public static String getNowMonth() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 得到当前天，格式为：dd
	 * @return
	 */
	public static String getNowDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 得到当前小时，格式为：HH
	 * @return
	 */
	public static String getNowHour() {
		SimpleDateFormat sdf = new SimpleDateFormat("HH");
		String shortdt = sdf.format(new Date());
		return shortdt;
	}

	/**
	 * @description 将给定字符串转为指定格式的时间，转换后格式为：yyyy-MM-dd HH:mm:ss
	 * @param strDateTime
	 *            给定的字符串日期
	 * @return
	 * @throws Exception
	 */
	public static Date getDateTime(String strDateTime) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date strToDateTime = null;
		try {
			strToDateTime = formatter.parse(strDateTime);
		} catch (ParseException e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return strToDateTime;
	}

	/**
	 * @description 将给定字符串转为指定格式的日期，转换后格式为：yyyy-MM-dd
	 * @param strDate
	 *            给定的字符串日期
	 * @return
	 * @throws Exception
	 */
	public static Date getDate1(String strDate) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date strToDate = null;
		try {
			strToDate = formatter.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return strToDate;
	}

	/**
	 * @description 将给定字符串转为指定格式的日期，转换后格式为：yyyy年MM月dd日
	 * @param strDate
	 *            给定的字符串日期
	 * @return
	 * @throws Exception
	 */
	public static Date getDate2(String strDate) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
		Date strToDate = null;
		try {
			strToDate = formatter.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return strToDate;
	}

	/**
	 * @description 将给定字符串转为指定格式的日期，返回字符串形式，转换后格式为：yyyy/MM/dd
	 * @param strDateTime
	 *            给定的字符串日期
	 * @return
	 * @throws Exception
	 */
	public static String getDateByStr1(String strDate) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		String strToDate = null;
		try {
			strToDate = formatter.format(formatter.parse(strDate)).toString();
		} catch (ParseException e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return strToDate;
	}

	/**
	 * @description 将给定字符串转为指定格式的日期，返回字符串形式，转换后格式为：yyyy-MM-dd
	 * @param strDate
	 *            给定的字符串日期
	 * @return
	 * @throws Exception
	 */
	public static String getDateByStr2(String strDate) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String strToDate = null;
		try {
			strToDate = formatter.format(formatter.parse(strDate)).toString();
		} catch (ParseException e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return strToDate;
	}

	/**
	 * @description 将给定字符串转为指定格式的时间，返回字符串形式，转换后格式为：yyyy-MM-dd HH:mm:ss
	 * @param strDateTime
	 *            给定的字符串时间
	 * @return
	 * @throws Exception
	 */
	public static String getDateTimeByStr1(String strDateTime) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strToDateTime = null;
		try {
			strToDateTime = formatter.format(formatter.parse(strDateTime)).toString();
		} catch (ParseException e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return strToDateTime;
	}

	/**
	 * @description 得到当前时间，返回Date，格式为：yyyy-MM-dd HH:mm:ss
	 * @return
	 * @throws Exception
	 */
	public static Date getNowDateTime10() throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(new Date());
		Date nowDate = null;
		try {
			nowDate = formatter.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return nowDate;
	}

	/**
	 * @description 得到当前时间，返回Date，格式为：yyyy-MM-dd
	 * @return
	 * @throws Exception
	 */
	public static Date getNowDate10() throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(new Date());
		Date nowDateShort = null;
		try {
			nowDateShort = formatter.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		return nowDateShort;
	}

	/**
	 * @description 得到2个日期的天数差，strEndDate - strStartDate
	 * @param strStartDate
	 *            ：开始时间
	 * @param strEndDate
	 *            ：结束时间
	 * @return
	 * @throws Exception
	 */
	public static long getDayDifference(String strStartDate, String strEndDate) throws Exception {
		Date d1 = DateTimeUtil.getDate1(strStartDate);
		Date d2 = DateTimeUtil.getDate1(strEndDate);
		long dayNum = (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24);
		return dayNum;
	}

	/**
	 * @description 得到2个日期的天数差，dEndDate - dStartDate
	 * @param dStartDate
	 *            ：开始时间
	 * @param dEndDate
	 *            ：结束时间
	 * @return
	 */
	public static long getDayDifference(Date dStartDate, Date dEndDate) throws Exception {
		long rowe = (dEndDate.getTime() - dStartDate.getTime()) / (1000 * 60 * 60 * 24);
		return rowe;
	}
	
	/**
	 * @description 得到2个日期的分钟差，dEndDate - dStartDate
	 * @param dStartDate
	 *            ：开始时间
	 * @param dEndDate
	 *            ：结束时间
	 * @return
	 */
	public static long getMinuteDifference(Date dStartDate, Date dEndDate) throws Exception {
		long rowe = ((dEndDate.getTime() - dStartDate.getTime()) / (1000 * 60));
		return rowe;
	}

	/**
	 * @description 得到指定日期加上天数后的日期，eg:2013-8-15 + 20 = 2013-09-04
	 * @param strDate
	 *            ：指定日期
	 * @param iDayNum
	 *            ：所加天数
	 * @return
	 * @throws Exception
	 */
	public static String getDateByAddNum(String strDate, int iDayNum) throws Exception {
		Calendar c = Calendar.getInstance();
		c.setTime(DateTimeUtil.getDate1(strDate));
		c.add(Calendar.DATE, iDayNum);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String st = sd.format(c.getTime());
		return st;
	}

	/**
	 * @description 判断第二个日期是否大于第一个日期
	 * @param dateFirst
	 *            ：第一个日期
	 * @param dateSecond
	 *            ：第二个日期
	 * @return
	 * @throws Exception
	 */
	public static Boolean isAfter(Date dateFirst, Date dateSecond) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");

		String strFirst = formatter.format(dateFirst);
		String strSecond = formatter.format(dateSecond);

		Integer iFirst = java.lang.Integer.valueOf(strFirst);
		Integer iSecond = java.lang.Integer.valueOf(strSecond);

		if (iSecond - iFirst > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 
	 * @description 根据出生日期得到年龄
	 * 
	 * @param birthDay
	 * @return
	 * @throws Exception
	 */
	public static int getAge(Date birthDay) throws Exception {
		Calendar cal = Calendar.getInstance();

		if (cal.before(birthDay)) {
			throw new IllegalArgumentException("出生日期大于了当前日期，你是未来人？fuck");
		}
		int yearNow = cal.get(Calendar.YEAR);
		int monthNow = cal.get(Calendar.MONTH);
		int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH);
		cal.setTime(birthDay);

		int yearBirth = cal.get(Calendar.YEAR);
		int monthBirth = cal.get(Calendar.MONTH);
		int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);

		int age = yearNow - yearBirth;

		if (monthNow <= monthBirth) {
			if (monthNow == monthBirth) {
				if (dayOfMonthNow < dayOfMonthBirth)
					age--;
			} else {
				age--;
			}
		}
		return age;
	}

	/**
	 * 
	 * @description 根据日期得到星期几
	 * 
	 * @param pTime
	 * @return
	 * @throws Exception
	 */
	public static Integer dayForWeek(Date pTime) throws Exception {
		if (pTime == null) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(pTime);
		int dayForWeek = 0;
		if (cal.get(Calendar.DAY_OF_WEEK) == 1) {
			dayForWeek = 7;
		} else {
			dayForWeek = cal.get(Calendar.DAY_OF_WEEK) - 1;
		}
		return dayForWeek;
	}

	/**
	 * @description 将未指定格式的日期字符串转化成java.util.Date类型日期对象
	 * 
	 * @param date
	 *            ,待转换的日期字符串
	 * @return
	 * @throws ParseException
	 */
	public static Date parseStringToDate(String date) throws ParseException {
		Date result = null;
		String parse = date;
		if (date != null && date.length() == 4 && parse.indexOf("-") < 0) {
			parse = "yyyy";
		} else if (date != null && date.length() == 8 && parse.indexOf("-") < 0 && parse.indexOf("/") < 0) {
			parse = "yyyyMMdd";
		} else if (date != null && date.length() >= 8 && parse.indexOf("/") > 0) {
			if (date.indexOf("/") == 4) {
				parse = "yyyy/MM/dd";
			} else {
				parse = "MM/dd/yyyy";
			}			
		} else {
			parse = parse.replaceFirst("^[0-9]{4}([^0-9])", "yyyy$1");
			parse = parse.replaceFirst("^[0-9]{2}([^0-9])", "yy$1");
			parse = parse.replaceFirst("([^0-9])[0-9]{1,2}([^0-9])", "$1MM$2");
			parse = parse.replaceFirst("([^0-9])[0-9]{1,2}( ?)", "$1dd$2");
			parse = parse.replaceFirst("( )[0-9]{1,2}([^0-9])", "$1HH$2");
			parse = parse.replaceFirst("([^0-9])[0-9]{1,2}([^0-9])", "$1mm$2");
			parse = parse.replaceFirst("([^0-9])[0-9]{1,2}([^0-9]?)", "$1ss$2");
		}

		DateFormat format = new SimpleDateFormat(parse, Locale.CHINA);
		result = format.parse(date);

		return result;
	}

	public static void main(String[] args) throws Exception {
		System.out.println(dayForWeek(getDate1("2015-06-14")));
		System.out.println(format("yyyy-MM-dd", parseStringToDate("20070506")));
		System.out.println(format("yyyy-MM-dd HH:mm:ss", parseStringToDate("2014-10-27")));
		
		System.out.println(getMinuteDifference(getDateTime("2015-06-12 10:50:50"), getDateTime("2015-06-15 12:59:50")));
	}
}
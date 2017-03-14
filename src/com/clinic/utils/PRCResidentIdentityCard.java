package com.clinic.utils;

import java.util.Calendar;

/**
 * @description 身份证号码验证工具类
 * @version 20140822
 */
public final class PRCResidentIdentityCard {
	private static final int[] wi = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1};
	private static final int[] valideCode = {1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2};
	
	/**
	 * @description 验证身份证号码是否有效，支持15位和18位身份证号验证
	 * @param strID：身份证号码
	 * @return 有效-true，无效-false
	 */
	public static boolean validatePRCRIDCard(String strID) throws Exception {
		if (strID == null || (strID = strID.replaceAll(" ", "")) == "") {
			return false;
		}

		if (strID.length() == 15) {
			return validate15IDBrithday(strID);
		} else if (strID.length() == 18) {
			char[] arrIDCard = strID.toCharArray();// 得到身份证数组
			if (validate18IDBrithday(strID) && validate18IDLastCode(arrIDCard)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	/**
	 * @description 通过身份证判断是男是女
	 * @param strID：15/18位身份证号码
	 * @return 'female'-女、'male'、null-不是中国公民身份证
	 */
	public static String getSexyByPRCRID(String strID) throws Exception {
		strID = strID.replaceAll(" ", "");// 对身份证号码做处理。包括字符间有空格。
		
		if (strID.length() == 15) {
			if (Integer.parseInt(strID.substring(14, 15)) % 2 == 0) {
				return "female";
			} else {
				return "male";
			}
		} else if (strID.length() == 18) {
			if (Integer.parseInt(strID.substring(14, 17)) % 2 == 0) {
				return "female";
			} else {
				return "male";
			}
		} else {
			return null;
		}
	}
	
	/**	
	 * @description 判断身份证号码为18位时最后的验证位是否正确
	 * @param arrIDCard：身份证号码数组
	 * @return 正确-true，错误-false
	 */
	private static boolean validate18IDLastCode(char[] arrIDCard) throws Exception {
		int sum = 0; // 声明加权求和变量
		
		if (String.valueOf(arrIDCard[17]).equalsIgnoreCase("x")) {
			arrIDCard[17] = 10;// 将最后位为x的验证码替换为10方便后续操作
		}
		
		for (int i = 0; i < 17; i++) {
			sum += wi[i] * Integer.parseInt(String.valueOf(arrIDCard[i]));// 加权求和
		}
		
		int valCodePosition = sum % 11;// 得到验证码所位置
		
		if (Integer.parseInt(String.valueOf(arrIDCard[17])) == valideCode[valCodePosition]) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * @description 验证18位数身份证号码中的生日是否是有效生日
	 * @param strID 18位书身份证字符串
	 * @return 有效-true，无效-false
	 */
	private static boolean validate18IDBrithday(String strID) throws Exception {
		String year =  strID.substring(6,10);
		String month = strID.substring(10,12);
		String day = strID.substring(12,14);  
		
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
			if (calendar.get(Calendar.YEAR) != Integer.parseInt(year) || calendar.get(Calendar.MONTH) != Integer.parseInt(month) - 1 || calendar.get(Calendar.DAY_OF_MONTH) != Integer.parseInt(day)) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * @description 验证15位数身份证号码中的生日是否是有效生日
	 * @param strID：15位数身份证字符串
	 * @return 有效-true，无效-false
	 */
	private static boolean validate15IDBrithday(String strID) throws Exception {
	    String year =  strID.substring(6,8);
	    String month = strID.substring(8,10);
	    String day = strID.substring(10,12);
	    
		try {
			Calendar calendar = Calendar.getInstance();
			calendar.set(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
			// 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法
			if (calendar.get(Calendar.YEAR) != Integer.parseInt(year) || calendar.get(Calendar.MONTH) != Integer.parseInt(month) - 1 || calendar.get(Calendar.DAY_OF_MONTH) != Integer.parseInt(day)) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
package com.clinic.utils;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

/**
 * @description 加载系统配置文件
 * @version 20140822
 */
public class LoadSystemConfig {

	private static Properties properties = new Properties();

	static {
		try {
			properties.load(LoadSystemConfig.class.getClassLoader().getResourceAsStream("systemConfig.properties"));
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	/**
	 * @description 根据key获取系统配置
	 * @param key
	 * @return
	 */
	public static String getSysConfig(String key) {
		return (String) properties.get(key);
	}

	/**
	 * @description 可动态根据占位符配置参数，来获取国际化字符串
	 * @param key
	 * @param params：参数Object[]，对应字符串字符串中的占位符{0}{1}
	 * @return
	 */
	public static String getSysConfig(String key, Object[] params) {
		String msg = (String) properties.get(key);
		return MessageFormat.format(msg, params);
	}

}
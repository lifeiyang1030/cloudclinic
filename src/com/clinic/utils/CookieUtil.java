package com.clinic.utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @description 操作Cookie的公共方法
 * @version 20140822
 */
public class CookieUtil {

	/**
	 * @description 添加cookie
	 * @param response：response对象
	 * @param strCookieName：cookie的名称
	 * @param strValue：cookie的值
	 * @param iValid：
	 *            cookie的有效期(以秒为单位,假如存放三天,即3*24*60*60;
	 *            如果值为0,cookie将随浏览器关闭而清除,eg:CookieUtil.addCookie(response,
	 *            "userName", "", 0);)
	 */
	public static void addCookie(HttpServletResponse response, String strCookieName, String strValue, int iValid) {
		try {
			Cookie cookie = new Cookie(strCookieName, strValue);
			cookie.setPath("/");
			if (iValid > 0) {
				cookie.setMaxAge(iValid);
			}
			response.addCookie(cookie);
		} catch (Exception ex) {

		}
	}

	/**
	 * @description 获取cookie的值
	 * @param request：request对象
	 * @param strCookieName：cookie的名称
	 * @return
	 */
	public static String getCookieByName(HttpServletRequest request, String strCookieName) {
		try {
			Map<String, Cookie> cookieMap = CookieUtil.readCookieMap(request);
			if (cookieMap.containsKey(strCookieName)) {
				Cookie cookie = cookieMap.get(strCookieName);
				return cookie.getValue();
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

	private static Map<String, Cookie> readCookieMap(HttpServletRequest request) throws Exception {
		Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
		return cookieMap;
	}
}
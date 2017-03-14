package com.clinic.interceptor;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.clinic.commons.BeanConst;

/**
 * @description springMVC拦截器
 * 
 * @author Jxl
 * @date 2015年5月27日
 * @time 下午2:59:31
 * 
 */
public class InterceptorMVC implements HandlerInterceptor {
	private static final Logger LOGGER = Logger.getLogger(InterceptorMVC.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("user");

		if (map == null && "11".equals("22")) {
			if (!((request.getHeader("accept") != null && request.getHeader("accept").indexOf("application/json") > -1) || (request.getHeader("X-Requested-With") != null && request.getHeader(
					"X-Requested-With").indexOf("XMLHttpRequest") > -1))) {
				// 如果不是ajax方式请求 返回错误到指定页面
				String path = request.getContextPath();
				String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
				response.sendRedirect(basePath + "user/login_timeover");
				LOGGER.info("同步请求超时");
			} else {
				PrintWriter writer = response.getWriter();
				String str = BeanConst.TIME_OVER;
				writer.write(str);
				LOGGER.info("异步请求超时");
			}

			//return false;
			return true;
		} else {
			return true;
		}

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	}

	/**
	 * 该方法也是需要当前对应的Interceptor的preHandle方法的返回值为true时才会执行。该方法将在整个请求完成之后， 也就是DispatcherServlet渲染了视图执行，
	 * 这个方法的主要作用是用于清理资源的，当然这个方法也只能在当前这个Interceptor的preHandle方法的返回值为true时才会执行。
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// TODO Auto-generated method stub

	}

}

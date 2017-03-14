package com.clinic.exception;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.clinic.commons.BeanConst;

/**
 * @description spring的总错误异常处理
 * 
 * @author Jxl
 * @date 2015年5月27日
 * @time 下午3:02:27
 * 
 */
public class CustomExceptionResolver extends SimpleMappingExceptionResolver {

	private static final Logger LOGGER = Logger.getLogger(CustomExceptionResolver.class);

	@Override
	protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		LOGGER.error("控制层异常总处理", ex);
		ex.printStackTrace();
		String strViewName = determineViewName(ex, request);
		LOGGER.info("ViewName:" + strViewName);

		if (strViewName != null) {
			if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request.getHeader("X-Requested-With") != null && request.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {
				LOGGER.info("同步请求出现异常");
				// 如果不是ajax方式请求 返回错误到指定页面
				Integer iStatusCode = determineStatusCode(request, strViewName);
				if (iStatusCode != null) {
					applyStatusCodeIfPossible(request, response, iStatusCode);
				}
				return getModelAndView(strViewName, ex, request);
			} else {
				LOGGER.info("异步请求出现异常");
				try {
					// 如果是ajax方式请求 JSON格式返回
					PrintWriter pw = response.getWriter();
					pw.write(BeanConst.DEFAULT_ERROR_MSG_JSON);
					pw.flush();
				} catch (IOException e) {
					e.printStackTrace();
					LOGGER.error("控制层发送异常返回JSON出错", e);
				}
				return null;
			}
		} else {
			LOGGER.info("控制层发生异常时未找到响应视图");
			return null;
		}
	}
}

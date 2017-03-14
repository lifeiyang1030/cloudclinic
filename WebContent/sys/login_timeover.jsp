<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/resources/common/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <base href="<%=basePath%>" />
   <jsp:include page="/resources/common/headpage.jsp" />
   <script type="text/javascript">
		$(function() {
			alert("由于您长时间未有任何操作，已经被系统自动退出，请重新登录。");
			if(window.top == window.self)
			{
				window.location.href = "<%=basePath%>user/login";
			}
			else
			{
				window.parent.window.location.href = "<%=basePath%>user/login";
			}
		});
   </script>
</head>
<body>
</body>
</html>
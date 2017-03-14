<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body onload="window.location='${basePath}user/login'">
	<center><span id="spNoJS" style="font-size:12px; color:Red;">您的浏览器不支持javascript功能，无法使用本系统！</span></center>
</body>
</html>
<script language="javascript" type="text/javascript">
	document.getElementById("spNoJS").style.display = "none";
</script>
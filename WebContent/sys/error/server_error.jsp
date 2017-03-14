<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>" />
    <jsp:include page="/resources/common/headpage.jsp" />
</head>
<body>
	<div style="width:100%;">
		<div style="width:1000px;height:430px;margin:0px auto;">
	            <div style="width:480px;height:128px;position:relative;left:313px;top:100px;"><span style="font-family:'微软雅黑','黑体','幼圆','宋体';font-size:18px;color:#4d4c4c;line-height:52px;">起得比鸡早，睡得比狗晚，加班越来越多，压力越来越重，工资越来越少！服务器他<span style="font-size:56px;font-weight:900;color:#21dfdf;">暴</span><span style="font-size:48px;font-weight:700;color:#ff36cd;">走</span>了，请您稍等一下。</span></div><div style="width:128px;height:128px;position:relative;left:185px;top:-28px;background:url(resources/images/common/express.png) no-repeat -256px 0px;"></div>
		</div>
	</div>
</body>
</html>
<script language="javascript" type="text/javascript">
	$(document).ready(function (){
		window.parent.CloseDialogMsg();
	});
</script>
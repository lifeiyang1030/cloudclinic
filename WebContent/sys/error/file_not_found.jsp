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
            <div style="width:480px;height:128px;position:relative;left:313px;top:100px;"><span style="font-family:'微软雅黑','黑体','幼圆','宋体';font-size:18px;color:#4d4c4c;line-height:52px;"><span style="font-size:32px;font-weight:500;color:#ff9b04;">抱</span><span style="font-size:48px;font-weight:900;color:#65bc10;">歉</span>，您<span style="font-size:56px;font-weight:900;color:#21dfdf;">要</span><span style="font-size:48px;font-weight:700;color:#ff36cd;">找</span>的页面已停止服务,欢迎您<span style="font-size:36px;font-weight:600;color:#ce9b07;">浏</span><span style="font-size:48px;font-weight:800;color:#c197bf;">览</span>其它页面。</span></div><div style="width:128px;height:128px;position:relative;left:185px;top:-28px;background:url(resources/images/common/express.png) no-repeat -384px 0px;"></div>
        </div>
    </div>
</body>
</html>
<script language="javascript" type="text/javascript">
	$(document).ready(function (){
		window.parent.CloseDialogMsg();
	});
</script>
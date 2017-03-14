<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/resources/common/taglibs.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>" />
    <jsp:include page="/resources/common/headpage.jsp" />
    <link rel="stylesheet" href="resources/css/base.css?v=2a63ade673"></link>
	<script language="javascript" type="text/javascript">
    	var strAPath= "<%=basePath%>";
	</script>
    <style type="text/css">
    	.divMenu {text-align:center; padding:8px;}
    	.aMenuItem{font-size:14px; line-height:30px;}
    </style>
</head>
<body>

	<div id="w" class="easyui-window" title="智慧云诊室 - 岛琴诊所" data-options="minimizable:false,closable:false,resizable:false,maximizable:false" style="width:400px; height: 260px;">
	    <div id="loginPanel" class="easyui-panel" title="" data-options="border:false,href:'sys/login/login_info.jsp'" style="width:100%;height: 100%;  text-align: center;">
	    </div>
    </div>
 
    <script>
        function submitForm(){
            //$('#ff').form('submit');
        }
    </script>

</body>
</html>
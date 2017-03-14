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
    	/**
    	html 
		{ 
			overflow: hidden; 
		} 
		body 
		{ 
			overflow: hidden; 
		} **/
    </style>
</head>
<body>

	<jsp:include page="/resources/common/navigate.jsp" />
	
	<div id="tab" class="easyui-tabs" data-options="tabPosition:'left',tabHeight:50, plain:false,narrow:true,border:false"style="width:100%;height: 90%; margin-bottom: -65px">
		<div title="药品信息管理"  data-options="href:'sys/yaopin/yaopin_message.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
		<div title="药品入库"  data-options="href:'sys/yaopin/yaopin_in.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
		<div title="库存管理"  data-options="href:'sys/yaopin/yaopin_stock.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
		<div title="库存预警"  data-options="href:'sys/yaopin/yaopin_warn.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
		<div title="入库日志查询"  data-options="href:'sys/yaopin/yaopin_in_log.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
	</div>
</body>
</html>
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
    	.dialog-button { text-align: center; }
    </style>
</head>
<body>
	<div>
		<jsp:include page="/resources/common/navigate.jsp" />
	</div>
	
	<div id="tab" class="easyui-tabs" data-options="tabPosition:'left',tabHeight:50, plain:false,narrow:true,border:false"style="width:100%;height: 90%; margin-bottom: -65px">
		<div title="门诊病例"  data-options="href:'sys/menzhen/menzhen_add.jsp'" style="padding: 0px 10px 65px 10px;" >
		</div>
		<div title="患者列表"  data-options="href:'sys/menzhen/menzhen_patient.jsp'" style="padding: 0px 10px 65px 10px;" >
		</div>
	</div>
</body>


	
	
</html>
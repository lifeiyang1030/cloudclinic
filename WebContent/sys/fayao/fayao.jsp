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
    	/*
    	用于把easyUI的输入框文本颜色改为红色，注意如果调整了input需要更改下面的input13，input14
    	*/
    	input#_easyui_textbox_input13.textbox-text.validatebox-text{color: red;}
    	input#_easyui_textbox_input13.textbox-text.validatebox-text.textbox-prompt{color: red;}
    	input#_easyui_textbox_input14.textbox-text.validatebox-text{color: red;}
    	input#_easyui_textbox_input14.textbox-text.validatebox-text.textbox-prompt{color: red;}
    </style>
</head>
<body>

    <jsp:include page="/resources/common/navigate.jsp" />
        
	<div id="tab" class="easyui-tabs" data-options="tabPosition:'left',tabHeight:50, plain:false,narrow:true,border:false"style="width:100%;height: 90%; margin-bottom: -65px">
		<div title="直接售药"  data-options="href:'sys/fayao/fayao_zjsy.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
		<div title="待发药"  data-options="href:'sys/fayao/fayao_dfy.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
		<div title="带退药"  data-options="href:'sys/fayao/fayao_dty.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
		<div title="预发药"  data-options="href:'sys/fayao/fayao_yfy.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
		<div title="发药历史"  data-options="href:'sys/fayao/fayao_fyls.jsp'" style="padding: 10px 10px 65px 10px;" >
		</div>
	</div>
</body>
</html>
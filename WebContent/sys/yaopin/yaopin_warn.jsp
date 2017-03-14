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
	<script language="javascript" type="text/javascript" src="resources/javascript/main/mainpage.js"></script>
	<script language="javascript" type="text/javascript">
    	var strAPath= "<%=basePath%>";
	</script>
    <style type="text/css">
    	.divMenu {text-align:center; padding:8px;}
    	.aMenuItem{font-size:14px; line-height:30px;}
    </style>
</head>
<body>
 	<form id="warn_form" method="post">
		<div style="margin-bottom: 13px">
			<select class="easyui-combobox" name="language" label="药品分类：" data-options="labelAlign:'right'" style="width:150px;text-align: left;">
               	<option value="ar">全部</option>
               	<option value="bg">饮片</option>
               	<option value="ca">中成药</option>
             </select>
		</div>
	</form>

	<table id="warn_list" class="easyui-datagrid" style="width: 99%"
		data-options="singleSelect:true" url="guahao/list" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="status" width="25%">药品名称</th>
				<th field="name" width="10%">药品分类</th>
				<th field="sex" width="20%">规格</th>
				<th field="doctors" width="25%">生产厂家</th>
				<th field="dept" width="10%">库存</th>
				<th field="age" width="10%">库存阈值</th>
			</tr>
		</thead>
	</table>

</body>
</html>
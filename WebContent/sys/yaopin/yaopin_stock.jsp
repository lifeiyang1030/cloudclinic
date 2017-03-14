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
  
	<form id="stock_form" method="post">
		<div style="margin-bottom: 13px">
			<input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'药品名称/商品名', labelAlign:'right', label:'药品检索：'" />
			<input class="easyui-textbox" name="name" style="width: 200px" data-options="prompt:'生产批号', labelAlign:'right', label:'生产批号：'" />
			<select class="easyui-combobox" name="language" label="药品分类：" data-options="labelAlign:'right'" style="width:150px;text-align: left;">
               	<option value="ar">全部</option>
               	<option value="bg">饮片</option>
               	<option value="ca">中成药</option>
             </select>
             &nbsp;
             <input class="easyui-switchbutton" data-options="onText:'包含空库存',offText:'排除空库存'" style="width: 100px;" />
             &nbsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width: 80px">查询</a>&nbsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width: 80px">导出</a>&nbsp;
		</div>
	</form>

	<table id="stock_list" class="easyui-datagrid" style="width: 99%"
		data-options="singleSelect:true" url="guahao/list" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="status" width="10%">药品名称</th>
				<th field="name" width="10%">药品分类</th>
				<th field="sex" width="10%">规格</th>
				<th field="age" width="10%">生产厂家</th>
				<th field="dept" width="10%">供货商</th>
				<th field="doctors" width="10%">批号</th>
				<th field="age" width="10%">进货价</th>
				<th field="age" width="10%">处方价</th>
				<th field="age" width="10%">批次库存</th>
				<th field="userId" data-options="formatter:formatCZ"  width="10%">操作</th>
			</tr>
		</thead>
	</table>
	
	<script>
 
	 $('#stock_list').datagrid({
	 	onLoadSuccess:function(data){  
	         $('.stockModClass').linkbutton({text:'编辑',plain:true});  
	     }  
	 });
	 function formatCZ(val,row){
		 var cz = "<a href=\"javascript:void(0)\" onclick=\"modStock('" + val + "')\"  class=\"stockModClass\" style=\"width:40px;height:20px;color: #3d76b9;\"></a>";
	 	return cz;
	 }
	 function modStock(userId) {
		 var tab = $('#tab').tabs('getSelected'); 
		 tab.panel('refresh', 'sys/yaopin/yaopin_stock_mod.jsp');
	 }
	 </script>

</body>
</html>
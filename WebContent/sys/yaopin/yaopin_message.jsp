<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/resources/common/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<jsp:include page="/resources/common/headpage.jsp" />
<link rel="stylesheet" href="resources/css/base.css?v=2a63ade673"></link>
<script language="javascript" type="text/javascript"
	src="resources/javascript/main/mainpage.js"></script>
<script language="javascript" type="text/javascript">
    	var strAPath= "<%=basePath%>";
</script>
<style type="text/css">
.divMenu {
	text-align: center;
	padding: 8px;
}

.aMenuItem {
	font-size: 14px;
	line-height: 30px;
}
</style>
</head>
<body>

	<form id="message_form" method="post">
		<div style="margin-bottom: 13px">
			<input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'名称/厂家/条码', labelAlign:'right', label:'药品检索：'" />
			<select class="easyui-combobox" name="language" label="药品分类：" data-options="labelAlign:'right'" style="width:150px;text-align: left;">
               	<option value="ar">全部</option>
               	<option value="bg">饮片</option>
               	<option value="ca">中成药</option>
             </select>
             <select class="easyui-combobox" name="language" label="药品状态：" data-options="labelAlign:'right'" style="width:150px;text-align: left;">
             	<option value="ar">全部</option>
             	<option value="bg">启用</option>
             	<option value="ca">停用</option>
             </select>&nbsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width: 80px">查询</a>&nbsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addYaopin();" style="width: 80px">新增</a>&nbsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width: 80px">导入</a>&nbsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width: 80px">导出</a>&nbsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width: 80px">下载模板</a>&nbsp;
		</div>
	</form>

	<table id="message_list" class="easyui-datagrid" style="width: 99%;"
		data-options="singleSelect:true" url="guahao/list" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="status" width="15%">药品名称</th>
				<th field="name" width="10%">药品分类</th>
				<th field="sex" width="10%">规格</th>
				<th field="age" width="18%">生产厂家</th>
				<th field="dept" width="10%">处方价</th>
				<th field="doctors" width="10%">总库存</th>
				<th field="createName" width="10%">库存阈值</th>
				<th field="userId" data-options="formatter:formatCZ"  width="18%">操作</th>
			</tr>
		</thead>
	</table>
	
	<script>
 	
	 function addYaopin() {
		 var tab = $('#tab').tabs('getSelected'); 
		 tab.panel('refresh', 'sys/yaopin/yaopin_add.jsp');
	 }
	
	 $('#message_list').datagrid({
	 	onLoadSuccess:function(data){  
	         $('.messageModClass').linkbutton({text:'编辑',plain:true});  
	         $('.messageDelClass').linkbutton({text:'删除',plain:true});  
	     }  
	 });
	 function formatCZ(val,row){
		 var cz = "<a href=\"javascript:void(0)\" class=\"messageModClass\" onclick=\"modYaopin('" + val + "')\" style=\"width:40px;height:20px;color: #3d76b9;\"></a>" + 
		 		  "<a href=\"javascript:void(0)\" class=\"messageDelClass\" onclick=\"delYaopin('" + val + "')\" style=\"width:40px;height:20px;color: #3d76b9;\"></a>";
	 	return cz;
	 }
	 
	 function modYaopin() {
		 var tab = $('#tab').tabs('getSelected'); 
		 tab.panel('refresh', 'sys/yaopin/yaopin_mod.jsp');
	 }
	 
	 function delYaopin(val){
	 	$.messager.confirm('删除', '你确定要删除该条数据吗？', function(r){
	         if (r){
	             alert('OK');
	         }
	     });
	 }
	 </script>
	 
</body>


</html>
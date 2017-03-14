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
    <form id="user_form" method="post">
		<div style="margin-bottom: 13px">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addUser()" style="width: 80px">新建账号</a>&nbsp;
		</div>
	</form>

	<table id="user_list" class="easyui-datagrid" style="width: 99%"
		data-options="singleSelect:true" url="guahao/list" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="status" width="10%">登录账号</th>
				<th field="name" width="10%">真实姓名</th>
				<th field="sex" width="5%">性别</th>
				<th field="age" width="10%">电话</th>
				<th field="dept" width="5%">状态</th>
				<th field="doctors" width="10%">科室</th>
				<th field="sex" width="5%">挂号</th>
				<th field="sex" width="5%">门诊</th>
				<th field="sex" width="5%">收费</th>
				<th field="sex" width="5%">发药</th>
				<th field="sex" width="5%">药品管理</th>
				<th field="sex" width="5%">诊所管理</th>
				<th field="userId" data-options="formatter:formatUser"  width="15%">操作</th>
			</tr>
		</thead>
	</table>
	
	<script>
 	
	 function addUser() {
		 var tab = $('#tab').tabs('getSelected'); 
		 tab.panel('refresh', 'sys/xitongguanli/xitong_user_add.jsp');
	 }
	
	 $('#user_list').datagrid({
	 	onLoadSuccess:function(data){  
	         $('.userModClass').linkbutton({text:'编辑',plain:true});  
	         $('.userDelClass').linkbutton({text:'删除',plain:true});  
	     }  
	 });
	 function formatUser(val,row){
		 var cz = "<a href=\"javascript:void(0)\" class=\"userModClass\" onclick=\"modUserData('" + val + "')\" style=\"width:40px;height:20px;color: #3d76b9;\"></a>" + 
		 		  "<a href=\"javascript:void(0)\" class=\"userDelClass\" onclick=\"delUserData('" + val + "')\" style=\"width:40px;height:20px;color: #3d76b9;\"></a>";
	 	return cz;
	 }
	 
	 function delUserData(val){
	 	$.messager.confirm('删除', '你确定要删除该条数据吗？', function(r){
	         if (r){
	             alert('OK');
	         }
	     });
	 }
	 function modUserData(val){
		 var tab = $('#tab').tabs('getSelected'); 
		 tab.panel('refresh', 'sys/xitongguanli/xitong_user_add.jsp');
	 }
	 </script>

</body>
</html>
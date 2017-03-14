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
		<div style="margin-top: 5px;margin-left: 40px;">姓名：<input class="easyui-textbox" name="dtf_name" style="width: 150px;"/>
			<a id="dtf_search" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		</div>
		<div style="margin-top: 15px;margin-left: 20px;">
			<table id="dtf_list" class="easyui-datagrid" style="width: 99%"
			data-options="singleSelect:true" url="feiyong/list" rownumbers="true" pagination="true">
				<thead>
					<tr>
						<th field="name">姓名</th>
						<th field="sex">性别</th>
						<th field="age">年龄</th>
						<th field="orderdoctor" >开单医生</th>
						<th field="jiuzhentime">就诊日期</th>
						<th field="total">应退金额</th>
						<th field="caozuo" data-options="formatter:dtf_cz" style="width: 40px;">操作</th>
					</tr>
				</thead>
			</table>
		</div>
		<script>
			$('#dtf_list').datagrid({
			 	onLoadSuccess:function(data){  
			         $('.dtf_modClass').linkbutton({text:'退费',plain:true});  
			     }  
			 });
			function dtf_tf() {
				 var tab = $('#tab').tabs('getSelected'); 
				 tab.panel('refresh', 'sys/feiyong/feiyong_dtf_tf.jsp');
			 }
			function dtf_cz(val,row){
	    		var cz = "<a href=\"javascript:void(0)\" class=\"dtf_modClass\" style=\"width:40px;height:20px;color: #3d76b9;\" onclick=\"dtf_tf()\"></a>";
	    		return cz;
	    	}
		</script>
	</body>
</html>
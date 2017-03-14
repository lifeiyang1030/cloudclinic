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
		<div style="margin-top: 5px;margin-left: 40px;">姓名：<input class="easyui-textbox" name="dsf_name" style="width: 150px;"/>
			<a id="dsf_search" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		</div>
		<div style="margin-top: 15px;margin-left: 20px;">
			<table id="dsf_list" class="easyui-datagrid" style="width: 99%"
			data-options="singleSelect:true" url="feiyong/list" rownumbers="true" pagination="true">
				<thead>
					<tr>
						<th field="name" width="10%">姓名</th>
						<th field="sex" width="5%">性别</th>
						<th field="age" width="5%">年龄</th>
						<th field="orderdoctor" width="10%">开单医生</th>
						<th field="jiuzhentime" width="20%">就诊时间</th>
						<th field="total" width="20%">总金额</th>
						<th field="ysmoney" width="28%">应收金额</th>
						<th field="caozuo" data-options="formatter:dsf_cz" width="3%">操作</th>
					</tr>
				</thead>
			</table>
		</div>
		<script>
			$('#dsf_list').datagrid({
			 	onLoadSuccess:function(data){  
			         $('.dsf_modClass').linkbutton({text:'收费',plain:true});  
			     }  
			 });
			function dsf_sf() {
				 var tab = $('#tab').tabs('getSelected'); 
				 tab.panel('refresh', 'sys/feiyong/feiyong_dsf_sf.jsp');
			 }
			function dsf_cz(val,row){
	    		var cz = "<a href=\"javascript:void(0)\" class=\"dsf_modClass\" style=\"width:40px;height:20px;color: #3d76b9;\" onclick=\"dsf_sf()\"></a>";
	    		return cz;
	    	}
		</script>
	</body>
</html>
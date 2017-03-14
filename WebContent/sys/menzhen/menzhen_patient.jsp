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
	    <form id="ff" method="post">
            <div style="margin-bottom:13px; padding-top: 13px;">
                <input class="easyui-textbox" name="name" style="width:400px" data-options="prompt:'患者姓名、电话', labelAlign:'right', label:'患者姓名：'"/>&nbsp;&nbsp;
                &nbsp;&nbsp;
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">搜索</a>
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addPatient()" style="width:80px">新增患者</a>
            </div>
        </form>
         
        <table id="menzhen_list" class="easyui-datagrid" style="width: 99%"
        		data-options="singleSelect:true"
	            url="guahao/list"
	            rownumbers="true" pagination="true">
	        <thead>
	            <tr>
	                <th field="name"  width="10%">姓名</th>
	                <th field="sex"  width="10%">性别</th>
	                <th field="age"  width="10%">年龄</th>
	                <th field="createTime" width="20%">诊断时间</th>
	                <th field="doctors" width="40%">诊断</th>
	                <th field="userId" data-options="formatter:formatMenzhen"  width="10%">操作</th>
	            </tr>
	        </thead>
	    </table>
	    <script>
	
	 $('#menzhen_list').datagrid({
	 	onLoadSuccess:function(data){  
	         $('.menzhenModClass').linkbutton({text:'修改病例',plain:true});  
	     }  
	 });
	 function formatMenzhen(val,row){
		 var cz = "<a href=\"javascript:void(0)\" class=\"menzhenModClass\" onclick=\"modMenzhen('" + val + "')\" style=\"width:60px;height:20px;color: #3d76b9;\"></a>"; 
	 	return cz;
	 }
	 function modMenzhen(userId) {
		 //$('#tab').children("div").first().empty();
		 //$("#tab_panel1").empty();
		 var tab = $('#tab').tabs('getSelected'); 
		 tab.panel('refresh', 'sys/menzhen/menzhen_mod.jsp');
	 }
	 function addPatient() {
		 backURL = 'sys/menzhen/menzhen_patient.jsp';
		 var tab = $('#tab').tabs('getSelected'); 
		 tab.panel('refresh', "sys/guahao/guahao_add.jsp");
	 }
	 </script> 
</body>
</html>
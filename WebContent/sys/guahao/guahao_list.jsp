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
            <div style="margin-bottom:13px;">
                <input class="easyui-textbox" name="name" style="width:200px" data-options="labelAlign:'right', label:'患者姓名：'"/>&nbsp;
                <select class="easyui-combobox" name="language" label="医生姓名：" data-options="labelAlign:'right'" style="width:150px;text-align: left;">
                	<option value="ar">张三</option>
                	<option value="bg">李四</option>
                	<option value="ca">王五</option>
                </select>&nbsp;
                <input class="easyui-datetimebox" name="guhaoshijian" label="挂号时间：" data-options="labelAlign:'right'" value="3/4/2010 2:3" style="width:224px">
                </input>
                <select class="easyui-combobox" name="language" label="状态：" data-options="labelAlign:'right'" style="width:150px;text-align: left;">
                	<option value="ar">全部</option>
                	<option value="bg">待诊</option>
                	<option value="ca">接诊中</option>
                </select>
                &nbsp;
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">查询</a>&nbsp;
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="newguahao()" style="width:80px">新增挂号</a>
            </div>
        </form>
    	
    	<table id="guahao_list" class="easyui-datagrid" style="width: 99%"
        		data-options="singleSelect:true"
	            url="guahao/list"
	            rownumbers="false" pagination="true">
	        <thead>
	            <tr>
	           		<th field="status">就诊流水号</th>
	                <th field="status" width="5%" >状态</th>
	                <th field="name"  width="10%">姓名</th>
	                <th field="sex"  width="5%">性别</th>
	                <th field="age"  width="5%">年龄</th>
	                <th field="dept"  width="10%">科室</th>
	                <th field="doctors"  width="10%">医生</th>
	                <th field="createName"  width="15%">挂号员</th>
	                <th field="createTime"  width="19%">挂号时间</th>
	                <th field="caozuo" data-options="formatter:guhao_list_cz" width="19%">操作</th>
	            </tr>
	        </thead>
	    </table>
	    <script>
		    $('#guahao_list').datagrid({
			 	onLoadSuccess:function(data){  
			         $('.guhao_list_modClass').linkbutton({text:'详细信息',plain:true});  
			     }  
			 });
	    	function newguahao(){
				 $('#tab').tabs('select', '新增挂号');
	    	}
	    	function guhao_list_cz(val,row){
	    		var cz = "<a href=\"javascript:void(0)\" class=\"guhao_list_modClass\" style=\"width:60px;height:20px;color: #3d76b9;\" onclick=\"newguahao()\"></a>";
	    		return cz;
	    	}
	    </script>
</body>
</html>
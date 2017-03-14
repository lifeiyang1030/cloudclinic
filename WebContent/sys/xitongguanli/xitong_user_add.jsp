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
    <style type="text/css">
    	.divMenu {text-align:center; padding:8px;}
    	.aMenuItem{font-size:14px; line-height:30px;}
    </style>
</head>
<body>
		<div class="easyui-panel" title="" style="width:100%; height:auto;" data-options="border:false">
            <header style="height:40px;margin-top:-10px; z-index:99; background:white; position:absolute;bottom:auto; top:expression(eval(document.documentElement.scrollTop));">
            	<div style="margin-top:10px;">
            		<span style="font-size: 18px; margin-right: 20px; " >新建账号</span>
		            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="submitForm()" style="width: 80px;color: #3d76b9;">保存</a>&nbsp;|
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="backUserList();" style="width: 80px;color: #3d76b9;">取消</a>&nbsp;
				</div>
            </header>
            <div style="padding-top: 45px;">
          		<div style="margin-top: 10px;">
          			<input class="easyui-textbox" name="name" style="width: 500px" data-options="prompt:'', labelAlign:'right', label:'登录账号：'" />
          		</div>
          		<div style="margin-top: 10px;">
          			<input class="easyui-textbox" name="name" style="width: 500px" data-options="prompt:'', labelAlign:'right', label:'登录密码：'" />
          		</div>
          		<div style="margin-top: 10px;">
          			<input class="easyui-textbox" name="name" style="width: 500px" data-options="prompt:'', labelAlign:'right', label:'真实姓名：'" />
          		</div>
            	<div style="margin-top: 10px; padding-left: 45px;">
          			性别：&nbsp;<input class="easyui-switchbutton" data-options="onText:'男',offText:'女'" style="width: 60px;" />
          		</div>
          		<div style="margin-top: 10px;">
          			<input class="easyui-textbox" name="name" style="width: 500px" data-options="prompt:'', labelAlign:'right', label:'手机：'" />
          		</div>
          		<div style="margin-top: 10px;">
          			<input class="easyui-textbox" name="name" style="width: 500px" data-options="prompt:'', labelAlign:'right', label:'邮箱：'" />
          		</div>
          		<div style="margin-top: 10px;">
          			<select class="easyui-combobox" name="language" label="科室：" data-options="labelAlign:'right'" style="width:200px;text-align: left;">
			               	<option value="ar">全科</option>
			               	<option value="bg">内科</option>
			               	<option value="ca">外科</option>
		            </select>
          		</div>
          		<div style="margin-top: 10px; padding-left: 45px;">
          			权限：&nbsp; 
          			<label><input name="Fruit" type="radio" value="" />&nbsp; 挂号 </label>&nbsp;&nbsp;&nbsp;    
					<label><input name="Fruit" type="radio" value="" />&nbsp; 门诊 </label>&nbsp;&nbsp;&nbsp;  
					<label><input name="Fruit" type="radio" value="" />&nbsp; 收费 </label>&nbsp;&nbsp;&nbsp;  
					<label><input name="Fruit" type="radio" value="" />&nbsp; 发药 </label>&nbsp;&nbsp;&nbsp; 
					<label><input name="Fruit" type="radio" value="" />&nbsp; 药品管理</label>&nbsp;&nbsp;&nbsp;  
					<label><input name="Fruit" type="radio" value="" />&nbsp; 诊所管理</label>&nbsp;&nbsp;&nbsp; 
          		</div>
            	<div style="margin-top: 10px; padding-left: 20px;">
          			保密设置：&nbsp;<input class="easyui-switchbutton" data-options="onText:'是',offText:'否'" style="width: 60px;" />
          			 注：查看诊所全部患者及处方信息
          		</div>
          		<div style="margin-top: 10px; padding-left: 45px;">
          			状态：&nbsp;<input class="easyui-switchbutton" data-options="onText:'启用',offText:'禁用'" style="width: 60px;" />
          		</div>
          		
            </div>
   	    </div>
 
	<script language="javascript" type="text/javascript">
    	function backUserList() {
			 var tab = $('#tab').tabs('getSelected'); 
			 tab.panel('refresh', 'sys/xitongguanli/xitong_user.jsp');
		 }
    </script>
</body>
</html>
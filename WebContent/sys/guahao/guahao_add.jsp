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

<div class="easyui-panel" title="" style="width:99%; height:auto;" data-options="border:false">
   <header style="height:40px; margin-top:0px; background:white; z-index:99; position:absolute;bottom:auto; top:expression(eval(document.documentElement.scrollTop));">
		<div style="margin-top:10px;">
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="submitForm()" style="width: 80px;color: #3d76b9;">保存</a>&nbsp;|
		 	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="backLastPage();" style="width: 80px;color: #3d76b9;">取消</a>&nbsp;
		</div>
	</header>
	<div style="width: 100%;height: 50px;background-color: #F8F8F8;line-height: 50px; padding-left:10px; margin-top: 40px;"><span style="font-size: 16px;"><b>患者信息</b></span></div>
      	<table style="margin-top: 5px;margin-left: 40px;">
      		<tr style="height: 35px;">
      			<td style="width: 300px;">姓&nbsp;&nbsp;名：<input class="easyui-textbox" style="width:200px;"></td>
      			<td style="width: 400px;">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<input class="easyui-textbox" style="width:200px;margin-left: 30px;"></td>
      		</tr>
      		<tr style="height: 35px;">
      			<td>年&nbsp;&nbsp;龄：<input class="easyui-textbox" style="width:30px">&nbsp;岁
    				<select class="easyui-combobox">
    					<option value="AL">1</option>
	                	<option value="AK">2</option>
		                <option value="AZ">3</option>
		                <option value="AR">4</option>
		                <option value="CA">5</option>
		                <option value="CO">6</option>
		                <option value="CT">7</option>
		                <option value="DE">8</option>
		                <option value="FL">9</option>
		                <option value="GA">10</option>
		                <option value="HI">11</option>
		                <option value="ID">12</option>
    				</select>&nbsp;月
    				&nbsp;
    				<select class="easyui-combobox" style="width: 87px;">
    					<option value="AL">性别</option>
	                	<option value="AK">男</option>
		                <option value="AZ">女</option>
    				</select>
    				</td>
      			<td>出生日期：<input class="easyui-textbox" style="width:200px"></td>
      		</tr>
      		<tr style="height: 35px;">
      			<td>地&nbsp;&nbsp;址：<input class="easyui-textbox" style="width:200px;"></td>
      			<td>身&nbsp;份&nbsp;证&nbsp;：<input class="easyui-textbox" style="width:200px;"></td>
      		</tr>
      	</table>
      	<div style="width: 100%;height: 50px;background-color: #F8F8F8;line-height: 50px; padding-left:10px; "><span style="font-size: 16px;"><b>就诊信息</b></span></div>
      	<table style="margin-top: 5px;margin-left: 0px;">
      		<tr style="height: 35px;">
      			<td style="width: 250px;">
					<span style="margin-left: 40px;">科&nbsp;&nbsp;&nbsp;&nbsp;室：</span> 
					<select class="easyui-combobox" name="language" data-options="labelAlign:'right'" style="width:150px;text-align: left;">
	                	<option value="ar">张三</option>
	                	<option value="bg">李四</option>
	                	<option value="ca">王五</option>
                	</select>
				</td>
      			<td>
      				<select class="easyui-combobox" name="language" label="医  生：" data-options="labelAlign:'right'" style="width:150px;text-align: left;">
	                	<option value="ar">张三</option>
	                	<option value="bg">李四</option>
	                	<option value="ca">王五</option>
                	</select>
      			</td>
      			<td>
      				<select class="easyui-combobox" name="language" label="挂号类别：" data-options="labelAlign:'right'" style="width:150px;text-align: left;">
	                	<option value="ar">张三</option>
	                	<option value="bg">李四</option>
	                	<option value="ca">王五</option>
                	</select>
      			</td>
      		</tr>
      		<tr>
      			<td> <span style="margin-left: 40px;">挂号费：<input class="easyui-textbox" style="width:155px;margin-left: 5px;"></span></td>
      			<td style="width: 250px;"><span style="margin-left: 40px;">优&nbsp;惠：</span> <input class="easyui-textbox" style="width:150px"></td>
      			<td><span style="margin-left: 20px;">应&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收：</span><input class="easyui-textbox" style="width:150px"></td>
      		</tr>
      		
      	</table>
      	<table style="margin-top: 20px;margin-left: 40px;">
      		<tr style="height: 35px;">
      			<td>主&nbsp;&nbsp;&nbsp;诉：</td>
      			<td colspan="2"><input class="easyui-textbox" style="width:640px"></td>
      		</tr>
      		<tr style="height: 35px;">
      			<td>既往史：</td>
      			<td colspan="2"><input class="easyui-textbox" style="width:640px"></td>
      		</tr>
      		<tr style="height: 35px;">
      			<td>过敏史：</td>
      			<td colspan="2"><input class="easyui-textbox" style="width:640px"></td>
      		</tr>
      		<tr style="height: 35px;">
      			<td>个人史：</td>
      			<td colspan="2"><input class="easyui-textbox" style="width:640px"></td>
      		</tr>
      		<tr style="height: 35px;">
      			<td>家族史：</td>
      			<td colspan="2"><input class="easyui-textbox" style="width:640px"></td>
      		</tr>
      	</table>
  </div>
  
  <script>
  
   	function backLastPage(){
		 if(typeof(backURL) != "undefined" && backURL != ""){
			 var tab = $('#tab').tabs('getSelected'); 
			 tab.panel('refresh', backURL);
		 } else {
			 $('#tab').tabs('select', '挂号列表');
		 }
		 
   	}
  </script>
</body>
</html>
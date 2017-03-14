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
    
    	<table align="center" style="margin-top: 20px;">
    	  <tr style="height: 40px;">
    	   <td colspan="2">
    	   	  <input class="easyui-textbox" name="name" style="width:240px" data-options="prompt:'用户名'"/>
    	   </td>
    	  </tr>
    	  <tr style="height: 40px;">
    	   <td colspan="2">
    	   	  <input class="easyui-passwordbox" name="pwd" style="width:240px" data-options="prompt:'用户密码'"/>
    	   </td>
    	  </tr>
    	  <tr style="height: 30px;">
    	   <td align="left">
    	   	  <input class="easyui-switchbutton" style="width: 30px; height: 16px;" data-options="onText:'是',offText:'否'"/>&nbsp;
         	  <font style="">下次自动登陆</font>
    	   </td>
    	   <td align="right">
    	   	  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="findPwd();" data-options="plain:true" style="width: 60px; color: #3d76b9;">忘记密码</a>
    	   </td>
    	  </tr>
    	  <tr style="height: 40px;">
    	   <td colspan="2">
    	   	  <a href="main/menzhen" class="easyui-linkbutton" onclick="submitForm()" style="width:240px">登&nbsp;&nbsp;&nbsp;&nbsp;陆</a>
    	   </td>
    	  </tr>
    	  <tr style="height: 30px;">
    	   <td colspan="2" align="left">
    	   	  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="newZhuce()" data-options="plain:true" style="width: 60px; color: #3d76b9;">立即注册</a>
    	   </td>
    	  </tr>
    	</table>
    </form>
    	
        
 
    <script>
        function submitForm(){
            //$('#ff').form('submit');
        }
        function findPwd() {
			$('#loginPanel').panel('refresh', 'sys/login/login_find_pwd.jsp');
		}
        function newZhuce() {
			$('#loginPanel').panel('refresh', 'sys/login/login_zhuce.jsp');
		}
    </script>

</body>
</html>
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
    
		    <div style="margin-top: 5px;">
		    	<font style="">注册</font>
		    </div>
	    	
    		<div style="margin-top: 8px;">
            	<input class="easyui-textbox" name="name" style="width: 240px" data-options="prompt:'登陆名', labelAlign:'right'" />
            </div>
    	    <div style="margin-top: 8px;">
            	<input class="easyui-textbox" name="name" style="width: 240px" data-options="prompt:'手机号', labelAlign:'right'" />
            </div>
            <div style="margin-top: 8px;">
            	<input class="easyui-textbox" name="name" style="width: 146px" data-options="prompt:'验证码', labelAlign:'right'" />
            	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" style="width: 80px; margin-left:10px; color: #3d76b9;">发送验证码</a>
            </div>
            <div style="margin-top: 8px;">
            	<input class="easyui-passwordbox" name="name" style="width: 240px" data-options="prompt:'新密码', labelAlign:'right'" />
            </div>
            
            <div style="margin-top: 8px;">
            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="zhuce()" style="width:240px">注&nbsp;&nbsp;&nbsp;&nbsp;册</a>
            </div>
            <div style="margin-top: 5px;">
	           	 <p style="width:240px">我有账号<a href="javascript:void(0)" onclick="backLogin()" data-options="plain:true" style="width: 60px; color: #3d76b9;">立即登陆</a></p>
            </div>
            
    </form>
    	
        
 
    <script>
        function submitForm(){
            //$('#ff').form('submit');
        }
        function zhuce() {
			$('#loginPanel').panel('refresh', 'sys/login/login_info.jsp');
		}
        function backLogin() {
			$('#loginPanel').panel('refresh', 'sys/login/login_info.jsp');
		}
    </script>

</body>
</html>
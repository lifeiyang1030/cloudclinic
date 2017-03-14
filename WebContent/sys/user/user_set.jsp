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
    	.dialog-button { text-align: center; }
    </style>
</head>
<body>
<div class="easyui-panel" title="" style="width:100%; height:auto; padding-top: 5px; " data-options="border:false">
		<header style="height:40px;margin-top:-10px; z-index:99; background:white;">
            	<div style="margin-top:10px;">
            		<span style="font-size: 14px;" >账号资料</span>
            		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="$('#modUserInfo').dialog('open')" style="width: 80px; margin-left:20px; color: #3d76b9;">修改资料</a>
				</div>
        </header>
        <div style="padding-left: 20px;">
	   		<table>
	   			<tr style="height: 35px">
	   				<td style="width: 100%;">
	   					账号：jxl
	   				</td>
	   			</tr>
	   			<tr style="height: 35px">
	   				<td style="width: 100%;">
	   					姓名：张三
	   				</td>
	   			</tr>
	   			<tr style="height: 35px">
	   				<td style="width: 100%;">
	   					邮箱：1237278822@qq.com
	   				</td>
	   			</tr>
	   			<tr style="height: 35px">
	   				<td style="width: 100%;">
	   					诊所名称：苍井空
	   				</td>
	   			</tr>
	   			<tr style="height: 35px">
	   				<td style="width: 100%;">
	   					诊所地址：四川
	   				</td>
	   			</tr>
	   		</table>
   		</div>
     </div>
     
	<div class="easyui-panel" title="" style="width:100%; height:auto; padding-top: 5px; margin-top: 5px; " data-options="border:false">
		<header style="height:40px;margin-top:-10px; z-index:99; background:white; ">
            	<div style="margin-top:10px;">
            		<span style="font-size: 14px;" >账号安全</span>
				</div>
        </header>
        <div style="padding-left: 20px;">
	   		<table>
	   			<tr style="height: 35px">
	   				<td style="">
	   					密码：*******
	   				</td>
	   				<td style="">
	   					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="$('#modPwd').dialog('open')" style="width: 80px; margin-left:20px; color: #3d76b9;">修改密码</a>
	   				</td>
	   			</tr>
	   			<tr style="height: 35px">
	   				<td style="">
	   					手机号：138812383133
	   				</td>
	   				<td style="">
	   					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="$('#modPhone').dialog('open')" style="width: 80px; margin-left:20px; color: #3d76b9;">修改手机号</a>
	   				</td>
	   			</tr>
	   		</table>
   		</div>
     </div>    

	<div id="modUserInfo" class="easyui-dialog" title="修改信息" style="width:330px;height:200px;"
            data-options="
            	closed:true,
                buttons: [{
                    text:'确定',
                    width:100,
                    handler:function(){
                        $('#modUserInfo').dialog('close');
                    }
                },{
                    text:'取消',
                    width:100,
                    handler:function(){
                        $('#modUserInfo').dialog('close');
                    }
                }]
            ">
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'姓名：'" />
            </div>
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'邮箱：'" />
            </div>
     </div>
     
     <div id="modPhone" class="easyui-dialog" title="更改手机号" style="width:330px;height:200px;"
            data-options="
            	closed:true,
                buttons: [{
                    text:'确定',
                    width:100,
                    handler:function(){
                        $('#modPhone').dialog('close');
                    }
                },{
                    text:'取消',
                    width:100,
                    handler:function(){
                        $('#modPhone').dialog('close');
                    }
                }]
            ">
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'新手机号：'" />
            </div>
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 200px" data-options="prompt:'', labelAlign:'right', label:'手机验证码：'" />
            	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" style="width: 80px; margin-left:10px; color: #3d76b9;">发送验证码</a>
            </div>
     </div>
         
     <div id="modPwd" class="easyui-dialog" title="修改密码" style="width:330px;height:250px;"
            data-options="
            	closed:true,
                buttons: [{
                    text:'确定',
                    width:100,
                    handler:function(){
                        $('#modPwd').dialog('close');
                    }
                },{
                    text:'取消',
                    width:100,
                    handler:function(){
                        $('#modPwd').dialog('close');
                    }
                }]
            ">
            <div style="margin-top: 25px;">
            	<input class="easyui-passwordbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'原密码：'" />
            </div>
            <div style="margin-top: 25px;">
            	<input class="easyui-passwordbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'新密码：'" />
            </div>
            <div style="margin-top: 25px;">
            	<input class="easyui-passwordbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'确认密码：'" />
            </div>
    </div>
</body>
</html>
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
	<div class="easyui-panel" title="" style="width:100%; height:auto; padding-top: 5px; " data-options="border:false">
		<header style="height:40px;margin-top:-10px; z-index:99; background:white;">
            	<div style="margin-top:10px;">
            		<span style="font-size: 14px;" >注册人信息</span>
				</div>
        </header>
        <div style="padding-left: 20px;">
	   		<table>
	   			<tr style="height: 35px">
	   				<td style="width: 100%;">
	   					注册人姓名：蒋文明
	   				</td>
	   			</tr>
	   			<tr style="height: 35px">
	   				<td style="width: 100%;">
	   					注册人手机：1237278822
	   				</td>
	   			</tr>
	   		</table>
   		</div>
     </div>
     
	<div class="easyui-panel" title="" style="width:100%; height:auto; padding-top: 5px; margin-top: 5px; " data-options="border:false">
		<header style="height:40px;margin-top:-10px; z-index:99; background:white; ">
            	<div style="margin-top:10px;">
            		<span style="font-size: 14px;" >诊所信息</span>
		            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="$('#ZSInfo').dialog('open')" style="width: 80px; margin-left:20px; color: #3d76b9;">修改</a>
				</div>
        </header>
        <div style="padding-left: 20px;">
	   		<table>
	   			<tr style="height: 35px">
	   				<td style="">
	   					诊所名称：苍进空诊所
	   				</td>
	   			</tr>
	   			<tr style="height: 35px">
	   				<td style="">
	   					诊所地址：四川
	   				</td>
	   			</tr>
	   			
	   			<tr style="height: 35px">
	   				<td style="">
	   					诊所编号：HM9125D46BC4F6D856
	   				</td>
	   			</tr>
	   			<tr style="height: 35px">
	   				<td style="">
	   					注册时间：2017-01-17 11:27:45
	   				</td>
	   			</tr>
	   		</table>
   		</div>
     </div>    
     
     <div id="ZSInfo" class="easyui-dialog" title="修改诊所信息" style="width:330px;height:200px;"
            data-options="
            	closed:true,
                buttons: [{
                    text:'确定',
                    width:100,
                    handler:function(){
                        $('#ZSInfo').dialog('close');
                    }
                },{
                    text:'取消',
                    width:100,
                    handler:function(){
                        $('#ZSInfo').dialog('close');
                    }
                }]
            ">
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'诊所名称：'" />
            </div>
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'诊所地址：'" />
            </div>
    </div>
</body>
</html>
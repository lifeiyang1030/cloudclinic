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
            <header style="height:40px;margin-top:-10px; background:white; position:absolute;bottom:auto; top:expression(eval(document.documentElement.scrollTop));">
            	<div style="margin-top:10px;">
            		<span style="font-size: 18px; margin-right: 20px; " >编辑库存</span>
		            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="submitForm()" style="width: 80px;color: #3d76b9;">保存</a>&nbsp;|
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="backYaopinMessage();" style="width: 80px;color: #3d76b9;">取消</a>&nbsp;
				</div>
            </header>
            <div style="padding-top: 45px;">
            	<div class="easyui-panel" title="基本信息" style="width:100%; height:auto; padding-top: 5px; margin-top: 5px; " data-options="border:false">
            		<table>
            			<tr style="height: 35px">
            				<td style="width: 350px;">
            					<input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', disabled:true, label:'药品名称：'" />
            				</td>
            				<td style="width: 300px;">
	            				<select class="easyui-combobox" name="language" label="药品类型：" data-options="labelAlign:'right', disabled:true" style="width:150px;text-align: left;">
					               	<option value="ar">全部</option>
					               	<option value="bg">饮片</option>
					               	<option value="ca">中成药</option>
					             </select>
            				</td>
            				<td style="width: 300px;padding-left: 40px;">
            					OTC：&nbsp;&nbsp;<input class="easyui-switchbutton" data-options="onText:'是',offText:'否', disabled:true" style="width: 55px;" />
            				</td>
            			</tr>
            			<tr style="height: 35px">
            				<td style="width: 350px;">
            					<input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'规格包装描述', labelAlign:'right', disabled:true, label:'包装规格：'" />/
            					<input class="easyui-textbox" name="name" style="width: 60px" data-options="prompt:'包装单位', disabled:true" />
            				</td>
            				<td style="width: 300px;">
	            				<input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', disabled:true, label:'生产厂家：'" />
            				</td>
            				<td style="width: 300px;padding-left: 40px;">
            					状态：&nbsp;&nbsp;<input class="easyui-switchbutton" data-options="onText:'启用',offText:'停用', disabled:true" style="width: 55px;" />
            				</td>
            			</tr>
            			<tr style="height: 35px">
            				<td style="width: 300px;">
            					<input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', disabled:true, label:'批准文号：'" />
            				</td>
            				<td style="width: 300px;">
	            				<input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', disabled:true, label:'药品条形码：'" />
            				</td>
            			</tr>
            		</table>
            	</div>
            	<div class="easyui-panel" title="库存销售设置" style="width:100%; height:auto; padding-top: 5px; margin-top: 5px; " data-options="border:false">
            		<table>
            			<tr style="height: 35px">
            				<td style="width: 350px;">
            					<input class="easyui-numberbox" name="name" style="width: 250px" data-options="prompt:'0', labelAlign:'right', label:'库存阈值：'" />
            				</td>
            				<td style="width: 300px;">
	            				<input class="easyui-numberbox" precision="2" name="name" style="width: 250px" data-options="prompt:'0.00', labelAlign:'right', label:'处方价：'" />
            				</td>
            				<td style="width: 300px;">
            					<input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', label:'供应商：'" />
            				</td>
            			</tr>
            			<tr style="height: 35px">
            				<td style="width: 300px;">
            					<input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', label:'货架码：'" />
            				</td>
            			</tr>
            		</table>
            	</div>
            </div>
   	    </div>
 
	<script language="javascript" type="text/javascript">
    	function backYaopinMessage() {
			 var tab = $('#tab').tabs('getSelected'); 
			 tab.panel('refresh', 'sys/yaopin/yaopin_stock.jsp');
		 }
    </script>
</body>
</html>
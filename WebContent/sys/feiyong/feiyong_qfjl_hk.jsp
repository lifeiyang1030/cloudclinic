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
    
</head>
	<body>
		<style type="text/css">
	    	.tableItem{width: 100px;background-color: #DDDDDD;height: 30px;line-height: 30px;}
	    	.tabcolor{color: #00BBFF;}
	    	.tableItemDetail{width: 100px;height: 30px;line-height: 30px;}
	    </style>
		<div style="height: 40px;line-height: 40px;">
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="submitForm()" style="width: 80px;margin-left: 10px;"><span style="font-size: 22px;">退费</span></a>&nbsp;|
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true" onclick="dsf_tf_back();" style="width: 80px;"><span style="font-size: 22px;">返回</span></a>&nbsp;
		</div>
		<div style="width: 98%;height: 95%;">
			<div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'west'" style="width:20%;padding:10px">
                <table style="margin-left: 40px;margin-top: 25px;">
				<tr>
					<td style="width: 130px;height: 40px;">姓名：</td>
					<td style="width: 200px;">张三</td>
				</tr>
				<tr>
					<td style="width: 100px;height: 40px;">年龄：</td>
					<td style="width: 200px;">21岁</td>
				</tr>
				<tr>
					<td style="width: 100px;height: 40px;">性别：</td>
					<td style="width: 200px;">男</td>
				</tr>
				<tr>
					<td style="width: 100px;height: 40px;">科室：</td>
					<td style="width: 200px;">全科</td>
				</tr>
				<tr>
					<td style="width: 100px;height: 40px;">医生：</td>
					<td style="width: 200px;">全科</td>
				</tr>
				<tr>
					<td style="width: 100px;height: 40px;">诊断：</td>
					<td style="width: 200px;">下呼吸道感染</td>
				</tr>
				<tr>
					<td style="width: 100px;height: 40px;">总金额：</td>
					<td style="width: 200px;">1234</td>
				</tr>
				<tr>
					<td style="width: 100px;height: 40px;">优惠金额：</td>
					<td style="width: 200px;">1234</td>
				</tr>
				<tr>
					<td style="width: 100px;height: 40px;">实际收的金额：</td>
					<td style="width: 200px;">1234</td>
				</tr>
			</table>
            </div>
            <div data-options="region:'center'" style="padding:20px">
            	<div>
            		<input type="checkbox"/>&nbsp;&nbsp;项目 <span style="color: red; margin-left: 100px;">总金额：370  优惠：110 实际：260</span>
            	</div>
                <div>
                	<table style="text-align: center;margin-top: 5px;">
                		<tr>
                			<td style="width: 20px;background-color: #DDDDDD;"></td>
                			<td class="tableItem"><span class="tabcolor">项目名称</span></td>
                			<td class="tableItem"><span class="tabcolor">单价</span></td>
                			<td class="tableItem"><span class="tabcolor">单位</span></td>
                			<td class="tableItem"><span class="tabcolor">数量</span></td>
                			<td class="tableItem"><span class="tabcolor">金额</span></td>
                			<td class="tableItem"><span class="tabcolor">折扣</span></td>
                			<td class="tableItem"><span class="tabcolor">折后金额</span></td>
                		</tr>
                		<tr>
                			<td><input type="checkbox" style="height: 30px;line-height: 30px;text-align: center;"/></td>
                			<td class="tableItemDetail">血常规</td>
                			<td class="tableItemDetail">10</td>
                			<td class="tableItemDetail">次</td>
                			<td class="tableItemDetail">1</td>
                			<td class="tableItemDetail">10</td>
                			<td class="tableItemDetail">80%</td>
                			<td class="tableItemDetail">8</td>
                		</tr>
                		<tr>
                			<td><input type="checkbox" style="height: 30px;line-height: 30px;text-align: center;"/></td>
                			<td class="tableItemDetail">按摩套餐</td>
                			<td class="tableItemDetail">180</td>
                			<td class="tableItemDetail">5次</td>
                			<td class="tableItemDetail">2</td>
                			<td class="tableItemDetail">360</td>
                			<td class="tableItemDetail">70%</td>
                			<td class="tableItemDetail">252</td>
                		</tr>
                	</table>
                </div>
                <div style="margin-top: 10px;">
            		<input type="checkbox"/>&nbsp;&nbsp;处方一 <span style="color: red; margin-left: 100px;">总金额：35  优惠：0  实际：35</span>
            	</div>
                <div>
                	<table style="text-align: center;margin-top: 5px;">
                		<tr>
                			<td style="width: 20px;background-color: #DDDDDD;"></td>
                			<td class="tableItem"><span class="tabcolor">项目名称</span></td>
                			<td class="tableItem"><span class="tabcolor">单价</span></td>
                			<td class="tableItem"><span class="tabcolor">单位</span></td>
                			<td class="tableItem"><span class="tabcolor">数量</span></td>
                			<td class="tableItem"><span class="tabcolor">金额</span></td>
                			<td class="tableItem"><span class="tabcolor">折扣</span></td>
                			<td class="tableItem"><span class="tabcolor">折后金额</span></td>
                		</tr>
                		<tr>
                			<td><input type="checkbox" style="height: 30px;line-height: 30px;text-align: center;"/></td>
                			<td class="tableItemDetail">血常规</td>
                			<td class="tableItemDetail">10</td>
                			<td class="tableItemDetail">次</td>
                			<td class="tableItemDetail">1</td>
                			<td class="tableItemDetail">10</td>
                			<td class="tableItemDetail">80%</td>
                			<td class="tableItemDetail">8</td>
                		</tr>
                		<tr>
                			<td><input type="checkbox" style="height: 30px;line-height: 30px;text-align: center;"/></td>
                			<td class="tableItemDetail">按摩套餐</td>
                			<td class="tableItemDetail">180</td>
                			<td class="tableItemDetail">5次</td>
                			<td class="tableItemDetail">2</td>
                			<td class="tableItemDetail">360</td>
                			<td class="tableItemDetail">70%</td>
                			<td class="tableItemDetail">252</td>
                		</tr>
                	</table>
                </div>
                <div style="margin-top: 10px;">
            		<input type="checkbox"/>&nbsp;&nbsp;处方2 <span style="color: red; margin-left: 100px;">总金额：35  优惠：0  实际：35</span>
            	</div>
                <div>
                	<table style="text-align: center;margin-top: 5px;">
                		<tr>
                			<td style="width: 20px;background-color: #DDDDDD;"></td>
                			<td class="tableItem"><span class="tabcolor">项目名称</span></td>
                			<td class="tableItem"><span class="tabcolor">单价</span></td>
                			<td class="tableItem"><span class="tabcolor">单位</span></td>
                			<td class="tableItem"><span class="tabcolor">数量</span></td>
                			<td class="tableItem"><span class="tabcolor">金额</span></td>
                			<td class="tableItem"><span class="tabcolor">折扣</span></td>
                			<td class="tableItem"><span class="tabcolor">折后金额</span></td>
                		</tr>
                		<tr>
                			<td><input type="checkbox" style="height: 30px;line-height: 30px;text-align: center;"/></td>
                			<td class="tableItemDetail">血常规</td>
                			<td class="tableItemDetail">10</td>
                			<td class="tableItemDetail">次</td>
                			<td class="tableItemDetail">1</td>
                			<td class="tableItemDetail">10</td>
                			<td class="tableItemDetail">80%</td>
                			<td class="tableItemDetail">8</td>
                		</tr>
                		<tr>
                			<td><input type="checkbox" style="height: 30px;line-height: 30px;text-align: center;"/></td>
                			<td class="tableItemDetail">按摩套餐</td>
                			<td class="tableItemDetail">180</td>
                			<td class="tableItemDetail">5次</td>
                			<td class="tableItemDetail">2</td>
                			<td class="tableItemDetail">360</td>
                			<td class="tableItemDetail">70%</td>
                			<td class="tableItemDetail">252</td>
                		</tr>
                	</table>
                </div>
            </div>
        </div>
		</div>
		<script language="javascript" type="text/javascript">
	    	function dsf_tf_back() {
				 var tab = $('#tab').tabs('getSelected'); 
				 tab.panel('refresh', 'sys/feiyong/feiyong_qfjl.jsp');
			 }
    </script>
	</body>
</html>
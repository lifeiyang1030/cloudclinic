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
  
  <form id="zjfy_form" method="post">
		<div style="margin-bottom: 13px">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#sf_w').window('open')" style="width: 80px">收费</a>&nbsp;&nbsp;
			<a href="javascript:void(0)" id = "userInfoIn" onclick="showHideUserInfo()" style=" color: #3d76b9">输入患者信息 ∨</a>
		</div>
		<div id = "userInfo" style="background: #eee;margin-right: 12px; display:none; margin-bottom: 5px;">
			<div style="padding-top: 5px;">
				<input class="easyui-textbox" name="name" style="width: 200px" data-options="prompt:'', labelAlign:'right', label:'姓名：'" />
				<input class="easyui-numberbox" name="name" style="width: 130px" data-options="prompt:'', labelAlign:'right', label:'年龄：'" />
				<select class="easyui-combobox" name="language" style="width:40px;">
			           <option value="1">岁</option>
			           <option value="2">月</option>
			           <option value="3">天</option>
	        	</select>
	        	&nbsp; &nbsp; 性别：&nbsp; 
			       	<label><input name="sex" type="radio" value="" />&nbsp; 男 </label>&nbsp;&nbsp;&nbsp;    
					<label><input name="sex" type="radio" value="" />&nbsp; 女 </label>&nbsp;&nbsp;&nbsp; 
			</div>
			<div style="margin-top: 10px; padding-bottom: 5px;">
				<input class="easyui-textbox" name="name" style="width: 257px" data-options="prompt:'', labelAlign:'right', label:'联系方式：'" />
				<input class="easyui-textbox" name="name" style="width: 257px" data-options="prompt:'', labelAlign:'right', label:'身份证：'" />
			</div>
		</div>
		
		<table id="zjfy_list" style="width: 99%">
			<thead style="background-color: #eee;">
				<tr style="height: 35px;">
					<th field="1" width="3%"></th>
					<th field="2" width="15%">药品名称/条形码</th>
					<th field="3" width="10%">药品规格</th>
					<th field="4" width="15%">厂家</th>
					<th field="5" width="8%">单价</th>
					<th field="6" width="8%">现价</th>
					<th field="9" width="15%">开药量</th>
					<th field="11" width="10%">金额</th>
					<th field="10" width="10%">操作</th>
				</tr>
			</thead>
			<tbody id = "appendIN">
	            <tr style="height: 35px;">
	          		<td style="padding-left: 5px;">1</td>
	                <td onclick="ckIsAutoAddIn(this);"><input class="easyui-textbox" name="name" style="width: 150px" data-options="" /></td>
	                <td><p style="color: #ccc">药品规格</p></td>
	                <td><p style="color: #ccc">厂家</p></td>
	                <td><input class="easyui-numberbox" precision="2" name="name" style="width: 60px" data-options="prompt:'单价'" /></td>
	                <td><input class="easyui-numberbox" precision="2" name="name" style="width: 60px" data-options="prompt:'现价'" /></td>
	                <td>
	                <input class="easyui-numberbox" style="width:50px;"/>
	                <select class="easyui-combobox" name="language" style="width:50px;">
		             	<option value="ar">盒</option>
	           		</select>
	                </td>
	                <td><p style="">0.00</p></td>
	                <td><a href="javascript:void(0)" onclick="$(this).parent().parent().remove();" style="width: 50px; color: #3d76b9">删除</a></td>
	            </tr>
	            <tr style="height: 40px;">
	                <td colspan="2"><a href="javascript:void(0)"  onclick="addYao(this);" style="width: 100px; color: #3d76b9">添加药品</a></td>
	                <td colspan="6" align="right">
	                	总金额： ¥ <font style="">23.00</font> - 优惠金额： <font style="color: red;">¥</font>  
	                	<input class="easyui-numberbox" precision="2" name="name" style="width: 70px;" data-options="prompt:'0.00'" />
	                	= 应收金额： <font style="color: red;">¥</font> 
	                	<input class="easyui-numberbox" precision="2" name="name" style="width: 70px;" data-options="prompt:'0.00'" />
	                </td>
	            </tr>
        	</tbody>
		</table>
	
	</form>
	
	<div id="sf_w" class="easyui-window" title="确认收费" data-options="modal:true,resizable:false,closed:true" style="width:450px; padding-bottom: 10px; ">
       <table align="left">
		<tr style="height: 35px">
			<td style="color: red;padding-left: 20px;">
			  <font>应收金额：</font><font style="font-size: 16px;">123123.11</font>
			</td>
		</tr>
		<tr style="height: 35px;">
			<td style=" padding-left: 20px;">
			   <a href="javascript:;" id = "chgQF" onclick="clickBtn(1)" class="easyui-linkbutton" data-options="toggle:true,plain:true" style="width: 96px; color: #3d76b9;" >暂欠费</a>
			   <a href="javascript:;" id = "chgYB" onclick="clickBtn(2)"class="easyui-linkbutton" data-options="toggle:true,plain:true" style="width: 96px; color: #3d76b9;" >医保</a>
			   <a href="javascript:;" id = "chgSB" onclick="clickBtn(3)"class="easyui-linkbutton" data-options="toggle:true,plain:true" style="width: 95px; color: #3d76b9;" >商保</a>
			</td>
		</tr>
		<tr id = "qf" style="display: none;" >
			<td>
				<div style="padding:5px 0px 5px 0px; margin-left:20px; background: #eee;">
			  		 <input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', label:'姓名：'" />
			  	</div>
			  	<div style="padding:5px 0px 5px 0px; margin-left:20px; background: #eee;">
			  		 <input class="easyui-textbox" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', label:'手机号：'" /> 
			   </div>
			  	<div style="padding:5px 0px 5px 0px; margin-left:20px; background: #eee;">
			   		 <input class="easyui-numberbox" precision="2" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', label:'欠款金额：'" />
			   		 <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clickBtn(1,'chgQF')" data-options="plain:true" style="width: 40px; color: #3d76b9;">删除</a>
			   </div>
			</td>
		</tr>
		<tr id = "yb" style="display: none;">
			<td>
			   <div style="padding:5px 0px 5px 0px; margin-left:20px; margin-top:2px; background: #eee;">
				    <input class="easyui-numberbox" precision="2" style="width: 250px" data-options="prompt:'', labelAlign:'right', label:'医保支付：'" />
				    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clickBtn(2,'chgYB')" data-options="plain:true" style="width: 40px; color: #3d76b9;">删除</a>
			   </div>
			</td>
		</tr>
		<tr id = "sb" style="display: none;">
			<td>
			   <div style="padding:5px 0px 5px 0px; margin-left:20px; margin-top:2px; background: #eee;">
			     <input class="easyui-numberbox" precision="2" name="name" style="width: 250px" data-options="prompt:'', labelAlign:'right', label:'商保支付：'" />
			     <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clickBtn(3,'chgSB')" data-options="plain:true" style="width: 40px; color: #3d76b9;">删除</a>
			   </div>
			</td>
		</tr>
		<tr style="height: 35px">
			<td style="padding-left: 20px;">
			   付款方式：&nbsp; 
		       	<label><input name="Fruit" type="radio" value="" />&nbsp; 现金 </label>&nbsp;&nbsp;&nbsp;    
				<label><input name="Fruit" type="radio" value="" />&nbsp; 支付宝 </label>&nbsp;&nbsp;&nbsp;  
				<label><input name="Fruit" type="radio" value="" />&nbsp; 微信 </label>&nbsp;&nbsp;&nbsp;  
				<label><input name="Fruit" type="radio" value="" />&nbsp; 银行卡 </label>&nbsp;&nbsp;&nbsp; 
				<label><input name="Fruit" type="radio" value="" />&nbsp; 其他</label>&nbsp;&nbsp;&nbsp;  
			</td>
		</tr>
		<tr style="height: 35px">
			<td>
			   <input class="easyui-numberbox" precision="2" name="name" style="width: 270px" data-options="prompt:'0.00', labelAlign:'right', label:'付款金额：'" />
			</td>
		</tr>
		<tr style="height: 35px">
			<td  style="padding-left: 43px;">
			   找零：&nbsp; <font style="font-size: 16px;">0.00</font>
			</td>
		</tr>
		<tr style="height: 35px">
			<td style="padding-left: 70px;">
			   <a href="javascript:;" class="easyui-linkbutton" onclick="" style="width:100px">确定</a>
			   <a href="javascript:" class="easyui-linkbutton" onclick="$('#sf_w').window('close')" style="width:100px; margin-left: 20px;">取消</a>
			</td>
		</tr>
      </table>
    </div>

<script id="inTempl" type="text/x-dot-template">
				<tr style="height: 35px;">
	          		<td style="padding-left: 5px;">{{=it.index}}</td>
	                <td onclick="ckIsAutoAddIn(this);"><input class="easyui-textbox" name="name" style="width: 150px" data-options="" /></td>
	                <td><p style="color: #ccc">药品规格</p></td>
	                <td><p style="color: #ccc">厂家</p></td>
	                <td><input onclick="ckIsAutoAddIn(this);" class="easyui-numberbox" precision="2" name="name" style="width: 60px" data-options="prompt:'单价'" /></td>
	                <td><input onclick="ckIsAutoAddIn(this);" class="easyui-numberbox" precision="2" name="name" style="width: 60px" data-options="prompt:'现价'" /></td>
	                <td>
	                <input class="easyui-numberbox" style="width:50px;"/>
	                <select class="easyui-combobox" name="language" style="width:50px;">
		             	<option value="ar">盒</option>
	           		</select>
	                </td>
	                <td><p style="">0.00</p></td>
	                <td><a href="javascript:void(0)" onclick = "$(this).parent().parent().remove();" style="width: 50px; color: #3d76b9"">删除</a></td>
	            </tr>
</script>
<script type="text/javascript">

var qfIsTrue = false;
var ybIsTrue = false;
var sbIsTrue = false;
function clickBtn(btnID, chgBtnID) {
	if(chgBtnID != ""){
		$('#' + chgBtnID).linkbutton('unselect');
	}
	switch (btnID) {
	case 1:
		qfIsTrue = !qfIsTrue;
		if (qfIsTrue) {
			$("#qf").css("display","inline");
		} else {
			$("#qf").css("display","none");
			$("#qf").find('input[type="text"]').each(function(){
			    $(this).val("");
			});
		}
		break;
	case 2:
		ybIsTrue = !ybIsTrue;
		if (ybIsTrue) {
			$("#yb").css("display","inline");
		} else {
			$("#yb").css("display","none");
			$("#yb").find("input").attr("value","");
			$("#yb").find('input[type="text"]').each(function(){
			    $(this).val("");
			});
		}
		break;
	case 3:
		sbIsTrue = !sbIsTrue;
		if (sbIsTrue) {
			$("#sb").css("display","inline");
		} else {
			$("#sb").css("display","none");
			$("#sb ").find("input").attr("value","");
			$("#sb").find('input[type="text"]').each(function(){
			    $(this).val("");
			});
		}
		break;

	default:
		break;
	}
}

function showHideUserInfo(){
	$("#userInfo").toggle(300);
	
	var btnText = $("#userInfoIn").text();
	if (btnText.indexOf('∨')!=-1) {
		$("#userInfoIn").text(btnText.replace('∨','∧'));
	} else {
		$("#userInfoIn").text(btnText.replace('∧','∨'));
	}
	// 清空文本框
	$("#userInfo").find('input[type="text"]').each(function(){
	    $(this).val("");
	});
	// 复位单选按钮
	$("input[name=sex]").attr("checked",false); 
	// 复位下拉菜单
    $("#userInfo").find('select').each(function(){
       //$(this).find('option:first-child').attr('selected',"selected");
    });
}

function ckIsAutoAddIn(nowInput) {
	var clickIndex =  $(nowInput).parent().index();    
	var countTr =  $(nowInput).parent().parent().find("tr").length;
    if((countTr - 1) == (clickIndex + 1)){
    	addYao(nowInput);
    }
}

var index = 1;
function addYao(table){
	index ++;
	var data = {
			index: index
		};
	var pagefn = doT.template($("#inTempl").text(), undefined, undefined);
	$(table).parent().parent().parent().find("tr").eq(-1).before(pagefn(data));
	$.parser.parse($(table).parent().parent().parent().find("tr").eq(-2));
}

</script>
   
</body>
</html>
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
  
  <form id="in_form" method="post">
		<div style="margin-bottom: 13px">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width: 80px">保存</a>
			<input class="easyui-datebox" data-options="labelAlign:'right',label:'入库日期：'" style="width:200px;"/>
			<input class="easyui-textbox" name="name" style="width: 300px" data-options="labelAlign:'right', label:'供货商：'" />
		</div>
		
		<table id="in_list" style="width: 99%">
			<thead style="background-color: #eee;">
				<tr style="height: 35px;">
					<th field="1" width="3%"></th>
					<th field="2" width="15%">药品名称/条形码</th>
					<th field="3" width="10%">药品规格</th>
					<th field="4" width="15%">厂家</th>
					<th field="5" width="8%">*入库数量</th>
					<th field="6" width="8%">进货价</th>
					<th field="7" width="8%">处方价</th>
					<th field="8" width="10%">批号</th>
					<th field="9" width="15%">有效期</th>
					<th field="10" width="10%">操作</th>
				</tr>
			</thead>
			<tbody id = "appendIN">
	            <tr style="height: 35px;">
	          		<td style="padding-left: 5px;">1</td>
	                <td onclick="ckIsAutoAddIn(this);"><input class="easyui-textbox" name="name" style="width: 150px" data-options="" /></td>
	                <td><p style="color: #ccc">药品规格</p></td>
	                <td><p style="color: #ccc">厂家</p></td>
	                <td><input class="easyui-numberbox" name="name" style="width: 60px" data-options="prompt:'入库数量'" /></td>
	                <td><input class="easyui-numberbox" precision="2" name="name" style="width: 60px" data-options="" /></td>
	                <td><input class="easyui-numberbox" precision="2" name="name" style="width: 60px" data-options="" /></td>
	                <td><input class="easyui-textbox" name="name" style="width: 70px" data-options="" /></td>
	                <td>
	                <select class="easyui-combobox" name="language" style="width:50px;">
		             	<option value="ar">1年</option>
		             	<option value="bg">2年</option>
		             	<option value="ca">3年</option>
	           		</select>
	                <input class="easyui-datebox" style="width:100px;"/></td>
	                <td><a href="javascript:void(0)" onclick="$(this).parent().parent().remove();" style="width: 50px; color: #3d76b9">删除</a></td>
	            </tr>
	            <tr style="height: 35px;">
	                <td colspan="8"><a href="javascript:void(0)"  onclick="addIn(this);" style="width: 100px; color: #3d76b9">添加药品</a></td>
	            </tr>
        	</tbody>
		</table>
	
	</form>

<script id="inTempl" type="text/x-dot-template">
				<tr style="height: 35px;">
	          		<td style="padding-left: 5px;">{{=it.index}}</td>
	                <td onclick="ckIsAutoAddIn(this);"><input class="easyui-textbox" name="name" style="width: 150px" data-options="" /></td>
	                <td><p style="color: #ccc">药品规格</p></td>
	                <td><p style="color: #ccc">厂家</p></td>
	                <td onclick="ckIsAutoAddIn(this);"><input class="easyui-numberbox" name="name" style="width: 60px" data-options="prompt:'入库数量'" /></td>
	                <td onclick="ckIsAutoAddIn(this);"><input class="easyui-numberbox" precision="2" name="name" style="width: 60px" data-options="" /></td>
	                <td onclick="ckIsAutoAddIn(this);"><input class="easyui-numberbox" precision="2" name="name" style="width: 60px" data-options="" /></td>
	                <td onclick="ckIsAutoAddIn(this);"><input class="easyui-textbox" name="name" style="width: 70px" data-options="" /></td>
	                <td>
	                <select class="easyui-combobox" name="language" style="width:50px;">
		             	<option value="ar">1年</option>
		             	<option value="bg">2年</option>
		             	<option value="ca">3年</option>
	           		</select>
	                <input class="easyui-datebox" style="width:100px;"/></td>
	                <td><a href="javascript:void(0)" onclick = "$(this).parent().parent().remove();" style="width: 50px; color: #3d76b9">删除</a></td>
	            </tr>
</script>
<script type="text/javascript">

function ckIsAutoAddIn(nowInput) {
	var clickIndex =  $(nowInput).parent().index();    
	var countTr =  $(nowInput).parent().parent().find("tr").length;
    if((countTr - 1) == (clickIndex + 1)){
    	addIn(nowInput);
    }
}

var index = 1;
function addIn(table){
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
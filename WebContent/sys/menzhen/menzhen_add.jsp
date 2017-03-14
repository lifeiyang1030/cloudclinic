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
    	
    	//定义全局的用于记录返回的URL地址
    	var backURL = '';
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
			<a href="javascript:;" class="easyui-linkbutton" data-options="plain:true" style="width: 80px;margin-left: 5px;color: #3d76b9;" onclick="$('#JZDlgAdd').dialog('open')">待接诊(1)</a>&nbsp;|
			<a href="javascript:;" class="easyui-linkbutton" data-options="plain:true" onclick="saveCF();" style="width: 80px;margin-left: 5px;color: #3d76b9;">保存</a>&nbsp;|
		    <a href="javascript:;" class="easyui-linkbutton" data-options="plain:true" onclick="newGuahao();" style="width: 80px;margin-left: 5px;color: #3d76b9;">新增挂号</a>&nbsp;
		</div>
	</header>
	<div id="JZDlgAdd" class="easyui-dialog" title="待接诊病人" style="width:500px;height:350px;"
            data-options="
            	closed:true,
                buttons: [{
                    text:'确定',
                    width:100,
                    handler:function(){
                        $('#JZDlgAdd').dialog('close');
                    }
                },{
                    text:'取消',
                    width:100,
                    handler:function(){
                        $('#JZDlgAdd').dialog('close');
                    }
                }]
            ">
        <table id="JZListAdd" class="easyui-datagrid"
        		data-options="singleSelect:true,"
	            url="menzhen/list"
	            rownumbers="true">
	        <thead>
	            <tr>
	           		<th data-options="field:'ck',checkbox:true"></th>
	           		<th field="userId"  width="20%">编号</th>
	                <th field="name"  width="30%">姓名</th>
	                <th field="sex"  width="20%">性别</th>
	                <th field="age"  width="20%">年龄</th>
	            </tr>
	        </thead>
	    </table>
    </div>
	
	<table style="margin-top: 55px;">
        <tr>
            <td style="width:300px;height: 40px"><input class="easyui-textbox" name="name" style="width:270px" data-options="labelAlign:'right', label:'患者姓名：'"/></td>
            <td style="width:300px;height: 40px"><font style="margin-left: 45px; padding-right: 5px;">性别：</font><input class="easyui-switchbutton" data-options="onText:'男',offText:'女'"/></td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px">
            	<input class="easyui-textbox" name="name" style="width:215px" data-options="labelAlign:'right', label:'年龄：'"/> 
				<select class="easyui-combobox" name="language"  data-options="labelAlign:'right'" style="width:50px;text-align: left;">
	                	<option value="ar">岁</option>
	                	<option value="bg">月</option>
	                	<option value="ca">天</option>
	             </select>
            </td>
            <td style="width:300px;height: 40px">
            	 <input class="easyui-textbox" name="name" style="width:300px" data-options="labelAlign:'right', label:'电话：'"/> 
            </td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px" colspan="2">
            	<input class="easyui-textbox" name="name" style="width:600px" data-options="labelAlign:'right', label:'主诉/现病史：'"/>
            </td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px" colspan="2">
            	<input class="easyui-textbox" name="name" style="width:600px" data-options="labelAlign:'right', label:'既往史：'"/>
            </td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px" colspan="2">
            	<input class="easyui-textbox" name="name" style="width:600px" data-options="labelAlign:'right', label:'个人史：'"/>
            </td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px" colspan="2">
            	<input class="easyui-textbox" name="name" style="width:600px" data-options="labelAlign:'right', label:'过敏史：'"/>
            </td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px" colspan="2">
            	<input class="easyui-textbox" name="name" style="width:600px" data-options="labelAlign:'right', label:'家族史：'"/>
            </td>
        </tr>
        <tr>
            <td style="width:300px;" colspan="2">
            <p style="width: 80px; text-align: right;">体格检查：</p>
            <input class="easyui-numberbox" precision="1" name="name" style="width:130px" data-options="labelAlign:'right', label:'体温：'"/>℃ &nbsp;&nbsp;&nbsp;
            体重：<input class="easyui-numberbox" precision="1" name="name" style="width:45px"/>KG &nbsp;&nbsp;&nbsp;
            心率：<input class="easyui-numberbox" precision="1" name="name" style="width:45px"/>bpm &nbsp;&nbsp;&nbsp;
            血压：
            <input class="easyui-numberbox" precision="1" name="name" style="width:50px" data-options="prompt:'收缩压'"/> / 
            <input class="easyui-numberbox" precision="1" name="name" style="width:50px" data-options="prompt:'舒张压'"/>mmHg
            <div style="padding-left: 85px; margin-top: 5px; ">
           	 	<input class="easyui-textbox" label="" labelPosition="right" data-options="prompt:'其他体格检查'" multiline="true" value="" style="width:515px;height:80px"/>
            </div>
            </td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px" colspan="2">
           	 <input class="easyui-textbox" name="name" style="width:600px" data-options="labelAlign:'right', label:'诊断：'"/>
            </td>
        </tr>
        <tr>
            <td style="width:300px; height: 40px" colspan="2">
            <p style="width: 185px; text-align: right;">检查治疗项：<a href="javascript:;" class="easyui-linkbutton" onclick="addZLX();" style="width: 100px; margin-left: 5px;">添加</a> </p>
            <div id = "appendZLXMod" style="padding-left: 85px;padding-bottom: 5px;">
            </div>
            </td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px" colspan="2">
            <p style="width: 185px; text-align: right;">处方：<a href="javascript:;" class="easyui-linkbutton" onclick="addCF();" style="width: 100px;margin-left: 5px;">添加处方</a></p>
            	<div id = "appendCFMod" style="padding-left: 85px; padding-bottom: 5px;">
	            </div>
            </td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px" colspan="2">
            <p style="width: 185px; text-align: right;">附加费用：<a href="javascript:;" class="easyui-linkbutton" onclick="addFJFY();" style="width: 100px;margin-left: 5px;">添加</a></p>
	            <div id = "appendFJFYMod" style="padding-left: 85px; padding-bottom: 5px;">
	            </div>
            </td>
        </tr>
        <tr>
            <td style="width:300px;height: 40px" colspan="2">
             <input class="easyui-textbox" name="name" style="width:600px" data-options="labelAlign:'right', label:'医嘱：'"/>
            </td>
        </tr>
         <tr>
            <td style="width:300px;height: 80px" colspan="2">
            	<div  style="font-size: 18px; width:600px; text-align: right;">合计金额：<b style="color: red;">￥ 0.00</b></div>
            </td>
        </tr>
    </table>
</div>
  
  
    <script language="javascript" type="text/javascript">

    	function addZLX() {
    		var appendHtml = 
    			"<div style=\"margin-top: 5px; \">" +
        			"<input class=\"easyui-textbox\" name=\"name\" style=\"width:380px\" data-options=\"prompt:'检查项'\"/> &nbsp;&nbsp;" +
        			"<input class=\"easyui-numberbox\" name=\"name\" style=\"width:45px\" data-options=\"prompt:'次数'\"/>" +
        			"<font style=\"width: 200px\">￥ 0.00</font>" +
					"<a href=\"javascript:;\" onclick = \"$(this).parent().remove();\" style=\" color: #3d76b9; margin-left: 5px;\">删除</a>" +
				"</div>";
			$("#appendZLXMod").append(appendHtml);
			$.parser.parse('#appendZLXMod');
		}
    	
    	function addFJFY() {
    		var appendHtml = 
    			"<div style=\"margin-top: 5px; \">" +
		        	"<input class=\"easyui-textbox\" name=\"name\" style=\"width:400px\" data-options=\"prompt:'费用材料'\"/>" +
		        	"￥<input class=\"easyui-numberbox\" precision=\"2\" name=\"name\" style=\"width:60px\" data-options=\"prompt:'0.00'\"/>" +
					"<a href=\"javascript:;\" onclick = \"$(this).parent().remove();\" style=\" color: #3d76b9; margin-left: 5px;\">删除</a>" +
				"</div>";
			$("#appendFJFYMod").append(appendHtml);
			$.parser.parse('#appendFJFYMod');
		}
  	</script>
  	
  
    <script id="cfTempl_One_Mod" type="text/x-dot-template">
									<tr>
										<td><input style="width: 120px; height: 25px;"/></td>
										<td><input style="width: 10px; height: 25px;"/></td>
										<td><input style="width: 30px; height: 25px;"/></td>
										<td><input style="width: 30px; height: 25px;"/></td>
										<td><input style="width: 20px; height: 25px;"/><input style="width: 20px; height: 25px;"/></td>
										<td><input style="width: 20px; height: 25px;"/><input style="width: 20px; height: 25px;"/></td>
										<td>￥0.00</td>
										<td><a href="javascript:;" onclick = "$(this).parent().parent().remove();" style="color: #3d76b9;">删除</a></td>
									</tr>
	</script>
  	<script id="cfTemplMod" type="text/x-dot-template">
						<div style="background-color: #eee; margin-top: 5px; padding-left: 5px; padding-right: 5px;">
		            			<table border="0" width="100%" cellspacing="" cellpadding="" align="center" style=" text-align: center; background-color: #eee;">
									<tr height="40px">
										<th colspan="3" style="text-align: left;">处方1：</th>
										<th colspan="5" style="text-align: right;"><a href="javascript:;" onclick = "$(this).parent().parent().parent().parent().remove();" style="color: #3d76b9;">删除该处方</a></th>
									</tr>
									<tr height="25px">
										<td>药品名称</td>
										<td>组号</td>
										<td>用法</td>
										<td>用药频率</td>
										<td>单次剂量</td>
										<td>开药量</td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td><input style="width: 120px; height: 25px;"/></td>
										<td><input style="width: 10px; height: 25px;"/></td>
										<td><input style="width: 30px; height: 25px;"/></td>
										<td><input style="width: 30px; height: 25px;"/></td>
										<td><input style="width: 20px; height: 25px;"/><input style="width: 20px; height: 25px;"/></td>
										<td><input style="width: 20px; height: 25px;"/><input style="width: 20px; height: 25px;"/></td>
										<td>￥0.00</td>
										<td><a href="javascript:;" onclick = "$(this).parent().parent().remove();" style="color: #3d76b9;">删除</a></td>
									</tr>
									<tr>
										<td><input style="width: 120px; height: 25px;"/></td>
										<td><input style="width: 10px; height: 25px;"/></td>
										<td><input style="width: 30px; height: 25px;"/></td>
										<td><input style="width: 30px; height: 25px;"/></td>
										<td><input style="width: 20px; height: 25px;"/><input style="width: 20px; height: 25px;"/></td>
										<td><input style="width: 20px; height: 25px;"/><input style="width: 20px; height: 25px;"/></td>
										<td>￥0.00</td>
										<td><a href="javascript:;" onclick = "$(this).parent().parent().remove();" style="color: #3d76b9;">删除</a></td>
									</tr>
									<tr>
										<td><input style="width: 120px; height: 25px;"/></td>
										<td><input style="width: 10px; height: 25px;"/></td>
										<td><input style="width: 30px; height: 25px;"/></td>
										<td><input style="width: 30px; height: 25px;"/></td>
										<td><input style="width: 20px; height: 25px;"/><input style="width: 20px; height: 25px;"/></td>
										<td><input style="width: 20px; height: 25px;"/><input style="width: 20px; height: 25px;"/></td>
										<td>￥0.00</td>
										<td><a href="javascript:;" onclick = "$(this).parent().parent().remove();" style="color: #3d76b9;">删除</a></td>
									</tr>
									<tr height="40px">
										<td colspan="8" style="text-align: left;"><a href="javascript:;" onclick = "addCFOneMod(this);" style="color: #3d76b9;">添加药品</a></td>
									</tr>
								</table>
		            		</div>
    </script>
    <script type="text/javascript">

		function addCF(){
			var data = {
					title: "My title",
					name: "11",
					htmlText: "<i>html test</i>"
				};
			var pagefn = doT.template($("#cfTemplMod").text(), undefined, undefined);
			$("#appendCFMod").append(pagefn(data));
		}
		
		function addCFOneMod(table){
			var data = {
					title: "My title",
					name: "11",
					htmlText: "<i>html test</i>"
				};
			var pagefn = doT.template($("#cfTempl_One_Mod").text(), undefined, undefined);
			$(table).parent().parent().parent().find("tr").eq(-2).after(pagefn(data));
		}
	
		
		function newGuahao() {
			 backURL = 'sys/menzhen/menzhen_add.jsp';
			 var tab = $('#tab').tabs('getSelected'); 
			 tab.panel('refresh', "sys/guahao/guahao_add.jsp");
		 }
		
   </script>

  </body>
</html>
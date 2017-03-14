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
    <form id="check_form" method="post">
		<div style="margin-bottom: 13px">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#addCheck').dialog('open')" style="width: 100px">新建检查治疗项</a>&nbsp;
		</div>
	</form>

	<table id="check_list" class="easyui-datagrid" style="width: 99%"
		data-options="singleSelect:true" url="guahao/list" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="status" width="10%">检查治疗项名称</th>
				<th field="name" width="30%">成本价</th>
				<th field="name" width="30%">销售价</th>
				<th field="userId" data-options="formatter:formatCheck"  width="15%">操作</th>
			</tr>
		</thead>
	</table>
	
    <div id="addCheck" class="easyui-dialog" title="新建检查治疗项" style="width:330px;height:250px;"
            data-options="
            	closed:true,
                buttons: [{
                    text:'确定',
                    width:100,
                    handler:function(){
                        $('#addCheck').dialog('close');
                    }
                },{
                    text:'取消',
                    width:100,
                    handler:function(){
                        $('#addCheck').dialog('close');
                    }
                }]
            ">
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'检查项名称：'" />
            </div>
            <div style="margin-top: 25px;">
            	<input class="easyui-numberbox" precision="2" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'成本价：'" />
            </div>
            <div style="margin-top: 25px;">
            	<input class="easyui-numberbox" precision="2" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'销售价：'" />
            </div>
    </div>	
     <div id="modCheck" class="easyui-dialog" title="修改检查治疗项" style="width:330px;height:250px;"
            data-options="
            	closed:true,
                buttons: [{
                    text:'确定',
                    width:100,
                    handler:function(){
                        $('#modCheck').dialog('close');
                    }
                },{
                    text:'取消',
                    width:100,
                    handler:function(){
                        $('#modCheck').dialog('close');
                    }
                }]
            ">
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'检查项名称：'" />
            </div>
            <div style="margin-top: 25px;">
            	<input class="easyui-numberbox" precision="2" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'成本价：'" />
            </div>
            <div style="margin-top: 25px;">
            	<input class="easyui-numberbox" precision="2" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'销售价：'" />
            </div>
    </div>	
      
	<script>
	
	 $('#check_list').datagrid({
	 	onLoadSuccess:function(data){  
	         $('.checkModClass').linkbutton({text:'编辑',plain:true});  
	         $('.checkDelClass').linkbutton({text:'删除',plain:true});  
	     }  
	 });
	 function formatCheck(val,row){
		 var cz = "<a href=\"javascript:void(0)\" class=\"checkModClass\" onclick=\"modCheckData('" + val + "')\" style=\"width:40px;height:20px;color: #3d76b9;\"></a>" + 
		 		  "<a href=\"javascript:void(0)\" class=\"checkDelClass\" onclick=\"delCheckData('" + val + "')\" style=\"width:40px;height:20px;color: #3d76b9;\"></a>";
	 	return cz;
	 }
	 
	 function delCheckData(val){
	 	$.messager.confirm('删除', '你确定要删除该条数据吗？', function(r){
	         if (r){
	             alert('OK');
	         }
	     });
	 }
	 function modCheckData(val){
		 $('#modCheck').dialog('open');
	 }
	 </script>   

</body>
</html>
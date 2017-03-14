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
    <form id="dept_form" method="post">
		<div style="margin-bottom: 13px">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#addDept').dialog('open')" style="width: 80px">新建科室</a>&nbsp;
		</div>
	</form>

	<table id="dept_list" class="easyui-datagrid" style="width: 99%"
		data-options="singleSelect:true" url="guahao/list" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="status" width="10%">科室名称</th>
				<th field="name" width="70%">科室成员</th>
				<th field="userId" data-options="formatter:formatDept"  width="15%">操作</th>
			</tr>
		</thead>
	</table>
	
    <div id="addDept" class="easyui-dialog" title="新建科室" style="width:330px;height:150px;"
            data-options="
            	closed:true,
                buttons: [{
                    text:'确定',
                    width:100,
                    handler:function(){
                        $('#addDept').dialog('close');
                    }
                },{
                    text:'取消',
                    width:100,
                    handler:function(){
                        $('#addDept').dialog('close');
                    }
                }]
            ">
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'科室名称：'" />
            </div>
    </div>	
     <div id="modDept" class="easyui-dialog" title="修改科室" style="width:330px;height:150px;"
            data-options="
            	closed:true,
                buttons: [{
                    text:'确定',
                    width:100,
                    handler:function(){
                        $('#modDept').dialog('close');
                    }
                },{
                    text:'取消',
                    width:100,
                    handler:function(){
                        $('#modDept').dialog('close');
                    }
                }]
            ">
            <div style="margin-top: 25px;">
            	<input class="easyui-textbox" name="name" style="width: 300px" data-options="prompt:'', labelAlign:'right', label:'科室名称：'" />
            </div>
    </div>	
      
	<script>
	
	 $('#dept_list').datagrid({
	 	onLoadSuccess:function(data){  
	         $('.deptModClass').linkbutton({text:'编辑',plain:true});  
	         $('.deptDelClass').linkbutton({text:'删除',plain:true});  
	     }  
	 });
	 function formatDept(val,row){
		 var cz = "<a href=\"javascript:void(0)\" class=\"deptModClass\" onclick=\"modDeptData('" + val + "')\" style=\"width:40px;height:20px;color: #3d76b9;\"></a>" + 
		 		  "<a href=\"javascript:void(0)\" class=\"deptDelClass\" onclick=\"delDeptData('" + val + "')\" style=\"width:40px;height:20px;color: #3d76b9;\"></a>";
	 	return cz;
	 }
	 
	 function delDeptData(val){
	 	$.messager.confirm('删除', '你确定要删除该条数据吗？', function(r){
	         if (r){
	             alert('OK');
	         }
	     });
	 }
	 function modDeptData(val){
		 $('#modDept').dialog('open');
	 }
	 </script>  

</body>
</html>
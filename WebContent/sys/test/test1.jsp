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

	<h2>Basic Form</h2>
    <p>Fill the form and submit it.</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" title="New Topic" style="width:100%;max-width:400px;padding:30px 60px;">
        <form id="ff" method="post">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="name" style="width:100%" data-options="label:'Name:',required:true"/>
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="pwd" style="width:100%" data-options="label:'pwd:',required:true"/>
            </div>
        </form>
        <div style="text-align:center;padding:5px 0">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">Clear</a>
        </div>
    </div>
    
    <table id="tt" class="easyui-datagrid" style="width: 100%"
		        		data-options="singleSelect:true"
			            url="guahao/list"
			            rownumbers="false" pagination="true">
			        <thead>
			            <tr>
			           		<th data-options="field:'ck',checkbox:true"></th>
			                <th field="sex"  width="5%">2222</th>
			                <th field="age"  width="5%">33333</th>
			                <th field="userId" data-options="formatter:formatCZ"  width="10%">操作</th>
			            </tr>
			        </thead>
			    </table>
    
    <script>
    	// ======================  datagrid  =========================================
    	//需要放到最后，否则无效，因为在页面中你先进行了data-options。
	    $('#tt').datagrid({
			onClickRow: function(index,row){
				console.log(row);
	    	},
	    	onLoadSuccess:function(data){  
	            $('.czClass').linkbutton({text:'删除',plain:true,iconCls:'icon-remove'});  
	        }  
	    });
	    function formatCZ(val,row){
	    	return "<a href=\"javascript:void(0)\" class=\"czClass\" onclick=\"delData('" + val + "')\" style=\"width:80px\"></a>";
	    }
	    
	    function delData(val){
	    	$.messager.confirm('删除', '你确定要删除该条数据吗？', function(r){
                if (r){
                    alert('OK');
                }
            });
	    }
	 	// ======================  datagrid  =========================================
		 
        function submitForm(){
        	$('#ff').form('submit', {
                url:'test/save',
                onSubmit: function(param){
                	// param.p1 = 'value1';可以添加额外的参数
                    // 在提交之前触发，返回false以阻止提交操作,可以做一些检查。                    
                	var isValid = $(this).form('validate');
            		if (!isValid){
            			$.messager.progress('close');	// hide progress bar while the form is invalid
            		}
            		return isValid;            		
                },
                onBeforeLoad:function(param){
                	//在请求加载数据之前触发。 返回false以取消此操作。
                	$.messager.progress();
                },
                success:function(data){
                	// alert(data);
                	// change the JSON string to javascript object
                	var data = eval('(' + data + ')'); 
                	if (data.flag == 'ok'){
                        alert(data.msg);
                    }
                	$.messager.progress('close');
                },
                onLoadError:function(){
                	$.messager.progress('close');
                }
        	});
        }
        
        function clearForm(){
            $('#ff').form('clear');
        }
    </script>
   
</body>
</html>
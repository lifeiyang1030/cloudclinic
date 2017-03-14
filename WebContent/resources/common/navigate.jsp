<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/resources/common/taglibs.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

</head>
<body>
     <div class="cloudClinic-header flt">
        <div class="header-content" id="header-content">
        		<div class="header-content-logo " style="margin-left: -10px;">
<!--         		<img src="images/header_logo.png" class="content-logo-pic" height="44" alt=""/> -->
        		<p style="font-size: 20px; margin-top: -10px; " >智慧云诊室</p>
        		<p style="font-size: 12px; margin-top: -38px; text-align: center; ">岛琴诊所</p>
        		</div> 
        		
        		<nav class="header-nav">
        			<a href="main/guahao" id = "guahao_bar" class="nav-list nav-registration ">挂号</a>
        			<a href="main/menzhen" id = "menzhen_bar" class="nav-list nav-clinic ">门诊</a>
        			<a href="main/feiyong" id = "feiyong_bar" class="nav-list nav-chargeDrug ">收费</a>
       				<a href="main/fayao" id = "fayao_bar" class="nav-list nav-chargeDrug ">发药</a>
        			<a href="main/yaopin" id = "yaopin_bar" class="nav-list nav-drugManage ">药品管理</a>
        			<a href="main/xitongguanli" id = "xitongguanli_bar" class="nav-list nav-clinicMana">诊所管理</a>
        		</nav>
        		<div class="header-user">
        				<a id = "toolbar_a" class="easyui-tooltip" href="javascript:void(0)" data-options="
					                    hideEvent: 'none',
					                    content: function(){
					                        return $('#user_toolbar');
					                    },
					                     onShow: function(){
							                    var t = $(this);
							                    t.tooltip('tip').unbind().bind('mouseenter', function(){
							                        t.tooltip('show');
							                    }).bind('mouseleave', function(){
							                        t.tooltip('hide');
							                    });
							                    $('#toolbar_a').unbind().bind('mouseenter', function(){
							                        t.tooltip('show');
							                    }).bind('mouseleave', function(){
							                        t.tooltip('hide');
							                    });
							                }
					                " style="color: white; font-size: 16px; margin-right: 15px; " >jxl</a>
					    <div style="display:none">
					        <div id="user_toolbar">
					            <a href="main/user" class="easyui-linkbutton" data-options="plain:true">账号信息</a><br />
					            <a href="login/" class="easyui-linkbutton" data-options="plain:true">退出登录</a>
					        </div>
					    </div>
        		</div>
        </div>
    </div>
    
    <script language="javascript" type="text/javascript">
	    var url= window.location.href;
	    var type = url.substring(url.lastIndexOf('/') + 1);
		$("nav").find("a").each(function(){
			$(this).removeClass("nav-check"); 
		});
		$("#" + type + "_bar").addClass("nav-check"); 
	</script>

</body>
</html>
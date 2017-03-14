/**
 * main/mainpage.jsp页面js
 */

var formData, divTabs;
var strArrIndex = ""; 
var strArrIframeID = "";

$(document).ready(function (){
	formData = $('#formData');
	divTabs = $('#divTabs');
	
	InitDivDialogMsg();
	
	divTabs.tabs({
		onBeforeClose:function(title, index){
			var arrTmp0 = strArrIframeID.split(',');
			var arrTmp1 = strArrIndex.split(',');
			var iLen = arrTmp0.length;
			
			var strTmp0 = "";
			var strTmp1 = "";
			var strDelIframe = "";
			
			for (var i = 0; i < iLen; i++)
			{
				if (arrTmp1[i] != index)
				{
					strTmp0 += arrTmp0[i] + ",";
					strTmp1 += arrTmp1[i] + ",";
				}
				else
				{
					strDelIframe = arrTmp0[i];
				}
			}
			
			strArrIframeID = strTmp0.substring(0, strTmp0.length - 1);
			strArrIndex = strTmp1.substring(0, strTmp1.length - 1);
			
			if($('#' + strDelIframe)[0])
			{
				var objDelIframe = $('#' + strDelIframe);
				objDelIframe[0].contentWindow.document.write('');
				objDelIframe[0].contentWindow.close();
				objDelIframe.remove();
				if($.browser.msie){ CollectGarbage(); }
			}
		}
	});
	
	AddTab("iframe001001", "管理员列表", "sysuser/sysuser_list", false);
});

/* 打开一个新的Tab
 * strIframeID：Iframe的ID。注：不能有重复
 * strTitle：Tab的标题，全局必须唯一。
 * strURL：载入页面的action
 * isClose：是否允许关闭Tab。
 */
function AddTab(strIframeID, strTitle, strURL, isClose)
{
	strIframeID = $.trim(strIframeID);
	
	if (divTabs.tabs('exists', strTitle)){
		divTabs.tabs('select', strTitle);
	}
	else
	{	
		ShowDialogMsg('progress', constLoadPage);
		
		var strCont = '<iframe id="' + strIframeID + '" scrolling="auto" frameborder="0"  src="' + strURL + '" style="width:100%; height:100%;"></iframe>';
			
		divTabs.tabs('add', {
		    title: strTitle,
		    closable: isClose,
		    selected: true,
		    content: strCont
		});
		
	}
}

/* 关闭当前打开的Tab */
function CloseCurrentTab()
{
	var tabSelected = divTabs.tabs('getSelected');
	var indexSelected = divTabs.tabs('getTabIndex', tabSelected);
	divTabs.tabs('close', indexSelected);
}

/* 根据Title查找某个Tab中的Iframe 
 * strTitle：选项卡面板的'title'
 */
function FindIframeByTitle(strTitle)
{
	if (divTabs.tabs('getTab',strTitle) == null)
	{
		return null;
	}
	else
	{
		return divTabs.tabs('getTab',strTitle).find('iframe').first();
	}
}

/* 重新载入页面数据
 * strIframeID：Iframe的ID。
 * strURL：载入页面的action
 */
function ReLoadData(strIframeID, strURL)
{
	var objIframe = $('#' + strIframeID);
	if(objIframe[0])
	{
		ShowDialogMsg('progress', constLoadData);
		objIframe.attr('src', strURL);
	}
}

/* 退出系统 */
function LoginOut()
{
	BaseShowDialogMsg('question', '您确定要退出系统吗？', 400, 150, '退出', 'icon-ok', '取消', 'icon-cancel');
	aDialogLeftButton.one('click', function(){
		formData.attr('action','userfree/exit');
		formData.submit();
	});
	aDialogRightButton.one('click', function(){
		aDialogLeftButton.unbind();
		divDialogMsg.window('close');
	});
}
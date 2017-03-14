var constOk = "操作成功。";
var constError = "抱歉，网络异常，请稍后再试！";
var constSaveData = "请稍后，系统正在保存数据...";
var constDelData = "请稍后，系统正在删除数据...";
var constLoadData = "请稍后，系统正在载入数据...";
var constLoadPage = "请稍后，系统正在加载指定的页面...";
var constProcess = "请稍后，系统正在处理...";



var aDialogLeftButton, aDialogRightButton;
var orderCol = null, orderType = null;

$.extend($.fn.validatebox.defaults.rules, {
	phoneNo: {
		validator: function(value){
        	var reg = new RegExp("^(13|14|15|17|18)[0-9]{9}$");
            return reg.test(value);
        },
        message: '手机号码格式不正确。'
    },
    date: {
    	validator: function(value){
    		var strArr = value.split("-");
    		if(strArr.length == 3 && strArr[0].length == 4 && strArr[1].length == 2 && strArr[2].length == 2)
    		{
    			var rlt = new Date(value);
    			
    			if(rlt.getFullYear().toString() == strArr[0])
				{
    				var m = rlt.getMonth() + 1;
    				m = m < 10 ? "0" + m.toString() : m.toString() ;
    				if(m == strArr[1])
					{
    					var d = rlt.getDate();
        				d = d < 10 ? "0" + d.toString() : d.toString() ;
        				if(d == strArr[2])
    					{
        					return true;
    					}
        				else
    					{
        					return false;
    					}
					}
    				else
					{
    					return false;
					}
				}
    			else
				{
    				return false;
				}
    		}
    		else
			{
    			return false;
			}
        },
        message: '请按 “1900-01-01” 这样的格式输入日期。'
    },
    noLessToday: {
    	validator: function(value){
    		var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth() + 1;
			var day = now.getDate();
    		var today = year + "-" + month + "-" + day;
			var d1 = $.fn.datebox.defaults.parser(today);
			var d2 = $.fn.datebox.defaults.parser(value);
			return d1 <= d2;
		},
		message: '不能选择今天之前的日期。'
    },
    noLessSpecifiedDate: {
    	validator: function(value, param){
    		var obj = $(param[0]);//获取另一个需要比较的日期控件
    		var objValue = obj.datebox('getValue');
    		var d1 = $.fn.datebox.defaults.parser(objValue);
			var d2 = $.fn.datebox.defaults.parser(value);
			return d1 <= d2;
    	},
		message: '不能选择第一个日期之前的日期。'
    }
});



/* 加入收藏夹
 * url：收藏网址
 * description：网站名字
 */
function AddBookMark(url, description) 
{
	var ctrl = (navigator.userAgent.toLowerCase()).indexOf('mac') != -1 ? 'Command/Cmd' : 'CTRL';
	if (document.all) 
	{
		window.external.addFavorite(url, description);
	}
	else if (window.sidebar)
	{
		window.sidebar.addPanel(description, url, '');
	}
	else
	{
		alert('添加失败\n您可以尝试通过快捷键' + ctrl + ' + D 加入到收藏夹~');
	}
}



/* 初始化仿Checkbox的span控件
 * Obj：仿checkbox的span标签对象
 */
function InitSpanCheckBox(obj)
{
	obj.on("click", function(){
		if(obj.hasClass("spItemUnCheck"))
		{
			obj.removeClass("spItemUnCheck").addClass("spItemChecked");
		}
		else if(obj.hasClass("spItemChecked"))
		{
			obj.removeClass("spItemChecked").addClass("spItemUnCheck");
		}
	});
}

/* 选择框点击事件
 * objContainer：选择框所属的容器对象
 * objSpItem：选择框对象
 * objSpAll：选择框所属的容器对象中的全选框对象
 */
function spCheckItemClick(objContainer, objSpItem, objSpAll)
{
	if(objSpItem.hasClass("spItemChecked"))
	{
		objSpItem.removeClass("spItemChecked").addClass("spItemUnCheck");
		objSpAll.removeClass("spAllChecked").addClass("spAllUnCheck");
	}
	else
	{
		objSpItem.removeClass("spItemUnCheck").addClass("spItemChecked");
		if(objContainer.find('span.spItemUnCheck').length == 0)
		{
			objSpAll.removeClass("spAllUnCheck").addClass("spAllChecked");
		}
	}
}

/* 全选选择框点击事件
 * objTab：全选框所属的table对象
 * objSpAll：全选框对象
 */
function spCheckAllClick(objTab, objSpAll)
{
	if(objSpAll.hasClass("spAllChecked"))
	{
		objSpAll.removeClass("spAllChecked").addClass("spAllUnCheck");
		objTab.find('span.spItemChecked').removeClass("spItemChecked").addClass("spItemUnCheck");
	}
	else
	{
		objSpAll.removeClass("spAllUnCheck").addClass("spAllChecked");
		objTab.find('span.spItemUnCheck').removeClass("spItemUnCheck").addClass("spItemChecked");
	}
}

/* 全部选择按钮点击事件
 * objContainer：选择框所属的容器对象
 */
function spCheckAll(objContainer)
{
	objContainer.find('span.spAllUnCheck').removeClass("spAllUnCheck").addClass("spAllChecked");
	objContainer.find('span.spItemUnCheck').removeClass("spItemUnCheck").addClass("spItemChecked");
}

/* 全部取消按钮点击事件
 * objContainer：选择框所属的容器对象
 */
function spUnCheckAll(objContainer)
{
	objContainer.find('span.spAllChecked').removeClass("spAllChecked").addClass("spAllUnCheck");
	objContainer.find('span.spItemChecked').removeClass("spItemChecked").addClass("spItemUnCheck");
}

/* 获取容器中选中的选择框的ID
 * objContainer：选择框所属的容器对象
 * 注：span对象选中的CSS class必须为spItemChecked；
 * 	  id值必须为span对象的ID；
 * strReplace：要替换的ID的前缀或后缀
 */
function GetCheckedItem(objContainer, strReplace)
{
	var strIDList = "";
	var objArr = objContainer.find('span.spItemChecked');
	if(objArr.length > 0)	
	{
		objArr.each(function(){
			var strID = $.trim($(this).attr('id'));
			if(strReplace == "" || strReplace == null)
			{
				// do nothing
			}
			else if(strID.indexOf(strReplace) == 0)
			{
				strID = strID.substr(strReplace.length);
			}
			else if(strID.lastIndexOf(strReplace) == strID.length - strReplace.length)
			{
				strID = strID.substring(0, strID.length - strReplace.length);
			}
			strIDList += strID + ",";
		});
		
		strIDList = strIDList.substring(0, strIDList.length - 1);
	}
	return strIDList;
}



/* 单选框点击事件
 * objContainer：单选框所属的容器对象
 * objSpItem：选择框对象
 */
function spRadioItemClick(objContainer, objSpItem)
{
	if(objSpItem.hasClass("spRadioChecked"))
	{	
		// do nothing
	}
	else
	{
		objContainer.find('span.spRadioChecked').removeClass("spRadioChecked").addClass("spRadioUnCheck");
		objSpItem.removeClass("spRadioUnCheck").addClass("spRadioChecked");
	}
}

/* 获取容器中选中的单选框的ID
 * objContainer：选择框所属的容器对象
 * 注：span对象选中的CSS class必须为spRadioChecked；
 * 	  id值必须为span对象的ID；
 * strReplace：要替换的ID的前缀或后缀
 */
function GetRadioItem(objContainer, strReplace)
{
	var strID = "";
	var objArr = objContainer.find('span.spRadioChecked');
	if(objArr.length == 1)	
	{
		var objRadio = objArr.first();
		strID = $.trim(objRadio.attr('id'));
		if(strReplace == "" || strReplace == null)
		{
			// do nothing
		}
		else if(strID.indexOf(strReplace) == 0)
		{
			strID = strID.substr(strReplace.length);
		}
		else if(strID.lastIndexOf(strReplace) == strID.length - strReplace.length)
		{
			strID = strID.substring(0, strID.length - strReplace.length);
		}
	}
	return strID;
}



/* 显示带遮罩的提示框(点击按钮后关闭)
 * strIcon：消息类型
 * strText：消息内容
 */
function ShowDialogWithClose(strIcon, strText)
{
	BaseShowDialogMsg(strIcon, strText, 300, 150, "关闭", "");
	aDialogLeftButton.one('click', CloseDialogMsg);
}

/* 显示带遮罩的提示框(点击按钮后关闭)
 * strIcon：消息类型
 * strText：消息内容
 */
function ShowDialogWithIKnow(strIcon, strText)
{
	if (strIcon == "error")
	{
		if(strText == "timeover")
		{
			BaseShowDialogMsg(strIcon, "操作失败，由于您长时间未有任何操作，已经被系统自动退出，请重新登录。", 300, 150, "我知道了", "");
			aDialogLeftButton.one('click', function(){
				if(window.top == window.self)
				{
					window.location.href = strAPath + "usersfree/login";
				}
				else
				{
					window.parent.window.location.href = strAPath + "usersfree/login";
				}
			});
		}
		else
		{
			BaseShowDialogMsg(strIcon, constError, 300, 150, "我知道了", "");
			aDialogLeftButton.one('click', CloseDialogMsg);
		}
	}
	else
	{
		BaseShowDialogMsg(strIcon, strText, 300, 150, "我知道了", "");
		aDialogLeftButton.one('click', CloseDialogMsg);
	}
}

/* 显示带遮罩的提示框
 * strIcon：消息类型
 * strText：消息内容
 * iWidth：提示框宽度
 * iHeight：提示框高度
 * btnLeftText：左边按钮文字
 * btnRightText：右边按钮文字
 * 注意：如果需要给按钮绑定事件，必须在divDialogMsg显示后绑定才有效。
 */
function BaseShowDialogMsg(strIcon, strText, iWidth, iHeight, btnLeftText, btnRightText)
{
	CloseDialogMsg();
	
	var strHTML = "";
	strHTML += "<div id=\"divDialogMsg\" class=\"easyui-window\">";
	strHTML += "<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"5\" style=\"margin-top:10px;\">";
	strHTML += "<tr><td style=\"width:48px; height:48px; text-align:center; vertical-align:middle;\">";
	switch (strIcon)
    {
        case 'error': strHTML += "<img src=\"resources/images/common/error.png\" />"; break;
        case 'info': strHTML += "<img src=\"resources/images/common/info.png\" />"; break;
        case 'ok': strHTML += "<img src=\"resources/images/common/ok.png\" />"; break;
        case 'progress': strHTML += "<img src=\"resources/images/common/progress.gif\" />"; break;
        case 'question': strHTML += "<img src=\"resources/images/common/question.png\" />"; break;
        case 'warning': strHTML += "<img src=\"resources/images/common/warning.png\" />"; break;
    }	
	strHTML += "</td><td>" + strText + "</td></tr>";
	strHTML += "<tr><td colspan=\"2\" style=\"text-align:center;\">";
	if($.trim(btnLeftText) != "")
	{
		strHTML += "<a id=\"aDialogLeftButton\" class=\"easyui-linkbutton l-btn\" href=\"javascript:void(0);\"><span class=\"l-btn-left\"><span class=\"l-btn-text\">" +  $.trim(btnLeftText) + "</span></span></a>";
	}
	if($.trim(btnRightText) != "")
	{
		strHTML += "<a id=\"aDialogRightButton\" class=\"easyui-linkbutton l-btn\" href=\"javascript:void(0);\" style=\"margin-left:20px;\"><span class=\"l-btn-left\"><span class=\"l-btn-text\">" +  $.trim(btnRightText) + "</span></span></a>";
	}
	
	strHTML += "</td></tr>";
	strHTML += "</table>";
	strHTML += "</div>";

	formData.after(strHTML);
	
	$('#divDialogMsg').window({
		width:iWidth,
		height:iHeight,
		title:'',
		collapsible:false, 
		minimizable:false, 
		maximizable:false, 
		closable:false, 
		draggable:false, 
		resizable:false, 
		modal:true
	});
	
	aDialogLeftButton = $('#aDialogLeftButton');
	aDialogRightButton = $('#aDialogRightButton');
	$('#divDialogMsg').css('border-top-width', '1px');
    
    $('#divDialogMsg').window('center');
}

/*关闭带遮罩的提示框*/
function CloseDialogMsg()
{
	if($('#divDialogMsg')[0])
	{
		//销毁提示框
		aDialogLeftButton = null;
		aDialogRightButton = null;
		$('#divDialogMsg').window('destroy');
	}
}



/*
 * 对指定列的数据进行排序
 * objTab：需要排序的Table
 * iRowIndex:列头所在行索引
 * iColIndex：列索引
 * strDataType：列的数据类型。(Number, Date, String)
 */
function SortData(objTab, iRowIndex, iColIndex, strDataType)
{
	var arrayTmp0 = new Array();
	var objTbody = objTab.find('tbody').first();
	var objTrHead = objTab.find('thead').first().find('tr').eq(iRowIndex);
	
	objTbody.find('tr').each(function(i){
		var arrayTmp1 = new Array();
		arrayTmp1[0] = $(this).find('td').eq(iColIndex).text();
		arrayTmp1[1] = $(this);
		arrayTmp0[i] = arrayTmp1;
	});
	
	switch(strDataType)
	{
		case "Number":
		case "Date":
			
			arrayTmp0.sort(function(a, b){
				var aTmp = ConvertData(a[0], strDataType);
				var bTmp = ConvertData(b[0], strDataType);
				
				if(aTmp < bTmp)
				{
					return -1;
				}
				else if(aTmp > bTmp)
				{
					return 1;
				}
				else
				{
					return 0;
				}
			});
			
			break;
		case "String":
			
			arrayTmp0.sort(function(a, b){
				var aTmp;
				var bTmp;
				
				if(a == null || typeof(a) == "undefined" || a[0] == null || typeof(a[0]) == "undefined" || $.trim(a[0]) == "")
				{
					aTmp = "";
				}
				else
				{
					aTmp = a[0];
				}
				
				if(b == null || typeof(b) == "undefined" || b[0] == null || typeof(b[0]) == "undefined" || $.trim(b[0]) == "")
				{
					bTmp = "";
				}
				else
				{
					bTmp = b[0];
				}
				
				return aTmp.localeCompare(bTmp);
			});
			
		default:
			break;
	}
	
	objTbody.empty();
	
	if(orderCol != iColIndex)
	{
		orderType = "asc";
	}
	else
	{
		if (orderType == "asc")
		{ 
			orderType = "desc"; 
		}
		else if (orderType == "desc")
		{ 
			orderType = "asc"; 
		}
	}
	orderCol= iColIndex;
	
	if (orderType == "asc")
	{
		for(var i = 0; i < arrayTmp0.length; i++)
		{
			objTbody.append(arrayTmp0[i][1]);
		}
	}
	else if(orderType == "desc")
	{
		for(var i = arrayTmp0.length - 1; i >=0; i--)
		{
			objTbody.append(arrayTmp0[i][1]);
		}
	}
	
	objTrHead.find('span.spSortAsc').removeClass().addClass("spSort");
	objTrHead.find('span.spSortDesc').removeClass().addClass("spSort");
	if (orderType == "asc") 
	{
		objTrHead.find('td').eq(iColIndex).find('span').first().removeClass().addClass("spSortAsc");
	} 
	else 
	{
		objTrHead.find('td').eq(iColIndex).find('span').first().removeClass().addClass("spSortDesc");
	}
}

/*
 * 数据类型转换
 * strData：数据
 * strType：数据类型。(Number, Date)
 */
function ConvertData(strData, strType)
{
	var re = null;
	switch(strType)
	{
		case "Number":
			if($.trim(strData) == "")
			{
				re = Number.POSITIVE_INFINITY;
			}
			else
			{
				re = Number(strData);
				if(isNaN(re))
				{
					re = Number.POSITIVE_INFINITY;
				}
			}
			break;
		case "Date":
			var strData = strData.replace(/-/g,"/");
			re = new Date(Date.parse(strData));
			if(re == "Invalid Date")
			{
				re = new Date(Date.parse("1900/01/01 00:00:01"));
			}
			break;
		default:
			break;
	}
	return re;
}

/*获取当前日期：yyyy-MM-dd*/
function GetToday()
{
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var day = now.getDate();
	var today = year + "-" + month + "-" + day;
	return today;
}
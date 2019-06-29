/*
* 这是用来打开一个新的标签的公共js
* 
*
**/

function openNewTab(url, title)
{
	var tabs = parent.$('#mainTabs');
	var opts = {
		title : title,
		closable : true,
		iconCls : "",
		content : sy.formatString('<iframe src="{0}" allowTransparency="true" style="border:0;width:100%;height:99%;" frameBorder="0"></iframe>', url),
		border : false,
		fit : true
	};
	if (tabs.tabs('exists', opts.title)) {
		tabs.tabs('close', opts.title);
		tabs.tabs('add', opts);
	}else{
		tabs.tabs('add', opts);
	}

}


function closeTab(tabTitle){
	var tabs = parent.$('#mainTabs');
	tabs.tabs('close', tabTitle);
}
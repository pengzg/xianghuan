 function findSelections(checkboxName, idName) {  //从列表中找出选中的id值列表
    var elementCheckbox = document.getElementsByName(checkboxName);  //通过name取出所有的checkbox
    var number = 0;  //定义游标
    var ids = null;  //定义id值的数组
    for(var i=0;i<elementCheckbox.length;i++){  //循环checkbox组
        if(elementCheckbox[i].checked) {  //如果被选中
            number += 1;  //游标加1
            if(ids == null) {
                ids = new Array(0);
            }
            ids.push(elementCheckbox[i].value);  //加入选中的checkbox
        }
    }
    return ids;
 }
 
 function checkSelections(ids) { 
	 if(ids == null) {  //如果ids为空
		alert('请选择数据！');
		return false;
	 }
	if(ids.length > 1) {  //如果ids有2条以上的纪录
		alert('只能选择一条数据！');
		return false;
	}
	return true;
 }
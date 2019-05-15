<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/metro-green/easyui.css"  />
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){
	init();
});

function init(){
	$("#showT").datagrid({
		url:"showTracker",
		method:"post",
		pagination:true,
		fitColumns : true,
		singleSelect : true,
		toolbar:'#Tbar',
		
	})
}

function formattercaozuo(value,row,index){
	return "<a href='javascript:void(0)' onclick='look("+index+")'>查看</a> "
}
 
/* 查看 */
function look(index){
	var data=$("#showT").datagrid("getData");
	var row=data.rows[index];
	$("#lookfrm").form("load",row);
	$("#lookdialog").dialog("open")
}
function close(){
	$("#lookdialog").dialog("close");
}

</script>
</head>

<body>
	<table id="showT" class="easyui-datagrid">   
    <thead>   
        <tr>   
            <th data-options="field:'student.stu_name',title:'学生姓名'"></th>   
            <th data-options="field:'t_beginTime',title:'跟踪开始时间'"></th>
            <th data-options="field:'t_finishTime',title:'跟踪结束时间'"></th>
            <th data-options="field:'t_huiFang',title:'回访情况'"></th>
            <th data-options="field:'t_fangShi',title:'跟踪方式'"></th>
            <th data-options="field:'student.stu_id',title:'学号'"></th>
            <th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
        </tr>   
    </thead>   
</table> 

<div id="Tbar">
<form class="easyui-form" id="barfrm">
			<label for="stu_name">学生姓名:</label>   
            <input class="easyui-validatebox" type="text" id="tracker.student.stu_name" data-options="required:true" />
        	<label for="name">跟踪开始时间:</label>  
        	<input class="easyui-validatebox" type="text" id="t_beginTime" data-options="required:true"/>
        	<label for="name">跟踪结束时间:</label>   
        	<input class="easyui-validatebox" type="text" id="t_finishTime" /> 
            <br>    
            <label for="name">回访情况:</label>   
        	<input class="easyui-validatebox" type="text" id="t_huiFang" />
        	
        	<label for="name">跟踪方式:</label>
            <select id="t_fangShi" class="easyui-combobox" name="dept" style="width:200px;">   
            <option value="上门">上门</option>   
            <option value="电话">电话</option>      
            </select>       	
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="init()" data-options="iconCls:'icon-search'">搜索</a>
</form>
</div> 

<div  id="lookdialog" class="easyui-dialog" data-options="modal:true,closed:true,buttons:[
	{
	text:'关闭',
	handler:function(){
		close();
		}
	}
	]">
		<form id="lookfrm" class="easyui-form">
		      <div>
			  <label for="name">学生姓名:</label>   
	          <input class="easyui-validatebox" disabled="disabled" name="stu_name" type="text" data-options="required:true" />   
			  </div>
			  <div>
			  <label for="name">跟踪开始时间:</label>   
	          <input class="easyui-validatebox" name="t_beginTime" type="text" id="updatename" data-options="required:true" /> 
	          </div>
	           <div>
	          <label for="name">跟踪结束时间:</label>   
	          <input class="easyui-validatebox" name="t_finishTime" type="text" data-options="required:true" />
	          </div>
	           <div>
	          <label for="name">跟踪方式:</label>   
	          <input class="easyui-validatebox" name="t_huiFang" type="text" data-options="required:true" />
	          </div>
	           <div>
	          <label for="name">回访情况:</label>   
	          <input class="easyui-validatebox" name="t_fangShi" type="text" data-options="required:true" />
	          
		</form>
	</div>

 









</body>
</html>
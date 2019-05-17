<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.3/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="js/jquery-easyui-1.4.3/themes/metro-green/easyui.css" />
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function(){
	initUsery();
	
})

function initUsery(){

	$("#selUsery").datagrid({
		url : 'selUsery',
		method : 'post',
		//fitColumns : true,
		pagination : true,
		toolbar:"#bar",
		queryParams:{
			u_loginName:$("#u_loginName").val(),
			u_isQianDao:$("#u_isQianDao").combobox("getValue"),
			/* u_clockinTime:$('#u_clockinTime').datetimebox('getValue'),
			u_clockoutTime:$('#u_clockoutTime').datetimebox('getValue'), */
			
			}

		});
		$("#bar-frm").form("reset");
	
}
function formatteru_isQianDao(value,row,index) {
	return row.u_isQianDao==1? "已签到":"未签到";
}
function formattercaozuo(value,row,index){
	return "<a href='javascript:void(0)' onclick='updateUsery("+index+")'>修改状态</a>"
}

	


</script>
</head>
<body>
	<table id="selUsery" class="easyui-datagrid" >
		<thead>
			<tr>
				<th data-options="field:'u_id',title:'bId'" >u_id</th>
				<th data-options="field:'u_loginName',title:'u_loginName'">账户</th>
				<th data-options="field:'u_clockinTime',title:'u_clockinTime'" >打卡上班</th>
				<th data-options="field:'u_clockoutTime',title:'u_clockoutTime'">打卡下班</th>
				<th data-options="field:'u_isQianDao',title:'u_isQianDao',formatter:formatteru_isQianDao">签到状态</th>
				 <th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo">操作</th>
			</tr>
		</thead>
			<!-- 搜索 -->
	
	<div id="bar">
		<form id="bar-frm">

		  <label for="name">用户名:</label>   
          <input class="easyui-validatebox" type="text" id="u_loginName" /> 
         <!--    <label for="name">打卡时间:</label>   
          <input class="easyui-datetimebox" name="u_clockinTime"  id="u_clockinTime" >——
        	<input class="easyui-datetimebox" name="u_clockoutTime"  id="u_clockoutTime" >
        	  -->
            <label for="name">是否签到:</label>   
	       <select class="easyui-combobox" id="u_isQianDao" name="u_isQianDao">   
			    <option value="">--请选择--</option>
			    <option value="1">已签到</option>   
			    <option value="0">未签到</option>   
			<select>

          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initUsery()">搜索</a> 
		</form>
	</div>

</body>
</html>
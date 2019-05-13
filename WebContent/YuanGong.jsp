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
					//u_isLockout:$("#u_isLockout").val(),

					}

				});
				$("#bar-frm").form("reset");
			
		}
		function formattercaozuo(value,row,index){
			return "<a href='javascript:void(0)' onclick='updateUsery("+index+")'>修改</a>  <a href='javascript:void(0)' onclick='addUsery("+index+")'>添加</a>  <a href='javascript:void(0)' onclick='delUsery("+index+")'>删除</a>"
		}
		
	/* 	//修改
		function  updateUsery(index){
			//获取修改的数据    展示     修改    点击提交按钮
			var data=$("#showUsery").datagrid("getData");
			var row=data.rows[index];	
			
			$("#updatett").combobox({
				url:'getUseryType',
				method:'post',
				valueField:'tId',//填充进 <option value='id'>text</option>    
				textField:'tName'//标签中间（<option>text</option>）   
				
			})
			$("#updatett").combobox('setValue',row.UseryType.tId)
		
			//填充表单
			$("#updatefrm").form("load",row);
			
			//打开弹窗
			$("#updatedialog").dialog("open")
		}
		
		function saveUpdate(){
			alert($("#updatett").combobox('getValue'));
			$.post("updateUsery",{
				bId:$("#updatebId").val(),
				bName:$("#updatebName").val(),
				tId:$("#updatett").combobox('getValue'),
				bPrice:$("#updatebPrice").val(),
				bAuthor:$("#updatebAuthor").val(),
				bJieshao:$("#updatebJieshao").val(),
				
			},function(res){
				if(res>0){
					//修改成功
					$("#showUsery").datagrid("reload");
					$("#updatedialog").dialog("close")
					$.messager.alert("提示","修改成功");
				}else{
					//修改失败
					$.messager.alert("提示","修改失败");
				}
			},"json")
		}
		//删除
		function delUsery(index){
			 var data=$("#showUsery").datagrid("getData");
		 	var row=data.rows[index];
			alert(row.bId);
			$.post("delUsery",{
				bId:row.bId,		
			},function(res){
				if(res>0){
					//删除成功
					$("#showUsery").datagrid("reload");
					$.messager.alert("提示","删除成功");
				}else{
					//删除失败
					$.messager.alert("提示","删除失败");
				}
			},"json")
			
		
		}
		
		//添加
		function  addUsery(index){
		
			
		 	$("#addtt").combobox({
				url:'getUseryType',
				method:'post',
				valueField:'tId',//填充进 <option value='id'>text</option>    
				textField:'tName'//标签中间（<option>text</option>）   
				
			}) 
			
			
			//打开弹窗
			$("#add-dialog").dialog("open") 
		}
		
		function saveAdd(){
			
			$.post("addUsery",{				
				bId:$("#addbId").val(),
				bName:$("#addbName").val(),
				tId:$("#addtt").combobox('getValue'),
				bPrice:$("#addbPrice").val(),
				bAuthor:$("#addbAuthor").val(),
				bJieshao:$("#addbJieshao").val(),
			},function(res){
				if(res>0){
					//修改成功
					$("#showUsery").datagrid("reload");
					$("#add-dialog").dialog("close")
					$.messager.alert("提示","添加成功");
				}else{
					//修改失败
					$.messager.alert("提示","添加失败");
				}
			},"json")
			$("#addfrm").form("reset");
		}
		 */



</script>
</head>
<body>

	<table id="selUsery" class="easyui-datagrid" >
		<thead>
			<tr>
				<th data-options="field:'u_id',title:'bId'" >u_id</th>
				<th data-options="field:'u_loginName',title:'u_loginName'">账户</th>
				<!-- <th data-options="field:'u_password',title:'u_password'" >密码</th> -->
				<th data-options="field:'u_isLockout',title:'u_isLockout'" >是否锁定</th>
				<th data-options="field:'u_loginTime',title:'u_loginTime'" >登录时间</th>
				<th data-options="field:'u_logoutTime',title:'u_logoutTime'" >退出时间</th>
				<th data-options="field:'u_clockinTime',title:'u_clockinTime'" >打卡上班</th>
				<th data-options="field:'u_clockoutTime',title:'u_clockoutTime'">打卡下班</th>
				<th data-options="field:'u_creationTime',title:'u_creationTime'" >创建时间</th>
				<th data-options="field:'u_email',title:'u_email'" >邮箱</th>
				<th data-options="field:'u_phone',title:'u_phone'" >手机号</th>
				 <th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo">操作</th>
			</tr>
		</thead>
	</table>
	<!-- 搜索 -->
	
	<div id="bar">
		<form id="bar-frm">

		  <label for="name">用户名:</label>   
          <input class="easyui-validatebox" type="text" id="u_loginName" /> 
          
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initUsery()">搜索</a> 
		</form>
	</div>
	
	<!--修改的对话框  -->
	<div  id="updatedialog" class="easyui-dialog" data-options="modal:true,closed:true,buttons:[
	{
	text:'保存',
	handler:function(){
		saveUpdate();
		}
	},{
	text:'取消',
	handler:function(){
		
		}
	}
	]">
		<form id="updatefrm" class="easyui-form">
			  <label for="name">书籍Id:</label>   
	          <input class="easyui-validatebox" disabled="disabled" name="bId" type="text" id="updatebId" data-options="required:true" />   
			  <br>
			  <label for="name">书籍名称:</label>   
	          <input class="easyui-validatebox" name="bName" type="text" id="updatebName" data-options="required:true" /> 
	          <br>
	           <!-- 下拉列表 -->
			<select id="updatett" class="easyui-combobox">
				<option selected="selected" >--请选择班级--</option>
			</select>
	          <label for="name">价格:</label>   
	          <input class="easyui-validatebox" name="bPrice" type="text" id="updatebPrice" data-options="required:true" /> 
	        <br>
	         <label for="name">作者:</label>   
	          <input class="easyui-validatebox" name="bAuthor" type="text" id="updatebAuthor" data-options="required:true" /> 
	        <br>
	         <label for="name">介绍:</label>   
	          <input class="easyui-validatebox" name="bJieshao" type="text" id="updatebJieshao" data-options="required:true" /> 
	        <br>
	  
		</form>
	</div>
	
	<!--添加的对话框  -->
	<div  id="add-dialog" class="easyui-dialog" data-options="modal:true,closed:true,buttons:[
	{
	text:'保存',
	handler:function(){
		saveAdd();
		}
	},{
	text:'取消',
	handler:function(){
		
		}
	}
	]">
		<form id="addfrm" class="easyui-form">
			  <label for="name">书籍名称:</label>   
	          <input class="easyui-validatebox" name="bName" type="text" id="addbName" data-options="required:true" /> 
	          <br>
	           <!-- 下拉列表 -->
			<select id="addtt" class="easyui-combobox">
				<option selected="selected"" >--请选择班级--</option>
			</select>
	          <label for="name">价格:</label>   
	          <input class="easyui-validatebox" name="bPrice" type="text" id="addbPrice" data-options="required:true" /> 
	        <br>
	         <label for="name">作者:</label>   
	          <input class="easyui-validatebox" name="bAuthor" type="text" id="addbAuthor" data-options="required:true" /> 
	        <br>
	         <label for="name">介绍:</label>   
	          <input class="easyui-validatebox" name="bJieshao" type="text" id="addbJieshao" data-options="required:true" /> 
	        <br>
		</form>
	</div>
</body>
</html>
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
<script type="text/javascript" src="js/jquery-easyui-1.4.3/datagrid-export.js"></script>
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
					u_isLockout:$("#u_isLockout").combobox("getValue"),
					startTime:$("#startTime").val(),
		    		endTime:$("#endTime").val(),

					}

				});
				$("#bar-frm").form("reset");
			
		}
		function formattercaozuo(value,row,index){
			return "<a href='javascript:void(0)' onclick='updateUsery("+index+")'>修改</a>  <a href='javascript:void(0)' onclick='delUsery("+index+")'>删除</a>"
		}
		
	 	//修改
		function  updateUsery(index){
			//获取修改的数据    展示     修改    点击提交按钮
			var data=$("#selUsery").datagrid("getData");
			var row=data.rows[index];	
			
			$("#updatett").combobox('setValue',row.u_isLockout)
		
			//填充表单
			$("#updatefrm").form("load",row);
			
			//打开弹窗
			$("#updatedialog").dialog("open")
		}
		
		function saveUpdate(){
			//alert($("#updatett").combobox('getValue'));
			$.post("updateUsery",{
				u_id:$("#updateu_id").val(),
				u_loginName:$("#updateu_loginName").val(),
				//u_password:$("#updateu_password").val(),
				u_isLockout:$("#updatett").combobox('getValue'),
				/* u_loginTime:$("#updateu_loginTime").val(),
				u_logoutTime:$("#updateu_logoutTime").val(),
				u_clockinTime:$("#updateu_clockinTime").val(),
				u_clockoutTime:$("#updateu_clockoutTime").val(),
				u_creationTime:$("#updateu_creationTime").val(), */
				u_email:$("#updateu_email").val(),
				u_phone:$("#updateu_phone").val(),
		
				
			},function(res){
				if(res>0){
					//修改成功
					$("#selUsery").datagrid("reload");
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
			 var data=$("#selUsery").datagrid("getData");
		 	var row=data.rows[index];
			//alert(row.u_id);
			$.messager.confirm("提示","确认删除么？",function(r){
				if(r){
			$.post("delUsery",{
				u_id:row.u_id,		
			},function(res){
				if(res>0){
					//删除成功
					$("#selUsery").datagrid("reload");
					$.messager.alert("提示","删除成功");
				}else{
					//删除失败
					$.messager.alert("提示","删除失败");
				}
			},"json")
			
				}
			})
		} 
		
		//添加
		function  addUsery(index){
			
			
			//打开弹窗
			$("#add-dialog").dialog("open") 
		}
		
		function saveAdd(){
			
			$.post("addUsery",{				
				u_id:$("#addu_id").val(),
				u_loginName:$("#addu_loginName").val(),
				u_password:$("#addeu_password").val(),
				u_isLockout:$("#addtt").combobox('getValue'),
			/* 	u_loginTime:$("#addu_loginTime").val(),
				u_logoutTime:$("#addu_logoutTime").val(),
				u_clockinTime:$("#addu_clockinTime").val(),
				u_clockoutTime:$("#addu_clockoutTime").val(),
				u_creationTime:$("#addu_creationTime").val(), */
				u_email:$("#addu_email").val(),
				u_phone:$("#addu_phone").val(),
			},function(res){
				if(res>0){
					//修改成功
					$("#selUsery").datagrid("reload");
					$("#add-dialog").dialog("close")
					$.messager.alert("提示","添加成功");
				}else{
					//修改失败
					$.messager.alert("提示","添加失败");
				}
			},"json")
			$("#addfrm").form("reset");
		}
		function formatteru_isLockout(value,row,index) {
			return row.u_isLockout==1? "已锁定":"未锁定";
		}


		//导出excel
		function exportExcel(){
			$('#selUsery').datagrid('toExcel','dg.xls');	// export to excel
		} 
</script>
</head>
<body>

	<table id="selUsery" class="easyui-datagrid" >
		<thead>
			<tr>
				<th data-options="field:'u_id',title:'bId'" >u_id</th>
				<th data-options="field:'u_loginName',title:'u_loginName'">账户</th>
				<!-- <th data-options="field:'u_password',title:'u_password'" >密码</th> -->
				<th data-options="field:'u_isLockout',title:'u_isLockout',formatter:formatteru_isLockout" >是否锁定</th>
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
          
          <label for="email">创建时间:</label>   
        <input class="easyui-datebox" id="startTime" />——
        <input class="easyui-datebox" id="endTime"  />
            <label for="name">是否锁定:</label>   
	       <select class="easyui-combobox" id="u_isLockout" name="u_isLockout" >   
			    <option value="">--请选择--</option>
			    <option value="1">已锁定</option>   
			    <option value="0">未锁定</option>
			<select>
          
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initUsery()">搜索</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addUsery()">添加</a> 
		 <a
						class="easyui-linkbutton" plain="true" onclick="exportExcel()"
						id="serach" data-options="iconCls:'icon-print'">导出excel</a>
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
			  <label for="name">Id:</label>   
	          <input class="easyui-validatebox" disabled="disabled" name="u_id" type="text" id="updateu_id" data-options="required:true" />   
			  <br>
			  <label for="name">登录账户:</label>   
	          <input class="easyui-validatebox" name="u_loginName" type="text" id="updateu_loginName" data-options="required:true" /> 
	          <br>
	         <!--  <label for="name">登录密码:</label>   
	          <input class="easyui-validatebox" name="u_password" type="text" id="updateu_password" data-options="required:true" /> 
	        <br> -->
	         <!-- 下拉列表 -->
			<select id="updatett" class="easyui-combobox" id="u_isLockout">
				<option selected="selected" >--是否锁定--</option>
				  <option value="1">已锁定</option>   
			    <option value="2">未锁定</option>   
				
			</select>
			<br>
	    <!--      <label for="name">登录时间:</label>   
	          <input class="easyui-validatebox" name="u_loginTime" type="text" id="updateu_loginTime" data-options="required:true" /> 
	        <br>
	         <label for="name">退出时间:</label>   
	          <input class="easyui-validatebox" name="u_logoutTime" type="text" id="updateu_logoutTime" data-options="required:true" /> 
	        <br>
	           <label for="name">打卡上班:</label>   
	          <input class="easyui-validatebox" name="u_clockinTime" type="text" id="updateu_clockinTime" data-options="required:true" /> 
	        <br>
	         <label for="name">打卡下班:</label>   
	          <input class="easyui-validatebox" name="u_clockoutTime" type="text" id="updateu_clockoutTime" data-options="required:true" /> 
	        <br>
	         <label for="name">创建时间:</label>   
	          <input class="easyui-validatebox" name="u_creationTime" type="text" id="updateu_creationTime" data-options="required:true" /> 
	        <br> -->
	           <label for="name">邮箱:</label>   
	          <input class="easyui-validatebox" name="u_email" type="text" id="updateu_email" data-options="required:true" /> 
	        <br>
	         <label for="name">手机号:</label>   
	          <input class="easyui-validatebox" name="u_phone" type="text" id="updateu_phone" data-options="required:true" /> 
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
			  <label for="name">Id:</label>   
	          <input class="easyui-validatebox" disabled="disabled" name="u_id" type="text" id="addu_id" data-options="required:true" />   
			  <br>
			  <label for="name">登录账户:</label>   
	          <input class="easyui-validatebox" name="u_loginName" type="text" id="addu_loginName" data-options="required:true" /> 
	          <br>
	          <label for="name">登录密码:</label>   
	          <input class="easyui-validatebox" name="u_password" type="text" id="addeu_password" data-options="required:true" value="123456" /> 
	        <br> 
	         <!-- 下拉列表 -->
			<select id="addtt" class="easyui-combobox" >
				<option selected="selected" >是否锁定</option>
				 <option value="1">已锁定</option>   
			    <option value="0">未锁定</option>  
			</select>
			<br>
	      <!--    <label for="name">登录时间:</label>   
	          <input class="easyui-validatebox" name="u_loginTime" type="text" id="addu_loginTime"  /> 
	        <br>
	         <label for="name">退出时间:</label>   
	          <input class="easyui-validatebox" name="u_logoutTime" type="text" id="addu_logoutTime" /> 
	        <br>
	           <label for="name">打卡上班:</label>   
	          <input class="easyui-validatebox" name="u_clockinTime" type="text" id="addu_clockinTime"  /> 
	        <br>
	         <label for="name">打卡下班:</label>   
	          <input class="easyui-validatebox" name="u_clockoutTime" type="text" id="addu_clockoutTime" /> 
	        <br>
	         <label for="name">创建时间:</label>   
	          <input class="easyui-validatebox" name="u_creationTime" type="text" id="addu_creationTime"  /> 
	        <br> -->
	           <label for="name">邮箱:</label>   
	          <input class="easyui-validatebox" name="u_email" type="text" id="addu_email" data-options="required:true" /> 
	        <br>
	         <label for="name">手机号:</label>   
	          <input class="easyui-validatebox" name="u_phone" type="text" id="addu_phone" data-options="required:true" /> 
	        <br>
	    
	  
		</form>
	</div>
</body>
</html>
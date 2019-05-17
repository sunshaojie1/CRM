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
		initRoles();
	})
	function initRoles(){
		$("#Rolestab").datagrid({    
		    url:"selectRoleser",
		    method:"post",
		    pagination:true,
		    toolbar: '#tb',
		    //多条件查询
		    	 queryParams: {
		    		r_name:$("#r_name").val()

		} 

		});  
	}
	function formattercaozuo(value,row,index) {
		return "<a href='javascript:void(0)' onclick='update("+index+")'>编辑</a> <a href='javascript:void(0)' onclick='del("+index+")'>删除</a> "
	}
	function formatterQuanxian(value,row,index) {
		return "<a href='javascript:void(0)' onclick='updateQuanxian("+index+")'>设置权限</a>"
	}
	
	function update(index) {
		var datas=$("#Rolestab").datagrid("getData");
		var row=datas.rows[index];
		$("#frmRoles").form("load",row)
		 $("#updateRoles").dialog("open");
	}
	 
	function updateRoless() {
		$.post("updateRoleser",{
			r_id:$("#updater_id").val(),
			r_name:$("#updater_name").val()
			
		},function(res){
			if(res>0){
				$("#Rolestab").datagrid("reload");
				$("#updateRoles").dialog("close");
				$.messager.alert("提示","修改成功");
			}else{
				$.messager.alert("提示","修改失败");
			}
		},"json");
	}
	function closesRoles() {
		 $("#updateRoles").dialog("close");
	}
	//打开设置权限框
	 function updateQuanxian(index){
	 	var data = $("#Rolestab").datagrid("getData");
		var row = data.rows[index];
	 	var Name=row.Name;
	 	var r_id=row.r_Id;
	 		$("#quqnxian").dialog({
	 			closed:false,
	 			title:"您正在设置："+Name,
	 			toolbar:[{
	 				text:"提交",
	 				iconCls:'icon-ok',
	 				handler:function(){
	 					var data = $("#Rolestab").datagrid("getSelected");
	 					var nodes=$("#tre").tree('getChecked',['checked','indeterminate']);
	 					var n="";
	 					for(var i=0;i<nodes.length;i++){
	 						if(n==""){
	 							n+=nodes[i].id;
	 						}else{
	 							n += ",";
	 							n += nodes[i].id;
	 						}
	 					}
	 					$.post(
	 						"",
	 						{
	 							parentIds:n,
								r_Id:data.r_Id,
								 
							}, function(res){
								if(res.success){
									$.messager.alert("消息","保存权限成功！");
									$("#quqnxian").window("close");
									$("#Rolestab").datagrid("reload");
								}else{
									$.messager.alert("消息",res.Message);
								}
						}, "json")
	 				}
	 			},{
	 				text:"取消",
	 				iconCls:'icon-cancel',
	 				handler:function(){
	 					$("#quqnxian").window("close");
	 				}
	 			}]
	 		});
	 		$.post("", {
						r_id:r_id,
						 
					}, function(res) {
						checked:true;
						$("#tre").tree("loadData",res);
				}, "json")
	 }
	</script>
</head>
<body>
	<table class="easyui-datagrid" id="Rolestab">   
    <thead>   
        <tr>   
            <th data-options="field:'r_id',title:'角色id'"></th>   
            <th data-options="field:'r_name',title:'角色姓名'"></th>   
              <th data-options="field:'操作',title:'操作',formatter:formattercaozuo"></th>   
              <th data-options="field:'角色',title:'操作',formatter:formatterQuanxian"></th>   
        </tr>   
    </thead>   
</table>  
<div id="tb">
<form id="ff">   
           <label for="email">姓名:</label>   
        <input class="easyui-validatebox" type="text" id="r_name" name="r_name" />       
     <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initRoles()">搜索</a> 
</form> 
</div>
<!--修改  -->
<div id="updateRoles" class="easyui-window" data-options="modal:true,closed:true,resizable:true,collapsible:true,draggable:true">
		<form id="frmRoles" class="easyui-form" >
			<table>
			<tr>
					<td>
						<label for="easyui-validatebox">角色id:</label> 
						<td>
						<input class="easyui-validatebox" type="text" id="updater_id" name="r_id" />
					</td>
					</td>
				</tr>
				<tr>
					<td>
						<label for="easyui-validatebox">角色姓名:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="updater_name" name="r_name" />
					</td>
				</tr>
				<tr>
				<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateRoless()" >提交</a>
					</td>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closesRoles()" >取消</a>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
	<!--权限设置-->
		<div id="quqnxian" class="easyui-dialog"  style="width:300px;height:500px" data-options="iconCls:'icon-save',modal:true,closed:true">
				<ul id="userTree" class="easyui-tree" data-options = "iconCls:'icon-save',collapsible:true">
				
			</ul>
			
		</div>
</body>
</html>
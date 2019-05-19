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
<script type="text/javascript" src="js/gVerify.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		MoTabs();
	})
	function MoTree(){
		$("#MokuaiTree").tree({
			url : "rolesTree",
			method : "post",
			animate : true
		})
	}
	function MoTabs(){
		$("#MokuaiTab").datagrid({
			url:"modulesSelect",
			method:"post",
			singleSelect:true,
			toolbar:"#ae",
			columns:[[
				{field:'m_id',title:'模块编号'},
				{field:'m_name',title:'模块名称'},
				{field:'kkek',title:'操作',formatter:formatterCao}
			]]
		})
	}
	function formatterCao(value,row,index){
		return "<a href='javascript:void(0)' onclick='del("+index+")'>删除</a>||<a href='javascript:void(0)' onclick='upd("+index+")'>修改</a>";
	}
	function del(index){
		var data=$("#MokuaiTab").datagrid("getData");
		var row=data.rows[index];
		$.messager.confirm('确认','您确认想要删除该模块么？角色下的模块也会随之消失',function(r){    
		    if (r){    
		    	$.post("deleteMod",{
					m_id:row.m_id
				},function(res){
					if(res>0){
						$.messager.alert("系统提示","删除成功");
						$("#MokuaiTab").datagrid("load");
					}else{
						$.messager.alert("系统提示","删除失败");
						$("#MokuaiTab").datagrid("load");
					}
				})  
		    }    
		}); 
		
		
		
	}
	//修改
	function upd(index){
		var row = $("#MokuaiTab").datagrid("getData").rows[index];
		$("#updfrom").form("load", row);
		$("#update_dialog").window('open');
	}
	//修改确定
	function updYes() {
		$.post("updateMod",{
			m_id:$("#updm_id").val(),
			m_name:$("#updm_name").val(),
		},function(res){
			if(res>0){
				$.messager.alert("系统提示","修改成功");
				$("#update_dialog").window('close');
				$("#MokuaiTab").datagrid("reload");
			}else{
				$.messager.alert("系统提示","修改失败");
			}
		})
	}
	//修改取消
	function updNo() {
		$("#update_dialog").window('close');
	}
	//新增加
	function add(){
		$("#addWindow").window('open');
	}
	function addYes(){
		$.post("insertMod",{
			m_name:$("#addName").val()
		},function(res){
			if(res>0){
				$.messager.alert("系统提示","添加成功")
				$("#MokuaiTab").datagrid("load");
			}else{
				$.messager.alert("系统提示","添加失败")
				$("#MokuaiTab").datagrid("load");
			}
		})
	}
	function addNo(){
		$("#addWindow").window('close');
	}
</script>
<body>
		<table id="MokuaiTab" class="easyui-datagrid"  >
		</table>
		<div id="ae" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<!-- plain为true时显示简洁效果。 -->
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-add" plain="true" onclick="add()">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
			名称： <input class="easyui-textbox" id="u_loginName" style="width: 80px"> 
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="MoTabs()">搜索</a>
		</div>
	</div>
				<!-- <td>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="zuoYi()">《《《</a>
					<br>
					<br>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="youYi()">》》》</a>
				</td> -->
				<!-- <td style="width: 77%;height: 400px;">
					<div class="easyui-panel" title="角色权限管理">
						<table>
							<tr>
								<td>
									<ul id="MokuaiTree" class="easyui-tree">
									</ul>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr> -->
	<div id="addWindow"  class="easyui-window"  title="添加一个角色" data-options="modal:true,closed:true" style="width: 500px; height: 350px; padding: 10px;">
		<form id="addfrom">
			<table cellpadding="12">
				<tr>
					<td>模块名称</td>
					<td><input id="addName" class="easyui-textbox" data-options="required:true"  /></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addYes()" data-options="iconCls:'icon-ok'">确定</a></td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addNo()" data-options="iconCls:'icon-no'">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="update_dialog" title="修改模块" class="easyui-dialog"
		style="width: 600px; height: 400px;"
		data-options="iconCls:'icon-save',closed:true,resizable:true,modal:true,buttons:[{
				text:'保存',
				iconCls:'icon-ok',
				handler:function(){updYes()}
			},{
				text:'关闭',
				iconCls:'icon-no',
				handler:function(){updNo()}
			}]">
			<form id="updfrom">
				<table cellpadding="12">
					<tr>
						<td>编号：</td>
						<td><input id="updm_id" name="m_id" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>角色名称：</td>
						<td><input id="updm_name" name="m_name" class="easyui-textbox" data-options="required:true"/></td>
					</tr>
				</table>
			</form>
	</div>
</body>
</html>
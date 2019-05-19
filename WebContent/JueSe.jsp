<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/metro-green/easyui.css"  />
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		initJue();
	})
	function initJue(){
		$("#JueTab").datagrid({
			url:"selectRol",
			method:"post",
			pagination : true,//开分页
			fitColumns : true,//自动扩
			singleSelect : true,//只能选一个
			toolbar : "#ae",//导航条
			pageList : [ 5, 10, 15,20 ],
			pageSize : 5,
			columns:[[
				{field:"r_id",title:"编号"},
				{field:"r_name",title:"角色名"},
				{field : "cao",title : "操作",formatter : formatterCao}
			]],
			queryParams : {
				r_name:$("#r_ame").val()
			}
		})
	}
	function formatterCao(value, row, index){
		return "<a href='javascript:void(0)' onclick='delRoles("
				+ index
				+ ")'>删除</a>||<a href='javascript:void(0)'  onclick='updRoles("
				+ index
				+ ")'>修改</a>||<a href='javascript:void(0)' class='easyui-linkbutton' onclick='inMokuai("
				+ index + ")' >分配权限</a>";
		
	}
	//删除
	function delRoles(index){
		var row=$("#JueTab").datagrid("getData").rows[index];
		$.post("delro",{
			r_id:row.r_id
		},function(res){
			if (res > 0) {
				$.messager.alert("提示","删除成功");
				$("#JueTab").datagrid("reload");
			} else {
				$.messager.alert("提示","删除成功");
				$("#JueTab").datagrid("load");
			}
		})
		
	}
	//修改
	function updRoles(index){
		var row = $("#JueTab").datagrid("getData").rows[index];
		$("#updfrom").form("load", row);
		$("#roles_dialog").window('open');
	}
	//修改确定
	function updYes() {
		$.post("updro",{
			r_id:$("#updr_id").val(),
			r_name:$("#updr_name").val(),
		},function(res){
			if(res>0){
				$.messager.alert("系统提示","修改成功");
				$("#roles_dialog").window('close');
				$("#JueTab").datagrid("reload");
			}else{
				$.messager.alert("系统提示","修改失败");
			}
		})
	}
	//修改取消
	function updNo() {
		$("#roles_dialog").window('close');
	}
	//新增
	function initRoles(){
		$("#addWindow").window('open');
	}
	function addYes(){
		$.post("insertro",{
			r_name:$("#addName").val()
		},function(res){
			if (res > 0) {
				$.messager.alert("提示","添加成功");
				$("#JueTab").datagrid("reload");
			} else {
				$.messager.alert("提示","添加失败");
				$("#JueTab").datagrid("load");
			}
		})
	}
	function addNo(){
		$("#addWindow").window('close');
	}
	
	//分配模块
	function inMokuai(index){
		var row = $("#JueTab").datagrid("getData").rows[index];
		//查询所有模块
		$("#MokuaiTabs").datagrid({
			url : "modulesSelect",
			method : "post",
			singleSelect : true,
			fitColumns : true,
			columns : [ [ {
				field : 'm_id',
				title : '模块编号'
			}, {
				field : 'm_name',
				title : '模块名称'
			} ] ]
		})
		//查询角色下的模块
		$("#myMokuai").datagrid({
			url : "selMo",
			method : "post",
			singleSelect : true,
			fitColumns : true,
			columns : [ [ {
				field : 'm_name',
				title : '模块名称'
			} ] ],
			queryParams : {
				r_name : row.r_name
			}
		})
		$("#rloseWindow").window('open');
	}
	//添加模块
	function insertMokuai() {
	//获取角色
		var roles = $("#JueTab").datagrid("getSelected");
	//获取用户
		var mokuaiTabs = $("#MokuaiTabs").datagrid("getSelected");
		if (mokuaiTabs) {
			$.post("insertMo", {
				role_id : roles.r_id,
				module_id : mokuaiTabs.m_id
			}, function(res) {
				alert(res);
				if (res > 0) {
					$("#myMokuai").datagrid("reload");
				} else if (res < 0) {
					$.messager.alert("系统提示", "重复无法添加");
				}
			})
		} else {
			$.messager.alert("系统提示", "请先选择模块.....");
		}
	}
//移除模块
	function deleteMokuai() {
	//获取角色
		var roles = $("#JueTab").datagrid("getSelected");
	//获取模块
		var myMokuai = $("#myMokuai").datagrid("getSelected");
		if (myMokuai) {
			$.post("delMMM", {
				role_id : roles.r_id,
				module_id : myMokuai.m_id
			}, function(res) {
				alert(res)
				if (res > 0) {
					$("#myMokuai").datagrid("reload");
				} else {
					$.messager.alert("系统提示", "删除失败");
				}
			})
		} else {
			$.messager.alert("系统提示", "请先选择模块.....");
		}
	}
	
</script>
<body>
	<table id="JueTab" class="easyui-datagrid">
		
	</table>
	<div id="ae" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<!-- plain为true时显示简洁效果。 -->
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-add" plain="true" onclick="initRoles()">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
			名称： <input class="easyui-textbox" id="r_ame"
				style="width: 80px"> 
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" plain="true" onclick="initJue()">搜索</a>
		</div>
	</div>
	<div id="addWindow"  class="easyui-window"  title="添加一个角色" data-options="modal:true,closed:true" style="width: 500px; height: 350px; padding: 10px;">
		<form id="addfrom">
			<table cellpadding="12">
				<tr>
					<td>角色名称</td>
					<td><input id="addName" class="easyui-textbox" data-options="required:true"  /></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addYes()" data-options="iconCls:'icon-ok'">确定</a></td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addNo()" data-options="iconCls:'icon-no'">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="roles_dialog" title="修改用户" class="easyui-dialog"
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
						<td><input id="updr_id" name="r_id" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>角色名称：</td>
						<td><input id="updr_name" name="r_name" class="easyui-textbox" data-options="required:true"/></td>
					</tr>
				</table>
			</form>
	</div>
	<div id="rloseWindow" class="easyui-window" title="分配角色"
		data-options="modal:true,closed:true"
		style="width: 500px; height: 350px; padding: 10px;">
		<table>
			<tr>
				<td width="200px">
					<table title="模块" id="MokuaiTabs" class="easyui-datagrid">
					</table>
				</td>
				<td width="100px">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="insertMokuai()" data-options="iconCls:'icon-redo'"></a> 
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="deleteMokuai()" data-options="iconCls:'icon-undo'"></a>
				</td>
				<td width="100px" valign="top">
					<table title="当前用户的模块" id="myMokuai" class="easyui-datagrid">
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
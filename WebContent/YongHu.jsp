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
<style>
a {
	text-decoration: none;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		initUsery();
	})
	//初始化
	function initUsery() {
		$("#useryTab").datagrid({
			url : "selectUsery1",
			method : "post",
			pagination : true,//开分页
			fitColumns : true,//自动扩
			singleSelect : true,//只能选一个
			toolbar : "#ae",//导航条
			pageList : [ 5, 10, 15,20 ],
			pageSize : 5,
			columns : [ [ {
				field : 'u_id',
				title : '用户id',
				hidden : true
			}, {
				field : 'u_loginName',
				title : '帐号'
			}, {
				field : 'u_password',
				title : '密码'
			}, {
				field : 'u_isLockout',
				title : '是否锁定',
				formatter : formatterShuo
			}, {
				field : 'u_email',
				title : '邮箱'
			}, {
				field : 'u_phone',
				title : '手机号'
			}, {
				field : 'u_loginTime',
				title : '登录时间'
			}, {
				field : 'u_logoutTime',
				title : '退出时间'
			}, {
				field : 'u_clockinTime',
				title : '签到时间'
			}, {
				field : 'u_clockoutTime',
				title : '签退时间'
			}, {
				field : 'u_creationTime',
				title : '创建时间'
			}, {
				field : "cao",
				title : "操作",
				formatter : formatterCao
			} ] ],
			queryParams : {
				u_loginName : $("#u_loginName").val(),
				u_isLockout : $("#u_isLockout").combobox("getValue"),
			}
		})
	}

	function formatterShuo(value, row, index) {
		return row.u_isLockout == 1 ? "是" : "否";
	}

	function formatterCao(value, row, index) {
		return "<a href='javascript:void(0)' onclick='delUsery("
				+ index
				+ ")'>删除</a>||<a href='javascript:void(0)'  onclick='updUsery("
				+ index
				+ ")'>修改</a>||<a href='javascript:void(0)' class='easyui-linkbutton' onclick='inRoles("
				+ index + ")' >分配角色</a>";
	}
//删除
	function delUsery(index) {
		var row = $("#useryTab").datagrid("getData").rows[index];
		$.messager.confirm('确认', '您确认想要该用户么', function(r) {
			if (r) {
				$.post("delUsery1", {
					u_id : row.u_id
				}, function(res) {
					if (res > 0) {
						$.messager.alert("提示","删除成功");
						$("#useryTab").datagrid("reload");
					} else {
						$.messager.alert("提示","删除失败");
						$("#useryTab").datagrid("load");
					}
				})
			}
		})
	}
//修改
	function updUsery(index) {
		var row = $("#useryTab").datagrid("getData").rows[index];
		$("#upd_form").form("load", row);
		$("#usery_dialog").window('open');

	}
//修改确定
	function updYes() {
		$.post("updateUser1",{
			u_id:$("#updu_id").val(),
			u_loginName:$("#updu_loginName").val(),
			u_password:$("#updu_password").val(),
			u_isLockout:$("#updu_isLockout").combobox("getValue"),
			u_email:$("#updu_email").val(),
			u_phone:$("#updu_phone").numberbox('getValue')
		},function(res){
			if(res>0){
				$.messager.alert("系统提示","修改成功");
				$("#usery_dialog").window('close');
				$("#useryTab").datagrid("reload");
			}else{
				$.messager.alert("系统提示","修改失败");
			}
		})
	}
//修改取消
	function updNo() {
		$("#usery_dialog").window('close');
	}
//添加用户
	function insertUsery() {
		$("#addWindow").window('open');
	}
//添加确定
	function addYes(){
		$.post("insertUsery1",{
			u_loginName:$("#addName").val(),
			u_password:$("#addPwd").val(),
			u_isLockout:$("#addSuo").combobox("getValue"),
			u_email:$("#addEml").val(),
			u_phone:$("#addPhone").numberbox('getValue')
		},function(res){
			if(res>0){
				$.messager.alert("系统提示","添加成功")
				$("#addWindow").window('close');
				$("#useryTab").datagrid("reload");
				$("#addfrom").form("reset");
			}else{
				$.messager.alert("系统提示","添加失败")
			}
		})
	}
//添加取消
	function addNo(){
		$("#addWindow").window('close');
	}
//查看用户角色
	function inRoles(index) {
		var row = $("#useryTab").datagrid("getData").rows[index];
	//查询所有角色
		$("#rolesTabs").datagrid({
			url : "selectRol",
			method : "post",
			singleSelect : true,
			fitColumns : true,
			columns : [ [ {
				field : 'r_id',
				title : '角色编号'
			}, {
				field : 'r_name',
				title : '角色名称'
			} ] ]
		})
	//查询该用户下的角色
		$("#myRoles").datagrid({
			url : "userRoles",
			method : "post",
			singleSelect : true,
			fitColumns : true,
			columns : [ [ {
				field : 'r_name',
				title : '角色名称'
			} ] ],
			queryParams : {
				u_name : row.u_loginName
			}
		})
		$("#rloseWindow").window('open');
	}
//添加角色
	function insertRoles() {
	//获取用户
		var user = $("#useryTab").datagrid("getSelected");
	//获取角色
		var roles = $("#rolesTabs").datagrid("getSelected");
		if (roles) {
			$.post("inserRoles", {
				user_id : user.u_id,
				roles_id : roles.r_id
			}, function(res) {
				if (res > 0) {
					$("#myRoles").datagrid("reload");
				} else if (res < 0) {
					$.messager.alert("系统提示", "重复	无法添加");
				}
			})
		} else {
			$.messager.alert("系统提示", "请先选择角色.....");
		}
	}
//移除角色
	function deleteRoles() {
	//获取用户
		var user = $("#useryTab").datagrid("getSelected");
	//获取角色
		var myRoles = $("#myRoles").datagrid("getSelected");
		if (myRoles) {
			$.post("delRoles", {
				user_id : user.u_id,
				roles_id : myRoles.r_id
			}, function(res) {
				if (res > 0) {
					$("#myRoles").datagrid("reload");
				} else {
					$.messager.alert("系统提示", "删除失败");
				}
			})
		} else {
			$.messager.alert("系统提示", "请先选择角色.....");
		}
	}
</script>
<body>
	<table id="useryTab" style="width:100%;" class="easyu-datagrid">

	</table>
	<div id="ae" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
			<!-- plain为true时显示简洁效果。 -->
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-add" plain="true" onclick="insertUsery()">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
			名称： <input class="easyui-textbox" id="u_loginName"
				style="width: 80px"> 是否锁定： <select id="u_isLockout"
				class="easyui-combobox">
				<option value="">--请选择--</option>
				<option value="1">是</option>
				<option value="0">否</option>
			</select> <a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" plain="true" onclick="initUsery()">搜索</a>
		</div>
	</div>
	<div id="usery_dialog" title="修改用户" class="easyui-dialog"
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
		<form id="upd_form">
			<table>
				<tr>
					<td>编号：</td>
					<td><input id="updu_id" name="u_id" readonly="readonly" /></td>
					<td>账户：</td>
					<td><input id="updu_loginName" name="u_loginName" class="easyui-textbox" data-options="required:true"/></td>
				</tr>

				<tr>
					<td>密码：</td>
					<td><input id="updu_password" name="u_password" class="easyui-textbox" data-options="required:true"/></td>
					<td>是否锁定：</td>
					<td>
						<select id="updu_isLockout" name="u_isLockout" class="easyui-combobox" style="width: 80px">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td><input id="updu_email" name="u_email" class="easyui-validatebox" data-options="required:true,validType:'email'"  /></td>
					<td>电话：</td>
					<td><input id="updu_phone" name="u_phone" class="easyui-numberbox" data-options="required:true" /></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 添加的div -->
	<div id="addWindow" class="easyui-window" title="添加一个用户" data-options="modal:true,closed:true" style="width: 500px; height: 350px; padding: 10px;">
		<form id="addfrom">
			<table cellpadding="12">
				<tr>
					<td>帐号：</td>
					<td><input id="addName" class="easyui-textbox" data-options="required:true"  /></td>
				</tr>
				<tr>
					<td>登录密码：</td>
					<td><input id="addPwd" class="easyui-textbox" data-options="required:true" /></td>
				</tr>
				<tr>
					<td>是否锁定：</td>
					<td>
						<select id="addSuo" class="easyui-combobox" style="width: 80px">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</td>
					
				</tr>
				<tr>
					<td>邮箱：</td>
					<td><input id="addEml"  class="easyui-validatebox" data-options="required:true,validType:'email'" /></td>
				</tr>
				<tr>
					<td>手机号：</td>
					<td><input id="addPhone" class="easyui-numberbox" data-options="required:true" /></td>
				</tr>
				<tr>
					<td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addYes()" data-options="iconCls:'icon-ok'">确定</a></td>
					<td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="addNo()" data-options="iconCls:'icon-no'">取消</a></td>
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
					<table title="角色" id="rolesTabs" class="easyui-datagrid">
					</table>
				</td>
				<td width="100px">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="insertRoles()" data-options="iconCls:'icon-redo'"></a> 
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="deleteRoles()" data-options="iconCls:'icon-undo'"></a>
				</td>
				<td width="100px" valign="top">
					<table title="当前用户的角色" id="myRoles" class="easyui-datagrid">
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
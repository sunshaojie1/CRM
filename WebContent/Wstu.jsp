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
	$(function() {
		init();

	});
	function init() {
		$("#showstu").datagrid({
			url : "showStu",
			method : "post",
			pagination : true,
			fitColumns : true,
			singleSelect : true,
			toolbar : '#Wstubar',
		/* queryParams:{
		stu_name:$("#stu_name").val(),	
		
		}  */
		})
	}
	function formattercaozuo(value, row, index) {
		return "<a href='javascript:void(0)' onclick='lookWstu(" + index
				+ ")'>查看</a> <a href='javascript:void(0)' onclick='updateWstu(" + index
				+ ")'>修改</a>   <a href='javascript:void(0)' onclick='del(" + index
				+ ")'>删除</a>"
	}

	/* 查看 */
	function lookWstu(index) {
		var data = $("#showstu").datagrid("getData");
		var row = data.rows[index];
		$("#lookfrm").form("load", row);
		$("#lookdialog").dialog("open")
	}
	function close() {
		$("#lookdialog").dialog("close");
	}
   /* 修改 */
   function updateWstu(index) {
	  alert(123);
		var data = $("#showstu").datagrid("getData");
		var row = data.rows[index];
		$("#updatefrm").form("load", row);
		$("#updatedialog").dialog("open")
	}
	function close() {
		$("#updatedialog").dialog("close");
	}
	function updateWstu() {
		$.post("updateWstu",{
			stu_id:$("#stu_id1").val(),
			stu_ziXun:$("#stu_ziXun1").val(),
			stu_keCheng:$("#stu_keCheng1").val(),
			stu_daFen:$("#stu_daFen1").val(),
			stu_baoBei:$("#stu_baoBei1").val(),
			stu_class:$("#stu_class1").val(),
			stu_classTime:$("#stu_classTime1").val(),
			stu_classBeiZhu:$("#stu_classBeiZhu1").val(),
			stu_youXiao:$("#stu_youXiao1").val(),
			stu_wuXiaoYuanYin:$("#stu_wuXiaoYuanYin1").val(),
			stu_huiFang:$("#stu_huiFang1").val(),
			stu_visit:$("#stu_visit1").val(),
			stu_payTime:$("#stu_payTime1").val(),
			stu_money:$("#stu_money1").val(),
			stu_moneyTime:$("#stu_moneyTime1").val(),
			stu_jinE:$("#stu_jinE1").val(),
			stu_tui:$("#stu_tui1").val(),
			stu_tuiYin:$("#stu_tuiYin1").val(),
			stu_dingJinE:$("#stu_dingJinE1").val(),
			stu_dingTime:$("#stu_dingTime1").val(),
		},function(res){
			if(res>0){
				$("#showstu").datagrid("reload");
				$("#updatedialog").dialog("close");
				alert("修改成功！！");
			}else{
				alert("修改失败");
			}
			
		},"json");
	}
	
	
	/* 删除 */
	function del(index) {
		var data = $("#showstu").datagrid("getData");
		var row = data.rows[index];
		alert(row.stu_id)
		$.post("delStu", {
			stu_id : row.stu_id,
		}, function(res) {
			if (res > 0) {
				//删除成功
				$("#showstu").datagrid("reload");
				$.messager.alert("提示", "删除成功");
			} else {
				//删除失败
				$.messager.alert("提示", "删除失败");
			}
		}, "json");
	}
</script>

</head>
<body>
	<table id="showstu" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'stu_id',title:'学号'"></th>
				<th data-options="field:'stu_name',title:'学生姓名'"></th>
				<th data-options="field:'stu_sex',title:'性别'"></th>
				<th data-options="field:'stu_age',title:'年龄'"></th>
				<th data-options="field:'stu_phone',title:'电话'"></th>
				<th data-options="field:'stu_state',title:'个人状态'"></th>
				<th data-options="field:'stu_xueLi',title:'学历'"></th>
				<th data-options="field:'stu_quDao',title:'来源渠道'"></th>
				<th data-options="field:'stu_wangZhan',title:'来源网址'"></th>
				<th data-options="field:'stu_guanJian',title:'来源关键词'"></th>
				<th data-options="field:'stu_wx',title:'微信'"></th>
				<th data-options="field:'stu_baoBei',title:'是否报备'"></th>
				<th data-options="field:'stu_keCheng',title:'课程方向'"></th>
				<th data-options="field:'stu_youXiao',title:'是否有效'"></th>
				<th data-options="field:'stu_daFen',title:'打分'"></th>
				<th data-options="field:'stu_huiFang',title:'是否回访'"></th>
				<th data-options="field:'stu_visit',title:'是否上门'"></th>
				<th data-options="field:'stu_visitTime',title:'上门时间'"></th>
				<th data-options="field:'stu_baoBei',title:'是否报备'"></th>
				<th data-options="field:'stu_payTime',title:'首次回访时间'"></th>
				<th data-options="field:'stu_wuXiaoYuanYin',title:'无效原因'"></th>
				<th data-options="field:'stu_money',title:'是否缴费'"></th>
				<th data-options="field:'stu_moneyTime',title:'缴费时间'"></th>
				<th data-options="field:'stu_jinE',title:'金额'"></th>
				<th data-options="field:'stu_tui',title:'是否退费'"></th>
				<th data-options="field:'stu_class',title:'是否进班'"></th>
				<th data-options="field:'stu_classTime',title:'进班时间'"></th>
				<th data-options="field:'stu_classBeiZhu',title:'进班备注'"></th>
				<th data-options="field:'stu_tuiYin',title:'退费原因'"></th>
				<th data-options="field:'stu_dingJinE',title:'定金金额'"></th>
				<th data-options="field:'stu_dingTime',title:'定金时间'"></th>
				<th data-options="field:'stu_quYu',title:'所在区域'"></th>
				<th data-options="field:'stu_buMen',title:'来源部门'"></th>
				<th data-options="field:'stu_qq',title:'QQ'"></th>
				<th data-options="field:'stu_ziXun',title:'咨询姓名'"></th>
				<th data-options="field:'stu_creatorTime',title:'创建时间'"></th>
				<th
					data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th>
			</tr>
		</thead>
	</table>
	<div id="Wstubar">
		<form class="easyui-form" id="barfrm">
			<label for="stu_name">学生姓名:</label> <input class="easyui-validatebox"
				type="text" id="stu_name" data-options="required:true" /> <label
				for="name">电话:</label> <input class="easyui-validatebox" type="text"
				id="stu_phone" data-options="required:true" /> <label for="name">咨询师:</label>
			<input class="easyui-validatebox" type="text" id="stu_ziXun" /> <br>
			<label for="name">是否缴费:</label> <select id="stu_money"
				class="easyui-combobox" name="dept" style="width: 200px;">
				<option value="已缴费">已缴费</option>
				<option value="未缴费">未缴费</option>
			</select> <label for="name">是否有效:</label> <select id="stu_youXiao"
				class="easyui-combobox" name="dept" style="width: 200px;">
				<option value="是">是</option>
				<option value="否">否</option>
			</select> <label for="name">是否回访:</label> <select id="stu_huiFang"
				class="easyui-combobox" name="dept" style="width: 200px;">
				<option value="是">是</option>
				<option value="否">否</option>
			</select> <br> <label for="name">微信:</label> <input
				class="easyui-validatebox" type="text" id="stu_wx" /> <label
				for="name">创建时间:</label> <input class="easyui-datebox" type="text"
				id="stu_creatorTime" />~ <input class="easyui-datebox" type="text"
				id="stu_creatorTime" /> <a href="javascript:void(0)"
				class="easyui-linkbutton" onclick="init()"
				data-options="iconCls:'icon-search'">搜索</a>
		</form>
	</div>
<!-- 查看 -->	
<div  id="lookdialog" class="easyui-dialog" data-options="modal:true,closed:true,buttons:[
	{
	text:'关闭',
	handler:function(){
		close();
		}
	}
	]">
	<form id="lookfrm" class="easyui-form">		
	   <table>
	   <tr>
	   <td> <label for="name">学号:</label>  </td>
	   <td> <input class="easyui-validatebox" disabled="disabled" name="stu_id" type="text"/></td>
	   <td> <label for="email">学生姓名:</label></td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_name"  /></td>
	   <td>  <label for="email">性别:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_sex"  /></td>
	   <td><label for="email">年龄:</label>   </td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_age"  /></td>
	   </tr>
	   <tr>
	   <td><label for="email">电话:</label>   </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_phone"  /></td>
	   <td><label for="email">个人状态:</label></td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_state"  /></td>
	   <td><label for="email">学历:</label>  </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_xueLi"  /></td>
	   <td> <label for="email">来源渠道:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_quDao"  /> </td>
	   </tr>
	   <tr>
	   <td> <label for="email">来源网址:</label> </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_wangZhan"  /></td>
	   <td> <label for="email">来源关键词:</label></td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_guanJian"  /> </td>
	   <td> <label for="email">微信:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_wx"  /></td>
	   <td> <label for="email">是否报备:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_baoBei"  /></td>	   
	   </tr>
	   <tr>
	   <td><label for="email">课程方向:</label></td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_keCheng"  /></td>
	   <td><label for="email">是否有效:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_youXiao"  /></td>
	   <td><label for="email">打分:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_daFen"  /></td>
	   <td><label for="email">是否回访:</label> </td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_huiFang"  /> </td>	   	   
	   </tr>
	   <tr>
	   <td><label for="email">是否上门:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_visit"  /></td>
	   <td><label for="email">上门时间:</label>   </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_visitTime"  /></td>
	   <td><label for="email">是否报备:</label> </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_baoBei"  /></td>
	   <td><label for="email">首次回访时间:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_payTime"  /></td>	   
	   </tr>   
	   <tr>
	   <td><label for="email">无效原因:</label></td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_wuXiaoYuanYin"  />   </td>
	   <td> <label for="email">是否缴费:</label> </td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_money"  /> </td>
	   <td><label for="email">缴费时间:</label> </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_moneyTime"  /> </td>
	   <td> <label for="email">金额:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_jinE"  /></td>	   	   
	   </tr>
	   <tr>
	   <td><label for="email">是否退费:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_tui"  /></td>
	   <td><label for="email">是否进班:</label></td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_class"  /></td>
	   <td><label for="email">进班时间:</label>  </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_classTime"  /> </td>
	   <td><label for="email">进班备注:</label> </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_classBeiZhu"  /> </td>
	   </tr>
	   
	   <tr>
	   <td><label for="email">退费原因:</label> </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_tuiYin"  />  </td>
	   <td><label for="email">定金金额:</label> </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_dingJinE"  /></td>
	   <td> <label for="email">定金时间:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_dingTime"  /></td>
	   <td><label for="email">所在区域:</label> </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_quYu"  /></td>
	   </tr>
	   <tr>
	   <td><label for="email">来源部门:</label>   </td>
	   <td><input class="easyui-validatebox" type="text" name="stu_buMen"  /></td>
	   <td><label for="email">QQ:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_qq"  /></td>
	   <td><label for="email">咨询姓名:</label></td>
	   <td><input class="easyui-validatebox" type="text" name="stu_ziXun"  /></td>
	   <td><label for="email">创建时间:</label>  </td>
	   <td> <input class="easyui-validatebox" type="text" name="stu_creatorTime"  /></td>
	   </tr>
	   </table>            	                                                                                                                                  
 </form>
        
</div> 


<!-- 修改 -->

<div  id="updatedialog" class="easyui-dialog" data-options="modal:true,closed:true,buttons:[
	{
	text:'关闭',
	handler:function(){
		close();
		}
	}
	]">
	<form id="updatefrm" class="easyui-form">		
	   <table>
	   
	   <tr>
	   <td><label for="email">学号:</label></td>
	   <td><input class="easyui-validatebox" type="text"  id="stu_id1" name="stu_id"  /></td>
	   <td><label for="email">咨询姓名:</label></td>
	   <td><input class="easyui-validatebox" type="text"  id="stu_ziXun1" name="stu_ziXun"  /></td>
	   <td><label for="email">课程方向:</label></td>
	   <td> <input class="easyui-validatebox" type="text" id="stu_keCheng1" name="stu_keCheng"  /></td>
	   <td><label for="email">打分:</label></td>
	   <td><input class="easyui-validatebox" type="text" id="stu_daFen1" name="stu_daFen"  /></td>
	   <td> <label for="email">是否报备:</label></td>
	   <td><input class="easyui-validatebox" type="text" id="stu_baoBei1" name="stu_baoBei"  /></td>	
	   </tr>
	   <tr>
	   <td><label for="email">是否进班:</label></td>
	   <td> <input class="easyui-validatebox" type="text" id="stu_class1" name="stu_class"  /></td>
	   <td><label for="email">进班时间:</label>  </td>
	   <td><input class="easyui-validatebox" type="text" id="stu_classTime1" name="stu_classTime"  /> </td>
	   <td><label for="email">进班备注:</label> </td>
	   <td><input class="easyui-validatebox" type="text" id="stu_classBeiZhu1" name="stu_classBeiZhu"  /> </td>
	   <td><label for="email">是否有效:</label></td>
	   <td><input class="easyui-validatebox" type="text" id="stu_youXiao1" name="stu_youXiao"  /></td>
	   </tr>
	   <tr>
	   <td><label for="email">无效原因:</label></td>
	   <td> <input class="easyui-validatebox" type="text" id="stu_wuXiaoYuanYin1" name="stu_wuXiaoYuanYin"  />   </td>
	   <td><label for="email">是否回访:</label> </td>
	   <td> <input class="easyui-validatebox" type="text" id="stu_huiFang1" name="stu_huiFang"  /> </td> 
	   <td><label for="email">是否上门:</label></td>
	   <td><input class="easyui-validatebox" type="text" id="stu_visit1" name="stu_visit"  /></td>
	   <td><label for="email">上门时间:</label>   </td>
	   <td><input class="easyui-validatebox" type="text" id="stu_visitTime1" name="stu_visitTime"  /></td> 
	   </tr>	    
	   <tr>
	   <td><label for="email">首次回访时间:</label></td>
	   <td><input class="easyui-validatebox" type="text" id="stu_payTime1" name="stu_payTime"  /></td>
	   <td> <label for="email">是否缴费:</label> </td>
	   <td> <input class="easyui-validatebox" type="text" id="stu_money1" name="stu_money"  /> </td>
	   <td><label for="email">缴费时间:</label> </td>
	   <td><input class="easyui-validatebox" type="text" id="stu_moneyTime1" name="stu_moneyTime"  /> </td>
	   <td> <label for="email">金额:</label></td>
	   <td><input class="easyui-validatebox" type="text" id="stu_jinE1" name="stu_jinE"  /></td>	   	   
	   </tr>
	   <tr>
	   <td><label for="email">是否退费:</label></td>
	   <td><input class="easyui-validatebox" type="text" id="stu_tui1" name="stu_tui"  /></td>
	   <td><label for="email">退费原因:</label> </td>
	   <td><input class="easyui-validatebox" type="text" id="stu_tuiYin1" name="stu_tuiYin"  />  </td>
	   <td><label for="email">定金金额:</label> </td>
	   <td><input class="easyui-validatebox" type="text" id="stu_dingJinE1" name="stu_dingJinE"  /></td>
	   <td> <label for="email">定金时间:</label></td>
	   <td><input class="easyui-validatebox" type="text" id="stu_dingTime1" name="stu_dingTime"  /></td>
	   </tr>
	   <tr>
	   <td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateWstu()" >提交</a></td>
	   <td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="close()" >取消</a></td>
	   </tr>
	   
	   </table>            	                                                                                                                                  
 </form>
        
</div> 
</body>
</html>
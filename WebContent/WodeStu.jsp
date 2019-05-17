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
		initWodeStu();
	})
	function initWodeStu(){
		$('#ltab').datagrid({    
		    url:"selectStu",
		    method:"post",
		    pagination:true,
		    toolbar: '#tb',
		    //多条件查询
		    	queryParams: {
		    		stu_name:$("#stu_name").val(),
		    		stu_phone:$("#stu_phone").val(),
		    		stu_money:$("#stu_money").combobox("getValue"),
		    		stu_youXiao:$("#stu_youXiao").combobox("getValue"),
		    		stu_huiFang:$("#stu_huiFang").combobox("getValue"),
		    		stu_qq:$("#stu_qq").val(),
		    		startstu_creatorTime:$("#startstu_creatorTime").val(),
		    		eddstu_creatorTime:$("#eddstu_creatorTime").val(),

		}

		});  
	}
	function formattercaozuo(value,row,index) {
		return "<a href='javascript:void(0)' onclick='update("+index+")'>修改</a> <a href='javascript:void(0)' onclick='del("+index+")'>删除</a>   <a href='javascript:void(0)' onclick='chakan("+index+")'>查看</a>"
	}
	function formattershi(value,row,index){
		return row.stu_baoBei==1? "是":"否";

	}
	function formattershistu_youXiao(value,row,index){
		return row.stu_youXiao==1? "是":"否";

	}
	function formattershistu_huiFang(value,row,index){
		return row.stu_huiFang==1? "是":"否";

	}
	function formattershistu_visit(value,row,index){
		return row.stu_visit ==1? "是":"否";

	}
	function formattershistu_money(value,row,index){
		return row.stu_money==1? "是":"否";

	}
	function formattershistu_tui(value,row,index){
		return row.stu_tui==1? "是":"否";

	}
	function formattershistu_class(value,row,index){
		return row.stu_class==1? "是":"否";

	}
	//查看
	function chakan(index) {
		var datas=$("#ltab").datagrid("getData");
		var row=datas.rows[index];
		$("#frmStuck").form("load",row)
		 $("#chakanStu").dialog("open");
	}
	//修改
	function update(index) {
		var datas=$("#ltab").datagrid("getData");
		var row=datas.rows[index];
		$("#frmStu").form("load",row)
		 $("#updateStu").dialog("open");
	}
	 
	function updateStu() {
		$.post("updateStu",{
			stu_id:$("#stu_id").val(),
			stu_ziXun:$("#stu_ziXun").val(),
			stu_keCheng:$("#stu_keCheng").val(),
			stu_daFen:$("#stu_daFen").val(),
			stu_class:$("#stu_class").combobox("getValue"),
			stu_classTime:$("#stu_classTime").val(),
			stu_classBeiZhu:$("#stu_classBeiZhu").val(),
			stu_ziXunBeiZhu:$("#stu_ziXunBeiZhu").val(),
			stu_youXiao:$("#stu_youXiao").combobox("getValue"),
			stu_wuXiaoYuanYin:$("#stu_wuXiaoYuanYin").val(),
			stu_huiFang:$("#stu_huiFang").combobox("getValue"),
			stu_visit:$("#stu_visit").combobox("getValue"),
			stu_visitTime:$("#stu_visitTime").val(),
			stu_payTime:$("#stu_payTime").val(),
			stu_money:$("#stu_money").combobox("getValue"),
			stu_moneyTime:$("#stu_moneyTime").val(),
			stu_jinE:$("#stu_jinE").val(),
			stu_tui:$("#stu_tui").combobox("getValue"),
			stu_tuiYin:$("#stu_tuiYin").val(),
			stu_dingJinE:$("#stu_dingJinE").val(),
			stu_dingTime:$("#stu_dingTime").val(),
		},function(res){
			if(res>0){
				$("#ltab").datagrid("reload");
				$("#updateStu").dialog("close");
				$.messager.alert("提示","修改成功");
			}else{
				$.messager.alert("提示","修改失败");
			}
		},"json");
	}
	function closesStu() {
		 $("#updateStu").dialog("close");
	}
	//删除
	function del(index) {
		var datas=$("#ltab").datagrid("getData");
		var row=datas.rows[index];
		$.messager.confirm("提示","确认删除么？",function(r){
			if(r){
				$.post("delStu",{
					stu_id:row.stu_id
				},function(res){
					if(res>0){
						//删除成功
						$("#ltab").datagrid("reload");
						$.messager.alert("提示","删除成功");
						
					}else{
						//删除失败
						$.messager.alert("提示","删除失败");
					}
				},"json")
				
			}
		})
	} 
</script>
</head>
<body>

	<table class="easyui-datagrid" id="ltab">   
    <thead>   
        <tr>   
            <th data-options="field:'stu_id',title:'学生id'"></th>   
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
            <th data-options="field:'stu_baoBei',title:'是否报备',formatter:formattershi"></th>   
            <th data-options="field:'stu_keCheng',title:'课程方向'"></th>   
            <th data-options="field:'stu_youXiao',title:'是否有效',formatter:formattershistu_youXiao"></th>   
            <th data-options="field:'stu_daFen',title:'打分'"></th>   
            <th data-options="field:'stu_huiFang',title:'是否回访',formatter:formattershistu_huiFang"></th>   
            <th data-options="field:'stu_visit',title:'是否上门',formatter:formattershistu_visit"></th>   
            <th data-options="field:'stu_visitTime',title:'上门时间'"></th>   
            <th data-options="field:'stu_payTime',title:'首次回访时间'"></th>   
            <th data-options="field:'stu_wuXiaoYuanYin',title:'无效原因'"></th>   
            <th data-options="field:'stu_money',title:'是否缴费',formatter:formattershistu_money"></th>   
            <th data-options="field:'stu_moneyTime',title:'缴费时间'"></th>   
            <th data-options="field:'stu_jinE',title:'金额'"></th>   
            <th data-options="field:'stu_tui',title:'是否退费',formatter:formattershistu_tui"></th>   
            <th data-options="field:'stu_class',title:'是否进班',formatter:formattershistu_class"></th>   
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
            <th data-options="field:'操作',title:'操作',formatter:formattercaozuo"></th>   
        </tr>   
    </thead>   
</table>  
<div id="tb">
<form id="ff">   
           <label for="email">姓名:</label>   
        <input class="easyui-validatebox" type="text" id="stu_name" name="stu_name" />       
        
           <label for="email">电话:</label>   
        <input class="easyui-validatebox" type="text" id="stu_phone" name="stu_phone" />       
        
         <!--   <label for="email">咨询师:</label>   
        <input class="easyui-validatebox" type="text" id="" name="email" />    -->    
        
           <label for="email">是否缴费:</label>   
          <select class="easyui-combobox" id="stu_money" name="stu_money">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>     
        
           <label for="email">是否有效:</label>   
        <select class="easyui-combobox" id="stu_youXiao" name="stu_youXiao">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>       
        
           <label for="email">是否回访:</label>   
 			<select class="easyui-combobox" id="stu_huiFang" name="stu_huiFang">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>        </br>
           <label for="email">QQ:</label>   
        <input class="easyui-validatebox" type="text" id="stu_qq" name="stu_qq" />       
        
       <label for="email">创建时间:</label>   
        <input class="easyui-datebox" id="startstu_creatorTime" name="startstu_creatorTime" required="true"/>~
        <input class="easyui-datebox" id="eddstu_creatorTime" name="eddstu_creatorTime" required="true"/>
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initWodeStu()">搜索</a> 
</form> 
</div>


<!--修改  -->
<div id="updateStu" class="easyui-window" data-options="modal:true,closed:true,resizable:true,collapsible:true,draggable:true">
		<form id="frmStu" class="easyui-form" >
			<table>
			<tr>
					<td>
						<label for="easyui-validatebox">id:</label> 
						<td>
						<input class="easyui-validatebox" type="text" id="stu_id" name="stu_id" />
					</td>
					</td>
					</tr>
				<tr>
					<td>
						<label for="easyui-validatebox">咨询姓名:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_ziXun" name="stu_ziXun" />
					</td>
					<td>
						<label for="easyui-validatebox">课程方向:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_keCheng" name="stu_keCheng" />
					</td>
					<td>
						<label for="easyui-validatebox">打分:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_daFen" name="stu_daFen" />
					</td>
				</tr>
				 
				<tr>
					<td>
						<label for="name">是否进班:</label> 
					</td>
					<td>
						     <select class="easyui-combobox" id="stu_class" name="stu_class">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
					
					<td>
						<label for="name">进班时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_classTime" name="stu_classTime" />
					</td>
					<td>
						<label for="name">进班备注:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_classBeiZhu" name="stu_classBeiZhu" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">咨询师备注:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_ziXunBeiZhu" name="stu_ziXunBeiZhu" />
					</td>
	
					<td>
						<label for="name">是否有效:</label> 
					</td>
					<td>
					   <select class="easyui-combobox" id="stu_youXiao" name="stu_youXiao">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
				
					<td>
						<label for="name">无效原因:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_wuXiaoYuanYin" name="stu_wuXiaoYuanYin" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">是否回访:</label> 
					</td>
					<td>
						   <select class="easyui-combobox" id="stu_huiFang" name="stu_huiFang">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
				
					<td>
						<label for="name">是否上门:</label> 
					</td>
					<td>
					   <select class="easyui-combobox" id="stu_visit" name="stu_visit">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
				
					<td>
						<label for="name">上门时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_visitTime" name="stu_visitTime" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">首次回访时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_payTime" name="stu_payTime" />
					</td>
				
					<td>
						<label for="name">是否缴费:</label> 
					</td>
					<td>
						   <select class="easyui-combobox" id="stu_money" name="stu_money">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
				
					<td>
						<label for="name">缴费时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_moneyTime" name="stu_moneyTime" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">缴费金额:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_jinE" name="stu_jinE" />
					</td>
				
					<td>
						<label for="name">是否退费:</label> 
					</td>
					<td>
						   <select class="easyui-combobox" id="stu_tui" name="stu_tui">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
				
					<td>
						<label for="name">退费原因:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_tuiYin" name="stu_tuiYin" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">定金金额:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_dingJinE" name="stu_dingJinE" />
					</td>
			
					<td>
						<label for="name">定金时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_dingTime" name="stu_dingTime" />
					</td>
				
					
				</tr>
				<tr>
			<td></td>
				<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateStu()" >提交</a>
					</td>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closesStu()" >取消</a>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
	
	<!-- 查看 -->
	<div id="chakanStu" class="easyui-window" data-options="modal:true,closed:true,resizable:true,collapsible:true,draggable:true">
		<form id="frmStuck" class="easyui-form" >
			<table>
			<tr>
					<td>
						<label for="easyui-validatebox">id:</label> 
						<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_id" name="stu_id" />
					</td>
					</td>
					</tr>
				<tr>
					<td>
						<label for="easyui-validatebox">咨询姓名:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_ziXun" name="stu_ziXun" />
					</td>
					<td>
						<label for="easyui-validatebox">课程方向:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_keCheng" name="stu_keCheng" />
					</td>
					<td>
						<label for="easyui-validatebox">打分:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_daFen" name="stu_daFen" />
					</td>
				</tr>
				 
				<tr>
					<td>
						<label for="name">是否进班:</label> 
					</td>
					<td>
					 <select class="easyui-combobox" disabled="disabled"  id="stu_class" name="stu_class">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
					
					<td>
						<label for="name">进班时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_classTime" name="stu_classTime" />
					</td>
					<td>
						<label for="name">进班备注:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_classBeiZhu" name="stu_classBeiZhu" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">咨询师备注:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_ziXunBeiZhu" name="stu_ziXunBeiZhu" />
					</td>
	
					<td>
						<label for="name">是否有效:</label> 
					</td>
					<td>
					  <select class="easyui-combobox" disabled="disabled"  id="stu_youXiao" name="stu_youXiao">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
				
					<td>
						<label for="name">无效原因:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_wuXiaoYuanYin" name="stu_wuXiaoYuanYin" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">是否回访:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_huiFang" name="stu_huiFang" />
					</td>
				
					<td>
						<label for="name">是否上门:</label> 
					</td>
					<td>
					<select class="easyui-combobox" disabled="disabled"  id="stu_visit" name="stu_visit">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
				
					<td>
						<label for="name">上门时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_visitTime" name="stu_visitTime" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">首次回访时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_payTime" name="stu_payTime" />
					</td>
				
					<td>
						<label for="name">是否缴费:</label> 
					</td>
					<td>
						<select class="easyui-combobox" disabled="disabled"  id="stu_money" name="stu_money">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
				
					<td>
						<label for="name">缴费时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_moneyTime" name="stu_moneyTime" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">缴费金额:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_jinE" name="stu_jinE" />
					</td>
				
					<td>
						<label for="name">是否退费:</label> 
					</td>
					<td>
						<select class="easyui-combobox" disabled="disabled"  id="stu_tui" name="stu_tui">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			<select>
					</td>
				
					<td>
						<label for="name">退费原因:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_tuiYin" name="stu_tuiYin" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">定金金额:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_dingJinE" name="stu_dingJinE" />
					</td>
			
					<td>
						<label for="name">定金时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_dingTime" name="stu_dingTime" />
					</td>
			</table>
		</form>
	</div>
</body>
</html>
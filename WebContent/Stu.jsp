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
<script type="text/javascript" src="js/jquery-easyui-1.4.3/datagrid-export.js"></script>
<script type="text/javascript">
	$(function(){
		initStu();
	})
	function initStu(){
		$('#ltab').datagrid({    
		    url:"selectStu1",
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
		    		startTime:$("#startTime").datetimebox("getValue"),
		    		endTime:$("#endTime").datetimebox("getValue"),
		}

		});  
			$("#bar-ff").form("reset");
	}
	
	//打开设置隐藏列对话框
	function lookstu() {
		$("#hiddenColumn_dialog").dialog("open");
	}
	function saveColumn() {
		var cbx = $("#hiddenColumn_form input[type='checkbox']"); //获取Form里面是checkbox的Object
		var checkedValue = "";
		var unCheckValue = "";
		for (var i = 0; i < cbx.length; i++) {
			if (cbx[i].checked) {//获取已经checked的Object
				if (checkedValue.length > 0) {
					checkedValue += "," + cbx[i].value; //获取已经checked的value
					 

				} else {
					checkedValue = cbx[i].value;
				}
			}
			if (!cbx[i].checked) {//获取没有checked的Object
				if (unCheckValue.length > 0) {
					unCheckValue += "," + cbx[i].value; //获取没有checked的value
					 
				} else {
					unCheckValue = cbx[i].value;
				}
			}
		}
		var checkeds = new Array();
		if (checkedValue != null && checkedValue != "") {
			checkeds = checkedValue.split(',');
			for (var i = 0; i < checkeds.length; i++) {
				$('#ltab').datagrid('hideColumn', checkeds[i]); //隐藏相应的列
			}

		}
		var unChecks = new Array();

		if (unCheckValue != null && unCheckValue != "") {
			unChecks = unCheckValue.split(',');
			for (var i = 0; i < unChecks.length; i++) {
				$('#ltab').datagrid('showColumn', unChecks[i]); //显示相应的列
			}
		}
		$('#hiddenColumn_dialog').dialog('close');
	}
	//关闭设置隐藏列弹框
	function closed_hiddenColumn() {
		$('#hiddenColumn_dialog').dialog('close');
	}
	//全选按钮
	function ChooseAll() {

		var a = $("#isQuanXuan").text();//获取按钮的值
		if ("全选" == a.trim()) {
			$("#hiddenColumn_form input[type='checkbox']")
					.prop("checked", true);//全选
			$('#isQuanXuan').linkbutton({
				text : '全不选'
			});
		} else {
			$("#hiddenColumn_form input[type='checkbox']").removeAttr(
					"checked", "checked");//取消全选
			$('#isQuanXuan').linkbutton({
				text : '全选'
			});
		}

	}

	//导出excel
	function exportExcel(){
		$('#ltab').datagrid('toExcel','dg.xls');	// export to excel
	} 
	
	
	function formattercaozuo(value,row,index) {
		return "<a href='javascript:void(0)' onclick='update("+index+")'>修改</a> <a href='javascript:void(0)' onclick='del("+index+")'>删除</a>   <a href='javascript:void(0)' onclick='chakan("+index+")'>查看</a> "
	}
	
	function formatteryuangong(value,row,index){
		return value.u_loginName;		
	}
	//查看
	function chakan(index) {
		var datas=$("#ltab").datagrid("getData"); 

		var row=datas.rows[index]; 
		
		$("#ttt").combobox({
			url:'getU_loginName',
			method:'post',
			valueField:'u_id',//填充进 <option value='id'>text</option>    
			textField:'u_loginName'//标签中间（<option>text</option>）   			
		})
		
		/* $("#ttt").combobox('setValue',row.usery.u_loginName);	 */
		
		 $("#chakanStu").dialog("open");
		 
		
		$("#frmStuck").form("load",row);
		 /* var str =  */JSON.stringify($("#ttt").combobox('setValue',row.usery.u_loginName));  
			/*  alert(str);   */
		
		
	 /*  alert($("#ttt").combobox('setValue',row.usery.u_loginName)) */
	 	
	 
	}
	 //修改
	function update(index) {
		var datas=$("#ltab").datagrid("getData");
		var row=datas.rows[index];
		
		$("#updatett").combobox({
			url:'getU_loginName',
			method:'post',
			valueField:'u_id',//填充进 <option value='id'>text</option>    
			textField:'u_loginName'//标签中间（<option>text</option>）   
			
		})
		$("#updatett").combobox('setValue',row.usery.u_loginName)	
		
		$("#updatefrmStu").form("load",row);
		
		//打开弹窗
		$("#updatedialog").dialog("open")
	
	}
	 
	function saveUpdate() {

		alert($("#updatestu_youXiao").combobox("getValue"));
		$.post("updateStu1",{
			stu_id:$("#updatestu_id").val(),
			stu_name:$("#updatestu_name").val(),
			stu_sex:$("#updatestu_sex").combobox('getValue'),
			stu_age:$("#updatestu_age").val(),
			stu_phone:$("#updatestu_phone").val(),
			stu_state:$("#updatestu_state").val(),
			stu_xueLi:$("#updatestu_xueLi").combobox('getValue'),
			stu_quDao:$("#updatestu_quDao").val(),
			stu_wangZhan:$("#updatestu_wangZhan").val(),
			stu_guanZhu:$("#updatestu_guanZhu").val(),
			stu_guanJian:$("#updatestu_guanJian").val(),
			stu_wx:$("#updatestu_wx").val(),
			stu_qq:$("#updatestu_qq").val(),
			stu_baoBei:$("#updatestu_baoBei").combobox('getValue'),
			stu_beiZhu:$("#updatestu_beiZhu").val(),
			stu_useryId:$("#updatett").combobox('getValue'),
		
			stu_youXiao:$("#updatestu_youXiao").combobox('getValue'),
			stu_wuXiaoYuanYin:$("#updatestu_wuXiaoYuanYin").val(),
			stu_huiFang:$("#updatestu_huiFang").combobox('getValue'),
		/* 	stu_creatorTime:$("#updatestu_creatorTime").val(), */
			stu_visit:$("#updatestu_visit").combobox('getValue'),
			stu_visitTime:$("#updatestu_visitTime").val(),
			stu_payTime:$("#updatestu_payTime").val(),
			stu_money:$("#updatestu_money").combobox('getValue'),
			stu_moneyTime:$("#updatestu_moneyTime").val(),
			stu_jinE:$("#updatestu_jinE").val(),
			stu_tui:$("#updatestu_tui").combobox('getValue'),
			stu_tuiYin:$("#updatestu_tuiYin").val(),
			stu_dingJinE:$("#updatestu_dingJinE").val(),
			stu_dingTime:$("#updatestu_dingTime").val(),
			stu_class:$("#updatestu_class").combobox('getValue'),
			stu_classTime:$("#updatestu_classTime").val(),
			stu_classBeiZhu:$("#updatestu_classBeiZhu").val(),
			stu_ziXun:$("#updatestu_ziXun").val(),
			stu_ziXunBeiZhu:$("#updatestu_ziXunBeiZhu").val(),
			stu_quYu:$("#updatestu_quYu").val(),
			stu_buMen:$("#updatestu_buMen").val(),
			stu_keCheng:$("#updatestu_keCheng").val(),
			stu_daFen:$("#updatestu_daFen").val(),
		
			
			stu_luRu:$("#updatestu_luRu").val(),
			
		},function(res){
			if(res>0){
				$("#ltab").datagrid("reload");
				$("#updatedialog").dialog("close");
				$.messager.alert("提示","修改成功");
			}else{
				$.messager.alert("提示","修改失败");
			}
		},"json");
	}
	function closeAdd(){
		$("#add-dialog").dialog("close") 
	}
	function closeUpdate(){
		$("#updatedialog").dialog("close") 
	}
	
	//添加
	function add(index) {
		/* var datas=$("#ltab").datagrid("getData");
		var row=datas.rows[index];
		$("#addfrmStu").form("load",row) */
		$("#addtt").combobox({
			url:'getU_loginName',
			method:'post',
			valueField:'u_id',//填充进 <option value='id'>text</option>    
			textField:'u_loginName'//标签中间（<option>text</option>）   
			
		})
		 $("#add-dialog").dialog("open");
	}
	 
	function saveAdd() {
		$.post("addStu1",{
			stu_id:$("#addstu_id").val(), 
			stu_name:$("#addstu_name").val(),
			stu_sex:$("#addstu_sex").combobox('getValue'),
			stu_age:$("#addstu_age").val(),
			stu_phone:$("#addstu_phone").val(),
			stu_state:$("#addstu_state").val(),
			stu_xueLi:$("#addstu_xueLi").combobox('getValue'),
			stu_quDao:$("#addstu_quDao").val(),
			stu_wangZhan:$("#addstu_wangZhan").val(),
			stu_guanZhu:$("#addstu_guanZhu").val(),
			stu_guanJian:$("#addstu_guanJian").val(),
			stu_wx:$("#addstu_wx").val(),
			stu_qq:$("#addstu_qq").val(),
			stu_baoBei:$("#addstu_baoBei").combobox('getValue'),
			stu_beiZhu:$("#addstu_beiZhu").val(),
			stu_useryId:$("#addtt").combobox('getValue'),
			
			
		},function(res){
			if(res>0){
				$("#ltab").datagrid("reload");
				$("#add-dialog").dialog("close");
				$.messager.alert("提示","添加成功");
			}else{
				$.messager.alert("提示","添加失败");
			}
		},"json");
	}
	/* function closesStu() {
		 $("#addStu").dialog("close");
	} */
	//删除
	function del(index) {
		var datas=$("#ltab").datagrid("getData");
		var row=datas.rows[index];
		$.messager.confirm("提示","确认删除么？",function(r){
			if(r){
				$.post("delStu1",{
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
	//性别
	function formatterstu_sex(value,row,index) {
		return row.stu_sex==1? "男":"女";
	}
	
 	 //是否报备
	function formatterstu_baoBei(value,row,index) {
		return row.stu_baoBei==1? "是":"否";
	} 
	//是否有效
	function formatterstu_youXiao(value,row,index) {
		return row.stu_youXiao==1? "是":"否";
	}
	
	 //是否缴费
 	function formatterstu_money(value,row,index) {
		return row.stu_money==1? "是":"否";
	} 
	//是否退费
	function formatterstu_tui(value,row,index) {
		return row.stu_tui==1? "是":"否";
	}
	
	 //是否进班
	function formatterstu_class(value,row,index) {
		return row.stu_class==1? "是":"否";
	}   


	
	 //是否回访
	function formatterstu_huiFang(value,row,index) {
		return row.stu_huiFang==1? "是":"否";
	}  
	 //是否上门
	 
	 function formatterstu_visit(value,row,index) {
			return row.stu_visit==1? "是":"否";
		} 
	 
	 
	
</script>
</head>
<body>
	<table class="easyui-datagrid" id="ltab">   
    <thead>   
        <tr>   
            <th data-options="field:'stu_id',title:'学生编号'"></th>   
            <th data-options="field:'stu_name',title:'学生姓名'"></th>   
            <th data-options="field:'stu_sex',title:'性别',formatter:formatterstu_sex"></th>   
            <th data-options="field:'stu_age',title:'年龄'"></th>   
            <th data-options="field:'stu_phone',title:'电话'"></th>  
            <th data-options="field:'stu_state',title:'个人状态'"></th>   
            <th data-options="field:'stu_xueLi',title:'学历'"></th>   
             <th data-options="field:'stu_quDao',title:'来源渠道'"></th>
             <th data-options="field:'stu_wangZhan',title:'来源网站'"></th>
             <th data-options="field:'stu_guanZhu',title:'学员关注'"></th>       
            <th data-options="field:'stu_guanJian',title:'来源关键词'"></th>   
            <th data-options="field:'stu_wx',title:'微信'"></th>  
            <th data-options="field:'stu_qq',title:'QQ'"></th>              
            <th data-options="field:'stu_baoBei',title:'是否报备',formatter:formatterstu_baoBei"></th>     
            <th data-options="field:'stu_beiZhu',title:'在线备注'"></th>           
            <th data-options="field:'usery',title:'负责人',formatter:formatteryuangong"></th>                           
            <th data-options="field:'stu_youXiao',title:'是否有效',formatter:formatterstu_youXiao"></th>   		
			<th data-options="field:'stu_wuXiaoYuanYin',title:'无效原因'"></th>
             <th data-options="field:'stu_huiFang',title:'是否回访',formatter:formatterstu_huiFang"></th>  
            <th data-options="field:'stu_creatorTime',title:'创建时间'"></th>    
           <th data-options="field:'stu_visit',title:'是否上门',formatter:formatterstu_visit"></th>   
            <th data-options="field:'stu_visitTime',title:'上门时间'"></th>    
            <th data-options="field:'stu_payTime',title:'首次回访时间'"></th>               
             <th data-options="field:'stu_money',title:'是否缴费',formatter:formatterstu_money"></th>            
            <th data-options="field:'stu_moneyTime',title:'缴费时间'"></th>   
            <th data-options="field:'stu_jinE',title:'缴费金额'"></th>             
             <th data-options="field:'stu_tui',title:'是否退费',formatter:formatterstu_tui"></th>          
            <th data-options="field:'stu_tuiYin',title:'退费原因'"></th>            
           <th data-options="field:'stu_dingJinE',title:'定金金额'"></th>   
            <th data-options="field:'stu_dingTime',title:'定金时间'"></th>               
           <th data-options="field:'stu_class',title:'是否进班',formatter:formatterstu_class"></th>          
           <th data-options="field:'stu_classTime',title:'进班时间'"></th>   
            <th data-options="field:'stu_classBeiZhu',title:'进班备注'"></th>   
            <th data-options="field:'stu_ziXun',title:'咨询姓名'"></th>
            <th data-options="field:'stu_ziXunBeiZhu',title:'咨询师备注'"></th>             
            <th data-options="field:'stu_quYu',title:'所在区域'"></th>   
            <th data-options="field:'stu_buMen',title:'来源部门'"></th>   
            <th data-options="field:'stu_keCheng',title:'课程方向'"></th>
            <th data-options="field:'stu_daFen',title:'打分'"></th>  
            <th data-options="field:'stu_luRu',title:'录入人'"></th>     
            <th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo"></th> 
            
        </tr>   
    </thead>   
</table>  
<!-- 搜索 -->
<div id="tb">
<form id="ff">   
           <label for="email">姓名:</label>   
        <input class="easyui-validatebox" type="text" id="stu_name" name="stu_name" />       
        
           <label for="email">电话:</label>   
        <input class="easyui-validatebox" type="text" id="stu_phone" name="stu_phone" />       
        
         <!--   <label for="email">咨询师:</label>   
        <input class="easyui-validatebox" type="text" id="" name="email" />    -->    
        
           <label for="email">是否缴费:</label>   
        <select class="easyui-combobox" id="stu_money" name="stu_money" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select>        
        
           <label for="email">是否有效:</label>   
         <select class="easyui-combobox" id="stu_youXiao" name="stu_youXiao" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select>   
        
           <label for="email">是否回访:</label>   
        <select class="easyui-combobox" id="stu_huiFang" name="stu_huiFang">   
			    <option value="">--请选择--</option>
			    <option value="1">是</option>   
			    <option value="2">否</option>   
			</select>          
        
           <label for="email">QQ:</label>   
        <input class="easyui-validatebox" type="text" id="stu_qq" name="stu_qq" />       
        </br>
       <label for="email">创建时间:</label>   
        <input class="easyui-datetimebox" id="startTime" />——
        <input class="easyui-datetimebox" id="endTime"  />
       
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initStu()">搜索</a> 
         
		<a
				id="btn" href="javascript:lookstu()" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'">设置隐藏列</a>
				
				<a
						class="easyui-linkbutton" plain="true" onclick="exportExcel()"
						id="serach" data-options="iconCls:'icon-print'">导出excel</a>
				
	<br>	
 <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">添加</a> 

</form> 
</div>


<!--修改  -->

<div  id="updatedialog"  title="修改当前学生信息"  style="width:650px; height: 500px;"
 class="easyui-dialog" data-options="modal:true,closed:true,buttons:[
	{
	text:'保存',
	handler:function(){
		saveUpdate();
		}
	},{
	text:'取消',
	handler:function(){
		closeUpdate();
		}
	}
	]">
		<form id="updatefrmStu"  >
		
			<table  cellpadding="7">
				<tr>
						<td><label for="easyui-validatebox" >学生编号:</label></td> 
						<td><input class="easyui-validatebox" disabled="disabled" type="text" id="updatestu_id" name="stu_id" /></td> 
					
						<td><label for="easyui-validatebox">学生姓名:</label> </td> 
						<td><input class="easyui-validatebox" type="text" id="updatestu_name" name="stu_name" /></td> 
				</tr>
				<tr>	
						<td> <label for="easyui-validatebox">性别:</label></td> 
						 <td> <select class="easyui-combobox" id="updatestu_sex" name="stu_sex" >   
							    <option value="">--请选择--</option>
							    <option value="1">男</option>   
							    <option value="2">女</option>
							</select> </td>
					
						<td><label for="easyui-validatebox">年龄:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_age" name="stu_age" /></td>
				</tr>
				<tr>
						<td><label for="name">电话:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_phone" name="stu_phone" /></td>
			
						<td><label for="name">个人状态:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_state" name="stu_state" /></td>
			</tr>
			<tr>
						<td><label for="name">学历:</label></td> 
						<td><select class="easyui-combobox" id="updatestu_xueLi" name="stu_xueLi" >   
							    <option value="">--请选择--</option>
							    <option value="高中">高中</option>
							    <option value="初中">初中</option>
							    <option value="小学">小学</option>  
							    <option value="其他">其他</option>   
							    
							</select> </td>
			
						<td><label for="name">来源渠道:</label></td> 
						<td><input class="easyui-validatebox" type="text" id="updatestu_quDao" name="stu_quDao" /></td>
		</tr>
		<tr>
						<td><label for="name">来源网站:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_wangZhan" name="stu_wangZhan" /></td>
			
						<td><label for="name">学员关注:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_guanZhu" name="stu_guanZhu" /></td>
		</tr>
		<tr>	
						<td><label for="name">来源关键字:</label></td> 
						<td><input class="easyui-validatebox" type="text" id="updatestu_guanJian" name="stu_guanJian" /></td>
				
						<td><label for="name">微信:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_wx" name="stu_wx" /></td>
			</tr>
			<tr>		
						<td><label for="name">QQ:</label></td> 
						<td><input class="easyui-validatebox" type="text" id="updatestu_qq" name="stu_qq" /></td>
			
						<td><label for="name">是否报备:</label> </td>
						<td> <select class="easyui-combobox" id="updatestu_baoBei" name="stu_baoBei" >  
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select> </td>
			</tr>
			<tr>
						<td><label for="name">在线备注:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_beiZhu" name="stu_beiZhu" /></td>
				
						<td><label for="name">负责人:</label> </td>
							     <!-- 下拉列表 -->
							<td><select id="updatett" class="easyui-combobox">
								<option selected="selected" >--请选择--</option>
							</select></td>
			</tr>	
			
			

			<tr>			
						<td><label for="name">是否有效:</label> </td>
						<td> <select class="easyui-combobox" id="updatestu_youXiao" name="stu_youXiao" >  
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select> </td>
						<td><label for="name">无效原因:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_wuXiaoYuanYin" name="stu_wuXiaoYuanYin" /></td>			
			</tr>
			<tr>			
						<td><label for="name">是否回访:</label> </td>
						<td> <select class="easyui-combobox" id="updatestu_huiFang" name="stu_huiFang" >  
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select> </td>
						<td><label for="name">创建时间:</label> </td>
						<td><input class="easyui-validatebox" disabled="disabled" type="text" id="updatestu_creatorTime" name="stu_creatorTime" /></td>			
			</tr>
			<tr>			
						<td><label for="name">是否上门:</label> </td>
						<td> <select class="easyui-combobox" id="updatestu_visit" name="stu_visit" >  
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select> </td>
						<td><label for="name">上门时间:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_visitTime" name="stu_visitTime" /></td>			
			</tr>
			<tr>			
						<td><label for="name">首次回访时间:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_payTime" name="stu_payTime" /></td>	
						<td><label for="name">是否缴费:</label> </td>
						<td> <select class="easyui-combobox" id="updatestu_money" name="stu_money" >  
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select> </td>								
			</tr>
			<tr>			
						<td><label for="name">缴费时间:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_moneyTime" name="stu_moneyTime" /></td>	
						<td><label for="name">缴费金额:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_jinE" name="stu_jinE" /></td>								
			</tr>
			<tr>			
						<td><label for="name">是否退费:</label> </td>
						<td> <select class="easyui-combobox" id="updatestu_tui" name="stu_tui" >  
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select> </td>
						<td><label for="name">退费原因:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_tuiYin" name="stu_tuiYin" /></td>			
			</tr>
			<tr>			
						<td><label for="name">定金金额:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_dingJinE" name="stu_dingJinE" /></td>	
						<td><label for="name">定金时间:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_dingTime" name="stu_dingTime" /></td>								
			</tr>
			<tr>			
						<td><label for="name">是否进班:</label> </td>
						<td> <select class="easyui-combobox" id="updatestu_class" name="stu_class" >  
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select> </td>
						<td><label for="name">进班时间:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_classTime" name="stu_classTime" /></td>			
			</tr>
			<tr>			
						<td><label for="name">进班备注:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_classBeiZhu" name="stu_classBeiZhu" /></td>	
						<td><label for="name">咨询姓名:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_ziXun" name="stu_ziXun" /></td>								
			</tr>
			<tr>			
						<td><label for="name">咨询师备注:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_ziXunBeiZhu" name="stu_ziXunBeiZhu" /></td>	
						<td><label for="name">所在区域:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_quYu" name="stu_quYu" /></td>								
			</tr>
			<tr>			
						<td><label for="name">来源部门:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_buMen" name="stu_buMen" /></td>	
						<td><label for="name">课程方向:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="updatestu_keCheng" name="stu_keCheng" /></td>								
			</tr>
			
			
			
				
			<tr>
						<td><label for="name">打分:</label></td> 
						<td><input class="easyui-validatebox" type="text" id="updatestu_daFen" name="stu_daFen" /></td>
						<td><label for="name">录入人:</label></td> 
						<td><input class="easyui-validatebox" type="text" id="updatestu_luRu" name="stu_luRu" /></td>
			</tr>
			</table>
		</form>
	</div>
	
	<!-- 查看 -->
	<div id="chakanStu" title="查看当前学生信息" class="easyui-window" data-options="modal:true,closed:true,resizable:true,collapsible:true,draggable:true">
		<form id="frmStuck" >
		
		<table>
			
			<tr>
						<td><label for="easyui-validatebox">学生编号:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_id" name="stu_id" /></td>
				
						<td><label for="easyui-validatebox">学生姓名:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_name" name="stu_name" /></td>
					
						<td><label for="easyui-validatebox">性别:</label> </td>
					<td> <select class="easyui-combobox" id="stu_sex" name="stu_sex" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">男</option>   
							    <option value="2">女</option>
							</select></td>

			</tr>	
			<tr>	
						<td><label for="easyui-validatebox">年龄:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_age" name="stu_age" /></td>
				
						<td><label for="easyui-validatebox">电话:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_phone" name="stu_phone" /></td>
				
						<td><label for="easyui-validatebox">个人状态:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_state" name="stu_state" /></td>
			</tr>	
			<tr>	
						<td><label for="easyui-validatebox">学历:</label></td> 
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_xueLi" name="stu_xueLi" /></td>
				
						<td><label for="name">来源渠道:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_quDao" name="stu_quDao" /></td>
				
						<td><label for="name">来源网站:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_wangZhan" name="stu_wangZhan" /></td>
			</tr>	
			<tr>		
						<td><label for="name">学员关注:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_guanZhu" name="stu_guanZhu" /></td>
				
						<td><label for="name">来源关键字:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_guanJian" name="stu_guanJian" /></td>
					
						<td><label for="name">微信:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_wx" name="stu_wx" /></td>
			</tr>
			<tr>	
						<td><label for="name">QQ:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_qq" name="stu_qq" /></td>
				
						<td><label for="name">是否报备:</label> </td>
					<td><select class="easyui-combobox" id="stu_baoBei" name="stu_baoBei" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select></td>
			
						<td><label for="name">在线备注</label></td> 
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_beiZhu" name="stu_beiZhu" /></td>
			</tr>
			<tr>		
						<td><label for="name">负责人:</label></td> 
					<td><select class="easyui-combobox" id="ttt" name="usery" disabled="disabled" >   
							    <option value="">--请选择--</option>
							</select></td>
				
						<td><label for="name">是否有效:</label> </td>
					<td><select class="easyui-combobox" id="stu_youXiao" name="stu_youXiao" disabled="disabled" >  
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select></td> 
			
						<td><label for="name">无效原因:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_wuXiaoYuanYin" name="stu_wuXiaoYuanYin" /></td>
			</tr>	
			<tr>		
						<td><label for="name">是否回访:</label> </td>
					<td><select class="easyui-combobox" id="stu_huiFang" name="stu_huiFang" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select></td>
				
						<td><label for="name">创建时间:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_creatorTime" name="stu_creatorTime" /></td>
					
						 <td><label for="name">是否上门:</label> </td>
					<td><select class="easyui-combobox" id="stu_visit" name="stu_visit" disabled="disabled" > 
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select></td> 
			</tr>		
			<tr>	
					<td>	<label for="name">上门时间:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_visitTime" name="stu_visitTime" /></td>
					
						<td><label for="name">首次回访时间:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_payTime" name="stu_payTime" /></td>
					
						<td><label for="name">是否缴费:</label> </td>
					<td><select class="easyui-combobox" id="stu_money" name="stu_money" disabled="disabled" > 
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select></td>
			</tr>
			<tr>	
						<td><label for="name">缴费时间:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_moneyTime" name="stu_moneyTime" /></td>
				
						<td><label for="name">缴费金额:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_jinE" name="stu_jinE" /></td>
				
						<td><label for="name">是否退费:</label> </td>
					<td><select class="easyui-combobox" id="stu_tui" name="stu_tui" disabled="disabled" >  
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select></td>
			</tr>	
			<tr>	
						<td><label for="name">退费原因:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_tuiYin" name="stu_tuiYin" /></td>
				
						<td><label for="name">定金金额:</label></td> 
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_dingJinE" name="stu_dingJinE" /></td>
					
						<td><label for="name">定金时间:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_dingTime" name="stu_dingTime" /></td>
			</tr>	
			<tr>		
						<td><label for="name">是否进班:</label> </td>
					<td><select class="easyui-combobox" id="stu_class" name="stu_class" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select></td>
				
				
						<td><label for="name">进班时间:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_classTime" name="stu_classTime" /></td>
					
						<td><label for="name">进班备注:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_classBeiZhu" name="stu_classBeiZhu" /></td>
				
			</tr>	
			<tr>			<td><label for="name">咨询姓名:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_ziXun" name="stu_ziXun" /></td>
			
				
						<td><label for="name">咨询师备注:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_ziXunBeiZhu" name="stu_ziXunBeiZhu" /></td>
				
						<td><label for="name">所在区域:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_quYu" name="stu_quYu" /></td>
			</tr>
			<tr>		
						<td><label for="name">来源部门:</label></td> 
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_buMen" name="stu_buMen" /></td>
				
					
						<td><label for="name">课程方向:</label></td> 
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_keCheng" name="stu_keCheng" /></td>
					
						<td><label for="name">打分:</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_daFen" name="stu_daFen" /></td>
			</tr>
			<tr>		
						<td><label for="name">录入人 :</label> </td>
					<td><input class="easyui-validatebox" type="text" disabled="disabled" id="stu_luRu" name="stu_luRu" /></td>
			</tr>	
				</table>
		</form>
	</div>
	
	<!--添加  -->
<div  id="add-dialog" title="添加新的学生信息" class="easyui-dialog" style="width:650px; height: 500px;"
 data-options="modal:true,closed:true,buttons:[
	{
	text:'保存',
	handler:function(){
		saveAdd();
		}
	},{
	text:'取消',
	handler:function(){
		closeAdd();
		}
	}
	]">
		<form id="addfrmStu" class="easyui-form" >
			<table cellpadding="7">
				<tr>
						<td><label for="name">学生编号:</label></td>   
	          			<td><input class="easyui-validatebox" disabled="disabled" name="u_id" type="text" id="addu_id" data-options="required:true" /></td>
				</tr>
				<tr>	
						<td><label for="easyui-validatebox">学生姓名:</label></td> 
						<td><input class="easyui-validatebox" type="text" id="addstu_name" name="stu_name" data-options="required:true"  />(必填)</td>
					
					
						<td><label for="easyui-validatebox">性别:</label></td> 
						<td><select class="easyui-combobox" id="addstu_sex" name="stu_sex" >  
							    <option value="">--请选择--</option>
							    <option value="1">男</option>   
							    <option value="2">女</option>
							</select> </td>
				</tr>
				<tr>	
						<td><label for="easyui-validatebox">年龄:</label> 
						<td><input class="easyui-validatebox" type="text" id="addstu_age" name="stu_age" /></td>
					
						<td><label for="name">电话:</label> 
						<td><input class="easyui-validatebox" type="text" id="addstu_phone" name="stu_phone" data-options="required:true"  />(必填)</td>
				</tr>
				<tr>	
						<td><label for="name">个人状态:</label> 
						<td><input class="easyui-validatebox" type="text" id="addstu_state" name="stu_state" /></td>
					
						<td><label for="name">学历:</label> </td>
						<td><select class="easyui-combobox" id="addstu_xueLi" name="stu_xueLi" >   
							    <option value="">--请选择--</option>
							    <option value="高中">高中</option>
							    <option value="初中">初中</option>
							    <option value="小学">小学</option>  
							    <option value="其他">其他</option>   
							    
							</select> </td>
				</tr>
				<tr>
						<td><label for="name">来源渠道:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="addstu_quDao" name="stu_quDao" /></td>
					
						<td><label for="name">来源网站:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="addstu_wangZhan" name="stu_wangZhan" /></td>
				</tr>
				<tr>	
						<td><label for="name">学员关注:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="addstu_guanZhu" name="stu_guanZhu" /></td>
				
						<td><label for="name">来源关键字:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="addstu_guanJian" name="stu_guanJian" /></td>
				</tr>
				<tr>	
						<td><label for="name">微信:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="addstu_wx" name="stu_wx" /></td>
					
						<td><label for="name">QQ:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="addstu_qq" name="stu_qq" /></td>
				</tr>
				<tr>
						<td><label for="name">是否报备:</label> </td>
						<td><select class="easyui-combobox" id="addstu_baoBei" name="stu_baoBei" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>
							    <option value="2">否</option>	    
							</select> </td>
					
						<td><label for="name">在线备注:</label> </td>
						<td><input class="easyui-validatebox" type="text" id="addstu_beiZhu" name="stu_beiZhu" /></td>
				</tr>
				<tr>	
						<td><label for="name">负责人:</label></td> 
				     <!-- 下拉列表 -->
							<td><select id="addtt" class="easyui-combobox">
								<option selected="selected" >--请选择--</option>
							</select></td>
			
				</tr>
			</table>
		</form>
	</div>
	
	
	
	
	
	<!-- 设置 -->
	
	<!-- 设置隐藏列 -->
	<div id="hiddenColumn_dialog" class="easyui-dialog"
		data-options="title:'设置隐藏列',modal:true,closed:'true',
			buttons:[{
				text:'保存',
				handler:function(){
				saveColumn();<!-- 保存 -->
				initStu();<!-- 刷新 -->
				closed_hiddenColumn();<!-- 关闭弹窗 -->
				}
			},{
				text:'关闭',
				handler:function(){
				closed_hiddenColumn();
				}
			}]">
		<form style="width: 450px; height: 300px;" id="hiddenColumn_form"
			class="easyui-form">
			<a href="javascript:void()" class="easyui-linkbutton" id="isQuanXuan"
				onclick="ChooseAll()" data-options="iconCls:'icon-edit'">全选</a>
			<table >
			<!--  -->
				<tr>
					<td><input type="checkbox" value="stu_id" />编号</td>

					<td><input type="checkbox" value="stu_name" />姓名</td>

					<td><input type="checkbox" value="stu_sex" />性别</td>

					<td><input type="checkbox" value="stu_age" />年龄</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="stu_phone" />电话</td>

					<td><input type="checkbox" value="stu_state" />状态</td>

					<td><input type="checkbox" value="stu_xueLi" />学历</td>

					<td><input type="checkbox" value="stu_quDao" />来源渠道</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="stu_wangZhan" />来源网址</td>

					<td><input type="checkbox" value="stu_guanZhu" />学员关注</td>

					<td><input type="checkbox" value="stu_guanJian" />来源关键词</td>

					 <td><input type="checkbox" value="stu_wx" />微信</td>
				</tr>
				<tr>
					 <td><input type="checkbox" value="stu_qq" />QQ</td>

					<td><input type="checkbox" value="stu_baoBei" />是否报备</td> 

					<td><input type="checkbox" value="stu_beiZhu" />在线备注</td>

					<td><input type="checkbox" value="usery" />负责人</td>
				</tr>
				<tr>
					<td><input type="checkbox" value="stu_youXiao" />是否有效</td>

					<td><input type="checkbox" value="stu_wuXiaoYuanYin" />无效原因</td>

					<td><input type="checkbox" value="stu_huiFang" />是否回访</td>
					<td><input type="checkbox" value="stu_creatorTime" />创建时间</td>

				</tr>
				<tr>



					<td><input type="checkbox" value="stu_visit" />是否上门</td>
					<td><input type="checkbox" value="stu_visitTime" />上门时间</td>
					<td><input type="checkbox" value="stu_payTime" />首次回访时间</td>
					<td><input type="checkbox" value="stu_money" />是否缴费</td>
				</tr>
				<tr>



					<td><input type="checkbox" value="stu_moneyTime" />缴费时间</td>
					<td><input type="checkbox" value="stu_jinE" />金额</td>

					<td><input type="checkbox" value="stu_tui" />是否退费</td>

					<td><input type="checkbox" value="stu_tuiYin" />退费原因</td>
				</tr>
				<tr>


					<td><input type="checkbox" value="stu_dingJinE" />定金金额</td>
					<td><input type="checkbox" value="stu_dingTime" />定金时间</td>

					<td><input type="checkbox" value="stu_class" />是否进班</td>

					<td><input type="checkbox" value="stu_classTime" />进班时间</td>
				</tr>
				<tr>



					<td><input type="checkbox" value="stu_classBeiZhu" />进班备注</td>
					<td><input type="checkbox" value="stu_ziXun" />咨询姓名</td>

					<td><input type="checkbox" value="stu_ziXunBeiZhu" />咨询师备注</td>

					<td><input type="checkbox" value="stu_quYu" />所在区域</td>
				</tr>
				<tr>


					<td><input type="checkbox" value="stu_buMen" />来源部门</td>
					<td><input type="checkbox" value="stu_keCheng" />课程方向</td>

					<td><input type="checkbox" value="stu_daFen" />打分</td>

					<td><input type="checkbox" value="stu_luRu" />录入人 </td>
				</tr>
					<tr>


					<td><input type="checkbox" value="caozuo" />操作 </td>
				</tr>
			</table>
		</form>
	</div>
	
	
</body>
</html>
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
		    		startTime:$("#startTime").val(),
		    		endTime:$("#endTime").val(),
		}

		});  
			$("#bar-ff").form("reset");
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
		$("#frmStuck").form("load",row)
		 $("#chakanStu").dialog("open");
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
		$("#updatett").combobox('setValue',row.usery.u_id)
	
		
		$("#updatefrmStu").form("load",row);
		
		//打开弹窗
		$("#updatedialog").dialog("open")
	}
	 
	function saveUpdate() {
		
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


	
	//导出excel
	function exportExcel(){
		$('#ltab').datagrid('toExcel','dg.xls');	// export to excel
	} 
	 //是否回访
	function formatterstu_huiFang(value,row,index) {
		return row.stu_huiFang==1? "是":"否";
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
           <!--  <th data-options="field:'stu_quDao',title:'来源渠道'"></th>   
            <th data-options="field:'stu_wangZhan',title:'来源网站'"></th>   
            <th data-options="field:'stu_guanJian',title:'来源关键词'"></th>    -->
            <th data-options="field:'stu_wx',title:'微信'"></th>  
            <th data-options="field:'stu_qq',title:'QQ'"></th>  
             
            <th data-options="field:'stu_baoBei',title:'是否报备',formatter:formatterstu_baoBei"></th> 
            
            <th data-options="field:'stu_beiZhu',title:'在线备注'"></th>           
            <th data-options="field:'usery',title:'负责人',formatter:formatteryuangong"></th>                
           
            <th data-options="field:'stu_youXiao',title:'是否有效',formatter:formatterstu_youXiao"></th>    
			
			<th data-options="field:'stu_wuXiaoYuanYin',title:'无效原因'"></th>
             <th data-options="field:'stu_huiFang',title:'是否回访',formatter:formatterstu_huiFang""></th>  
            <th data-options="field:'stu_creatorTime',title:'创建时间'"></th>    
         <!--    <th data-options="field:'stu_visit',title:'是否上门'"></th>   
            <th data-options="field:'stu_visitTime',title:'上门时间'"></th>    
            <th data-options="field:'stu_payTime',title:'首次回访时间'"></th>    -->   
             
              <th data-options="field:'stu_money',title:'是否缴费',formatter:formatterstu_money"></th>   
          
           <!--  <th data-options="field:'stu_moneyTime',title:'缴费时间'"></th>   
            <th data-options="field:'stu_jinE',title:'缴费金额'"></th>    -->
           
             <th data-options="field:'stu_tui',title:'是否退费',formatter:formatterstu_tui"></th>
           
            <th data-options="field:'stu_tuiYin',title:'退费原因'"></th>
           <!--  <th data-options="field:'stu_dingJinE',title:'定金金额'"></th>   
            <th data-options="field:'stu_dingTime',title:'定金时间'"></th>     -->
            
           <th data-options="field:'stu_class',title:'是否进班',formatter:formatterstu_class"></th>   
        
        <!--     <th data-options="field:'stu_classTime',title:'进班时间'"></th>    -->
          <!--   <th data-options="field:'stu_classBeiZhu',title:'进班备注'"></th>   
            <th data-options="field:'stu_ziXun',title:'咨询姓名'"></th> -->
            <th data-options="field:'stu_ziXunBeiZhu',title:'咨询师备注'"></th>  
         <!--    <th data-options="field:'stu_quYu',title:'所在区域'"></th>   
            <th data-options="field:'stu_buMen',title:'来源部门'"></th>   
            <th data-options="field:'stu_keCheng',title:'课程方向'"></th>
            <th data-options="field:'stu_daFen',title:'打分'"></th>  -->
            <th data-options="field:'stu_luRu',title:'录入人'"></th>  
            <th data-options="field:'操作',title:'操作',formatter:formattercaozuo"></th> 
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
			<select>          
        
           <label for="email">QQ:</label>   
        <input class="easyui-validatebox" type="text" id="stu_qq" name="stu_qq" />       
        
       <label for="email">创建时间:</label>   
        <input class="easyui-datebox" id="startTime" />——
        <input class="easyui-datebox" id="endTime"  />
       
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initStu()">搜索</a> 
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">添加</a> 
  <a
						class="easyui-linkbutton" plain="true" onclick="exportExcel()"
						id="serach" data-options="iconCls:'icon-print'">导出excel</a>
</form> 
</div>


<!--修改  -->

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
		<form id="updatefrmStu" class="easyui-form"  >
			
						<label for="easyui-validatebox" >学生编号:</label> 
						<input class="easyui-validatebox" disabled="disabled" type="text" id="updatestu_id" name="stu_id" />
					<br>
						<label for="easyui-validatebox">学生姓名:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_name" name="stu_name" />
					<br>
						<label for="easyui-validatebox">性别:</label> 
						  <select class="easyui-combobox" id="updatestu_sex" name="stu_sex" >   
							    <option value="">--请选择--</option>
							    <option value="1">男</option>   
							    <option value="2">女</option>
							</select> 
					<br>
						<label for="easyui-validatebox">年龄:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_age" name="stu_age" />
				<br>
						<label for="name">电话:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_phone" name="stu_phone" />
			<br>
						<label for="name">个人状态:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_state" name="stu_state" />
			<br>
						<label for="name">学历:</label> 
						<select class="easyui-combobox" id="updatestu_xueLi" name="stu_xueLi" >   
							    <option value="">--请选择--</option>
							    <option value="高中">高中</option>
							    <option value="初中">初中</option>
							    <option value="小学">小学</option>  
							    <option value="其他">其他</option>   
							    
							</select> 
			<br>
						<label for="name">来源渠道:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_quDao" name="stu_quDao" />
		<br>
						<label for="name">来源网站:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_wangZhan" name="stu_wangZhan" />
			<br>
						<label for="name">学员关注:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_guanZhu" name="stu_guanZhu" />
			<br>
						<label for="name">来源关键字:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_guanJian" name="stu_guanJian" />
				<br>
						<label for="name">微信:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_wx" name="stu_wx" />
					<br>
						<label for="name">QQ:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_qq" name="stu_qq" />
			<br>
						<label for="name">是否报备:</label> 
						 <select class="easyui-combobox" id="updatestu_baoBei" name="stu_baoBei" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select> 
			<br>
						<label for="name">在线备注:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_beiZhu" name="stu_beiZhu" />
				<br>
						<label for="name">负责人:</label> 
							     <!-- 下拉列表 -->
			<select id="updatett" class="easyui-combobox">
				<option selected="selected" >--请选择--</option>
			</select>
				<br>
						<label for="name">录入人:</label> 
						<input class="easyui-validatebox" type="text" id="updatestu_useryId" name="stu_luRu" />
			<br>
			
		</form>
	</div>
	
	<!-- 查看 -->
	<div id="chakanStu" class="easyui-window" data-options="modal:true,closed:true,resizable:true,collapsible:true,draggable:true">
		<form id="frmStuck" class="easyui-form" >
			
						<label for="easyui-validatebox">学生编号:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_id" name="stu_id" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="easyui-validatebox">学生姓名:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_name" name="stu_name" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="easyui-validatebox">性别:</label> 
					 <select class="easyui-combobox" id="updatestu_sex" name="stu_sex" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">男</option>   
							    <option value="2">女</option>
							</select>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				
				<br>	
						<label for="easyui-validatebox">年龄:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_age" name="stu_age" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="easyui-validatebox">电话:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_phone" name="stu_phone" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="easyui-validatebox">个人状态:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_state" name="stu_state" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
				<br>
						<label for="easyui-validatebox">学历:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_xueLi" name="stu_xueLi" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="name">来源渠道:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_quDao" name="stu_quDao" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="name">来源网站:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_wangZhan" name="stu_wangZhan" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				<br>	
						<label for="name">学员关注:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_guanZhu" name="stu_guanZhu" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="name">来源关键字:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_guanJian" name="stu_guanJian" />
				&ensp;&ensp;&ensp;&ensp;	
						<label for="name">微信:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_wx" name="stu_wx" />
				<br>
						<label for="name">QQ:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_qq" name="stu_qq" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="name">是否报备:</label> 
					<select class="easyui-combobox" id="updatestu_baoBei" name="stu_baoBei" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="name">在线备注</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_beiZhu" name="stu_beiZhu" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				<br>	
						<label for="name">负责人:</label> 
					<select class="easyui-combobox" id="updatett" name="stu_useryId" disabled="disabled" >   
							    <option value="">--请选择--</option>	 
							</select>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="name">是否有效:</label> 
					<select class="easyui-combobox" id="updatestu_youXiao" name="stu_youXiao" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="name">无效原因:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_wuXiaoYuanYin" name="stu_wuXiaoYuanYin" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				<br>	
						<label for="name">是否回访:</label> 
					<select class="easyui-combobox" id="updatestu_huiFang" name="stu_huiFang" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="name">创建时间:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_creatorTime" name="stu_creatorTime" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="name">是否上门:</label> 
					<select class="easyui-combobox" id="updatestu_visit" name="stu_visit" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
				<br>
						<label for="name">上门时间:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_visitTime" name="stu_visitTime" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="name">首次回访时间:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_payTime" name="stu_payTime" />
					&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="name">是否缴费:</label> 
					<select class="easyui-combobox" id="updatestu_money" name="stu_money" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select>
				<br>
						<label for="name">缴费时间:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_moneyTime" name="stu_moneyTime" />
					&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="name">缴费金额:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_jinE" name="stu_jinE" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="name">是否退费:</label> 
					<select class="easyui-combobox" id="updatestu_tui" name="stu_tui" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				<br>
						<label for="name">退费原因:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_tuiYin" name="stu_tuiYin" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
						<label for="name">定金金额:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_dingJinE" name="stu_dingJinE" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="name">定金时间:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_dingTime" name="stu_dingTime" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				<br>	
						<label for="name">是否进班:</label> 
					<select class="easyui-combobox" id="updatestu_class" name="stu_class" disabled="disabled" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>   
							    <option value="2">否</option>
							</select>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				
						<label for="name">进班时间:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_classTime" name="stu_classTime" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="name">进班备注:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_classBeiZhu" name="stu_classBeiZhu" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
				<br>
						<label for="name">咨询姓名:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_ziXun" name="stu_ziXun" />
			&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				
						<label for="name">咨询师备注:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_ziXunBeiZhu" name="stu_ziXunBeiZhu" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="name">所在区域:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_quYu" name="stu_quYu" />
				<br>	
						<label for="name">来源部门:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_buMen" name="stu_buMen" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
					
						<label for="name">课程方向:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_keCheng" name="stu_keCheng" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;	
						<label for="name">打分:</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_daFen" name="stu_daFen" />
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
				<br>	
						<label for="name">录入人 :</label> 
					<input class="easyui-validatebox" type="text" disabled="disabled" id="stu_luRu" name="stu_luRu" />
				<br>
		</form>
	</div>
	
	<!--添加  -->
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
		<form id="addfrmStu" class="easyui-form" >
			<table>
			<tr>
					<td>
						<label for="name">学生编号:</label>   
	          <input class="easyui-validatebox" disabled="disabled" name="u_id" type="text" id="addu_id" data-options="required:true" />     
					</td>
					</tr> 
				<tr>
					<td>
						<label for="easyui-validatebox">学生姓名:</label> 
						<input class="easyui-validatebox" type="text" id="addstu_name" name="stu_name" />
					</td>
					<td>
						<label for="easyui-validatebox">性别:</label> 
						<select class="easyui-combobox" id="addstu_sex" name="stu_sex" >   
							    <option value="">--请选择--</option>
							    <option value="1">男</option>   
							    <option value="2">女</option>
							</select> 
					</td>
					<td>
						<label for="easyui-validatebox">年龄:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_age" name="stu_age" />
					</td>
				</tr>
				 
				<tr>
					<td>
						<label for="name">电话:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_phone" name="stu_phone" />
					</td>
					
					<td>
						<label for="name">个人状态:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_state" name="stu_state" />
					</td>
					<td>
						<label for="name">学历:</label> 
					<select class="easyui-combobox" id="addstu_xueLi" name="stu_xueLi" >   
							    <option value="">--请选择--</option>
							    <option value="高中">高中</option>
							    <option value="初中">初中</option>
							    <option value="小学">小学</option>  
							    <option value="其他">其他</option>   
							    
							</select> 
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">来源渠道:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_quDao" name="stu_quDao" />
					</td>
	
					<td>
						<label for="name">来源网站:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_wangZhan" name="stu_wangZhan" />
					</td>
				
					<td>
						<label for="name">学员关注:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_guanZhu" name="stu_guanZhu" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">来源关键字:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_guanJian" name="stu_guanJian" />
					</td>
				
					<td>
						<label for="name">微信:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_wx" name="stu_wx" />
					</td>
				
					<td>
						<label for="name">QQ:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_qq" name="stu_qq" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">是否报备:</label> 
					<select class="easyui-combobox" id="addstu_baoBei" name="stu_baoBei" >   
							    <option value="">--请选择--</option>
							    <option value="1">是</option>
							    <option value="2">否</option>	    
							</select> 
					</td>
				
					<td>
						<label for="name">在线备注:</label> 
					<input class="easyui-validatebox" type="text" id="addstu_beiZhu" name="stu_beiZhu" />
					</td>
				
					<td>
						<label for="name">负责人:</label> 
				     <!-- 下拉列表 -->
			<select id="addtt" class="easyui-combobox">
				<option selected="selected" >--请选择--</option>
			</select>
					</td>
				</tr>
				
				<tr>
			<td></td>
				
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>
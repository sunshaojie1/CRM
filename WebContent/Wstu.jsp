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
		    queryParams:{
	    	stu_name:$("#stu_name").val(),
    		stu_phone:$("#stu_phone").val(),
    		//sid:$("#sid").val(),
    		stu_money:$("#stu_money").combobox("getValue"),
    		stu_youXiao:$("#stu_youXiao").combobox("getValue"),
    		stu_huiFang:$("#stu_huiFang").combobox("getValue"),
    		stu_qq:$("#stu_qq").val(),
    		startcreatorTime:$("#startcreatorTime").val(),
    		endcreatorTime:$("#endcreatorTime").val(),
	      
	      
	}  
		})
	}
	
	function formattercaozuo(value,row,index) {
		return "<a href='javascript:void(0)' onclick='update("+index+")'>修改</a> <a href='javascript:void(0)' onclick='del("+index+")'>删除</a>   <a href='javascript:void(0)' onclick='chakan("+index+")'>查看</a>"
	}
    function formattersex(value,row,index){
	return value == 1 ? '男' : '女';
    }
  
    function formatteryouXiao(value,row,index){
    	return value == 1 ? '是' : '否';
        }
    function formatterhuiFang(value,row,index){
    	return value == 1 ? '是' : '否';
        }
    function formattervisit(value,row,index){
    	return value == 1 ? '是' : '否';
        }
    function formattermoney(value,row,index){
    	return value == 1 ? '是' : '否';
        }
    function formattertui(value,row,index){
    	return value == 1 ? '是' : '否';
        }
    
    function formatterclass(value,row,index){
    	return value == 1 ? '是' : '否';
        }
    
	//查看
	function chakan(index) {
		var datas=$("#showstu").datagrid("getData");
		var row=datas.rows[index];
		$("#frm").form("load",row)
		$("#lookStu").dialog("open");
		$('#chakanStu').dialog({    
		    title: '查看学生信息',    
		    width: 800,    
		    height: 300,    
		    closed: false,    
		     
		    modal: true   
		});    
	}
	function close() {
		$("#lookdialog").dialog("close");
	}
	//修改
	function update(index) {
		var datas=$("#showstu").datagrid("getData");
		var row=datas.rows[index];
		$("#frmStu").form("load",row)
		$("#updateStu").dialog("open");
		$('#updateStu').dialog({    
		    title: '修改学生信息',    
		    width: 800,    
		    height: 300,    
		    closed: false,    
		     
		    modal: true   
		});    
	}
	 
	function updateStu() {
		$.post("updateStu2",{
			stu_id:$("#stu_id1").val(),
			stu_ziXun:$("#stu_ziXun1").val(),
			stu_keCheng:$("#stu_keCheng1").val(),
			stu_daFen:$("#stu_daFen1").val(),
			stu_class:$("#stu_class1").combobox("getValue"),
			stu_classTime:$("#stu_classTime1").val(),
			stu_classBeiZhu:$("#stu_classBeiZhu1").val(),
			stu_ziXunBeiZhu:$("#stu_ziXunBeiZhu1").val(),
			stu_youXiao:$("#stu_youXiao1").combobox("getValue"),
			stu_wuXiaoYuanYin:$("#stu_wuXiaoYuanYin1").val(),
			stu_huiFang:$("#stu_huiFang1").combobox("getValue"),
			stu_visit:$("#stu_visit1").combobox("getValue"),
			stu_visitTime:$("#stu_visitTime1").val(),
			stu_payTime:$("#stu_payTime1").val(),
			stu_money:$("#stu_money1").combobox("getValue"),
			stu_moneyTime:$("#stu_moneyTime1").val(),
			stu_jinE:$("#stu_jinE1").val(),
			stu_tui:$("#stu_tui1").combobox("getValue"),
			stu_tuiYin:$("#stu_tuiYin1").val(),
			stu_dingJinE:$("#stu_dingJinE1").val(),
			stu_dingTime:$("#stu_dingTime1").val(),
		},function(res){
			if(res>0){
				$("#showstu").datagrid("reload");
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
	
	/* 删除 */
	function del(index) {
		var data = $("#showstu").datagrid("getData");
		var row = data.rows[index];
		alert(row.stu_id)
		$.post("delStu2", {
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
			<th data-options="field:'stu_id',title:'学生id'"></th>   
            <th data-options="field:'stu_name',title:'学生姓名'"></th>   
            <th data-options="field:'stu_sex',title:'性别',formatter:formattersex"></th>   
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
            <th data-options="field:'stu_youXiao',title:'是否有效',formatter:formatteryouXiao"></th>   
            <th data-options="field:'stu_daFen',title:'打分'"></th>   
            <th data-options="field:'stu_huiFang',title:'是否回访',formatter:formatterhuiFang"></th>   
            <th data-options="field:'stu_visit',title:'是否上门',formatter:formattervisit"></th>   
            <th data-options="field:'stu_visitTime',title:'上门时间'"></th>      
            <th data-options="field:'stu_payTime',title:'首次回访时间'"></th>   
            <th data-options="field:'stu_wuXiaoYuanYin',title:'无效原因'"></th>   
            <th data-options="field:'stu_money',title:'是否缴费',formatter:formattermoney"></th>   
            <th data-options="field:'stu_moneyTime',title:'缴费时间'"></th>   
            <th data-options="field:'stu_jinE',title:'金额'"></th>   
            <th data-options="field:'stu_tui',title:'是否退费',formatter:formattertui"></th>   
            <th data-options="field:'stu_class',title:'是否进班',formatter:formatterclass"></th>   
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
	<div id="Wstubar">
<form id="ff">   
        <label for="email">姓名:</label>   
        <input class="easyui-validatebox" type="text" id="stu_name" name="stu_name" />       
        
        <label for="email">电话:</label>   
        <input class="easyui-validatebox" type="text" id="stu_phone" name="stu_phone" />       
       
        <label for="email">是否缴费:</label>   
        <select class="easyui-combobox" id="stu_money" name="stu_money">
         <option value="">--请选择--</option>
         <option value="1">是</option>
         <option value="2">否</option>
        </select>             
        <label for="email">是否有效:</label>   
         <select class="easyui-combobox" id="stu_youXiao" name="stu_youXiao">
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
        
        <label for="email">创建时间:</label>   
        <input class="easyui-datebox" id="startcreatorTime" name="stu_creatorTime" required="true"/>~
        <input class="easyui-datebox" id="endcreatorTime" name="stu_creatorTime" required="true"/>
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="init()">搜索</a> 
         
</form> 
</div>
<!-- 查看 -->
	<div id="lookStu" class="easyui-window" data-options="modal:true,closed:true,resizable:true,collapsible:true,draggable:true">
		<form id="frm" class="easyui-form" >
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
					<select class="easyui-combobox" id="stu_class1" name="stu_class" disabled="disabled">
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select> 						
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
					<select class="easyui-combobox" id="stu_class1" name="stu_youXiao" disabled="disabled">
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select> 	
						
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
					<select class="easyui-combobox" id="stu_class1" name="stu_huiFang" disabled="disabled">
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select> 						
					</td>
				
					<td>
						<label for="name">是否上门:</label> 
					</td>
					<td>
					<select class="easyui-combobox" id="stu_class1" name="stu_visit" disabled="disabled">
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select> 			
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
					<select class="easyui-combobox" id="stu_class1" name="stu_money" disabled="disabled">
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select> 	
						
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
					<select class="easyui-combobox" id="stu_class1" name="stu_tui" disabled="disabled">
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select>		
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



<!--修改  -->
<div id="updateStu" class="easyui-window" data-options="modal:true,closed:true,resizable:true,collapsible:true,draggable:true">
		<form id="frmStu" class="easyui-form" >
			<table>
			<tr>
					<td>
						<label for="easyui-validatebox">id:</label> 
						<td>
						<input class="easyui-validatebox" disabled="disabled" type="text" id="stu_id1" name="stu_id" />
					</td>
					</td>
					</tr>
				<tr>
					<td>
						<label for="easyui-validatebox">咨询姓名:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_ziXun1" name="stu_ziXun" />
					</td>
					<td>
						<label for="easyui-validatebox">课程方向:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_keCheng1" name="stu_keCheng" />
					</td>
					<td>
						<label for="easyui-validatebox">打分:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_daFen1" name="stu_daFen" />
					</td>
				</tr>
				 
				<tr>
					<td>
						<label for="name">是否进班:</label> 
					</td>
					<td>
					<select class="easyui-combobox" id="stu_class1" name="stu_class">
                      <option value="">--请选择--</option>
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select>             
					</td>
					
					<td>
						<label for="name">进班时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_classTime1" name="stu_classTime" />
					</td>
					<td>
						<label for="name">进班备注:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_classBeiZhu1" name="stu_classBeiZhu" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">咨询师备注:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_ziXunBeiZhu1" name="stu_ziXunBeiZhu" />
					</td>
	
					<td>
						<label for="name">是否有效:</label> 
					</td>
					<td>
					<select class="easyui-combobox" id="stu_youXiao1" name="stu_youXiao">
                      <option value="">--请选择--</option>
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select>  				
					</td>
				
					<td>
						<label for="name">无效原因:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_wuXiaoYuanYin1" name="stu_wuXiaoYuanYin" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">是否回访:</label> 
					</td>
					<td>
					<select class="easyui-combobox" id="stu_huiFang1" name="stu_huiFang">
                      <option value="">--请选择--</option>
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select> 
						
					</td>
				
					<td>
						<label for="name">是否上门:</label> 
					</td>
					<td>
					<select class="easyui-combobox" id="stu_visit1" name="stu_visit">
                      <option value="">--请选择--</option>
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select> 						
					</td>
				
					<td>
						<label for="name">上门时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_visitTime1" name="stu_visitTime" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">首次回访时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_payTime1" name="stu_payTime" />
					</td>
				
					<td>
						<label for="name">是否缴费:</label> 
					</td>
					<td>
					<select class="easyui-combobox" id="stu_money1" name="stu_money">
                      <option value="">--请选择--</option>
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select> 					
					</td>
				
					<td>
						<label for="name">缴费时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_moneyTime1" name="stu_moneyTime" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">缴费金额:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_jinE1" name="stu_jinE" />
					</td>
				
					<td>
						<label for="name">是否退费:</label> 
					</td>
					<td>
					<select class="easyui-combobox" id="stu_tui1" name="stu_tui">
                      <option value="">--请选择--</option>
                      <option value="1">是</option>
                      <option value="2">否</option>
                    </select> 

					</td>
				
					<td>
						<label for="name">退费原因:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_tuiYin1" name="stu_tuiYin" />
					</td>
				</tr>
				<tr>
					<td>
						<label for="name">定金金额:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_dingJinE1" name="stu_dingJinE" />
					</td>
			
					<td>
						<label for="name">定金时间:</label> 
					</td>
					<td>
						<input class="easyui-validatebox" type="text" id="stu_dingTime1" name="stu_dingTime" />
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
</body>
</html>
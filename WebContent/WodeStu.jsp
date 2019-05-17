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
		    toolbar: '#tb'
		});  
	}
	function formattercaozuo(value,row,index) {
		return "<a href='javascript:void(0)' onclick='update("+index+")'>修改</a> <a href='javascript:void(0)' onclick='del("+index+")'>删除</a>   <a href='javascript:void(0)' onclick='chakan("+index+")'>查看</a>"
	}
	function update(index) {
		var datas=$("#ltab").datagrid("getData");
		var row=datas.rows[index];
		$("#frmStu").form("load",row)
		 $("#updateStu").dialog("open");
		
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
            <th data-options="field:'操作',title:'操作',formatter:formattercaozuo"></th>   
        </tr>   
    </thead>   
</table>  
<div id="tb">
<form id="ff">   
           <label for="email">Email:</label>   
        <input class="easyui-validatebox" type="text" name="email" />       
        <label for="email">Email:</label>   
        <input class="easyui-validatebox" type="text" name="email" />   

          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initWodeStu()">搜索</a> 
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">添加书</a> 
</form> 
</body>
</html>
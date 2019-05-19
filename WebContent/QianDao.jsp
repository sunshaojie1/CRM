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
		<script type="text/javascript" src="js/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript" src="js/echarts/dist/echarts.js"></script>
<script type="text/javascript">
$(function(){
	initUsery();
	
	
	  // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    

    // 指定图表的配置项和数据
// app.title = '环形图';

option = {
		 title: {
		        text: '签到统计'
		    },
tooltip: {
    trigger: 'item',
    formatter: "{a} <br/>{b}: {c} ({d}%)"
},
legend: {
    orient: 'vertical',
    x: 'right',
    data:['已签到','未签到']
},
series: [
    {
        name:'访问来源',
        type:'pie',
        radius: ['50%', '70%'],
        avoidLabelOverlap: false,
        label: {
            normal: {
                show: false,
                position: 'center'
            },
            emphasis: {
                show: true,
                textStyle: {
                    fontSize: '30',
                    fontWeight: 'bold'
                }
            }
        },
        labelLine: {
            normal: {
                show: false
            }
        },
        data:[
            {value:335, name:'已签到'},
            {value:310, name:'未签到'},
        ]
    }
]
};

                

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
	
	
	
	
})

function initUsery(){

	$("#selUsery").datagrid({
		url : 'selUsery',
		method : 'post',
		//fitColumns : true,
		pagination : true,
		toolbar:"#bar",
		queryParams:{
			u_loginName:$("#u_loginName").val(),
			u_isQianDao:$("#u_isQianDao").combobox("getValue"),
			/* u_clockinTime:$('#u_clockinTime').datetimebox('getValue'),
			u_clockoutTime:$('#u_clockoutTime').datetimebox('getValue'), */
			
			}

		});
		$("#bar-frm").form("reset");
	
}
function formatteru_isQianDao(value,row,index) {
	return row.u_isQianDao==1? "已签到":"未签到";
}
function formattercaozuo(value,row,index){
	return "<a href='javascript:void(0)' onclick='updateUsery("+index+")'>修改状态</a>"
}

	


</script>
</head>
<body>
	<table id="selUsery" class="easyui-datagrid" >
		<thead>
			<tr>
				<th data-options="field:'u_id',title:'bId'" >u_id</th>
				<th data-options="field:'u_loginName',title:'u_loginName'">账户</th>
				<th data-options="field:'u_clockinTime',title:'u_clockinTime'" >打卡上班</th>
				<th data-options="field:'u_clockoutTime',title:'u_clockoutTime'">打卡下班</th>
				<th data-options="field:'u_isQianDao',title:'u_isQianDao',formatter:formatteru_isQianDao">签到状态</th>
				 <th data-options="field:'caozuo',title:'操作',formatter:formattercaozuo">操作</th>
			</tr>
		</thead>
		
		<div id="main" style="width: 600px;height:400px;"></div> 
			<!-- 搜索 -->
	
	<div id="bar">
		<form id="bar-frm">

		  <label for="name">用户名:</label>   
          <input class="easyui-validatebox" type="text" id="u_loginName" /> 
         <!--    <label for="name">打卡时间:</label>   
          <input class="easyui-datetimebox" name="u_clockinTime"  id="u_clockinTime" >——
        	<input class="easyui-datetimebox" name="u_clockoutTime"  id="u_clockoutTime" >
        	  -->
            <label for="name">是否签到:</label>   
	       <select class="easyui-combobox" id="u_isQianDao" name="u_isQianDao">   
			    <option value="">--请选择--</option>
			    <option value="1">已签到</option>   
			    <option value="0">未签到</option>   
			<select>

          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="initUsery()">搜索</a> 
		</form>
	</div>

</body>
</html>
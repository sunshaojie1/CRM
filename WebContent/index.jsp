<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
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
		$("#userTree").tree({
			url:"selectRoles",
			method:"post",
			animate:true,
			onSelect:function(node){
				var wangye="";
				var zi=$("#userTab").tabs('exists',node.text);//用来判断是否存在子节点 
				if(node.id==100){
					wangye="YuanGong.jsp";
				}else if(node.id==101){
					wangye="MoKuai.jsp"
				}else if(node.id==102){
					wangye="Wstu.jsp"
				}else if(node.id==103){
					wangye="XiuGai.jsp"
				}else if(node.id==104){
					wangye="FenPei.jsp"
				}else if(node.id==105){
					wangye="WodeStu.jsp"
				}else if(node.id==106){
					wangye="YongHu.jsp"
				}else if(node.id==107){
					wangye="Stu.jsp"
				}else if(node.id==108){
					wangye="GenZong.jsp"
				}else if(node.id==109){
					wangye="JueSe.jsp"
				}else if(node.id==110){
					wangye="QianDao.jsp"
				}
				var fu=$("#userTree").tree("isLeaf",node.target);//用来判断父节点
				if(fu){//点父节点不出页面
					if(!zi){//如果不存在子节点
						$("#userTab").tabs('add',{
							title:node.text,
							closable:true,//在设置为true的时候，选项卡面板将显示一个关闭按钮，在点击的时候会关闭选项卡面板。
							content:"<iframe src='"+wangye+"' style='width:100%;height:550px'/>"
						});
					}else{//如果存在
						$("#userTab").tabs('select',node.text);
					}
				}
			}
		})
	})
</script>
<body>
	<div id="userLayout" class="easyui-layout" style="width:1400px;height:666px">
		<!-- 上北：north 下南：south 左西：west 右东：east -->
		<!-- 上边板块 -->
		<div data-options="region:'north',collapsible:false" style="height:60px;">
			<h2 style="text-align: center;">欢迎您：${uname }-----<a href="logout" style="text-decoration: auto;" >退出该账号</a></h2	>
		</div>
		<!-- split:为true时用户可以通过分割栏改变面板大小。 -->
		<!-- 左边板块 -->
		<div class="easyui-panel" data-options="region:'west',title:'${uname },您好。您的职位如下',split:true" style="width:200px	">
			<ul id="userTree" class="easyui-tree" data-options = "iconCls:'icon-save',collapsible:true">
				
			</ul>
		</div>
		<!-- 中间板块 -->
		<div data-options="region:'center'">
			<div id="userTab" class="easyui-tabs" >
				
			</div>
		</div>
	</div>
	<div id="mm" class="easyui-menu" style="width:120px;">
		<div onclick="append()" data-options="iconCls:'icon-add'">追加</div>
		<div onclick="remove()" data-options="iconCls:'icon-remove'">移除</div>
	</div>
</body>
</html>
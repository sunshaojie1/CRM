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
	function Yes(){
		var Xpass=$("#Xpass").val();
		var aXpass=$("#aXpass").val();
		var bXpass=$("#bXpass").val();
		if(aXpass!='' && aXpass==bXpass){
			alert("判断条件");
		}
	}
</script>
<body>
	<table cellpadding="12">
		<tr>
			<td>请输入现在的密码：</td>
			<td><input id="Xpass" class="easyui-textbox" data-options="required:true"  /></td>
		</tr>
		<tr>
			<td>请输入新的密码：</td>
			<td><input id="aXpass" class="easyui-textbox" data-options="required:true"  /></td>
		</tr>
		<tr>
			<td>请再次输入新的密码：</td>
			<td><input id="bXpass" class="easyui-textbox" data-options="required:true"  /></td>
		</tr>
		<tr>
			<td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="Yes()" data-options="iconCls:'icon-ok'">确定</a></td>
		</tr>
	</table>
</body>
</html>
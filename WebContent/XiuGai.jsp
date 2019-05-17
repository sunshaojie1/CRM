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

/* $(function(){
	initUseryes();
	
})

function initUseryes(){
	$("#dwg").datagrid({
		url : 'selectUseryes',
		method : 'post',
		});
} */
	function update() {
		$.post("updateXiugai",{
		//	username:$("#username").val(),
			u_password:$("#u_password").val(),
			u_password:$("#u_password").val(),
		//	new_password_confirmation:$("#new_password_confirmation").val(),
		},function(res){
			if(res>0){
				$.messager.alert("提示","修改成功");
				$("#dwg").datagrid("reload");
			}else{
				$.messager.alert("提示","修改失败");
			}
		},"json");
	}
</script>
<style type="text/css"  >   
  .input{   
   border-color:#FF0000;   
   border-style:solid;   
    }
	 

</style> 
</head>
<body>

  <table align="center" id="dwg">
     <tr>
        <th width="200px" align="left">旧密码：
        </td>
        <td width="300px" colspan="2"><input type="text"  id="u_password" name="u_password"  style="width:200px">
        </td>
     </tr>
     <tr>
        <th align="left">
           新密码：
        </td>
        <td>
        <input type="password" id="u_password" nam="u_password"  style="width:200px" />
        </td>
      
     </tr>
     <tr>
        <th align="left">
        确认新密码：
        </td>
        <td colspan="2">
        <input type="text" id="u_password" name="u_password"  style="width:200px"/>
        </td>
     </tr>
     <tr>
     <td>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="update()" >提交</a>
					</td>
				</tr>  
  </table>
  <div id="showlianxi" style="display:none;filter:alpha(opacity=50); background: #FF9999">  
 <label id="lable1"></label>
 </div>
 <label id="old_pass" style="display:none">0</label>
 <label id="new_password_control" style="display:none">0</label>
 <label id="new_password_confirmation_control" style="display:none">0</label>
</body>
</html>
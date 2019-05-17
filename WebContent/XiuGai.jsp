<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
 %>    
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
	 <!-- 内部样式 -->
        <style type="text/css">
        .errorMsg {
            color: red;
        }
        
        .error {
            border: 1px solid red;
        }
        
        .password-input {
            width: 400px;
            hight: 25px !importent;
            margin-top: 5px;
        }
        
        .btn {
            vertical-align: middle;
            text-align: center;
            margin-top: 30px;
            width: 50%;
        }
        </style>
</head>
<body><!-- style="text-align: center" -->
	 <div>
            <h3 >修改用户密码</h3>
            <form method="post" id="frm" class="easyui-form" style="text-align: center" >
            <div>
                <label>当前密码</label></br>
                <input type="password" class="password-input" id="current_password" name="current_password" placeholder="密码长度为6-16个字符，由英文大小写字母、数字、符号组成" >
                &nbsp;<span id="currentMsg" class="errorMsg"></span>
            </div>
            <div style="margin-top: 15px;"> <!-- 内联样式 -->
                <label>新密码</label></br>
                <input type="password" class="password-input" id="new_password" name="new_password" placeholder="新密码不能当前密码相同" >
                &nbsp;<span id="newMsg" class="errorMsg"></span>
            </div>
            <div style="margin-top: 15px;">
                <label>确认密码</label></br>
                <input type="password" class="password-input" id="confirmation_password" name="confirmation_password" placeholder="确认密码与新密码保持一致" >
                &nbsp;<span id="confirmMsg" class="errorMsg"></span>
            </div>
            <div class="btn">
                <input type="reset" value="重置" onclick="clearInput();"></i> &nbsp;
                <input type="button" value="修改密码" onclick="checkInput();"></i>
            </div>
            </form>
        </div>
        
</body>
</html>
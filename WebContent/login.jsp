<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<script type="text/javascript" src="js/gVerify.js"></script>
<style type="text/css">
.input-val {
	width: 170px;
	height: 25px;
	border: 1px solid #ddd;
	box-sizing: border-box;
}

#canvas {
	vertical-align: middle;
	box-sizing: border-box;
	border: 1px solid #ddd;
	cursor: pointer;
}
</style>
</head>
<script type="text/javascript">
var show_num = [];
	$(function() {
		draw(show_num);//加载验证码，
		$("#canvas").on('click', function() {//花板的点击事件
			draw(show_num);//加载验证码，
		})
		$("#btn").on('click', function() {
			var val = $(".input-val").val().toLowerCase();
			var num = show_num.join("");
			if (val == '') {
				$.messager.alert("系统消息", "请输入验证码");
			} else if (val == num) {
				login();//登录
				//$(".input-val").val('');
				// draw(show_num);
			} else {
				$.messager.alert("系统消息", "验证码错误！请重新输入！");
				draw(show_num);//验证码输入错误，重新加载验证码
				$(".input-val").val('');//把文本框内容变为空
				// draw(show_num);
			}
		})
	})
	//生成并渲染出验证码图形
	function draw(show_num) {
		var canvas_width = $('#canvas').width();
		var canvas_height = $('#canvas').height();
		var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
		var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
		canvas.width = canvas_width;
		canvas.height = canvas_height;
		var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
		var aCode = sCode.split(",");
		var aLength = aCode.length;//获取到数组的长度
		for (var i = 0; i < 4; i++) { //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
			var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
			// var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
			var deg = Math.random() - 0.5; //产生一个随机弧度
			var txt = aCode[j];//得到随机的一个内容
			show_num[i] = txt.toLowerCase();
			var x = 10 + i * 20;//文字在canvas上的x坐标
			var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
			context.font = "bold 23px 微软雅黑";
			context.translate(x, y);
			context.rotate(deg);
			context.fillStyle = randomColor();
			context.fillText(txt, 0, 0);
			context.rotate(-deg);
			context.translate(-x, -y);
		}
		for (var i = 0; i <= 5; i++) { //验证码上显示线条
			context.strokeStyle = randomColor();
			context.beginPath();
			context.moveTo(Math.random() * canvas_width, Math.random()
					* canvas_height);
			context.lineTo(Math.random() * canvas_width, Math.random()
					* canvas_height);
			context.stroke();
		}
		for (var i = 0; i <= 30; i++) { //验证码上显示小点
			context.strokeStyle = randomColor();
			context.beginPath();
			var x = Math.random() * canvas_width;
			var y = Math.random() * canvas_height;
			context.moveTo(x, y);
			context.lineTo(x + 1, y + 1);
			context.stroke();
		}
	}
	//得到随机的颜色值
	function randomColor() {
		var r = Math.floor(Math.random() * 256);
		var g = Math.floor(Math.random() * 256);
		var b = Math.floor(Math.random() * 256);
		return "rgb(" + r + "," + g + "," + b + ")";
	}

	//登录
	function login() {
		var uname = $("#u_loginName").val();
		var pwd = $("#u_password").val();
		if ($("#u_loginName").val() == '') {
			$.messager.alert("系统消息", "帐号不能为空！！！");
		} else if ($("#u_password").val() == '') {
			$.messager.alert("系统消息", "密码不能为空！！！");
		} else {
			$.post("login", {
				u_loginName : uname,
				u_password : pwd
			}, function(zj) {
				if (zj == 1) {
					window.location.href = "index.jsp";
				} else if (zj == 2) {
					$.messager.alert("登陆失败：", "该用户已经被锁定,请联系相关人员");
					draw(show_num);//加载验证码，
					
				} else if (zj == 3) {
					$.messager.alert("登陆失败：", "密码错误");
					draw(show_num);//加载验证码，
					
				} else if (zj == 4) {
					$.messager.alert("登陆失败：", "该帐号不存在");
					draw(show_num);//加载验证码，
				}
			})
		}
	}
	//重置密码
	//打开window
	function chongzhi() {
		$("#chongzhi_window").window("open");
	}
	//取消
	function CzNo() {
		$("#chongzhi_window").window("close");
	}
	//重置密码
	function CzYes() {
		if ($("#CzName").val() == '') {
			$.messager.alert("系统消息", "用户名不能为空！！！");
		} else if ($("#CzPhone").val() == '') {
			$.messager.alert("系统消息", "手机号不能为空！！！");
		} else {
			$.post("updateCz", {
				CzName : $("#CzName").val(),
				CzPhone : $("#CzPhone").val()
			}, function(res) {
				if (res > 0) {
					$.messager.alert("重置成功", "重置成功，您的初始密码为ssj.123,请登陆后修改");
				} else {
					if (res == -1) {
						$.messager.alert("重置失败", "对不起！锁定账户不能重置密码");
					} else if (res == -2) {
						$.messager.alert("重置失败", "对不起！您提供的手机号与该账号不匹配");
					} else if (res == -3) {
						$.messager.alert("重置失败", "对不起！该账户不存在");
					}
				}
			})
		}
	}

	//设置cookie

	/* function setCookie(_name, val, expires) {
	    var d = new Date();
	    d.setDate(d.getDate() + expires);
	    document.cookie = _name + "=" + val + ";path=/;expires=" + d.toGMTString();
	} */
	//获取cookie
	/* function getCookie(_name) {
	    var cookie = document.cookie;
	    var arr = cookie.split("; ");
	    for (var i = 0; i < arr.length; i++) {
	        var newArr = arr[i].split("=");
	        if (newArr[0] == _name) {
	            return newArr[1];
	        }
	    }
	} */
	  /*
	        如何将json对象转换为字符串
	            JSON.stringify(对象);
	            返回值是一个字符串
	        如何将字符串转换为json对象
	            JSON.parse(字符串)
	            返回值是对象
	     */
	  /*   var oBtn = document.getElementById("btn");
	    var oUser = document.getElementById("username");
	    var oPass = document.getElementById("password");
	    var oCheck = document.getElementById("check"); */
	    /* if (getCookie("init")) {
	        var cookie = JSON.parse(getCookie("init"));
	        oUser.value = cookie.name;
	        oPass.value = cookie.pass;
	        oCheck.checked = true;
	    }
	    oBtn.onclick = function () {
	        if (oCheck.checked) {
	            var obj = {};
	            obj.name = oUser.value;
	            obj.pass = oPass.value;
	            var str = JSON.stringify(obj);
	            setCookie("init", str, 7);
	        }
	    } */
</script>
<body>
	<div
		style="position: absolute; z-index: -1; width: 100%; height: 100%;">
		<!-- <img src="images/aaa.jpg" width="100%" height="100%" /> -->
		<div id="dd" class="easyui-dialog" title="Crm系统登录"
			style="width: 450px; height: 340px;"
			data-options="resizable:true,modal:true">
			<form>
				<h2>请登录</h2>
				<table cellpadding="12" style="text-align: center;">
					<tr>
						<td>账号：</td>
						<td><input id="u_loginName" class="easyui-textbox"
							data-options="required:true" /></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input id="u_password" type="password"
							class="easyui-textbox" data-options="required:true" /></td>
					</tr>
					<tr>
						<td><div style="width: 50px">验证码:</div></td>
						<td><input type="text" value="" placeholder="请输入验证码(不区分大小写)"
							class="input-val"></td>
						<td>
							<canvas id="canvas" width="100" height="30"></canvas>
						</td>
					</tr>
				</table>
				&emsp;&emsp;&emsp; <input type="checkbox" id="" />记住密码&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

				<input type="button" id="btn" style="width: 100px" value="登录"
					class="easyui-linkbutton" />
				<hr>
				<br> <input type="button" style="width: 150px; height: 30px;"
					value="忘记密码?点击重置" class="easyui-linkbutton" onclick="chongzhi()" />
			</form>
		</div>
	</div>
	<div id="chongzhi_window" title="Crm系统登录"
		style="width: 450px; height: 340px;" class="easyui-window"
		data-options="resizable:true,modal:true">
		<form>
			<h2>重置密码</h2>
			<table cellpadding="12">
				<tr>
					<td>用户名</td>
					<td><input class="easyui-textbox" id="CzName"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td>请输入您的手机号</td>
					<td><input class="easyui-numberbox" id="CzPhone"
						data-options="required:true" /></td>
				</tr>
				<br/>
			</table>
			<br>
			<hr>
			<br>
			<br>
			<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100px;margin-left: 40px;"
				onclick="CzYes()">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" style="width:100px;margin-left: 150px;"
				onclick="CzNo()">返回</a>
		</form>
	</div>

</body>
</html>
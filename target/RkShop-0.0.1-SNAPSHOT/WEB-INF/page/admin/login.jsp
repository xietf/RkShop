<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${url }/public/css/adminlogin.css">
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${url}/public/js/layui/css/layui.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript" src="${url}/public/js/layui/layui.js"></script>
<script>
	$(function() {

		var result = $("#result").val();
		if (result == 2) {
			layui.use('layer', function() {
				layer.msg('请输入正确的用户名或密码', {
					icon : 2,
					time : 3000
				});
			});
		} else if (result == 3) {
			layui.use('layer', function() {
				layer.msg('请输入正确的验证码', {
					icon : 7,
					time : 3000
				});
			});
		}
	});

	function yanzhangmaflush() {
		$("#yanzhengmaImg").attr("src",
				"${url }/page/verifyCode.jsp?flag=" + Math.random());
	}
</script>
</head>

<input id="result" type="hidden" value="${result}">

<body>
	<form action="${url }/user/login" method="post"
		enctype="application/x-www-form-urlencoded">
		<div class="login-main">
			<div class="login-header">登录</div>
			<div class="item-box">
				<img src="${url }/public/images/login-user.png" class="img"> <input
					type="text" name="username" id="username" placeholder="用户名">
			</div>
			<div class="item-box">
				<img src="${url }/public/images/login-pass.png" class="img"> <input
					type="text" name="password" id="password" placeholder="密码">
			</div>
			<div class="item-code-box">
				<div class="item-box1">
					<img src="${url }/public/images/login-pass.png" class="img">
					<input type="text" name="code" id="code" placeholder="验证码">
				</div>
				<img id="yanzhengmaImg" class="code"
					src="${url }/page/verifyCode.jsp" border="0"
					onclick="yanzhangmaflush()" title="换一张" alt="验证码">
			</div>
			<div class="item-box" style="border: 0px; margin-top: 15px;">
				<input type="submit" value="登录" class="btn" style="border: 0px;" />
			</div>
			<div class="item-box" style="border: 0px; margin-top: 15px;">
				<a href="${url }/page/index.jsp" class="btn"
					style="background: #2aef6c;">返回首页</a>
			</div>
		</div>
	</form>
</body>
</html>
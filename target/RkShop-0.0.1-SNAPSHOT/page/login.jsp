<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>商城首页</title>
<link rel="stylesheet" type="text/css"
	href="${url}/public/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${url}/public/js/layui/css/layui.css">
<script type="text/javascript" src="${url}/public/js/jquery.min.js"></script>
<script type="text/javascript" src="${url}/public/js/layui/layui.js"></script>
<script type="text/javascript" src="${url}/public/js/index.js"></script>
<script type="text/javascript">
	$(function() {
		var result = $("#result").val();
		if (result == 2) {
			layui.use('layer', function() {
				layer.msg('请输入正确的用户名或密码', {
					icon : 2,
					time : 3000
				});
			});
		}
	});
</script>
</head>

<input id="result" type="hidden" value="${result}">

<body>

	<jsp:include page="joint/head.jsp"></jsp:include>

	<div class="section">
		<div class="nav-tit">
			<a class="selected" href="${url }/page/login.jsp">账户登录</a> <i>|</i> <a
				href="${url }/page/register.jsp">免费注册</a>
		</div>

		<form id="loginform" name="loginform" class="login-box"
			action="${url}/vipuser/login" method="post">
			<div class="input-box">
				<input id="username" name="username" type="text"
					placeholder="用户名/手机/邮箱" maxlength="50">
			</div>
			<div class="input-box">
				<input id="password" name="password" type="password"
					placeholder="输入登录密码" maxlength="16">
			</div>
			<div class="btn-box">
				<input id="btnSubmit" name="btnSubmit" type="submit" value="立即登录">
			</div>
		</form>
	</div>

	<jsp:include page="joint/footer.jsp"></jsp:include>

</body>
</html>
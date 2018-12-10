<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>商城首页</title>
<link rel="stylesheet" type="text/css" href="${url }/public/css/common.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script>
	
	$(function () {
		
		var insertResult = $("#insertResult").val();
		if(insertResult==1){
			alert("添加成功");
			$("#insertResult").val(0);
		}else if(insertResult==2){
			alert("添加失败");
		}
	});

	
	function yanzhangmaflush() {
		$("#yanzhengmaImg").attr("src","${url }/page/verifyCode.jsp?flag="+Math.random());
	}
		
</script>
</head>

<input id="insertResult" type="hidden" value="${insertResult }">

<body>

	<jsp:include page="joint/head.jsp"></jsp:include>

	<div class="section">
		
		<div class="nav-tit">
			<a href="${url }/page/login.jsp">账户登录</a> <i>|</i> <a class="selected" href="${url }/page/register.jsp">免费注册</a>
		</div>

		<form id="regform" name="regform" action="${url }/vipuser/insert" method="post">
			<div class="form-box full">
				<dl class="form-group">
					<dt>用 户 名：</dt>
					<dd>
						<input id="txtUserName" name="username" type="text" class="input"
							placeholder="输入登录用户名" required="required"> <span class="Validform_checktip">请输入登录的用户名</span>
					</dd>
				</dl>
				<dl class="form-group">
					<dt>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</dt>
					<dd>
						<input id="txtPassword" name="password" type="password"
							class="input" placeholder="输入登录密码"> <span
							class="Validform_checktip">请输入6-20位的登录密码</span>
					</dd>
				</dl>
				<dl class="form-group">
					<dt>确认密码：</dt>
					<dd>
						<input id="txtPassword1" name="yesPassword" type="password"
							class="input" placeholder="请再次输入密码"> <span
							class="Validform_checktip">请再次输入登录密码</span>
					</dd>
				</dl>

				<!--开放注册及手机注册-->
				<dl class="form-group">
					<dt>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</dt>
					<dd>
						<input id="txtMobile" name="phone" type="text" class="input"
							placeholder="输入手机号码"> <span class="Validform_checktip">请输入手机号码</span>
					</dd>
				</dl>
				<!--/开放注册及手机注册-->

				<!--开放注册及邮箱邀请注册-->
				<dl class="form-group">
					<dt>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</dt>
					<dd>
						<input id="txtEmail" name="email" type="text" class="input"
							placeholder="输入邮箱账号"> <span class="Validform_checktip">请输入电子邮箱账号</span>
					</dd>
				</dl>
				<!--/开放注册及邮箱邀请注册-->

				<!--开放注册-->
				<dl class="form-group">
					<dt>验 证 码：</dt>
					<dd>
						<input id="txtCode" name="code" type="text" class="input code" placeholder="输入验证码"> 
						<a class="send" href="javascript:;">
							<img id="yanzhengmaImg" src="${url }/page/verifyCode.jsp" border="0" alt="验证码">
						</a> 
						<a class="Validform_checktip" href="javascript:void(0)" onclick="yanzhangmaflush()">看不清，换一张</a>
					</dd>
				</dl>
				
				<!--/开放注册-->
				<dl class="form-group">
					<dd>
						<input type="submit" value="立即注册" class="submit">
					</dd>
				</dl>
				
			</div>
		</form>
	</div>

	<jsp:include page="joint/footer.jsp"></jsp:include>
	
</body>
</html>
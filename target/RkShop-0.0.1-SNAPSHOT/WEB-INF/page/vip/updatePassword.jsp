<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="right-auto">
	<div class="bg-wrap" style="min-height: 765px;">
		<div class="sub-tit " style="margin: 0px;">
			<a class="add" href="javascript:history.go(-1);"><i
				class="iconfont icon-reply"></i>返回</a>
			<ul>
				<li class="selected"><a href="javascript:;">修改密码</a></li>
			</ul>
		</div>

		<link rel="stylesheet" type="text/css"
			href="${url }/public/js/Validform/style.css">
		<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
		<script type="text/javascript"
			src="${url }/public/js/Validform/Validform_v5.3.2_min.js"></script>
		<script type="text/javascript">
			$(".updatePasswordForm").Validform();
		</script>
		<form class="updatePasswordForm" action="${url }/vipuser/">
			<div class="form-box">
				<dl class="form-group">
					<dt>用户名：</dt>
					<dd>${vipuser.username }</dd>
				</dl>
				<dl class="form-group">
					<dt>旧密码：</dt>
					<dd>
						<input id="password" type="hidden" value="${vipuser.password }">
						<input name="oldpassword" id="oldpassword" type="password"
							class="input" datatype="*6-20" nullmsg="旧密码不能为空"
							errormsg="密码范围在6-20位之间"> <span
							class="Validform_label" style="display: none;">111</span>
					</dd>
				</dl>
				<dl class="form-group">
					<dt>新密码：</dt>
					<dd>
						<input class="input" type="password" value="" name="password"
							datatype="*6-20" nullmsg="新密码不能为空" errormsg="密码范围在6~20位之间！" />
					</dd>
				</dl>
				<dl class="form-group">
					<dt>确认新密码：</dt>
					<dd>
						<input class="input" type="password" value="" name="password2"
							datatype="*6-20" nullmsg="确认密码不能为空" tip="密码范围在6-20位之间" recheck="password" errormsg="您两次输入的账号密码不一致！" />
					</dd>
				</dl>
				<dl class="form-group">
					<dd>
						<input type="submit" value="确认修改" class="submit">
					</dd>
				</dl>
			</div>
		</form>

	</div>
</div>
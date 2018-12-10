<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="right-auto">
	<div class="bg-wrap" style="min-height: 765px;">


		<div class="sub-tit " style="margin: 0px;">
			<a class="add" href="javascript:history.go(-1);"><i
				class="iconfont icon-reply"></i>返回</a>
			<ul>
				<li class="selected"><a href="javascript:;">账号资料</a></li>
			</ul>
		</div>

		<form action="${url }/vipuser/update" method="post"
			enctype="multipart/form-data">
			<c:forEach var="vipuser" items="${pageInfo.list }">
				<div class="form-box">
					<dl class="form-group">
						<dt>用户名：</dt>
						<dd>
							<input name="id" id="id" type="hidden" value="${vipuser.id }">
							<input name="username" id="username" type="text" class="input"
								value="${vipuser.username }">
					</dl>

					<dl class="form-group">
						<dt>头像：</dt>
						<dd>
							<input name="userImg" id="userImg" type="hidden" value="${vipuser.userImg }">
							<input name="fileimg" id="fileimg" type="file">
					</dl>

					<dl class="form-group">
						<dt>邮箱：</dt>
						<dd>
							<input name="email" id="email" type="text" class="input"
								value="${vipuser.email }">
					</dl>
					<dl class="form-group">
						<dt>手机：</dt>
						<dd>
							<input name="phone" id="phone" type="text" class="input"
								value="${vipuser.phone }">
					</dl>
					<dl class="form-group">
						<dt>描述：</dt>
						<dd>
							<textarea name="remark" style="border: 1px solid #e6d5d5;"
								value="${vipuser.remark }"></textarea>
						</dd>
					</dl>
					<dl class="form-group">
						<dd>
							<input type="submit" value="确认修改" class="submit">
						</dd>
					</dl>
				</div>
			</c:forEach>
		</form>

	</div>
</div>
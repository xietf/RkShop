<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${url }/public/css/adminlogin.css">
<link rel="stylesheet" href="${url }/public/css/adminbase.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript">
	function saveUser() {

		var id = $("#id").val();
		var username = $("#userName").val();
		var password = $("#Password").val();
		var status = $("#status").val();
		var remark = $("#remark").val();
		var usernameHidden = $("#userNameHidden").val();
		var passwordHidden = $("#PasswordHidden").val();
		var statusHidden = $("#statusHidden").val();
		var remarkHidden = $("#remarkHidden").val();

		if (username == null || username == "" || username == undefined) {
			username = usernameHidden;
		}
		if (password == null || password == "" || password == undefined) {
			password = passwordHidden;
		}
		if (status == null || status == "" || status == undefined) {
			status = statusHidden;
		}
		if (remark == null || remark == "" || remark == undefined) {
			remark = remarkHidden;
		}

		$.ajax({
			url : "${url}/user/update",
			type : "post",
			data : {
				id : id,
				username : username,
				password : password,
				status : status,
				remark : remark
			},
			success : function(result) {
				if (result == 1) {
					alert("修改成功");
				} else if (result == 2) {
					alert("修改失败");
				}
			}
		});
	}
</script>
</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="${url }/user/tologin">首页</a></li>
		</ul>
	</div>

	<div class="session-main">
		<c:forEach var="user" items="${pageInfo.list }">
			<input id="userNameHidden" type="hidden" value="${user.username }">
			<input id="PasswordHidden" type="hidden" value="${user.password }">
			<input id="statusHidden" type="hidden" value="${user.status }">
			<input id="remarkHidden" type="hidden" value="${user.remark }">
			<table
				style="text-align: center; width: 800px; height: 400px; margin: 80px auto;">
				<tr>
					<td colspan="2"><img src="${url }/public/images/nikimg.png"
						class="img-re"></td>
				</tr>
				<tr>
					<td>编号：<input id="id" type="text" value="${user.id }"
						readonly="readonly"></td>
					<td>用户名：<input id="userName" type="text"
						placeholder="${user.username }" value=""></td>
				</tr>
				<tr>
					<td>密码：<input id="Password" type="text"
						placeholder="${user.password }" value=""></td>
					<td>创建时间：<input id="createTime" type="text"
						placeholder="<fmt:formatDate value='${user.createTime }' pattern='yyyy-MM-dd HH:mm:ss' />" readonly="readonly"></td>
				</tr>
				<tr>
					<td>状态：<input id="status" type="text"
						placeholder="${user.status }" value=""></td>
					<td>最后登录时间：
					<input id="lastLoginTime" type="text" placeholder="<fmt:formatDate value='${user.lastLoginTime }' pattern='yyyy-MM-dd HH:mm:ss' />" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>描述：<input id="remark" type="text"
						placeholder="${user.remark }" value=""></td>
					<td></td>
				</tr>
				<tr>
					<td><a class="btn" style="border: 0px;" onclick="saveUser()">保存信息</a></td>
					<td><a class="btn" href="${url }/user/outLogin"
						style="background: #2aef6c;">注销账号</a></td>
				</tr>
			</table>




		</c:forEach>
	</div>

</body>
</html>
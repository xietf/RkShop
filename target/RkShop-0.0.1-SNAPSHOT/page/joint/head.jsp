<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript" src="${url }/public/js/index.js"></script>
<script type="text/javascript">

	$(function () {
		YNlogin();
	});

	function getGoodsByLike() {

		var goodsName = $("#goodsName").val();

		$.ajax({
			url : "${url }/goods/GoodslistByPage",
			type : "post",
			data : {
				pageSize : 20,
				goodsName : goodsName
			},
			success : function(result) {
				$("body").html(result);
			}

		});
	}
</script>
</head>

<input id="username" type="hidden" value="${sessionScope.vipuser.username }">
<input id="password" type="hidden" value="${sessionScope.vipuser.password }">

<body>
	<div class="top-header">
		<div class="section">
			<div class="top-header-left f-left">
				<a href="${url }/page/index.jsp">LOGO</a>
			</div>
			<div id="Nlogin" class="top-header-right f-right">
				<a href="${url }/page/login.jsp">登录</a> <a
					href="${url }/page/register.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${url }/user/tologin">后台</a>
			</div>
			<div id="Ylogin" class="top-header-right f-right">
				<a>尊敬的<a href="${url }/vipuser/YNlogin" style="color: orange;">${sessionScope.vipuser.username }</a>
					，欢迎您的登陆
				</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="${url }/user/tologin">后台</a>
			</div>
		</div>
	</div>

	<div class="section nav-header">
		<ul id="navbar" class="nav-menus f-left">
			<li><a href="${url }/page/index.jsp">首页</a></li>
			<li><a href="${url}/goodscatalog/list">产品列表</a></li>
			<li><a href="${url }/usercartlog/towTableList">购物车</a></li>
			<li><a href="${url }/vipuser/YNlogin">会员中心</a></li>
			<li><a href="${url}/newscatalog/list">新闻资讯</a></li>
			<li><a href="${url }/page/contact.jsp">联系我们</a></li>
		</ul>
		<div class="f-right nav-right">
			<input id="goodsName" type="text" class="seacher-input f-left"
				placeholder="输入关键字"> <a class="seacher-but  f-left"
				onclick="getGoodsByLike()">搜索</a>
		</div>
	</div>
</body>
</html>

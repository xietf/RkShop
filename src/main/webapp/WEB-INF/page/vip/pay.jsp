<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${url }/public/css/common.css">
</head>
<body>
	<jsp:include page="../../../page/joint/head.jsp"></jsp:include>

	<div class="section">
		<div class="cart-head">
			<h2>我的购物车</h2>
			<div class="cart-setp">
				<ul>
					<li class="first active">
						<div class="progress">
							<span>1</span> 放进购物车
						</div>
					</li>
					<li class="active">
						<div class="progress">
							<span>2</span> 填写订单信息
						</div>
					</li>
					<li class="last active">
						<div class="progress">
							<span>3</span> 支付/确认订单
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="section">
		
		<div class="msg-tips">
			<div class="icon"></div>
			<div class="info">
				<strong>订单已支付成功！</strong>
				<p>
					您可以点击这里进入<a href="${url }/vipuser/YNlogin">会员中心</a>查看订单状态！
				</p>
				<p>如有其它问题，请立即与我们客服人员联系。</p>
			</div>
		</div>

	</div>

</body>
</html>
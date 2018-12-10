<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会员中心</title>
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${url }/public/js/Validform/style.css">
<link rel="stylesheet" type="text/css"
	href="${url}/public/js/layui/css/layui.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${url }/public/js/Validform/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${url}/public/js/layui/layui.js"></script>
<script type="text/javascript" src="${url }/public/js/index.js"></script>
<script>
	$(function() {
		$("#navbar li:eq(3)").css({
			background : "#34ad2a"
		});
		$("#navbar li:eq(3) a").css({
			color : "white"
		});

		goPersonalCenter();
	});

	function goPersonalCenter() {
		$.ajax({
			url : "${url}/vipuser/goPersonalCenter",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	function moreshopOrder() {
		$.ajax({
			url : "${url}/shoporder/list",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}

		});
	}

	function addressList() {
		userId = $("#userid").val();
		$.ajax({
			url : "${url}/useraddress/list",
			type : "post",
			data : {
				mak : "addressList",
				userId : userId
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	function toChongzhi() {
		userId = $("#userid").val();
		$.ajax({
			url : "${url}/vipuser/toChongzhi",
			type : "post",
			data : {
				id : userId
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	function congzhiMoney(id) {
		var rechargeMoney = $("#rechargeMoney").val();
		var money = $("#money").val();
		$.ajax({
			url : "${url}/vipuser/chongzhi",
			type : "post",
			data : {
				id : id,
				money : money,
				rechargeMoney : rechargeMoney
			},
			success : function(result) {
				if (result == 1) {
					layui.use('layer', function() {
						layer.msg('充值成功', {
							icon : 6,
							time : 1000
						}, function () {
							window.location.reload();
						});
					});
				} else {
					layui.use('layer', function() {
						layer.msg('充值失败', {
							icon : 5,
							time : 1000
						});
					});
				}
			}
		});
	}

	function chongzhiRecord() {
		userId = $("#userid").val();
		$.ajax({
			url : "${url}/rechargelog/list",
			type : "post",
			data : {
				userId : userId
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	function vipuserInfo() {
		userId = $("#userid").val();
		$.ajax({
			url : "${url}/vipuser/list",
			type : "post",
			data : {
				mak : "addressList",
				id : userId
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	function toupdataPassword() {
		userId = $("#userid").val();
		$.ajax({
			url : "${url}/vipuser/toupdataPassword",
			type : "post",
			data : {
				id : userId
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	function orderInfo(id) {
		$.ajax({
			url : "${url}/shoporder/orderInfo",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	function updateOrder(id) {
		$.ajax({
			url : "${url}/shoporder/update3",
			type : "post",
			data : {
				id : id,
				shopState : -1
			},
			success : function(result) {
				if (result == 1) {
					layui.use('layer', function() {
						layer.msg('已取消', {
							icon : 6,
							time : 1000
						}, function () {
							window.location.reload();
						});
					});
				} else {
					layui.use('layer', function() {
						layer.msg('取消失败', {
							icon : 5,
							time : 1000
						});
					});
				}
			}
		});
	}

	function quxiaoOrder(id) {
		$.ajax({
			url : "${url}/shoporder/delete",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					layui.use('layer', function() {
						layer.msg('删除成功', {
							icon : 6,
							time : 1000
						}, function () {
							window.location.reload();
						});
					});
				} else {
					layui.use('layer', function() {
						layer.msg('删除失败', {
							icon : 5,
							time : 1000
						});
					});
				}
			}
		});
	}

	function toInsertAddress() {
		$.ajax({
			url : "${url }/useraddress/toInsert",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	function insertAddress() {
		$.ajax({
			url : "${url }/useraddress/insert",
			type : "post",
			data : $("#insertAddressForm").serializeArray(),
			success : function(result) {
				if (result == 1) {
					layui.use('layer', function() {
						layer.msg('添加成功', {
							icon : 6,
							time : 1000
						}, function () {
							window.location.reload();
						});
					});
				} else {
					layui.use('layer', function() {
						layer.msg('添加失败', {
							icon : 5,
							time : 1000
						});
					});
				}
			}
		});
	}

	function toUpdateAddress(id) {
		$.ajax({
			url : "${url }/useraddress/toupdate",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	function UpdateAddress() {
		$.ajax({
			url : "${url }/useraddress/update",
			type : "post",
			data : $("#updateAddressForm").serializeArray(),
			success : function(result) {
				if (result == 1) {
					layui.use('layer', function() {
						layer.msg('修改成功', {
							icon : 6,
							time : 1000
						}, function () {
							window.location.reload();
						});
					});
				} else {
					layui.use('layer', function() {
						layer.msg('修改失败', {
							icon : 5,
							time : 1000
						});
					});
				}
			}
		});
	}

	function moren(id, userId) {
		$.ajax({
			url : "${url }/useraddress/moren?id=" + id + "&&userId=" + userId,
			type : "post",
			success : function(result) {
				if (result == 1) {
					layui.use('layer', function() {
						layer.msg('设置成功', {
							icon : 6,
							time : 1000
						}, function () {
							window.location.reload();
						});
					});
				} else {
					layui.use('layer', function() {
						layer.msg('设置失败', {
							icon : 5,
							time : 1000
						});
					});
				}
			}
		});
	}
</script>
</head>

<input id="userid" type="hidden" value="${sessionScope.vipuser.id }">

<body>

	<jsp:include page="../../../page/joint/head.jsp"></jsp:include>

	<div class="section clearfix" style="margin-top: 10px;">
		<!--页面左边-->
		<div class="left-260">
			<div class="bg-wrap">
				<div class="avatar-box">
					<a class="img-box" onclick="goPersonalCenter()"> <img
						src="${url }/public/images/${sessionScope.vipuser.userImg}">
					</a>
					<h3>${sessionScope.vipuser.username }</h3>
					<p>
						<a href="register.jsp">注册会员</a>
					</p>
				</div>
				<div class="center-nav">
					<ul>
						<li>
							<h2>
								<i class="iconfont icon-order"></i> <span>订单管理</span>
							</h2>
							<div class="list">
								<p>
									<a href="javascript:void(0)" onclick="moreshopOrder()"><i
										class="iconfont icon-arrow-right"></i>交易订单</a>
								</p>
								<p>
									<a href="javascript:void(0)" onclick="addressList()"><i
										class="iconfont icon-arrow-right"></i>收货地址</a>
								</p>
							</div>
						</li>
						<li>
							<h2>
								<i class="iconfont icon-amount"></i> <span>余额管理</span>
							</h2>
							<div class="list">
								<p>
									<a href="javascript:void(0)" onclick="toChongzhi()"><i
										class="iconfont icon-arrow-right"></i>账户充值</a>
								</p>
								<p>
									<a href="javascript:void(0)" onclick="chongzhiRecord()"><i
										class="iconfont icon-arrow-right"></i>充值记录</a>
								</p>
							</div>
						</li>
						<li>
							<h2>
								<i class="iconfont icon-user"></i> <span>账户管理</span>
							</h2>
							<div class="list">
								<p>
									<a href="javascript:void(0)" onclick="vipuserInfo()"><i
										class="iconfont icon-arrow-right"></i>账户资料</a>
								</p>
								<p>
									<a href="javascript:void(0)" onclick="toupdataPassword()"><i
										class="iconfont icon-arrow-right"></i>修改密码</a>
								</p>
								<p>
									<a href="${url }/vipuser/outLogin"><i
										class="iconfont icon-arrow-right"></i>退出登录</a>
								</p>
							</div>
						</li>
					</ul>
				</div>

			</div>
		</div>
		<div id="mainPage"></div>
	</div>

	<jsp:include page="../../../page/joint/footer.jsp"></jsp:include>
</body>
</html>
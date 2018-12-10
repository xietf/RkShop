<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>商城产品页面</title>
<link rel="stylesheet" type="text/css"
	href="${url}/public/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${url}/public/js/layui/css/layui.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript" src="${url}/public/js/layui/layui.js"></script>
<script type="text/javascript">
	function clickCount() {
		var clickCount = $("#clickCount").val();
		var goodsNumber = $("#goodsNumber").text();

		if (parseInt(clickCount) < 1) {
			$("#clickCount").val(1);
			layui.use('layer', function() {
				layer.msg('不能再少啦！', {
					icon : 5,
					time : 1000
				});
			});
		}
		if (parseInt(clickCount) > parseInt(goodsNumber)) {
			$("#clickCount").val(goodsNumber);
			layui.use('layer', function() {
				layer.msg('再多就没有了！', {
					icon : 5,
					time : 1000
				});
			});
		}
	}

	function addtocart() {
		var clickCount = $("#clickCount").val();
		var goodsId = $("#goodsid").val();
		var vipuserId = $("#vipuserid").val();

		if (vipuserId == null || vipuserId == "" || vipuserId == undefined) {
			layui.use('layer', function() {
				layer.msg('请先登录！', {
					icon : 4,
					time : 500
				}, function () {
					window.location.href = '${url}/page/login.jsp';
				});
			});
		} else {
			$.ajax({
				url : "${url}/usercartlog/insert",
				type : "post",
				data : {
					addTime : new Date(),
					goNum : clickCount,
					goodsId : goodsId,
					userId : vipuserId
				},
				success : function(result) {
					if (result == 1) {
						layui.use('layer', function() {
							layer.msg('添加成功', {
								icon : 6,
								time : 1000
							});
						});
					} else if (result == 2) {
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
	}

	function buy() {
		var id = $("#goodsid").val();
		var goodsNum = $("#clickCount").val();

		$.ajax({
			url : "${url}/goods/buy",
			type : "post",
			data : {
				id : id,
				goodsNum : goodsNum
			},
			success : function(result) {
				$("body").empty();
				$("body").html(result);
			}
		});
	}
</script>
</head>

<body>

	<jsp:include page="joint/head.jsp"></jsp:include>

	<c:forEach var="good" items="${pageInfo.list }">
		<input id="goodsid" type="hidden" value="${good.id }" />
		<input id="vipuserid" type="hidden" value="${vipuser.id }" />
		<div class="section">
			<div class="wrapper clearfix">
				<div class="wrap-box">
					<div class="goods-box clearfix">
						<!--商品图片-->
						<div class="goods-pic">
							<!--幻灯片-->
							<div class="pic-box">
								<div class="pic-preview">
									<span class="jqzoom"> <img
										src="${url }/public/images/${good.goodsImg }"
										alt="${good.goodsName }">
									</span>
								</div>
							</div>
							<!--/幻灯片-->
						</div>
						<!--/商品图片-->

						<!--商品信息-->
						<div class="goods-spec">
							<h1>${good.goodsName }</h1>
							<div class="spec-box">
								<dl>
									<dt>货号</dt>
									<dd id="commodityGoodsNo">${good.goodsSn }</dd>
								</dl>
								<dl>
									<dt>市场价</dt>
									<dd>
										<s id="commodityMarketPrice">${good.marketPrice }</s>
									</dd>
								</dl>
								<dl>
									<dt>销售价</dt>
									<dd>
										<em class="price" id="commoditySellPrice">${good.sellPrice }</em>
									</dd>
								</dl>
							</div>

							<div class="spec-box">
								<dl>
									<dt>购买数量</dt>
									<dd>
										<div class="stock-box" style="line-height: 30px;">
											<input id="clickCount" type="number" value="1"
												onclick="clickCount()" />
										</div>
										<span class="stock-txt"> 库存<em id="goodsNumber">${good.goodsNumber }</em>件
										</span>
									</dd>
								</dl>
								<dl>
									<dd>
										<div class="btn-buy" id="buyButton">
											<button class="buy" onclick="buy()">立即购买</button>
											<button class="add" onclick="addtocart()">加入购物车</button>
										</div>
									</dd>
								</dl>
							</div>


						</div>
						<!--/商品信息-->
					</div>

				</div>
			</div>

			<div id="goodsTabs" class="goods-tab bg-wrap">
				<!--选项卡-->
				<div id="tabHead" class="tab-head">
					<ul>
						<li><a class="selected" href="javascript:;">商品介绍</a></li>

					</ul>
				</div>
				<!--/选项卡-->

				<!--选项内容-->
				<div class="tab-content entry" style="display: block;">
					<p>${good.description }</p>
				</div>

			</div>
		</div>
	</c:forEach>

	<jsp:include page="joint/footer.jsp"></jsp:include>

</body>
</html>
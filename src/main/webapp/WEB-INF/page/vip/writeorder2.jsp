<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>商城首页</title>
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/common.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function () {
		var userId = $("#userid").val();
		$.ajax({
			url: "${url }/useraddress/list",
			type: "post",
			data: {userId: parseInt(userId)},
			success: function (result) {
				$("#address").empty();
				$("#address").html(result);
			}
		});
	});
	function updateAddress(t) {
		if($(t).is(':checked')){
			orderId = $("#orderid").val();
		    inp = t.parentNode.parentNode.parentNode.childNodes;
		    userName = inp[1].value;
		    province = inp[3].value;
		    city = inp[5].value;
		    area = inp[7].value;
		    address = inp[9].value;
		    phone = inp[11].value;
		    email = inp[13].value;
		    code = inp[15].value;
		    id = $("#orderid").val();

		    $.ajax({
				url: "${url}/shoporder/update",
				type: "post",
				data: {
					userName: userName,
				    province: province,
				    city: city,
				    area: area,
				    address: address,
				    phone: phone,
				    email: email,
				    code: code,
				    id: id
					},
				success: function (result) {
					alert(result);
				}

			});
		}else{
			inp = t.parentNode.parentNode.parentNode.childNodes;
		    userId = inp[17].value;
		    id = $("#orderid").val();

			$.ajax({
				url: "${url}/shoporder/update",
				type: "post",
				data: {
					userId: userId,
					isDefault: 1,
					id: id
					},
				success: function (result) {
					alert(result);
				}

			});
		}
	}
</script>
</head>
<input id="orderid" type="hidden" value="${orderId }"/>
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
						<div class="progress ">
							<span>2</span> 填写订单信息
						</div>
					</li>
					<li class="last">
						<div class="progress">
							<span>3</span> 支付/确认订单
						</div>
					</li>
				</ul>
			</div>
		</div>

	</div>

	<div class="section">
		<div class="cart-box">
			<h2 class="slide-tit">
				<span>1、收货地址</span>
			</h2>
		</div>
	</div>
	<div id="address"></div>

	<div class="section">
		<div class="cart-box">
			<h2 class="slide-tit">
				<span>2、商品清单</span>
			</h2>
		</div>
	</div>
	<table width="1060px" align="center" class="cart-table" border="0"
		cellspacing="0" cellpadding="8">
		<tbody>
			<tr>
				<th align="left" colspan="2">商品信息</th>
				<th width="84" align="left">单价</th>
				<th width="104" align="center">数量</th>
				<th width="104" align="left">金额(元)</th>
			</tr>
			<c:forEach var="goods" items="${list }">
				<tr>
					<td width="68"><input id="userid" type="hidden" value="${userId }"><a target="_blank" href="${url }/goods/GoodslistByPage?id=${usercartlog.goodsId}"> <img
							src="${url }/public/images/${goods.goodsImg }" class="img">
					</a></td>
					<td><a target="_blank" href="${url }/goods/GoodslistByPage?id=${goods.id}">${goods.goodsName }</a>
						<p class="stxt"></p></td>
					<td>${goods.sellPrice }</td>
					<td align="center">
						<div class="buy-box">
							<span class="goodsQuantity">${goodsNum }</span>
						</div>
					</td>
					<td><span class="red"> ￥<label name="amountCount">${goods.sellPrice*goodsNum }</label>
					</span></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="section">
		<div class="cart-box">
			<h2 class="slide-tit">
				<span>3、结算信息</span>
			</h2>
		</div>
	</div>

	<div class="buy-foot clearfix"
		style="margin: 0px 270px; border: 1px red;">
		<div class="left-box">
			<dl>
				<dt>订单备注(100字符以内)</dt>
				<dd>
					<textarea name="message" class="input" style="height: 35px;"></textarea>
				</dd>
			</dl>
		</div>
		<div class="right-box">
			<p>
				商品 <label class="price">${goodsNum }</label> 件&nbsp;&nbsp;&nbsp;&nbsp; 商品金额：￥<label
					id="goodsAmount" class="price">${allPrice }</label>
				元&nbsp;&nbsp;&nbsp;&nbsp;
			</p>
			<p class="txt-box">
				应付总金额：￥<label id="totalAmount" class="price">${allPrice }</label>
			</p>
			<p class="btn-box">
				<a class="btn button" href="${url }/usercartlog/towTableList">返回购物车</a> <a id="btnSubmit"
					name="btnSubmit" href="${url}/shoporder/update2?id=${orderId }" class="btnsubmit">确认提交</a>
			</p>
		</div>
	</div>
</body>
</html>
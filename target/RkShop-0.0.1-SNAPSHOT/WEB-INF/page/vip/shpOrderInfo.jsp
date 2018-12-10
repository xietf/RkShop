<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="right-auto">
	<div class="bg-wrap" style="min-height: 765px;">
		<div class="sub-tit " style="margin: 0px;">
			<a class="add" href="javascript:history.go(-1);"><i
				class="iconfont icon-reply"></i>返回</a>
			<ul>
				<li class="selected"><a href="javascript:;">订单信息</a></li>
			</ul>
		</div>

		<div class="form-box accept-box" style="margin: 0px;">
			<dl class="head form-group">
				<dd>订单号：${shopOrder.orderSn }</dd>
			</dl>
			<dl class="form-group">
				<dt>订单状态：</dt>
				<dd>
					<c:if test="${shopOrder.shopState==-1 }">已取消</c:if>
					<c:if test="${shopOrder.shopState==0 }">待付款</c:if>
					<c:if test="${shopOrder.shopState==1 }">待签收</c:if>
					<c:if test="${shopOrder.shopState==2 }">已完成</c:if>
				</dd>
			</dl>
		</div>



		<div class="table-wrap" style="margin: 0px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="5"
				class="ftable">
				<tbody>
					<tr>
						<th align="left" colspan="2">商品信息</th>
						<th width="10%">单价</th>
						<th width="10%">数量</th>
						<th width="10%">金额</th>
					</tr>

					<c:forEach var="shopOrderGoods" items="${listshopOrderGoods }">
						<tr>
							<td width="60"><a target="_blank" href="/goods/show-95.html">
									<img src="${url }/public/images/${shopOrderGoods.goodsImg }"
									class="img">
							</a></td>
							<td align="left"><a target="_blank"
								href="/goods/show-95.html">${shopOrderGoods.goodsName }</a>
								<p></p></td>
							<td align="center">
								<p>￥${shopOrderGoods.price }</p>
							</td>
							<td align="center">${shopOrderGoods.goNum }</td>
							<td align="center">￥${shopOrderGoods.totalPrice }</td>
						</tr>

						<tr>
							<td colspan="7" align="right">
								<p>
									商品金额：<b class="red">￥${shopOrderGoods.totalPrice }</b>&nbsp;&nbsp;+&nbsp;&nbsp;运费：<b
										class="red">￥0.00</b>&nbsp;&nbsp;+ &nbsp;&nbsp;支付手续费：<b
										class="red">￥0.00</b>&nbsp;&nbsp;税费：<b class="red">0.00</b>
								</p>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="7" align="right">
							<p style="font-size: 22px;">
								应付总金额：<b class="red">￥${shopOrder.totalMoney }</b>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="form-box accept-box" style="margin: 0px;">
			<dl class="head form-group">
				<dd>收货信息</dd>
			</dl>
			<dl class="form-group">
				<dt>顾客姓名：</dt>
				<dd>${shopOrder.userName }</dd>
			</dl>
			<dl class="form-group">
				<dt>送货地址：</dt>
				<dd>${shopOrder.address }</dd>
			</dl>
			<dl class="form-group">
				<dt>联系电话：</dt>
				<dd>${shopOrder.phone }</dd>
			</dl>
			<dl class="form-group">
				<dt>电子邮箱：</dt>
				<dd>${shopOrder.email }</dd>
			</dl>
			<dl class="form-group">
				<dt>备注留言：</dt>
				<dd>${shopOrder.remark }</dd>
			</dl>
		</div>
	</div>
</div>
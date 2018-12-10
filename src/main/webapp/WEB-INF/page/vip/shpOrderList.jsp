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
				<li class="selected"><a href="javascript:;">交易订单</a></li>
			</ul>
		</div>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="ftable">
			<tbody>
				<tr>
					<th width="16%" align="left">订单号</th>
					<th align="left">订单商品</th>
					<th width="10%">姓名</th>
					<th width="12%">订单金额</th>
					<th width="11%">下单时间</th>
					<th width="10%">状态</th>
					<th width="12%">操作</th>
				</tr>

				<c:forEach var="shopOrder" items="${pageInfo.list }">
					<tr>
						<td>${shopOrder.orderSn }</td>
						<td><a target="_blank" title="" href="javascript:void(0)">
								<img width="60" height="60" src="${url }/public/images/${shopOrder.shopOrderGoods.goodsImg}" class="img">
						</a></td>
						<td align="center">${shopOrder.userName }</td>
						<td align="center"><strong>${shopOrder.totalMoney }</strong><br>货到付款</td>
						<td align="center"><fmt:formatDate
								value="${shopOrder.addTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td align="center">
							<c:if test="${shopOrder.shopState==-1 }">已取消</c:if>
							<c:if test="${shopOrder.shopState==0 }">未付款</c:if>
							<c:if test="${shopOrder.shopState==1 }">未签收</c:if> 
							<c:if test="${shopOrder.shopState==2 }">已完成</c:if></td>
						<td align="center"><a href="javascript:void(0)" onclick="orderInfo(${shopOrder.id })">查看订单</a><br>
							<c:if test="${shopOrder.shopState==0 }"><a href="javascript:void(0)" onclick="updateOrder(${shopOrder.id })">取消</a></c:if>
							<c:if test="${shopOrder.shopState==1 }"><a href="javascript:void(0)" onclick="updateOrder(${shopOrder.id })">取消</a></c:if>
							<c:if test="${shopOrder.shopState==2 }"><a href="javascript:void(0)" onclick="quxiaoOrder(${shopOrder.id })">删除订单</a></c:if>
							<c:if test="${shopOrder.shopState==-1 }"><a href="javascript:void(0)" onclick="quxiaoOrder(${shopOrder.id })">删除订单</a></c:if>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</div>
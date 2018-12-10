<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="section">
	<ul class="img-list">
		<c:forEach var="goods" items="${pageInfo.list }">
			<li><a title="${goods.goodsName }"
				href="${url }/goods/GoodslistByPage?id=${goods.id}">
					<div class="img-box">
						<div class="abs-txt">推荐</div>
						<img src="${url }/public/images/${goods.goodsImg}">
					</div>
					<div class="info">
						<h3>${goods.goodsName }</h3>
						<p class="price">
							<b>¥${goods.sellPrice }</b>元
						</p>
						<p>
							<strong>库存${goods.goodsNumber }</strong> <span>市场价：<s>${goods.marketPrice }</s></span>
						</p>
					</div>
			</a></li>
		</c:forEach>
	</ul>
</div>
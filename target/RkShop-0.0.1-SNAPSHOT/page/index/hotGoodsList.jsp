<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="goods" items="${pageInfo.list }">
	<li>
		<a title="${goods.goodsName }" href="${url }/goods/GoodslistByPage?id=${goods.id}">
			<div class="img-box">
				<img src="${url }/public/images/${goods.goodsImg}">
			</div>
			<div class="info">
				<h3>${goods.goodsName }</h3>
				<p>
					<strong>库存${goods.goodsNumber }</strong> <span class="price">¥${goods.sellPrice }</span>
				</p>
			</div>
		</a>
	</li>
</c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新品商品</title>
<link type="text/css" rel="stylesheet" href="${url }/public/js/laypage/skin/laypage.css">
<link rel="stylesheet" type="text/css" href="${url }/public/css/common.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript" src="${url }/public/js/laypage/laypage.js"></script>
<script type="text/javascript">
	$(function() {

		var pages = $("#pages").val();
		var pageNum = $("#pageNum").val();

		laypage({
			cont : 'page',
			pages : pages,
			curr : pageNum,
			jump : function(obj, first) { //点击分页按钮触发的事件
				if (!first) {
					$.ajax({
						url : "${url}/goods/GoodslistByPage",
						type : "post",
						data : {
							pageNum : obj.curr,
							pageSize : 20,
							isHot : 1
						},
						success : function(resultHtml) {
							$("body").empty();
							$("body").html(resultHtml);
						}
					});
				}
			}
		});
	});
</script>
</head>

<input type="hidden" id="pages" value="${pageInfo.pages }">
<input type="hidden" id="pageNum" value="${pageInfo.pageNum }">

<body>

	<jsp:include page="joint/head.jsp"></jsp:include>

	<div class="section new-goods-main">
		<c:forEach var="goods" items="${pageInfo.list }">
			<ul class="img-list">
				<li><a title="${goods.goodsName }"
					href="${url }/goods/GoodslistByPage?id=${goods.id}">
						<div class="img-box">
							<img src="${url }/public/images/${goods.goodsImg}">
						</div>
						<div class="info">
							<h3>${goods.goodsName }</h3>
							<p>
								<strong>库存${goods.goodsNumber }</strong> <span class="price">¥${goods.sellPrice }</span>
							</p>
						</div>
				</a></li>
			</ul>
		</c:forEach>
	</div>
	<div id="page"
		style="width: 500px; float: left; margin-left: 25%; margin-top: 25px;"></div>
	<jsp:include page="joint/footer.jsp"></jsp:include>

</body>
</html>
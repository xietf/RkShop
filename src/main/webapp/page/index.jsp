<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>商城首页</title>
<link rel="stylesheet" type="text/css" href="${url }/public/css/common.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript" src="${url }/public/js/index.js"></script>
<script>
	$(function() {
		$("#navbar li:eq(0)").css({background:"#34ad2a"});
		$("#navbar li:eq(0) a").css({color:"white"});
		newGoodsList();
		hotGoodsList();
	});
</script>
</head>

<body>

	<jsp:include page="joint/head.jsp"></jsp:include>

	<div class="swiper-container section ad-img">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="http://www.baidu.com" target="_blank"> <img
					src="${url }/public/images/brand.jpg">
				</a>
			</div>
		</div>
	</div>


	<div class="section new-goods-main">
		<div class="new-goods-header">
			新品产品 <a class="more-goods f-right" href="${url }/goods/GoodslistByPage?isNew=1&&pageSize=20">更多+</a>
		</div>
		<ul id="newgoodslist" class="img-list"></ul>
	</div>

	<div class="section new-goods-main">
		<div class="new-goods-header">
			热销产品 <a class="more-goods f-right" href="${url }/goods/GoodslistByPage?isHot=1&&pageSize=20">更多+</a>
		</div>
		<ul id="hotgoodslist" class="img-list"></ul>
	</div>
	
	<jsp:include page="joint/footer.jsp"></jsp:include>
	
</body>
</html>
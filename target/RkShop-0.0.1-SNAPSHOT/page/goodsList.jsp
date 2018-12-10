<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>商城产品页面</title>
<link rel="stylesheet" type="text/css" href="${url}/public/css/common.css">
<link type="text/css" rel="stylesheet" href="${url }/public/js/laypage/skin/laypage.css">
<script type="text/javascript" src="${url}/public/js/jquery.min.js"></script>
<script type="text/javascript" src="${url }/public/js/laypage/laypage.js"></script>
<script type="text/javascript">
	$(function() {

		$("#navbar li:eq(1)").css({background:"#34ad2a"});
		$("#navbar li:eq(1) a").css({color:"white"});
		
		$.ajax({
			url: "${url}/goods/GoodslistByPage",
			type: "post",
			data: {		
				pageNum: 1,
				pageSize: 1000
				},
			success: function (result) {
				$("#goodsList").empty();
				$("#goodsList").html(result);
			}
		});
	});

	function goodsCatalogone(t) {
		$(t).attr("class","selected");
		$(t).siblings().attr("class","");

		$("#goodsCatalog1").val($(t).attr("gid"));
		var catalogId = $("#goodsCatalog1").val();
		var price = $("#goodsCatalog2").val();
		var zonghe = $("#goodsCatalog3").val();

		$.ajax({
			url: "${url}/goods/GoodslistByPage",
			type: "post",
			data: {
				pageNum: 1,
				pageSize: 1000,
				catalogId: catalogId,
				price: price,
				zonghe: zonghe
				},
			success : function(resultHtml) {
				$("#goodsList").empty();
				$("#goodsList").html(resultHtml);
			}
		});
	}
	function goodsCatalogtwo(t) {
		$(t).attr("class","selected");
		$(t).siblings().attr("class","");

		$("#goodsCatalog2").val($(t).attr("gid"));
		var catalogId = $("#goodsCatalog1").val();
		var price = $("#goodsCatalog2").val();
		var zonghe = $("#goodsCatalog3").val();

		$.ajax({
			url: "${url}/goods/GoodslistByPage",
			type: "post",
			data: {
				pageNum: 1,
				pageSize: 1000,
				catalogId: catalogId,
				price: price,
				zonghe: zonghe
				},
			success : function(resultHtml) {
				$("#goodsList").empty();
				$("#goodsList").html(resultHtml);
			}
		});
	}
	function goodsCatalogthree(t) {
		$(t).attr("class","selected");
		$(t).siblings().attr("class","");

		$("#goodsCatalog3").val($(t).attr("gid"));
		var catalogId = $("#goodsCatalog1").val();
		var price = $("#goodsCatalog2").val();
		var zonghe = $("#goodsCatalog3").val();

		$.ajax({
			url: "${url}/goods/GoodslistByPage",
			type: "post",
			data: {
				pageNum: 1,
				pageSize: 1000,
				catalogId: catalogId,
				price: price,
				zonghe: zonghe
				},
			success : function(resultHtml) {
				$("#goodsList").empty();
				$("#goodsList").html(resultHtml);
			}
		});
	}
</script>
</head>

<input id="goodsCatalog1" type="hidden" value="0">
<input id="goodsCatalog2" type="hidden" value="0">
<input id="goodsCatalog3" type="hidden" value="0">

<body>

	<jsp:include page="joint/head.jsp"></jsp:include>

	<div class="section">
		<div class="screen-box">
			<!--分类-->
			<dl>
				<dt>分类：</dt>
				<dd>
					<a gid="0" class="selected" href="javascript:void(0)" onclick="goodsCatalogone(this)">全部</a> 
					<c:forEach var="goodsCatalog" items="${pageInfo1.list }">
						<a gid="${goodsCatalog.id }" href="javascript:void(0)" onclick="goodsCatalogone(this)">${goodsCatalog.name }</a>
					</c:forEach>
				</dd>
			</dl>
			<!--/分类-->
			<!--价格-->
			<dl>
				<dt>价格：</dt>
				<dd>
					<a gid="0" class="selected" href="javascript:void(0)" onclick="goodsCatalogtwo(this)">全部</a> 
					<a gid="1" href="javascript:void(0)" onclick="goodsCatalogtwo(this)">0-100元</a> 
					<a gid="2" href="javascript:void(0)" onclick="goodsCatalogtwo(this)">101-500元</a> 
					<a gid="3" href="javascript:void(0)" onclick="goodsCatalogtwo(this)">501-1000元</a> 
					<a gid="4" href="javascript:void(0)" onclick="goodsCatalogtwo(this)">1001-2000元</a>
					<a gid="5" href="javascript:void(0)" onclick="goodsCatalogtwo(this)">2000以上</a>
				</dd>
			</dl>
			<!--/价格-->
		</div>

		<div class="sort-box">
			<a gid="0" class="first selected" href="javascript:void(0)" onclick="goodsCatalogthree(this)">上架时间</a> 
			<a gid="1" href="javascript:void(0)" onclick="goodsCatalogthree(this)">按人气</a> 
			<a gid="2" href="javascript:void(0)" onclick="goodsCatalogthree(this)">价格从高到低</a> 
			<a gid="3" href="javascript:void(0)" onclick="goodsCatalogthree(this)">价格从低到高</a>
		</div>
	</div>


	<div id="goodsList"></div>
	
	<div id="page" style="width: 500px; float: left; margin-left: 25%; margin-top: 25px;"></div>
	
	<jsp:include page="joint/footer.jsp"></jsp:include>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻资讯</title>
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/common.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript" src="${url }/public/js/index.js"></script>
<script>
	$(function() {
		$("#navbar li:eq(4)").css({
			background : "#34ad2a"
		});
		$("#navbar li:eq(4) a").css({
			color : "white"
		});

		$.ajax({
			url : "${url }/news/list",
			type : "post",
			success : function(result) {
				$("#newslist").empty();
				$("#newslist").html(result);
			}
		});
	});
	function newsInfo(id) {
		$.ajax({
			url: "${url }/news/list",
			type: "post",
			data: {id: id},
			success: function (result) {
				$("#newslist").empty();
				$("#newslist").html(result);
			}
		});
	}
	function newsCatalog(catalogId) {
		$.ajax({
			url: "${url }/news/list",
			type: "post",
			data: {catalogId: catalogId},
			success: function (result) {
				$("#newslist").empty();
				$("#newslist").html(result);
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="joint/head.jsp"></jsp:include>
	<div class="section clearfix" style="margin-top: 10px;">
		<div class="right-260">
			<div class="bg-wrap nobg">
				<div class="sidebar-box">
					<h4>资讯类别</h4>
					<ul class="navbar">
						<c:forEach var="newscatalog" items="${list }">
							<li><c:if test="${newscatalog.catalogId==0 }">
									<div style="width: 110px; heigth: 30px; line-height: 30px;">
										<h5>
											<a href="javascript:void(0)"
												onclick="newsCatalog(${newscatalog.id })">${newscatalog.name }</a>
										</h5>
									</div>
									<c:forEach var="newscatalog1" items="${list }">
										<c:if test="${newscatalog1.catalogId==newscatalog.id }">
											<div
												style="width: 110px; heigth: 30px; line-height: 30px; float: left;">
												<a href="javascript:void(0)"
													onclick="newsCatalog(${newscatalog1.id })">${newscatalog1.name }</a>
											</div>
										</c:if>
									</c:forEach>
								</c:if></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<div id="newslist" class="left-auto"></div>

	</div>

	<jsp:include page="joint/footer.jsp"></jsp:include>
</body>
</html>
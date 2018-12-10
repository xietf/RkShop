<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/common.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
</head>
<body>
	<div class="left-auto">
		<div class="bg-wrap">
			<ul class="n-list">
				<c:forEach var="news" items="${pageInfo.list }">
					<li onclick="newsInfo(${news.id })">
						<h2>
							<a href="javascript:void(0)">${news.newsTitle }</a>
						</h2>
						<div class="note">

							<b><img src="${url }/public/images/${news.newsImg }"></b>

							<p>${news.description }</p>
							<div class="info">
								<span><i class="iconfont icon-date"></i> <fmt:formatDate
										value="${news.addTime }" /></span> <span>${news.commentCount }人评论</span>
								<span>${news.countClick }次浏览</span>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>

			<div class="page-box">
				<div class="digg"></div>
			</div>

		</div>
	</div>
</body>
</html>
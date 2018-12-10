<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="section clearfix" style="margin-top: 10px;">
	<!--页面左边-->
	<div class="left-auto">
		<div class="bg-wrap">
			<c:forEach var="news" items="${pageInfo.list }">
				<div class="meta">
					<h2>${news.newsTitle }</h2>
					<div class="info">
						<span><i class="iconfont icon-date"></i><fmt:formatDate value="${news.addTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						<span><i class="iconfont icon-comment"></i> <script
								type="text/javascript" src="detail.html"></script>${news.commentCount }人评论</span> <span><i
							class="iconfont icon-view"></i> <script type="text/javascript"
								src="detail.html"></script>浏览${news.countClick }次</span>
					</div>
					<div class="note">
						<p>${news.subTitle }</p>
					</div>
				</div>

				<div class="entry">
					<p class="text">${news.description }</p>
				</div>
			</c:forEach>
		</div>
	</div>
	<!--/页面左边-->
</div>
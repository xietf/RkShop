<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${url }/public/css/adminbase.css">
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">新闻资讯</a></li>
		</ul>
	</div>

	<div class="session-main">

		<table style="border: 0px; width: 100%;">
			<tr>
				<td align="left" width="10%"><a href="javascript:void(0)"
					onclick="tonewsinsert()" class="btn-add"><span><img
							src="${url }/public/images/t01.png"></span>添加</a></td>
				<td width="90%">
					<ul class="seachform" style="margin-top: 15px; float: right;">
						<li><input id="bylike" type="text" class="scinput"></li>

						<li><label>&nbsp;</label><input type="button" class="scbtn"
							value="查询" onclick="newsgetbylike()"></li>

					</ul>
				</td>
			</tr>
		</table>




		<table class="tablelist">
			<thead>
				<tr>
					<th>编号</th>
					<th>新闻标题</th>
					<th>新闻缩略图</th>
					<th>简标题</th>
					<th>创建时间</th>
					<th>预览数</th>
					<th>评论数</th>
					<th>是否显示</th>
					<th>详细信息</th>
					<th>新闻分类编号</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="news" items="${pageInfo.list }">
					<tr>
						<td>${news.id }</td>
						<td>${news.newsTitle }</td>
						<td><img src="${url }/public/images/${news.newsImg }"
							style="width: 30px; height: 30px;"></td>
						<td>${news.subTitle }</td>
						<td><fmt:formatDate value="${news.addTime }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${news.countClick }</td>
						<td>${news.commentCount }</td>
						<td><c:if test="${news.isShow==1 }">是</c:if> <c:if
								test="${news.isShow==0 }">否</c:if></td>
						<td><textarea>${news.description }</textarea></td>
						<td>${news.catalogId }</td>
						<td><a href="javascript:void(0)"
							onclick="tonewsupdate(${news.id })" class="tablelink">修改</a> <a
							href="javascript:void(0)" onclick="newsdelete(${news.id })"
							class="tablelink">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagin">
			<div class="message">
				共<i class="blue">${pageInfo.total }</i>条记录，当前显示第&nbsp;<i
					class="blue">${pageInfo.pageNum }/${pageInfo.pages }</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(1, ${pageInfo.pages }, 'news/list')"><span
						class="pagepre"></span></a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pageNum-1 }, ${pageInfo.pages }, 'news/list')">上一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pageNum+1 }, ${pageInfo.pages }, 'news/list')">下一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pages }, ${pageInfo.pages }, 'news/list')"><span
						class="pagenxt"></span></a></li>
			</ul>
		</div>
	</div>

</body>
</html>
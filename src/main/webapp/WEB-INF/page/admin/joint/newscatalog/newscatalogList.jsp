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
			<li><a href="#">新闻分类</a></li>
		</ul>
	</div>

	<div class="session-main">

		<table style="border: 0px; width: 100%;">
			<tr>
				<td align="left" width="10%"><a href="javascript:void(0)"
					onclick="tonewscataloginsert()" class="btn-add"><span><img
							src="${url }/public/images/t01.png"></span>添加</a></td>
				<td width="90%">
					<ul class="seachform" style="margin-top: 15px; float: right;">
						<li><input id="bylike" type="text" class="scinput"></li>

						<li><label>&nbsp;</label><input type="button" class="scbtn"
							value="查询" onclick="newscataloggetbylike()"></li>

					</ul>
				</td>
			</tr>
		</table>




		<table class="tablelist">
			<thead>
				<tr>
					<th>编号</th>
					<th>类型名称</th>
					<th>描述</th>
					<th>父级编号</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="newsCatalog" items="${pageInfo.list }">
					<tr>
						<td>${newsCatalog.id }</td>
						<td>${newsCatalog.name }</td>
						<td>${newsCatalog.remark }</td>
						<td>${newsCatalog.catalogId }</td>
						<td><a href="javascript:void(0)"
							onclick="tonewscatalogupdate(${newsCatalog.id })"
							class="tablelink">修改</a> <a href="javascript:void(0)"
							onclick="newscatalogdelete(${newsCatalog.id })" class="tablelink">删除</a></td>
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
					onclick="getbypage(1, ${pageInfo.pages }, 'newscatalog/list2')"><span
						class="pagepre"></span></a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pageNum-1 }, ${pageInfo.pages }, 'newscatalog/list2')">上一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pageNum+1 }, ${pageInfo.pages }, 'newscatalog/list2')">下一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pages }, ${pageInfo.pages }, 'newscatalog/list2')"><span
						class="pagenxt"></span></a></li>
			</ul>
		</div>
	</div>

</body>
</html>
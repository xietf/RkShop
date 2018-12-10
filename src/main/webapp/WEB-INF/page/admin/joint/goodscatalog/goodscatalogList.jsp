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
			<li><a href="#">商品分类</a></li>
		</ul>
	</div>

	<div class="session-main">

		<table style="border: 0px; width: 100%;">
			<tr>
				<td align="left" width="10%"><a href="javascript:void(0)"
					onclick="togoodscataloginsert()" class="btn-add"><span><img
							src="${url }/public/images/t01.png"></span>添加</a></td>
				<td width="90%">
					<ul class="seachform" style="margin-top: 15px; float: right;">
						<li><input id="bylike" type="text" class="scinput"></li>

						<li><label>&nbsp;</label><input type="button" class="scbtn"
							value="查询" onclick="goodscataloggetbylike()"></li>

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
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="goodsCatalog" items="${pageInfo1.list }">
					<tr>
						<td>${goodsCatalog.id }</td>
						<td>${goodsCatalog.name }</td>
						<td>${goodsCatalog.remark }</td>
						<td><a href="javascript:void(0)"
							onclick="togoodscatalogupdate(${goodsCatalog.id })"
							class="tablelink">修改</a> <a href="javascript:void(0)"
							onclick="goodscatalogdelete(${goodsCatalog.id })"
							class="tablelink">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagin">
			<div class="message">
				共<i class="blue">${pageInfo1.total }</i>条记录，当前显示第&nbsp;<i
					class="blue">${pageInfo1.pageNum }/${pageInfo1.pages }</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(1, ${pageInfo1.pages }, 'goodscatalog/list')"><span
						class="pagepre"></span></a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo1.pageNum-1 }, ${pageInfo1.pages }, 'goodscatalog/list')">上一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo1.pageNum+1 }, ${pageInfo1.pages }, 'goodscatalog/list')">下一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo1.pages }, ${pageInfo1.pages }, 'goodscatalog/list')"><span
						class="pagenxt"></span></a></li>
			</ul>
		</div>
	</div>

</body>
</html>
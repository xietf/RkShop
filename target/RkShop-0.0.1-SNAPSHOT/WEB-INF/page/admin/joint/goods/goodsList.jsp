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
<body style="overflow: auto;">
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">商品管理</a></li>
		</ul>
	</div>

	<div class="session-main">

		<table style="border: 0px; width: 100%;">
			<tr>
				<td align="left" width="10%"><a href="javascript:void(0)"
					onclick="togoodsadd()" class="btn-add"><span><img
							src="${url }/public/images/t01.png"></span>添加</a></td>
				<td width="90%">
					<ul class="seachform" style="margin-top: 15px; float: right;">
						<li><input id="bylike" type="text" class="scinput"></li>

						<li><label>&nbsp;</label><input type="button" class="scbtn"
							value="查询" onclick="goodsgetbylike()"></li>

					</ul>
				</td>
			</tr>
		</table>




		<table class="tablelist">
			<thead>
				<tr>
					<th>编号</th>
					<th>商品名称</th>
					<th>商品图片</th>
					<th>商品货号</th>
					<th>市场价格</th>
					<th>出售价格</th>
					<th>库存数量</th>
					<th>是否上架</th>
					<th>添加时间</th>
					<th>点击数量</th>
					<th>是否新品</th>
					<th>商品分类编号</th>
					<th>是否热销</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="goods" items="${pageInfo.list }">
					<tr>
						<td>${goods.id }</td>
						<td>${goods.goodsName }</td>
						<td><img src="${url }/public/images/${goods.goodsImg }"
							style="width: 30px; height: 30px;" /></td>
						<td>${goods.goodsSn }</td>
						<td>${goods.marketPrice }</td>
						<td>${goods.sellPrice }</td>
						<td>${goods.goodsNumber }</td>
						<td><c:if test="${goods.isOnSale==1 }">是</c:if> <c:if
								test="${goods.isOnSale==0 }">否</c:if></td>
						<td><fmt:formatDate value="${goods.addTime }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${goods.clickCount }</td>
						<td><c:if test="${goods.isNew==1 }">是</c:if> <c:if
								test="${goods.isNew==0 }">否</c:if></td>
						<td>${goods.catalogId }</td>
						<td><c:if test="${goods.isHot==1 }">是</c:if> <c:if
								test="${goods.isHot==0 }">否</c:if></td>
						<td><a href="javascript:void(0)"
							onclick="togoodsupdate(${goods.id })" class="tablelink">修改</a> <a
							href="javascript:void(0)" onclick="goodsdelete(${goods.id })"
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
					onclick="getbypage(1, ${pageInfo.pages }, 'goods/list')"><span
						class="pagepre"></span></a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pageNum-1 }, ${pageInfo.pages }, 'goods/list')">上一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pageNum+1 }, ${pageInfo.pages }, 'goods/list')">下一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pages }, ${pageInfo.pages }, 'goods/list')"><span
						class="pagenxt"></span></a></li>
			</ul>
		</div>
	</div>

</body>
</html>
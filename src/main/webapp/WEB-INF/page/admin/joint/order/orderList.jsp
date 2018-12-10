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
			<li><a href="#">订单管理</a></li>
		</ul>
	</div>

	<div class="session-main">

		<table style="border: 0px; width: 100%;">
			<tr>
				<td width="90%">
					<ul class="seachform" style="margin-top: 15px; float: right;">
						<li><input id="bylike" type="text" class="scinput"></li>

						<li><label>&nbsp;</label><input type="button" class="scbtn"
							value="查询" onclick="ordergetbylike()"></li>

					</ul>
				</td>
			</tr>
		</table>




		<table class="tablelist">
			<thead>
				<tr>
					<th>编号</th>
					<th>订单号</th>
					<th>创建时间</th>
					<th>用户名称</th>
					<th>省份</th>
					<th>城市</th>
					<th>地区</th>
					<th>详细信息</th>
					<th>手机</th>
					<th>邮箱</th>
					<th>邮政编码</th>
					<th>订单状态</th>
					<th>描述信息</th>
					<th>用户编号</th>
					<th>总金额</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="shopOrder" items="${pageInfo.list }">
					<tr>
						<td>${shopOrder.id }</td>
						<td>${shopOrder.orderSn }</td>
						<td><fmt:formatDate value="${shopOrder.addTime }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${shopOrder.userName }</td>
						<td>${shopOrder.province }</td>
						<td>${shopOrder.city }</td>
						<td>${shopOrder.area }</td>
						<td>${shopOrder.address }</td>
						<td>${shopOrder.phone }</td>
						<td>${shopOrder.email }</td>
						<td>${shopOrder.code }</td>
						<td><c:if test="${shopOrder.shopState==0 }">待付款</c:if> <c:if
								test="${shopOrder.shopState==1 }">待签收</c:if> <c:if
								test="${shopOrder.shopState==2 }">已完成</c:if></td>
						<td>${shopOrder.remark }</td>
						<td>${shopOrder.userId }</td>
						<td>${shopOrder.totalMoney }</td>
						<td><a href="javascript:void(0)"
							onclick="orderInfo(${shopOrder.id })" class="tablelink">查看</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagin">
			<div class="message">
				共<i class="blue">${pageInfo.total }</i>条记录，当前显示第&nbsp;<i
					class="blue">${pageInfo.pageNum }&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
				<li class="paginItem"><a href="javascript:void(0)" onclick="getbypage(${pageInfo.pageNum-1 }, 'shoporder/list2')">上一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)" onclick="getbypage(${pageInfo.pageNum+1 }, 'shoporder/list2')">下一页</a></li>
				<li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
			</ul>
		</div>
	</div>

</body>
</html>
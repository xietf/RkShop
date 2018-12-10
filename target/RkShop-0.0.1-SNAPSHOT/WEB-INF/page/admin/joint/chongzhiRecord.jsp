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
			<li><a href="#">充值记录</a></li>
		</ul>
	</div>

	<div class="session-main">

		<table style="border: 0px; width: 100%;">
			<tr>
				<td width="90%">
					<ul class="seachform" style="margin-top: 15px; float: right;">
						<li><input id="bylike" type="text" class="scinput"></li>

						<li><label>&nbsp;</label><input type="button" class="scbtn"
							value="查询" onclick="chongzhirecordgetbylike()"></li>

					</ul>
				</td>
			</tr>
		</table>




		<table class="tablelist">
			<thead>
				<tr>
					<th>编号</th>
					<th>用户编号</th>
					<th>订单号</th>
					<th>创建时间</th>
					<th>充值金额</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rechargeLog" items="${pageInfo.list }">
					<tr>
						<td>${rechargeLog.id }</td>
						<td>${rechargeLog.userId }</td>
						<td>${rechargeLog.rechargeSn }</td>
						<td><fmt:formatDate value="${rechargeLog.addTime }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${rechargeLog.money }</td>
						<td><a href="javascript:void(0)"
							onclick="chongzhirecorddelete(${rechargeLog.id })"
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
					onclick="getbypage(1, ${pageInfo.pages }, 'rechargelog/list')"><span
						class="pagepre"></span></a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pageNum-1 }, ${pageInfo.pages }, 'rechargelog/list')">上一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pageNum+1 }, ${pageInfo.pages }, 'rechargelog/list')">下一页</a></li>
				<li class="paginItem"><a href="javascript:void(0)"
					onclick="getbypage(${pageInfo.pages }, ${pageInfo.pages }, 'rechargelog/list')"><span
						class="pagenxt"></span></a></li>
			</ul>
		</div>
	</div>

</body>
</html>
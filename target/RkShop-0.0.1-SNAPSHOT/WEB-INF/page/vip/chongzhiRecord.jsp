<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="right-auto">
	<div class="bg-wrap" style="min-height: 765px;">
		<div class="sub-tit " style="margin: 0px;">
			<a class="add" href="javascript:window.history.go(-1)"><i
				class="iconfont icon-reply"></i>返回</a>
			<ul>
				<li class="selected"><a href="javascript:;">充值记录</a></li>
			</ul>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="ftable">
			<tbody>
				<tr>
					<th width="6%" align="left">编号</th>
					<th align="left" width="20%">充值单号</th>
					<th width="12%">充值金额</th>
					<th width="11%">时间</th>
				</tr>

				<c:forEach var="rechargeLog" items="${pageInfo.list }">
					<tr>
						<td>${rechargeLog.id }</td>
						<td>${rechargeLog.rechargeSn }</td>
						<td align="center">${rechargeLog.money }</td>
						<td align="center"><fmt:formatDate value="${rechargeLog.addTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</div>
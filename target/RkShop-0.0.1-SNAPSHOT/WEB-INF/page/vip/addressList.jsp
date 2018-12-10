<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/common.css">
</head>
<body>
	<c:forEach var="address" items="${list }">
		<table class="ftable"
			style="margin: 0px auto; margin-bottom: 20px; width: 1060px;">

			<tbody>
				<input type="hidden" value="${address.userName }"/>
				<input type="hidden" value="${address.province }"/>
				<input type="hidden" value="${address.city }"/>
				<input type="hidden" value="${address.area }"/>
				<input type="hidden" value="${address.address }"/>
				<input type="hidden" value="${address.phone }"/>
				<input type="hidden" value="${address.email }"/>
				<input type="hidden" value="${address.code }"/>
				<input type="hidden" value="${address.userId }"/>
				<tr>
					<th align="left" colspan="3"><c:if
							test="${address.isDefault==1 }">
							<span style="width: 65px; color: orange;">[默认地址]</span>
						</c:if> <c:if test="${address.isDefault==0 }">
						选择	<input name="addressCheck" type="checkbox"
								onclick="updateAddress(this)" />
						</c:if></th>
				</tr>
				<tr>
					<td colspan="2" align="left">${address.userName }</td>
					<td align="right">${address.phone }</td>
				</tr>
				<tr>
					<td colspan="2">地址：${address.address }</td>
				</tr>
			</tbody>

		</table>
	</c:forEach>
</body>
</html>
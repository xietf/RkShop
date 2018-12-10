<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="right-auto">
	<div class="bg-wrap" style="min-height: 765px;">
		<div class="sub-tit " style="margin: 0px;">
			<a class="add" href="javascript:void(0)" onclick="toInsertAddress()">新增地址</a>
			<ul>
				<li class="selected"><a href="javascript:;">收货地址</a></li>
			</ul>
		</div>

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="ftable">
			<c:forEach var="address" items="${list }">
				<tbody>
					<tr>
						<th align="left"><c:if test="${address.isDefault==1 }">
								<span style="width: 65px; color: orange;">[默认地址]</span>
							</c:if>收货地址</th>
						<th width="18%" align="left">手机</th>
						<th width="20%" align="left">邮箱</th>
						<th width="100">操作</th>
					</tr>
					<!--取得一个DataTable-->
					<!--取得分页页码列表-->
					<tr>
						<td>(${address.userName }) ${address.address }</td>
						<td>${address.phone }</td>
						<td>${address.email }</td>
						<td align="center"><a href="javascript:void(0)"
							onclick="toUpdateAddress(${address.id })">编辑</a> | <a
							href="javascript:void(0)"
							onclick="moren(${address.id },${address.userId })">设为默认</a></td>
					</tr>

				</tbody>
			</c:forEach>
		</table>

	</div>
</div>

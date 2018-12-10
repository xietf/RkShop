<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">订单管理</a></li>
		<li><a href="#">详请</a></li>
	</ul>
</div>
<div class="formbody">
	<ul class="forminfo">
		<li><label>编号</label><input type="text" class="dfinput"
			value="${shopOrder.id }" readonly="readonly" ></li>
		<li><label>订单号</label><input type="text" class="dfinput"
			value="${shopOrder.orderSn }" readonly="readonly"></li>
		<li><label>创建时间</label><input type="text" class="dfinput"
			value='<fmt:formatDate value="${shopOrder.addTime }" pattern="yyyy-MM-dd HH:mm:ss" />'
			readonly="readonly"></li>
		<li><label>收货人</label><input type="text" class="dfinput"
			value="${shopOrder.userName }"></li>
		<li><label>省</label><input type="text" class="dfinput"
			value="${shopOrder.province }"></li>
		<li><label>市</label><input type="text" class="dfinput"
			value="${shopOrder.city }"></li>
		<li><label>区</label><input type="text" class="dfinput"
			value="${shopOrder.area }"></li>
		<li><label>详细地址</label><input type="text" class="dfinput"
			value="${shopOrder.address }"></li>
		<li><label>手机号</label><input type="text" class="dfinput"
			value="${shopOrder.phone }"></li>
		<li><label>邮箱</label><input type="text" class="dfinput"
			value="${shopOrder.email }"></li>
		<li><label>邮政编码</label><input type="text" class="dfinput"
			value="${shopOrder.code }"></li>
		<li><label>订单状态</label> <c:if test="${shopOrder.shopState==-1 }">
				<input type="text" class="dfinput" value="已取消">
			</c:if> <c:if test="${shopOrder.shopState==0 }">
				<input type="text" class="dfinput" value="待付款">
			</c:if> <c:if test="${shopOrder.shopState==1 }">
				<input type="text" class="dfinput" value="待签收">
			</c:if> <c:if test="${shopOrder.shopState==2 }">
				<input type="text" class="dfinput" value="已完成">
			</c:if></li>
		<li><label>描述信息</label> <textarea rows="15" cols="100"
				style="border: solid 1px #c5c5c5;">${shopOrder.remark }</textarea></li>
		<li><label>会员编号</label><input type="text" class="dfinput"
			value="${shopOrder.userId }"></li>
		<li><label>总金额</label><input type="text" class="dfinput"
			value="${shopOrder.totalMoney }"></li>

		<li><label>&nbsp;</label><input type="button" class="btn"
			onclick="goodslist()" value="返回" style="background: #57e980;"></li>
	</ul>
</div>
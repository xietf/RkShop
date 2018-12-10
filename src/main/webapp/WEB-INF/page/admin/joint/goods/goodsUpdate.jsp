<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">商品管理</a></li>
		<li><a href="#">修改</a></li>
	</ul>
</div>
<div class="formbody">
	<form action="${url }/goods/update" method="post"
		enctype="multipart/form-data">
		<ul class="forminfo">
			<li><label>商品编号</label><input name="id" type="text"
				class="dfinput" value="${goods.id }" readonly="readonly"></li>
			<li><label>商品名称</label><input name="goodsName" type="text"
				class="dfinput" value="${goods.goodsName }"></li>
			<li><label>商品图片</label><input name="imgfile" type="file"></li>
			<li><label>商品货号</label><input name="goodsSn" type="text"
				class="dfinput" value="${goods.goodsSn }"></li>
			<li><label>市场价格</label><input name="marketPrice" type="text"
				class="dfinput" value="${goods.marketPrice }"></li>
			<li><label>出售价格</label><input name="sellPrice" type="text"
				class="dfinput" value="${goods.sellPrice }"></li>
			<li><label>库存数量</label><input name="goodsNumber" type="number"
				class="dfinput" value="${goods.goodsNumber }"></li>
			<li><label>是否上架</label> <c:if test="${goods.isOnSale==1 }">
					<cite> <input name="isOnSale" type="radio" value="1"
						checked="checked">是 &nbsp;&nbsp;&nbsp;&nbsp; <input
						name="isOnSale" type="radio" value="0">否
					</cite>
				</c:if> <c:if test="${goods.isOnSale==0 }">
					<cite> <input name="isOnSale" type="radio" value="1">是
						&nbsp;&nbsp;&nbsp;&nbsp; <input name="isOnSale" type="radio"
						value="0" checked="checked">否
					</cite>
				</c:if></li>
			<li><label>描述信息</label>
			<textarea name="description" rows="15" cols="100"
					style="border: solid 1px #c5c5c5;">${goods.description }</textarea></li>
			<li><label>创建时间</label><input name="addtime" type="text"
				class="dfinput"
				value='<fmt:formatDate value="${goods.addTime }" pattern="yyyy-MM-dd HH:mm:ss" />'
				readonly="readonly"></li>
			<li><label>点击数量</label><input name="clickCount" type="number"
				class="dfinput" value="${goods.clickCount }"></li>
			<li><label>是否新品</label> <c:if test="${goods.isNew==1 }">
					<cite> <input name="isNew" type="radio" value="1"
						checked="checked">是 &nbsp;&nbsp;&nbsp;&nbsp; <input
						name="isNew" type="radio" value="0">否
					</cite>
				</c:if> <c:if test="${goods.isNew==0 }">
					<cite> <input name="isNew" type="radio" value="1">是
						&nbsp;&nbsp;&nbsp;&nbsp; <input name="isNew" type="radio"
						value="0" checked="checked">否
					</cite>
				</c:if></li>
			<li><label>商品分类</label><select name="catalogid" class="dfinput">
					<option value="${goodscatalog.id }">${goodscatalog.name }</option>
					<c:forEach var="goodsCatalog" items="${listgoodsCatalog }">
						<c:if test="${goodsCatalog.id!=goods.catalogId }">
							<option value="${goodsCatalog.id }">${goodsCatalog.name }</option>
						</c:if>
					</c:forEach>
			</select></li>
			<li><label>是否热销</label> <c:if test="${goods.isHot==1 }">
					<cite> <input name="isHot" type="radio" value="1"
						checked="checked">是 &nbsp;&nbsp;&nbsp;&nbsp; <input
						name="isHot" type="radio" value="0">否
					</cite>
				</c:if> <c:if test="${goods.isHot==0 }">
					<cite> <input name="isHot" type="radio" value="1">是
						&nbsp;&nbsp;&nbsp;&nbsp; <input name="isHot" type="radio"
						value="0" checked="checked">否
					</cite>
				</c:if></li>
			<li><label>&nbsp;</label><input type="submit" class="btn"
				value="确认修改"> <input type="button" class="btn"
				onclick="goodslist()" value="返回" style="background: #57e980;"></li>
		</ul>
	</form>
</div>
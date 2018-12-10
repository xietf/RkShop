<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">商品管理</a></li>
		<li><a href="#">添加</a></li>
	</ul>
</div>

<div class="formbody">
	<form action="${url }/goods/insert" method="post"
		enctype="multipart/form-data">
		<ul class="forminfo">
			<li><label>商品名称</label><input name="goodsName" type="text"
				class="dfinput"></li>
			<li><label>商品图片</label><input name="imgfile" type="file"></li>
			<li><label>商品货号</label><input name="goodsSn" type="text"
				class="dfinput"></li>
			<li><label>市场价格</label><input name="marketPrice" type="text"
				class="dfinput"></li>
			<li><label>出售价格</label><input name="sellPrice" type="text"
				class="dfinput"></li>
			<li><label>库存数量</label><input name="goodsNumber" type="number"
				class="dfinput"></li>
			<li><label>是否上架</label> <cite> <input name="isOnSale"
					type="radio" value="1" checked="checked">是
					&nbsp;&nbsp;&nbsp;&nbsp; <input name="isOnSale" type="radio"
					value="0">否
			</cite></li>
			<li><label>描述信息</label><input name="description" type="text"
				class="dfinput"></li>
			<li><label>点击数量</label><input name="clickCount" type="number"
				class="dfinput"></li>
			<li><label>是否新品</label> <cite> <input name="isNew"
					type="radio" value="1" checked="checked">是
					&nbsp;&nbsp;&nbsp;&nbsp; <input name="isNew" type="radio" value="0">否
			</cite></li>
			<li><label>商品分类编号</label><input name="catalogId" type="text"
				class="dfinput"></li>
			<li><label>是否热销</label> <cite> <input name="isHot"
					type="radio" value="1" checked="checked">是
					&nbsp;&nbsp;&nbsp;&nbsp; <input name="isHot" type="radio" value="0">否
			</cite></li>
			<li><label>&nbsp;</label><input type="submit" class="btn"
				value="确认保存"> <input type="button" class="btn"
				onclick="goodslist()" value="返回" style="background: #57e980;"></li>
		</ul>
	</form>
</div>
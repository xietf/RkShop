<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">商品分类</a></li>
		<li><a href="#">添加</a></li>
	</ul>
</div>

<div class="formbody">
	<ul class="forminfo">
		<li><label>类型名称</label><input id="name" type="text"
			class="dfinput"></li>
		<li><label>描述</label><input id="remark" type="text"
			class="dfinput"></li>
		<li><label>&nbsp;</label>
		<input type="button" class="btn" onclick="goodscatalogadd()" value="确认保存">
		<input type="button" class="btn" onclick="goodslist()" value="返回" style="background: #57e980;"></li>
	</ul>
</div>
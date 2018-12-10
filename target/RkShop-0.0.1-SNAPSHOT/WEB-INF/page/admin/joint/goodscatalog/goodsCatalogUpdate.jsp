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
	<ul class="forminfo">
		<li><label>商品分类名称</label><input id="name" type="text"
			class="dfinput" value="${goodsCatalog.name }"></li>
		<li><label>描述</label><input id="remark" type="text"
			class="dfinput" value="${goodsCatalog.remark }"></li>
		<li><label>&nbsp;</label><input type="button" class="btn"
			value="确认修改" onclick="goodscatalogupdate(${goodsCatalog.id })"> <input type="button" class="btn"
			onclick="goodslist()" value="返回" style="background: #57e980;"></li>
	</ul>
</div>
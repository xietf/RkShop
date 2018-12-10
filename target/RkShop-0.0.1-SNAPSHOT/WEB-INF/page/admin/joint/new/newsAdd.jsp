<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../../css/adminbase.css">
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">新闻资讯</a></li>
			<li><a href="#">添加</a></li>
		</ul>
	</div>

	<div class="formbody">
		<form action="${url }/news/insert" method="post"
			enctype="multipart/form-data">
			<ul class="forminfo">
				<li><label>文章标题</label><input name="newsTitle" type="text"
					class="dfinput"></li>
				<li><label>文章略缩图</label><input name="imgfile" type="file"></li>
				<li><label>简标题</label><input name="subTitle" type="text"
					class="dfinput"></li>
				<li><label>是否显示</label><cite><input name="isShow"
						type="radio" value="1" checked="checked">是&nbsp;&nbsp;&nbsp;&nbsp;<input
						name="isShow" type="radio" value="0">否</cite></li>
				<li><label>文章内容</label> <textarea name="description" cols=""
						rows="" class="textinput"></textarea></li>
				<li><label>文章分类</label> <select name="catalogId"
					class="dfinput">
						<c:forEach var="newsCatalog" items="${list }">
							<option value="${newsCatalog.id }">${newsCatalog.name }</option>
						</c:forEach>
				</select></li>
				<li><label>&nbsp;</label><input type="submit" class="btn"
					value="确认保存"> <input type="button" class="btn"
					onclick="goodslist()" value="返回" style="background: #57e980;"></li>
			</ul>
		</form>
	</div>

</body>
</html>
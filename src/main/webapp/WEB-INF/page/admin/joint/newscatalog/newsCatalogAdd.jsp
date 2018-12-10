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
			<li><a href="#">新闻分类</a></li>
			<li><a href="#">添加</a></li>
		</ul>
	</div>

	<div class="session-main">

		<div class="formbody">

			<ul class="forminfo">
				<li><label>类型名称</label><input id="name" type="text"
					class="dfinput"></li>
				<li><label>描述</label>
				<textarea id="remark" cols="" rows="" class="textinput"></textarea></li>
				<li><label>父级分类</label> <select id="catalogId"
					class="dfinput">
						<option value="0">无</option>
						<c:forEach var="newsCatalog" items="${list }">
							<option value="${newsCatalog.id }">${newsCatalog.name }</option>
						</c:forEach>
				</select></li>
				<input type="button" class="btn" onclick="newscatalogadd()"
					value="确认保存">
				<input type="button" class="btn" onclick="newscatalog()" value="返回"
					style="background: #57e980;">
				</li>
			</ul>


		</div>
	</div>

</body>
</html>
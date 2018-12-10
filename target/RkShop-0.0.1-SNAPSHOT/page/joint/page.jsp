<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>商城首页</title>
<link rel="stylesheet" type="text/css"
	href="../../public/js/laypage/skin/laypage.css">
<script type="text/javascript" src="../../public/js/jquery.min.js"></script>
<script type="text/javascript" src="../../public/js/laypage/laypage.js"></script>
<script type="text/javascript">
	$(function() {
		laypage({
			cont : 'page',
			pages : 100,
			curr : 10,
			jump : function(obj) {
				console.log(obj)
			}
		});
	});
</script>
</head>

<body>
	<div id="page"></div>
</body>
</html>
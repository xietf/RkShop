<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>联系我们</title>
<link rel="stylesheet" type="text/css" href="${url}/public/css/common.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function () {
		$("#navbar li:eq(5)").css({background:"#34ad2a"});
		$("#navbar li:eq(5) a").css({color:"white"});
	});
	
</script>
</head>

<body>

	<jsp:include page="joint/head.jsp"></jsp:include>

	<div class="section" style="margin-top: 10px;">
		<div class="wrapper">
			<div class="bg-wrap">
				<h1
					style="padding: 20px; line-height: 30px; color: #c00; font-size: 30px; text-align: center; font-weight: 300;">联系我们</h1>
				<div class="entry">
					<p>
						<strong>软咖在线商城 - 专注互联网开发最前端 </strong>
					</p>
					<p>
						<strong>联系方式：不给</strong>
					</p>
					<p>
						<strong>地址：湖南省湘潭市九华软件学院</strong>
					</p>
					<p>
						<strong>微信公众号：暂无</strong>
					</p>
				</div>
				<div class="line15"></div>
			</div>
		</div>
	</div>

	<jsp:include page="joint/footer.jsp"></jsp:include>

</body>
</html>
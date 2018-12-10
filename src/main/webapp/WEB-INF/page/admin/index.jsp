<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>后台管理</title>
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/adminindex.css">
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/adminbase.css">
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${url }/public/css/font-awesome/font-awesome.min.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		userList();
		YNlogin();
	});

	//判定是否登录
	function YNlogin() {
		var username = $("#username").val();
		var password = $("#password").val();
		if (username == null || username == "" || password == null
				|| password == "") {
			$.ajax({
				url : "${url}/user/tologin",
				type : "post",
				success : function(result) {
					$("body").html(result);
				}

			});
		}
	}

	//获取当前系统用户的信息
	function userList() {

		var id = $("#id").val();
		$.ajax({
			url : "${url}/user/list",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}

		});
	}

	//分页
	function getbypage(pageNum, pages, url) {
		if (pageNum < 1) {
			alert("这是第一页");
		} else if (pageNum > pages) {
			alert("这是第最后一页");
		} else {
			$.ajax({
				url : "${url}/" + url,
				type : "post",
				data : {
					pageNum : pageNum,
					admin : "admin"
				},
				success : function(result) {
					$("#mainPage").empty();
					$("#mainPage").html(result);
				}
			});
		}
	}

	//遍历商品表
	function goodslist() {
		$.ajax({
			url : "${url}/goods/list",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//商品表模糊查询
	function goodsgetbylike() {
		var bylike = $("#bylike").val();
		$.ajax({
			url : "${url}/goods/list",
			type : "post",
			data : {
				goodsName : "%" + bylike + "%"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}

		});
	}

	//前往添加商品页面
	function togoodsadd() {
		$.ajax({
			url : "${url}/goods/toinsert",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//前往修改商品页面
	function togoodsupdate(id) {
		$.ajax({
			url : "${url}/goods/toupdate",
			type : "post",
			data:{id: id},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//根据id修改商品
	function goodsupdate(id) {
		$.ajax({
			url : "${url}/goods/update",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					alert("修改成功");
				} else {
					alert("修改失败");
				}
			}
		});
	}

	//根据id删除商品
	function goodsdelete(id) {
		$.ajax({
			url : "${url}/goods/delete",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					alert("删除成功");
					window.location.reload();
				} else {
					alert("删除失败");
				}
			}
		});
	}

	//遍历商品分类表
	function goodscatalog() {
		$.ajax({
			url : "${url}/goodscatalog/list",
			type : "post",
			data : {
				admin : "admin"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//商品分类表模糊查询
	function goodscataloggetbylike() {
		var bylike = $("#bylike").val();
		$.ajax({
			url : "${url}/goodscatalog/list",
			type : "post",
			data : {
				admin : "admin",
				name : "%" + bylike + "%"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}

		});
	}

	//前往添加商品分类页面
	function togoodscataloginsert() {
		$.ajax({
			url : "${url}/goodscatalog/toinsert",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//添加商品分类
	function goodscatalogadd() {
		var name = $("#name").val();
		var remark = $("#remark").val();
		$.ajax({
			url : "${url }/goodscatalog/insert",
			type : "post",
			data : {
				name : name,
				remark : remark
			},
			success : function(result) {
				if (result == 1) {
					alert("添加成功");
					window.location.reload();
				} else {
					alert("添加失败");
				}
			}
		});
	}

	//前往修改商品分类页面
	function togoodscatalogupdate(id) {
		$.ajax({
			url : "${url}/goodscatalog/toupdate",
			type : "post",
			data:{id: id},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//修改商品分类页面
	function goodscatalogupdate(id) {


		var name = $("#name").val();
		var remark = $("#remark").val();
		
		$.ajax({
			url : "${url}/goodscatalog/update",
			type : "post",
			data:{
				id: id,
				name: name,
				remark: remark
			},
			success : function(result) {
				if (result == 1) {
					alert("修改成功");
					window.location.reload();
				} else {
					alert("修改失败");
				}
			}
		});
	}

	//根据id删除商品类型
	function goodscatalogdelete(id) {
		$.ajax({
			url : "${url}/goodscatalog/delete",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					alert("删除成功");
					window.location.reload();
				} else {
					alert("删除失败");
				}
			}
		});
	}

	//遍历新闻表
	function newszixun() {
		$.ajax({
			url : "${url}/news/list",
			type : "post",
			data : {
				admin : "admin"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//新闻表模糊查询
	function newsgetbylike() {
		var bylike = $("#bylike").val();
		$.ajax({
			url : "${url}/news/list",
			type : "post",
			data : {
				admin : "admin",
				newsTitle : "%" + bylike + "%"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}

		});
	}

	//前往添加新闻页面
	function tonewsinsert() {
		$.ajax({
			url : "${url}/news/toinsert",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//根据id删除新闻
	function newsdelete(id) {
		$.ajax({
			url : "${url}/news/delete",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					alert("删除成功");
					window.location.reload();
				} else {
					alert("删除失败");
				}
			}
		});
	}

	//遍历新闻分类表
	function newscatalog() {
		$.ajax({
			url : "${url}/newscatalog/list2",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//新闻分类表模糊查询
	function newscataloggetbylike() {
		var bylike = $("#bylike").val();
		$.ajax({
			url : "${url}/newscatalog/list2",
			type : "post",
			data : {
				name : "%" + bylike + "%"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}

		});
	}

	//前往添加新闻分类页面
	function tonewscataloginsert() {
		$.ajax({
			url : "${url}/newscatalog/toinsert",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//添加新闻分类
	function newscatalogadd() {
		var name = $("#name").val();
		var remark = $("#remark").val();
		var catalogId = $("#catalogId").val();
		alert(name + "\t" + remark + "\t" + catalogId);
		$.ajax({
			url : "${url }/newscatalog/insert",
			type : "post",
			data : {
				name : name,
				remark : remark,
				catalogId : catalogId
			},
			success : function(result) {
				if (result == 1) {
					alert("添加成功");
					window.location.reload();
				} else {
					alert("添加失败");
				}
			}
		});
	}

	//根据id删除新闻类型
	function newscatalogdelete(id) {
		$.ajax({
			url : "${url}/newscatalog/delete",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					alert("删除成功");
					window.location.reload();
				} else {
					alert("删除失败");
				}
			}
		});
	}

	//遍历订单表
	function orderlist() {
		$.ajax({
			url : "${url}/shoporder/list2",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//订单详请
	function orderInfo(id) {
		$.ajax({
			url : "${url}/shoporder/orderInfo",
			type : "post",
			data: {
				id: id,
				admin: "admin"
				},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//订单表模糊查询
	function ordergetbylike() {
		var bylike = $("#bylike").val();
		$.ajax({
			url : "${url}/shoporder/list2",
			type : "post",
			data : {
				ordersn : "%" + bylike + "%"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}

		});
	}

	//遍历会员表
	function vipuserlist() {
		$.ajax({
			url : "${url}/vipuser/list",
			type : "post",
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//会员表模糊查询
	function vipusergetbylike() {
		var bylike = $("#bylike").val();
		$.ajax({
			url : "${url}/vipuser/list",
			type : "post",
			data : {
				username : "%" + bylike + "%"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}

		});
	}

	//根据id删除会员
	function vipuserdelete(id) {
		$.ajax({
			url : "${url}/vipuser/delete",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					alert("删除成功");
					window.location.reload();
				} else {
					alert("删除失败");
				}
			}
		});
	}

	//遍历充值记录表
	function chongzhiRecord() {
		$.ajax({
			url : "${url}/rechargelog/list",
			type : "post",
			data : {
				admin : "admin"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}
		});
	}

	//充值记录表模糊查询
	function chongzhirecordgetbylike() {
		var bylike = $("#bylike").val();
		$.ajax({
			url : "${url}/rechargelog/list",
			type : "post",
			data : {
				admin: "admin",
				rechargeSn : "%" + bylike + "%"
			},
			success : function(result) {
				$("#mainPage").empty();
				$("#mainPage").html(result);
			}

		});
	}

	//根据id删除充值记录
	function chongzhirecorddelete(id) {
		$.ajax({
			url : "${url}/rechargelog/delete",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					alert("删除成功");
					window.location.reload();
				} else {
					alert("删除失败");
				}
			}
		});
	}
</script>
</head>

<input type="hidden" id="id" value="${sessionScope.user.id }">
<input id="username" type="hidden"
	value="${sessionScope.user.username }">
<input id="password" type="hidden"
	value="${sessionScope.user.password }">

<body>
	<div class="header-top">
		<a class="logo" href="${url }/page/index.jsp">LOGO</a>
		<div class="right">
			<img src="${url }/public/images/exit.png">&nbsp;<a
				href="${url }/user/outLogin">退出</a>
		</div>
	</div>
	<div class="menus-left">
		<div class="menus-top">
			<img src="${url }/public/images/nikimg.png" class="img-re">
			<p class="xttong-admin">用户名：${sessionScope.user.username }</p>
		</div>
		<jsp:include page="joint/index_left.jsp"></jsp:include>
	</div>

	<div id="mainPage" class="conter-main" style="overflow: auto;"></div>
</body>
</html>
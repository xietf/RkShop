<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="${url }/public/css/common.css">
<link rel="stylesheet" type="text/css" href="${url}/public/js/layui/css/layui.css">
<script type="text/javascript" src="${url }/public/js/jquery.min.js"></script>
<script type="text/javascript" src="${url }/public/js/index.js"></script>
<script type="text/javascript" src="${url}/public/js/layui/layui.js"></script>
<script>
	$(function() {
		$("#navbar li:eq(2)").css({background : "#34ad2a"});
		$("#navbar li:eq(2) a").css({color:"white"});
		
		setInterval(function() {
			$("#totalQuantity").text($("#checkNum").val());
			$("#totalAmount").text($("#allPrice").val());
		}, 1);
		
	});

	var allbuy = true;
	function allBuy() {

		var allnum=0;
		var allprice=0;
		if(allbuy){
			$("input[type=checkbox][name='check']").prop('checked', true);
			var checkLength = $("td input[type=checkbox][name='check']").length;
			for (var i = 0; i < checkLength; i++) {

				var num = parseInt($("td input[type=checkbox][name='check']:eq("+i+")").attr('num'));
				allnum += num;
				
				var thisprice = parseFloat($("td input[type=checkbox][name='check']:eq("+i+")").attr('thispri'));
				allprice += thisprice;
			}
			$("#checkNum").val(allnum);
			$("#allPrice").val(allprice);
			allbuy=false;
		}else{
			$("input[type=checkbox][name='check']").prop('checked', false);
			$("#checkNum").val(0);
			$("#allPrice").val(0);
			allbuy=true;
		}
	}

	function sumBuy(t) {

		if($(t).is(':checked')){
			var checknum = parseInt($("#checkNum").val());
			var num = parseInt($(t).attr('num'));
			checknum += num;
			$("#checkNum").val(checknum);

			var allprice = parseFloat($("#allPrice").val());
			var thisprice = parseFloat($(t).attr('thispri'));
			allprice += thisprice;
			$("#allPrice").val(allprice);
		}else{
			var checknum = parseInt($("#checkNum").val());
			var num = parseInt($(t).attr('num'));
			checknum -= num;
			$("#checkNum").val(checknum);
			
			var allprice = parseFloat($("#allPrice").val());
			var thisprice = parseFloat($(t).attr('thispri'));
			allprice -= thisprice;
			$("#allPrice").val(allprice);
		}
	}
	
	function goNumJAJ(t) {
		
		tds = t.parentNode.parentNode.parentNode.childNodes;

		a1 = tds[3].childNodes;
		a2 = tds[5].childNodes;
		a3 = tds[7].childNodes;
		a4 = tds[11].childNodes;

		inp1 = a1[0].childNodes;
		inp2 = a2[1].childNodes;
		inp4 = a4[0].childNodes;

		goodsNumber = parseInt($(inp2[1]).text());
		id = parseInt($(inp1[0]).val());
		goNum = parseInt($(t).val());
		sellPrice = parseInt($(a3[1]).text());
		allPrice = parseInt($(inp4[1]).text());
		
		console.info("购物车："+id);
		console.info("库存："+goodsNumber);
		console.info("购买数量："+goNum);
		console.info("单价："+sellPrice);
		console.info("总价："+allPrice);

		if(goNum<=0){
			$(t).val(0);
		}else if(goNum>=goodsNumber){
			$(t).val(goodsNumber);
		}else{
			$.ajax({
				url: "${url}/usercartlog/update?id="+id+"&&goNum="+goNum,
				type: "post",
				 success: function (result) {
					 $("body").empty();
					 $("body").html(result);
				}
			});
		}
	}

	function buy() {
		$.ajax({
			url: "${url }/usercartlog/towTableList2",
			type: "post",
			data:$("#formMain").serializeArray(),
			success: function (result) {
				$("body").empty();
				$("body").html(result);
			}
		});
	}

	//根据id删除购物车数据
	function usercartlogdelete(id) {
		$.ajax({
			url : "${url}/usercartlog/delete",
			type : "post",
			data : {
				id : id
			},
			success : function(result) {
				if (result == 1) {
					layui.use('layer', function() {
						layer.msg('已删除', {icon: 1, time: 1000 }, function () {
							window.location.reload();
						});
					});
				} else {
					layui.use('layer', function() {
						layer.msg('删除失败', {icon: 1, time: 1000 });
					});
				}
			}
		});
	}
</script>
</head>

	<input type="hidden" id="checkNum" value="0" />
	<input type="hidden" id="allPrice" value="0" />

<body>
<form onsubmit="return false;" id="formMain">

	<jsp:include page="joint/head.jsp"></jsp:include>

	<div class="section">
		<div class="cart-head">
			<h2>我的购物车</h2>
			<div class="cart-setp">
				<ul>
					<li class="first active">
						<div class="progress">
							<span>1</span> 放进购物车
						</div>
					</li>
					<li>
						<div class="progress">
							<span>2</span> 填写订单信息
						</div>
					</li>
					<li class="last">
						<div class="progress">
							<span>3</span> 支付/确认订单
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>


	<div class="section">
		<table width="100%" align="center" class="cart-table" border="0"
			cellspacing="0" cellpadding="8">
			<tbody>
				<tr>
					<th align="left" width="30"><input type="checkbox" onclick="allBuy()"></th>
					<th align="left" colspan="2">商品信息</th>
					<th align="left" width="84">单价</th>
					<th align="center" width="104">数量</th>
					<th align="left" width="104">金额(元)</th>
					<th align="center" width="54">操作</th>
				</tr>
				<c:forEach var="usercartlog" items="${list }">
					<tr name="list">
						<td><input name="check" type="checkbox" value="${usercartlog.id }" thispri="${usercartlog.goods.sellPrice*usercartlog.goNum }" num="${usercartlog.goNum }" onclick="sumBuy(this)"/></td>
						<td width="68"><a target="_blank" href="/goods/show-97.html"><input type="hidden" value="${usercartlog.id }" /><img src="${url }/public/images/${usercartlog.goods.goodsImg }" class="img"></a></td>
						<td><a target="_blank" href="${url }/goods/GoodslistByPage?id=${usercartlog.goods.id }">${usercartlog.goods.goodsName }</a><p>库存：<span id="goodsNumber">${usercartlog.goods.goodsNumber }</span></p></td>
						<td>￥<span id="sellPrice">${usercartlog.goods.sellPrice }</span></td>
						<td align="center"><div class="buy-box"><input type="number" class="input"  value="${usercartlog.goNum }" style="width: 50px;" onclick="goNumJAJ(this)" /></div></td>
						<td><span class="red"> ￥<label id="price">${usercartlog.goods.sellPrice*usercartlog.goNum }</label></span></td>
						<td align="center"><a href="javascript:void(0)" onclick="usercartlogdelete(${usercartlog.id })">删除</a></td>
					</tr>
				</c:forEach>
				
				<tr>
					<th align="right" colspan="7"> 
						已选择商品 <b class="red" id="totalQuantity">0</b> 件 &nbsp;&nbsp;&nbsp; 商品总金额（不含运费）：<span class="red">￥</span><b class="red" id="totalAmount">0.00</b>元
					</th>
				</tr>
			</tbody>
		</table>
		
		<div id="page" style="width: 500px; float: left; margin-left: 10%; margin-top: 25px;"></div>
		
	</div>

	<div class="cart-foot section" style="float: left;">
		<div class="right-box">
			<button class="button"
				onclick="javascript:location.href='${url }/page/index.jsp';">继续购物</button>
			<button class="submit"
				onclick="buy()">立即结算</button>
		</div>
	</div>

	<jsp:include page="joint/footer.jsp"></jsp:include>
</form>
</body>
</html>
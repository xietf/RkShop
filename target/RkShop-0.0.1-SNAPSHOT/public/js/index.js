	
	/**
	 * 判断是否登录
	 * @returns
	 */
	function YNlogin() {
		var username = $("#username").val();
		var password = $("#password").val();
		if(username!=null && username!="" && password!=null && password!=""){
			$("#Ylogin").show();
			$("#Nlogin").hide();
		}else{
			$("#Ylogin").hide();
			$("#Nlogin").show();
		}
	}
	
	/**
	 * 新品商品遍历方法
	 * @returns
	 */
	 function newGoodsList() {
		$.ajax({
			url : "/RkShop/goods/GoodslistByPage",
			type : "post",
			data : {
				isNew : 1
			},
			success : function(result) {
				$("#newgoodslist").empty();
				$("#newgoodslist").html(result);
			}
		});
	}
	
	/**
	 * 热销商品遍历方法
	 * @returns
	 */
	function hotGoodsList() {
		$.ajax({
			url : "/RkShop/goods/GoodslistByPage",
			type : "post",
			data : {
				isHot : 1
			},
			success : function(result) {
				$("#hotgoodslist").empty();
				$("#hotgoodslist").html(result);
			}
		});
	}
	
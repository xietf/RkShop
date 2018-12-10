<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="right-auto">
	<div class="bg-wrap" style="min-height: 765px;">


		<!--会员中心-->
		<div class="sub-tit">
			<a class="add" href="javascript:history.go(-1);"><i
				class="iconfont icon-reply"></i>返回</a>
			<ul>
				<li class="selected"><a href="javascript:;">个人中心</a></li>
			</ul>
		</div>

		<div class="center-head clearfix">
			<div class="img-box">

				<img src="${url }/public/images/${vipUser.userImg}">

			</div>
			<div class="list-box">
				<h3>欢迎您~ ${vipUser.username }</h3>
				<ul>
					<li>组别：注册会员</li>
					<li>账户余额：￥${vipUser.rechargeMoney }</li>
				</ul>
			</div>
		</div>
		<div class="center-info clearfix">
			<ul>
				<li>本次登录IP：${ip }</li>
				<li>上次登录IP：${vipUser.lastIp }</li>
				<li>注册时间：<fmt:formatDate
						value="${vipUser.addTime }"
						pattern="yyyy-MM-dd HH:mm:ss" /></li>
				<li>上次登录时间：<fmt:formatDate
						value="${vipUser.lastLoginTime }"
						pattern="yyyy-MM-dd HH:mm:ss" /></li>
			</ul>
		</div>

		<div class="center-tit">
			<span><a href="javascript:void(0)" onclick="moreshopOrder()">更多..</a></span>
			<h3>
				<i class="iconfont icon-order"></i>我的订单
			</h3>
		</div>
		<div class="center-info clearfix">
			<ul>
				<li>已完成订单：${yiwancheng }个</li>
				<li>待完成订单：${weiwancheng }个</li>
			</ul>
		</div>
		<!--会员中心-->
	</div>
</div>
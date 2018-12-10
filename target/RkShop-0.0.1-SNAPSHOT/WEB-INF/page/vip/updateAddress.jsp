<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="userAddress" items="${list }">
	<form id="updateAddressForm" onsubmit="return false;">
		<div class="form-box address-info" style="width: 885px; float: left; padding-top: 0px; padding-left: 15px;">

			<div class="sub-tit " style="margin: 0px;">
				<a class="add" href="javascript:history.go(-1);"><i
					class="iconfont icon-reply"></i>返回</a>
				<ul>
					<li class="selected"><a href="javascript:;">修改地址</a></li>
				</ul>
			</div>

			<dl class="form-group">
				<input name="id" type="hidden" value="${userAddress.id }">
				<dt>收货人姓名：</dt>
				<dd>
					<input name="userName" type="text" class="input Validform_error"
						value="${userAddress.userName }" datatype="s2-20" sucmsg=" ">
				</dd>
			</dl>
			<dl class="form-group">
				<dt>所属地区：</dt>
				<dd>
					<select name="province" class="select">
						<option value="${userAddress.province }">${userAddress.province }</option>
						<option value="北京市">北京市</option>
						<option value="天津市">天津市</option>
						<option value="河北省">河北省</option>
						<option value="山西省">山西省</option>
						<option value="内蒙古自治区">内蒙古自治区</option>
						<option value="辽宁省">辽宁省</option>
						<option value="吉林省">吉林省</option>
						<option value="黑龙江省">黑龙江省</option>
						<option value="上海市">上海市</option>
						<option value="江苏省">江苏省</option>
						<option value="浙江省">浙江省</option>
						<option value="安徽省">安徽省</option>
						<option value="福建省">福建省</option>
						<option value="江西省">江西省</option>
						<option value="山东省">山东省</option>
						<option value="河南省">河南省</option>
						<option value="湖北省">湖北省</option>
						<option value="湖南省">湖南省</option>
						<option value="广东省">广东省</option>
						<option value="广西壮族自治区">广西壮族自治区</option>
						<option value="海南省">海南省</option>
						<option value="重庆市">重庆市</option>
						<option value="四川省">四川省</option>
						<option value="贵州省">贵州省</option>
						<option value="云南省">云南省</option>
						<option value="西藏自治区">西藏自治区</option>
						<option value="陕西省">陕西省</option>
						<option value="甘肃省">甘肃省</option>
						<option value="青海省">青海省</option>
						<option value="宁夏回族自治区">宁夏回族自治区</option>
						<option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
						<option value="香港特别行政区">香港特别行政区</option>
						<option value="澳门特别行政区">澳门特别行政区</option>
						<option value="台湾省">台湾省</option>
						<option value="其它">其它</option>
					</select> <select name="city" class="select">
						<option value="${userAddress.city }">${userAddress.city }</option>
						<option value="市辖区">市辖区</option>
						<option value="市辖县">市辖县</option>
					</select> <select name="area" class="select" datatype="*" sucmsg=" ">
						<option value="${userAddress.area }">${userAddress.area }</option>
						<option value="和平区">和平区</option>
						<option value="河东区">河东区</option>
						<option value="河西区">河西区</option>
						<option value="南开区">南开区</option>
						<option value="河北区">河北区</option>
						<option value="红桥区">红桥区</option>
						<option value="东丽区">东丽区</option>
						<option value="西青区">西青区</option>
						<option value="津南区">津南区</option>
						<option value="北辰区">北辰区</option>
						<option value="武清区">武清区</option>
						<option value="宝坻区">宝坻区</option>
						<option value="滨海新区">滨海新区</option>
					</select>
				</dd>
			</dl>
			<dl class="form-group">
				<dt>详细地址：</dt>
				<dd>
					<input name="address" type="text" class="input Validform_error"
						value="${userAddress.address }" datatype="*2-100" sucmsg=" ">
				</dd>
			</dl>
			<dl class="form-group">
				<dt>手机号码：</dt>
				<dd>
					<input name="phone" type="text" class="input"
						value="${userAddress.phone }" datatype="m" sucmsg=" ">
				</dd>
			</dl>
			<dl class="form-group">
				<dt>电子邮箱：</dt>
				<dd>
					<input name="email" type="text" class="input"
						value="${userAddress.email }">
				</dd>
			</dl>
			<dl class="form-group">
				<dt>邮政编码：</dt>
				<dd>
					<input name="code" type="txt" class="input code"
						value="${userAddress.code }">
				</dd>
			</dl>
			<dl class="form-group">
				<dt></dt>
				<dd>
					<input type="button" value="修改" onclick="UpdateAddress()"
						style="width: 100px; height: 40px; line-height: 40px; border-radius: 5px; background-color: #ff7f00; color: white; font-size: 16px;">
				</dd>
			</dl>
		</div>
	</form>
</c:forEach>
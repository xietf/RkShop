<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="right-auto">
	<div class="bg-wrap" style="min-height: 765px;">


		<div class="sub-tit " style="margin: 0px;">
			<a class="add" href="javascript:window.history.go(-1)"><i
				class="iconfont icon-reply"></i>返回</a>
			<ul>
				<li class="selected"><a href="javascript:;">账户充值</a></li>
			</ul>
		</div>

		<div class="form-box" style="margin: 0px;">
			<dl class="form-group">
				<dt>账户余额：</dt>
				<dd>
					<input id="money" type="hidden" value="${vipuser.rechargeMoney }">
					当前账户金额为：<b>${vipuser.rechargeMoney }</b> 元
				</dd>
			</dl>
			<dl class="form-group">
				<dt>充值金额：</dt>
				<dd>
					<input id="rechargeMoney" type="text" class="input code"
						datatype="n" nullmsg="请输入金额" sucmsg=" "> 元
				</dd>
			</dl>
			<dl class="form-group">
				<dd>
					<input type="button" value="确认充值" class="submit" onclick="congzhiMoney(${vipuser.id })">
				</dd>
			</dl>
		</div>

	</div>
</div>
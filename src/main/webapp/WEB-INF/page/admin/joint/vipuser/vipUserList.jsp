<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">会员管理</a></li>
	</ul>
</div>

<div class="session-main">

	<table style="border: 0px; width: 100%;">
		<tr>
			<td width="90%">
				<ul class="seachform" style="margin-top: 15px; float: right;">
					<li><input id="bylike" type="text" class="scinput"></li>

					<li><label>&nbsp;</label><input type="button" class="scbtn"
						value="查询" onclick="vipusergetbylike()"></li>

				</ul>
			</td>
		</tr>
	</table>




	<table class="tablelist">
		<thead>
			<tr>
				<th>编号</th>
				<th>头像</th>
				<th>用户名</th>
				<th>密码</th>
				<th>手机号</th>
				<th>邮箱</th>
				<th>创建时间</th>
				<th>最后登录时间</th>
				<th>描述</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vipuser" items="${pageInfo.list }">
				<tr>
					<td>${vipuser.id }</td>
					<td><img src="${url }/public/images/${vipuser.userImg }"
						style="width: 30px; height: 30px;"></td>
					<td>${vipuser.username }</td>
					<td>${vipuser.password }</td>
					<td>${vipuser.phone }</td>
					<td>${vipuser.email }</td>
					<td><fmt:formatDate value="${vipuser.addTime }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${vipuser.lastLoginTime }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${vipuser.remark }</td>
					<td><a href="javascript:void(0)"
						onclick="vipuserdelete(${vipuser.id })" class="tablelink">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="pagin">
		<div class="message">
			共<i class="blue">${pageInfo.total }</i>条记录，当前显示第&nbsp;<i class="blue">${pageInfo.pageNum }/${pageInfo.pages }</i>页
		</div>
		<ul class="paginList">
			<li class="paginItem"><a href="javascript:void(0)"
				onclick="getbypage(1, ${pageInfo.pages }, 'vipuser/list')"><span
					class="pagepre"></span></a></li>
			<li class="paginItem"><a href="javascript:void(0)"
				onclick="getbypage(${pageInfo.pageNum-1 }, ${pageInfo.pages }, 'vipuser/list')">上一页</a></li>
			<li class="paginItem"><a href="javascript:void(0)"
				onclick="getbypage(${pageInfo.pageNum+1 }, ${pageInfo.pages }, 'vipuser/list')">下一页</a></li>
			<li class="paginItem"><a href="javascript:void(0)"
				onclick="getbypage(${pageInfo.pages }, ${pageInfo.pages }, 'vipuser/list')"><span
					class="pagenxt"></span></a></li>
		</ul>
	</div>
</div>
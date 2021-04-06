<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

MMyPageController -> memberMyPage.jsp
<br>
<br>

<style>
.box {
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>

<h3>나의 당근</h3>

<table>
	<tr>
		<td>
			<div class="box">
				<a href="memberUpdate.mb">
				<img class="profile" src="<%=request.getContextPath()%>/resources/img.jpg">
				</a>	
			</div>
		</td>
		<td><a href="memberUpdate.mb"> 프로필 수정 </a></td>
	<tr>
</table>

<br>
<br>

<a href="saleList.prd">판매내역</a>
&nbsp;
<a href="purchaseList.prd">구매내역</a>
&nbsp;
<a href="townboard.bd">동네생활(글/댓글)</a>
&nbsp;
<a href="likeList.prd">관심 목록</a>
&nbsp;
<a href="QnA.jsp">QNA</a>
&nbsp;
<a href="Category.jsp">카테고리 관리</a>
&nbsp;
<a href="Notice.jsp">공지사항 관리</a>
&nbsp;
<a href="memberList.mb">회원관리</a>
&nbsp;

<br>


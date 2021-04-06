<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/main_top.jsp" %>

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


	<tr>
		<td>
			<div class="box">
				<a href="memberUpdate.mb">
				<img class="profile" src="<%=request.getContextPath()%>/resources/img.jpg">
				</a>	
			</div>
		</td>
		<td colspan="7"><a href="memberUpdate.mb"> 프로필 수정 </a></td>
	<tr>

	<tr>
		<td><a href="">판매내역</a></td> <!-- saleList.prd 변수 Duplicate local variable saleList 에러 -->
		<td><a href="purchaseList.prd">구매내역</a></td>
		<td><a href="">동네생활(글/댓글)</a></td> <!-- 추후 만들어서 삽입 예정 -->
		<td><a href="like.prd">관심 목록</a></td>
		<td><a href="QnA.jsp">QNA</a></td>
		<td><a href="Category.jsp">카테고리 관리</a></td>
		<td><a href="notice.jsp">공지사항 관리</a></td>
		<td><a href="memberList.mb">회원관리</a></td>
	</tr>

	
<%@ include file="./../common/main_bottom.jsp" %>
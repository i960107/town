<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

MListController -> memberList.jsp
<br>

<%@ include file="./../../WEB-INF/member/memberMyPageTop.jsp"%>

<tr>
	<td colspan="8">

		<table border="1" width="80%" height="600px" align="center">
			<h3>회원 관리</h3>

			<tr height="20" align="center">
				<th>권한</th>
				<th>ID</th>
				<th>이름</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th>계정 상태</th>
				<th>정지</th>
			</tr>

			<c:forEach var="mlist" items="${lists }">
				<tr align="center" height="30">
					<td >${mlist.authority }</td>
					<td>${mlist.id }</td>
					<td>${mlist.name }</td>
					<td>${mlist.gender }</td>
					<td>${mlist.phonenumber }</td>
					<td>${mlist.email }</td>
					<td>${mlist.address }</td>
					<td>${mlist.memberstatus }</td>
					<td>정지</td>
				</tr>
			</c:forEach>
		</table>

	</td>
</tr>
</table>

<br><br><br><br>

<%@ include file="./../common/main_bottom.jsp"%>
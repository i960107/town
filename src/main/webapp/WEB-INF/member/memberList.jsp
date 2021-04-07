<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./../common/common.jsp" %>

MListController -> memberList.jsp <br>

 <%@ include file="./../../WEB-INF/member/memberMyPageTop.jsp"%> 
 
 
<table border="1">
<h3>회원 관리 </h3>

<tr>
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
	<tr>
		<td align="center">${mlist.authority } </td>
		<td align="center">${mlist.id } </td>
		<td align="center">${mlist.name } </td>
		<td align="center">${mlist.gender } </td>
		<td align="center">${mlist.phonenumber } </td>
		<td align="center">${mlist.email } </td>
		<td align="center">${mlist.address } </td>
		<td align="center">${mlist.memberstatus } </td>
		<td align="center">정지</td>
	</tr>

</c:forEach>


</table>

	
	

	








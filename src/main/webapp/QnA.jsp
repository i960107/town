<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./WEB-INF/member/memberMyPageTop.jsp"%>

<h3>QNA</h3>

<!-- https://www.daangn.com/wv/faqs -->

<table align="center">
	<tr>
		<td>
			<h3>QnA</h3>
			<table border="1" width="1000px">
				<tr align="center">
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록시간</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
				
				<%-- <c:forEach var="" items=""> --%>
					<tr align="center">
						<td width="10%">NO</td>
						<td width="30%">제목</td>
						<td width="10%">작성자</td>
						<td width="20%">등록시간</td>
						<td width="10%">삭제</td>
						<td width="10%">수정</td>
					</tr>
			<%-- </c:forEach> --%>
			</table>
		</td>
	<tr>
</table>



<%@ include file="./../WEB-INF/common/main_bottom.jsp"%>
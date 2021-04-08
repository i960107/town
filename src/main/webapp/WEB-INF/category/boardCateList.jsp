<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="./../common/common.jsp" %>
<%@ include file="./../../Category.jsp"%>

<br>
boardCateList.jsp <br>

<h3>동네생활 카테고리 리스트 </h3>


<div align="center">
<table border="1">
<h3>동네생활 카테고리 목록 </h3>

	<tr height="20" align="center">
		<th>NO</th>
		<th>카테고리명</th>
		<th>삭제</th>
		<th>수정</th>
	
	</tr>
	
	<c:forEach var="bclist" items="${bcbean }">
		<tr align="center">
			<td>${bclist.no } </td>
			<td>${bclist.categoryname } </td>
			<td>삭제</td>
			<td>수정</td>
		</tr>
	</c:forEach>
</table>
<br>
</div>

<br><br>


<%@ include file="./../common/main_bottom.jsp"%>
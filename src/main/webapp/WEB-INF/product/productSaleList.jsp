<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp" %>


<!-- PSaleController -> productSaleList.jsp -->
<br>


<form name="myform">
<table align="center" width="1200px";>
	<tr>
		<td colspan="4">
		<h3>나의 당근 판매 내역 리스트 </h3>
		<%@include file="./../common/addrArray.jsp"%>
		</td>
	</tr>
	<tr>
		<c:set var="step" value="0" />
		<c:forEach var="i" items="${searchList}">
				<c:set var="step" value="${step+1 }" />
				<td width="300" height="300"><a	href="detail.prd?no=${i.no}&sellerid=${i.sellerid}"> 
				<img alt="" src="<%=request.getContextPath()%>/resources/${i.image1}" height="200" width="200">
				</a>
				<br>
				 ${i.subject} <br> <span>${i.category}</span> <br>
					${i.price } 원 <br>
					 ${i.address1 } ${i.address2 }<br></td>
				<c:if test="${(step%4)==0 }"> </tr> <tr></c:if>
		</c:forEach>
	</tr>
</table>
</form>
<%@ include file="./../common/main_bottom.jsp"%>
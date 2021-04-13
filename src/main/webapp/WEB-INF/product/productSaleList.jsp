<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp" %>


<!-- PSaleController -> productSaleList.jsp -->
<br>


<table width="1200" align="center">
	<tr>
		<td colspan="4">
		<h3>나의 당근 판매 내역 리스트</h3>
		<form name="myform"><%@include file="./../common/addrArray.jsp"%>
		</form>
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
				 ${i.subject} ${i.no}<br> <span>${i.category}</span> <br>
					${i.price } 원 <br>
					 ${i.address } <br></td>
				<c:if test="${(step%4)==0 }"> </tr> tr>	</c:if>
		</c:forEach>
	</tr>
</table>
<%@ include file="./../common/main_bottom.jsp"%>
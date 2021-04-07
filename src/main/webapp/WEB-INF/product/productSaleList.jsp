<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../../WEB-INF/member/memberMyPageTop.jsp"%>


PSaleController -> productSaleList.jsp<br>

<a href="detail.prd">자세히 보기 임시</a>
<h3>나의 당근 판매 내역 리스트 </h3>
<%@include file="./../common/addrArray.jsp" %>

<table>
	<tr>
		<c:set var="step" value="1"/>
		<c:forEach var="i" items="${list }" >
		<c:set var="step" value="${step+1 }"/>
			<td width="300" height="300">
				<a href="detail.prd?no=${i.no }">
				<img alt="" src="<%=request.getContextPath()%>/resources/${i.image1}" height="200" width="200"><br>
				</a>
				${i.subject } <br>
				${i.price } 원 <br>
				${i.address } <br>
			</td>
		<c:if test="${(step%4)==0 }"></tr><tr></c:if>
		</c:forEach>
	</tr>
</table>

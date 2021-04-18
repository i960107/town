<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp"%>
<script
	src="${pageContext.request.contextPath}/resources/script/timeFormat.js"></script>

<!-- PSaleController -> productSaleList.jsp -->
<br>


	<table align="center" width="1200px";>
		<tr>
			<td colspan="4">
			<div class="section-title">
				<h3>나의 당근 판매 내역 리스트</h3>
			</div>
			</td>
			<tr style="background-color: #FFFFF0;">
									<td colspan=2 align="center" style="padding-top: 10px"
										valign="middle"><h5>
											<b>카테고리</b>
										</h5></td>
								</tr>
								<tr style="background-color: #FFFFF0">
									<td colspan=2 height="100"><c:if test="${category==null}">
										<label for="out_category">
											<c:forEach items="${categoryList}" var="ctg">
												<span class="col-md-2"><input type="checkbox"
													name="category" value="${ctg.no}" checked>${ctg.categoryName}
												</span>
											</c:forEach>
										</c:if> 
										<c:if test="${category!=null}">
											<c:forEach items="${categoryList}" var="ctg">
												<span class="col-md-2"> <input type="checkbox"
													name="category" value="${ctg.no}"
													<c:forTokens items="${category}" delims="," var="ct">
													<c:if test="${ct==ctg.no}">checked</c:if>
													</c:forTokens>>${ctg.categoryName}
												</span>
											</c:forEach>
										</label>
										</c:if></td>
								</tr>
		</tr>
		<tr>
			<c:set var="step" value="0" />
			<c:forEach var="i" items="${searchList}">
				<c:set var="step" value="${step+1 }" />
				<td width="300" height="300">
				<a href="detail.prd?no=${i.no}&sellerid=${i.sellerid}"> <img
						alt="" src="<%=request.getContextPath()%>/resources/${i.image1}"
						height="200" width="200">
				</a> <br><script >
					document.write(displayTime('<c:out value="${i.regdate}"/>'));
				</script> <br> ${i.subject} <br> <span>${i.category}</span> <br>
					${i.price } 원 <br> ${i.address1 } ${i.address2 }<br></td>
				<c:if test="${(step%4)==0 }"></tr><tr></c:if>
			</c:forEach>
		</tr>
	</table>
<%@ include file="./../common/main_bottom.jsp"%>
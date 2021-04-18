<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../../WEB-INF/member/memberMyPageTop.jsp"%>



<br>

	<div style="width: 80%; margin: 0 auto;" > 
            <div class="row">
                <div class="col-md-12">
                    <div class="cart-table">
                    	<br>
                    	<h3 align="center" class="group-input"><b>My Sale List</b></h3>
                    	
                    	<div class="row">
                        <div class="col-lg-12">
                            <div class="cart-buttons" align="right">
                                <a href="pWrite.prd" class="primary-btn up-cart">글쓰기 </a>
                            </div>
                        </div>
               		     </div>
                    	
                        <table>
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Image</th>
                                    <th>제목</th>
                                    <th>카테고리</th>
                                    <th>내용</th>
                                    <th>가격</th>
                                    <th>등록일</th>
                                    <th>조회수</th>
                                    <th>판매상태</th>
                                    <th>수정</th>
                                    <th>삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="mslist" items="${mySaleLists }">
								<tr align="center">
									<td class="group-input"><label>${mslist.no +1 } </label></td>
									<td class="group-input"><label> <a
											href="detail.prd?no=${mslist.no}&sellerid=${sellerid}"> <img
												src="<%= request.getContextPath() %>/resources/${mslist.image1 }"
												width="40px" height="40px">
										</a>
									</label></td>
									<td class="group-input" ><label> <a
											href="detail.prd?no=${mslist.no}&sellerid=${sellerid}">
												${mslist.subject } </a>
									</label></td>
									<td ><label>${mslist.categoryName }
									</label></td>
									<td><label>${mslist.contents }
									</label></td>
									<td class="group-input"><label>
										<fmt:formatNumber pattern="###,###" value="${mslist.price }"/>원</label></td>
									<td class="group-input"><label> <fmt:parseDate
												value="${mslist.regdate } " var="regdate"
												pattern="yyyy-MM-dd" /> <fmt:formatDate value="${regdate }"
												pattern="yyyy-MM-dd" />
									</label></td>
									<td class="group-input"><label>${mslist.readcount }
									</label></td>

							
									<td class="group-input"><label> 
										<c:if test="${mslist.dealstatus == 1}"> 판매중 </c:if> 
										<c:if test="${mslist.dealstatus == 0}"> 판매  완료 </c:if> 
									</label></td>
									<td class="group-input"><label><a href="update.prd?no=${mslist.no}">수정</a></label></td>
									<td class="group-input"><label><a href="delete.prd?no=${mslist.no}"><i class="ti-close"></i></a></label></td>
                                    
                                    
								</tr>
							</c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
 		</div> 

	</td>
	</table>
<br>
<br>


<%@ include file="./../common/main_bottom.jsp"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp"%>
<%-- <%@ include file="../../WEB-INF/member/memberMyPageTop.jsp"%> --%>



<br>
<div style="width: 80%; margin: 0 auto;" > 
            <div class="row">
                <div class="col-md-12">
                    <div class="cart-table">
<form action="memberReportUpdate.mb" method="post" name="myform">
	<table align="center">
		<tr>
			<td>
				<div class="register-login-section spad">
					<div class="register-form">
						<h2>회원 관리</h2>

						<table width="1200px" class="sectable" border="1">
							<div class="group-input">
								<tr align="center">
									<th class="group-input"><label>권한 </label></th>
									<th class="group-input"><label>ID </label></th>
									<th class="group-input"><label>이름</label></th>
									<th class="group-input"><label>성별</label></th>
									<th class="group-input"><label>전화번호</label></th>
									<th class="group-input"><label>이메일</label></th>
									<th class="group-input"><label>주소</label></th>
									<th class="group-input"><label>신고횟수</label></th>
									<th class="group-input"><label>계정 상태</label></th>
									<th class="group-input"><label>계정 정지/복구</label></th>
								</tr>

								<c:forEach var="mlist" items="${lists }">
									<tr align="center" valign="bottom">
										<td class="group-input"><label> <c:if
													test="${mlist.authority == 0 }"> 관리자 </c:if> <c:if
													test="${mlist.authority != 0 }"> user </c:if>
										</label></td>

										<td class="group-input"><label>${mlist.id } </label></td>
										<td class="group-input"><label>${mlist.name } </label></td>
										<td class="group-input"><label>${mlist.gender }</label></td>
										<td class="group-input"><label>${mlist.phonenumber }
										</label></td>
										<td class="group-input"><label>${mlist.email }</label></td>
										<td class="group-input"><label>${mlist.address }</label></td>
										<td class="group-input"><label> <a
												href="memberReportDetail.mb?id=${mlist.id}">${mlist.reportcount }
													회</a>
										</label></td>
										<td class="group-input"><label> <c:if
													test="${mlist.memberstatus == 1 }"> 활동 가능</c:if> <c:if
													test="${mlist.memberstatus == 0 }"> 정지</c:if>
										</label></td>
										<td class="group-input"><lable> <c:if
												test="${mlist.memberstatus == 1 }">
												<a
													href="memberStatusUpdate.mb?id=${mlist.id}&memberstatus=${mlist.memberstatus}"
													onclick="return confirm('계정을 정지하겠습니까?');">계정 정지</a>
											</c:if> <c:if test="${mlist.memberstatus == 0 }">
												<a
													href="memberStatusUpdate.mb?id=${mlist.id}&memberstatus=${mlist.memberstatus}"
													onclick="return confirm('계정을 복구하겠습니까?');">계정 복구</a>
											</c:if> </lable></td>
									</tr>
								</c:forEach>

							</div>

						</table>

					</div>
				</div>
			</td>
		</tr>
	</table>
</form>
</div>
</div>
</div></div>

<br>
<br>


<%@ include file="./../common/main_bottom.jsp"%>


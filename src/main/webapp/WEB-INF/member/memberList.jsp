<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../../WEB-INF/member/memberMyPageTop.jsp"%>


MListController -> memberList.jsp <br>

<script type="text/javascript">
	function stopId(){
		alert("1");
		location.href='';
	}
</script>


<form action="memberReportUpdate.mb" method="post" name="myform">
<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>회원 관리</h2>
					
					<table width="1100px" class="sectable" border="1">
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
								<th class="group-input"><label>계정 정지</label></th>
							</tr>
							
							<c:forEach var="mlist" items="${lists }">
								<tr align="center">
									<td class="group-input">
										<label>
											<c:if test="${mlist.authority == 0 }" > 관리자 </c:if>
											<c:if test="${mlist.authority != 0 }" > user </c:if>
										</label>
									</td>
								
									<td class="group-input"><label>${mlist.id } </label></td>
									<td class="group-input"><label>${mlist.name } </label></td>
									<td class="group-input"><label>${mlist.gender }</label></td>
									<td class="group-input"><label>${mlist.phonenumber } </label></td>
									<td class="group-input"><label>${mlist.email }</label></td>
									<td class="group-input"><label>${mlist.address }</label></td>
									<td class="group-input"><label>${mlist.reportcount }</label></td>
									<td class="group-input"><label>
										<c:if test="${mlist.memberstatus == 1 }"> 활동 가능</c:if>
										<c:if test="${mlist.memberstatus != 1 }"> 정지</c:if>
									</label></td>
									<td class="group-input">
										<lable>
											<a href="memberStatusUpdate.mb?id=${mlist.id}&memberstatus=${mlist.memberstatus}">계정 정지</a>
										</lable>
									</td>
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

<br>
<br>


<%@ include file="./../common/main_bottom.jsp"%>


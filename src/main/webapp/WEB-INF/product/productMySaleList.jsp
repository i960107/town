<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../../WEB-INF/member/memberMyPageTop.jsp"%>


productMySaleList.jsp <br>

<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>나의 판매상품</h2>
					<table width="900px" class="sectable" border="1">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>이미지 </label></th>
								<th class="group-input"><label>제목</label></th>
								<th class="group-input"><label>카테고리</label></th>
								<th class="group-input"><label>설명</label></th>
								<th class="group-input"><label>가격</label></th>
								<th class="group-input"><label>등록일</label></th>
								<th class="group-input"><label>판매상태</label></th>
								<th class="group-input"><label>조회수</label></th>
								<th class="group-input"><label>삭제</label></th>
								<th class="group-input"><label>수정</label></th>

							</tr>

							<c:forEach var="mslist" items="${mySaleLists }">
								<tr align="center">
									<th class="group-input"><label>${mslist.no } </label></th>
									<th class="group-input"><label>${mslist.image1 } </label></th>
									<th class="group-input"><label>${mslist.subject } </label></th>
									<th class="group-input"><label>${mslist.category } </label></th>
									<th class="group-input"><label>${mslist.contents } </label></th>
									<th class="group-input"><label>${mslist.price } </label></th>
									<th class="group-input"><label>${mslist.regdate } </label></th>
									<th class="group-input"><label>${mslist.dealstatus } </label></th>
									<th class="group-input"><label>${mslist.readcount } </label></th>
									<th class="group-input"><label>삭제</label></th>
									<th class="group-input"><label>수정</label></th>
								</tr>
							</c:forEach>
				
						</div>
					</table>

				</div>
			</div>
		</td>
	</tr>
</table>

<br>
<br>


<%@ include file="./../common/main_bottom.jsp"%>


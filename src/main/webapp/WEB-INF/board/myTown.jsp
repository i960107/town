<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../../WEB-INF/member/memberMyPageTop.jsp"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#myBoardList").hide();
		$("#myBoardReplyList").hide();
	});

	function myBoardList() {
		//location.href="/myBoard.bd";     
		$("#myBoardList").show();
		$("#myBoardReplyList").hide();
	}

	function myBoardReplyList() {
		$("#myBoardReplyList").show();
		$("#myBoardList").hide();
	}
</script>
<style>
.div-style {
	position: absolute;
	width: 60%;
	height: 100px;
	margin: 0 32.5%;
	text-align: center;
}
.main-table{
	border-bottom: 1px solid #EAEAEA;
	text-align: center;
}
</style>


<br><br>
<div style="width: 70%; margin: 0 auto;">
	<div class="row">
		<div class="col-md-12">
			<div class="cart-table">
				<h3 align="center" class="group-input">
					<b>My Town</b>
				</h3>
			</div>
		</div>
	</div>
</div>


<div class="filter-control div-style">
	<ul>
		<li class="active" onmouseover="style='cursor:pointer'"
			onclick="myBoardList()">내 글</li>
		<li class="active" onmouseover="style='cursor:pointer'"
			onclick="myBoardReplyList()">내 댓글</li>
	</ul>
</div>


 <br><br>

<div id="myBoardList">
<table align="center" >
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<table width="850px" class="sectable listTable">
						<div class="group-input">
							<tr class="main-table">
								<th class="group-input"><label>NO </label></th>
									<th class="group-input"><label>제목</label></th>
									<th class="group-input"><label>카테고리</label></th>
									<th class="group-input"><label>내용</label></th>
									<th class="group-input"><label>등록일</label></th>
									<th class="group-input"><label>조회수</label></th>
									<th class="group-input"><label>삭제</label></th>
									<th class="group-input"><label>수정</label></th>

							</tr>

							<c:forEach var="mblist" items="${mblists }">

								<tr align="center">
									<td class="group-input"><label>${mblist.no } </label></td>
									<td class="group-input"><label><a href="detailView.bd?no=${mblist.no}"> ${mblist.subject }</a> </label></td>
									<td class="group-input"><label>${mblist.category } </label></td>
									<td class="group-input"><label>${fn:replace(mblist.contents,"<br>","")} </label></td>
									<td class="group-input"><label>
									<fmt:parseDate value="${mblist.regDate } " var="regdate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/>
									</label></td>
									<td class="group-input"><label>${mblist.readcount } </label></td>
									<td class="group-input"><label><a href="update.bd?no=${mblist.no }">수정</a></label></td>
									<td class="group-input"><label><a href="delete.bd?no=${mblist.no }">삭제</a></label></td>
								</tr>
							</c:forEach>
				


						</div>
					</table>

				</div>
			</div>
		</td>
	</tr>
</table>
</div>


<div id="myBoardReplyList">
<table align="center" >
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<table width="850px" class="sectable listTable">
						<div class="group-input">
							<tr class="main-table">
								<th class="group-input"><label>NO </label></th>
									<th class="group-input"><label>원글 번호</label></th>
									<th class="group-input"><label>댓글 내용</label></th>
									<th class="group-input"><label>등록일</label></th>
									<th class="group-input"><label>삭제</label></th>

							</tr>

							<c:forEach var="mbrlist" items="${mbrlists }">
								<tr align="center">
									<th class="group-input"><label>${mbrlist.no } </label></th>
									<th class="group-input"><label>${mbrlist.subject } </label></th>
									<th class="group-input"><label>${mbrlist.category } </label></th>
									<th class="group-input"><label>${fn:replace(mbrlist.contents,"<br>","")} </label></th>
									<th class="group-input"><label>
									<fmt:parseDate value="${mbrlist.regDate } " var="regdate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/>
									</label></th>
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
</div>



<br>

<!-- mytop꺼야  -->
</td>
</table>

<br>
<br>

<%@ include file="./../../WEB-INF/common/main_bottom.jsp"%>


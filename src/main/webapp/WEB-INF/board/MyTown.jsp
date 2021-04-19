<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../WEB-INF/member/memberMyPageTop.jsp"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>

<script type="text/javascript">
 	$(document).ready(function(){
		$("#myBoardList").hide();
		$("#myBoardReplyList").hide();
	}); 
	
	function myBoardList(){
		//location.href="/myBoard.bd";
		$("#myBoardList").show();
		$("#myBoardReplyList").hide();
	}
	
	function myBoardReplyList(){
		$("#myBoardReplyList").show();
		$("#myBoardList").hide();
	}

</script>
<style>

	.div-style{
		position: absolute;
		width: 60%;
		height : 100px;
		margin: 0 42.5%;
		text-align: center;
	}

</style>


<br>
<h4 align="center">동네생활 관리</h4> 


<div class="filter-control div-style" >
     <ul>
     <li class="active" onmouseover="style='cursor:pointer'" onclick="myBoardList()">내 글</li>
     <li class="active" onmouseover="style='cursor:pointer'" onclick="myBoardReplyList()">내 댓글</li>
     </ul>
 </div>
 <br>

<div id="myBoardList">
<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<table width="900px" class="sectable" border="1">
						<div class="group-input">
							<tr align="center">
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
									<th class="group-input"><label>${mblist.no } </label></th>
									<th class="group-input"><label>${mblist.subject } </label></th>
									<th class="group-input"><label>${mblist.category } </label></th>
									<th class="group-input"><label>${mblist.contents } </label></th>
									<th class="group-input"><label>
									<fmt:parseDate value="${mblist.regDate } " var="regdate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd"/>
									</label></th>
									<th class="group-input"><label>${mblist.readcount } </label></th>
									<th class="group-input"><label><a href="update.bd?no=${mblist.no }">수정</a></label></th>
									<th class="group-input"><label><a href="delete.bd?no=${mblist.no }">삭제</a></label></th>
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
<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<table width="900px" class="sectable" border="1">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>제목</label></th>
								<th class="group-input"><label>카테고리</label></th>
								<th class="group-input"><label>댓글 내용</label></th>
								<th class="group-input"><label>등록일</label></th>
								<th class="group-input"><label>삭제</label></th>
								<th class="group-input"><label>수정</label></th>
							</tr>

							<c:forEach var="mbrlist" items="${mbrlists }">
								<tr align="center">
									<th class="group-input"><label>${mbrlist.no } </label></th>
									<th class="group-input"><label>${mbrlist.subject } </label></th>
									<th class="group-input"><label>${mbrlist.category } </label></th>
									<th class="group-input"><label>${mbrlist.contents } </label></th>
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

<br><br>

<%@ include file="./../../WEB-INF/common/main_bottom.jsp"%> 
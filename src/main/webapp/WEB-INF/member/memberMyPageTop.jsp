<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/main_top.jsp"%>
<%@ include file="./../common/common.jsp"%>

MMyPageController -> memberMyPage.jsp
<br>
<br>

<style>
.box {
	width: 280px;
	height: 280px;
	border-radius: 50%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>

<script type="text/javascript">
	/* $(function() {
		$("#member").on("click", function() {
			$("#content").load("여기다서 나올까 ");
		});
	}); */
	/* 
	 ${'#member'}.on('click',function(){
	
	 $.ajax({
	 url : "memberList.mb",
	 type : "GET",
	 data : form,
	 sussess : function(data){
	 $('#content').html(data);
	 },
	 error : function(){
	 alert("이건 안돼 ");
	 }
	
	 });
	
	 }); */
</script>


<h3>나의 당근</h3>


<tr>
	<table width="80%" border="1" align="center">
		<tr rowspan="3" height="300">
			<td colspan="2" align="center">
				<div class="box">
					<a href="memberUpdate.mb"> <img class="profile"
						src="<%=request.getContextPath()%>/resources/member/${profileImage}">
					</a>
				</div>
			</td>
			<td colspan="6"><a href="memberUpdate.mb"> 프로필 수정 </a></td>
		</tr>

		<tr >
			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active"  href="#tab-1">My Sale</a></li>
				</ul>
			</td>
			
			<td class="tab-item" width="16%" >
				<ul class="nav" role="tablist">
					<li><a class="active" href="#tab-1" >My Purchase</a></li>
				</ul>
			</td>
			
			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active" href="#tab-1" >My Town</a></li>
				</ul>
			</td>
			
			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active"  href="#tab-1" >My Like</a></li>
				</ul>
			</td>
			
			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active"  href="like.prd" >My QNA</a></li>
				</ul>
			</td>
		
			<c:if test="${memAuth == 0 }">
				<td class="tab-item">
				<ul class="nav" role="tablist">
					<li><a class="active"  href="QnA.jsp" >Category</a></li>
				</ul>
			</td>
			
			<td class="tab-item">
				<ul class="nav" role="tablist">
					<li><a class="active"  href="notice.jsp" >Notice</a></li>
				</ul>
			</td>
			
			<td class="tab-item">
				<ul class="nav" role="tablist">
					<li><a class="active" href="memberList.mb">Member</a></li>
				</ul>
			</td>
			</c:if>
		
		
		<tr>		




		<!-- 		<tr>
			<td align="center"><a href="">판매내역</a></td>
			<td align="center"><a href="purchaseList.prd">구매내역</a></td>
			<td align="center"><a href="">동네생활(글/댓글)</a></td>
			<td align="center"><a href="like.prd">관심 목록</a></td>
			<td align="center"><a href="QnA.jsp">QNA</a></td>
			<td align="center"><a href="Category.jsp">카테고리 관리</a></td>
			<td align="center"><a href="notice.jsp">공지사항 관리</a></td>
			<td align="center"><a href="memberList.mb">회원관리</a></td> 
		</tr> -->
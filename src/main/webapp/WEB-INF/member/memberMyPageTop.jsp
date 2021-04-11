<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/main_top.jsp"%>
<%@ include file="./../common/common.jsp"%>


<style>
.box {
	width: 250px;
	height: 250px;
	border-radius: 50%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>


<!-- <script>
	$(document).ready(function(){
		$('#mySale').click(function(){
			alert("버튼누름");
			
			$.ajax({
				type : "GET",
				url : "productMySaleList.jsp",
				dataType: "json",
				success : function test(data){
					$("#content").html(a);
					},
				error : function error(){alert("error발생");}
			});
			
			
		});
		
		
	});

</script> -->





<br>
<center>
	<h2>나의 당근(MY PAGE)</h2>
</center>
<br>

<tr>
	<table width="70%" border="1" align="center">
		<tr rowspan="3" height="300">
			<td colspan="2" align="center">
				<div class="box">

					<c:if test="${loginInfo.image != null}">
						<a href="memberUpdate.mb"> <img class="profile"
							src="<%=request.getContextPath()%>/resources/members/${loginInfo.image}">
						</a>
					</c:if>

					<c:if test="${loginInfo.image == null}">
						<a href="memberUpdate.mb"> <img class="profile"
							src="<%=request.getContextPath()%>/resources/img.jpg">
						</a>
					</c:if>
				</div>
			</td>
			<td colspan="6"><a href="memberUpdate.mb"> 프로필 수정 </a></td>
		</tr>

		<tr>
			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active" href="mySaleList.prd">My Sale</a></li>
				</ul>
			</td>

			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active" href="myPurchaselist.prd">My
							Purchase</a></li>
				</ul>
			</td>

			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active" href="MyTown.jsp">My Town</a></li>
				</ul>
			</td>

			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active" href="mylikeList.prd">My Like</a></li>
				</ul>
			</td>

			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active" href="FAQ.jsp">FAQ</a></li>
				</ul>
			</td>

			<c:if test="${loginInfo.authority == 0 }">
				<td class="tab-item">
					<ul class="nav" role="tablist">
						<li><a class="active" href="Category.jsp">Category</a></li>
					</ul>
				</td>

				<td class="tab-item">
					<ul class="nav" role="tablist">
						<li><a class="active" href="memberList.mb">Member</a></li>
					</ul>
				</td>
			</c:if>

		</tr>
		
		<tr>
			<td colspan="8">
				<div id="content"></div>
			
			</td>
		</tr>
		
		
	</table>
</tr>





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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/main_top.jsp"%>
<%@ include file="./../common/common.jsp"%>


<style>

.cate_tr{
	width: 90%;
}
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
<script>
var rukakao = ${loginInfo.sitestatus};
function updateMember() {
	if(rukakao==1){
		alert("카카오 이용자는 카카오를 통해 회원정보를 변경해 주시기 바랍니다");
	}	
}
</script>
<br><br><br>
<center>
	<div class="section-title">
                        <h2>나의 당근(MY PAGE)</h2>
                    </div>

</center>
<br>


	<table width="70%"  align="center">
		<tr rowspan="3" height="300">
			<td colspan="2" align="center">
				<div class="box">

					<c:if test="${loginInfo.image != null}">
						<a href="memberUpdate.mb"> 
						<c:if test="${loginInfo.sitestatus==0 }">
						<img class="profile"
							src="<%=request.getContextPath()%>/resources/members/${loginInfo.image}">
						</c:if>
						<c:if test="${loginInfo.sitestatus==1 }">
						<img class="profile"
							src="${loginInfo.image}">
						</c:if>
						</a>
					</c:if>

					<c:if test="${loginInfo.image == null}">
						<a href="memberUpdate.mb"> <img class="profile" onclick="updateMember()"
							src="<%=request.getContextPath()%>/resources/img.jpg">
						</a>
					</c:if>
				</div>
				<br><br><br><br>
			</td>
			<td colspan="6">
                 <div class="cart-buttons" align="left" style="margin-left: 30px">
                        <a href="memberUpdate.mb" class="primary-btn up-cart" onclick="updateMember()">프로필 수정하기 </a>
				<br><br><br>
				 <h4><b>${loginInfo.id}</b>님 ${loginKakao}</h4><br>
				  ${loginInfo.address }<br><br>
				  </div>
			</td>
		</tr>

		<tr class="cate_tr">
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
					<li><a class="active" href="myBoard.bd">My Town</a></li>
				</ul>
			</td>

			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active" href="mylikeList.prd">My Like</a></li>
				</ul>
			</td>

			<td class="tab-item" width="16%">
				<ul class="nav" role="tablist">
					<li><a class="active" href="FAQ.jsp">FAQ &nbsp;&nbsp;</a></li>
				</ul>
			</td>

			<c:if test="${loginInfo.authority == 0 }">
				<td class="tab-item">
					<ul class="nav" role="tablist">
						<li><a class="active" href="categoryList.ct">Category &nbsp;</a></li>
					</ul>
				</td>

				<td class="tab-item">
					<ul class="nav" role="tablist">
						<li><a class="active" href="memberList.mb">Member &nbsp;</a></li>
					</ul>
				</td>
			</c:if>

		</tr>
		
		<tr>
		<td colspan="8">
	


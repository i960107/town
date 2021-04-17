<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%-- <%@include file="./../common/main_top.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sbean.id } 거래 채팅</title>



<style>
	.div-style{
		width: auto;
		height: auto;
		border: 5px solid #FFC19E;
		border-radius: 10%;
		align-content: center;		
	}
	img{
		margin-left: auto;
		margin-right: auto;
		display: block;
	}
	.chat-div{
		width: auto;
		height: auto;
	}
	.div-saleInfo{
		width: 65px;
		height:  auto;
		border: 2px solid #4641D9;
		background-color : #4641D9;
		font-size:11pt;
		color : #FFFFFF;
		border-radius: 10%;
		align-content: center;	
		margin-bottom: 50;
	}

</style>


<script type="text/javascript">
	function updateDealStatus(){
		alert("딜수정해");
		alert("상품번호:"+ ${pno }+","+"거래상태"+${pbean.dealstatus});
		location.href="updateDeal.prd?no="+${pno }+"&deal="+${pbean.dealstatus};
	}
	
	function saleCompleted(){
		alert("이미 판매완료 된 상품입니다.");
	}
	
</script>

</head>
<body>


<br>
<img src="<%=request.getContextPath()%>/resources/img/logo.png" >
<br>
<div class="div-style">
<table align="center">
	<tr>
		<td>
		
			<div class="chat-div">
			<c:forEach var="chat" items="${clist }">
			<c:if test="${login==chat.talker }">
			<p align="right" >${chat.contents }</p>
			</c:if>
			<c:if test="${login!=chat.talker }">
			<p align="left" >${chat.contents }</p>
			</c:if>
			</c:forEach>
			</div>
			
		</td>
	</tr>
</table>
<form action="reply.prd" method="post" name="myform">
	<input type="hidden" name="sellerid" value="${sbean.id }">
	<input type="hidden" name="buyerid" value="${bbean.id }">
	<input type="hidden" name="pno" value="${pno }">
	<input type="hidden" name="room" value="${room }">
	<input type="hidden" name="subject" value="${pbean.subject }">
	<input type="hidden" name="talker" value="${login }">
	<table align="center">
	<tr>
	<td>
	<textarea rows="4" cols="50" name="contents" ></textarea></td>
	<td>
		<!-- 판매자 -->
		<c:if test="${sbean.id eq login && pbean.dealstatus == 1 }">
		<input type="button" value="거래완료" onclick="updateDealStatus()"><br><br>
		</c:if>
		
		<c:if test="${sbean.id eq login && pbean.dealstatus == 0 }">
		<input type="button" value="판매완료" onclick="saleCompleted()"><br><br>
		</c:if>
		
		<!-- 거래자 -->
		<c:if test="${sbean.id ne login && pbean.dealstatus == 0 }">
		<div class="div-saleInfo"><b>구매완료</b>	</div><br>
		</c:if>
	

		<input type="submit" value="전송">
	</td>
	</tr>
	<tr align="center">
	<td colspan="2" > 
		<br>
		<c:if test="${sbean.id ne login && pbean.dealstatus == 0 }">
		<input type="button" value="구매 리뷰 등록" onclick="review()">
		</c:if>
		<input type="button" onclick="self.close()" value="대화창 닫기" >
	
	</td>
	</tr>
	</table>
		<br>
</form>
</div>

<!-- 거래후기 남기기 -->





</body>
<%-- <%@include file="./../common/main_bottom.jsp" %> --%>
</html>
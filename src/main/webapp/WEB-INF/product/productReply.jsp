<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%-- <%@include file="./../common/main_top.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${sbean.id } 거래 채팅</title>

    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
  

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
</head>

<style type="text/css">
.rating-form {
	margin-top: 40px;
}

	/* RATING - Form - Group */
	.rating-form .form-group {
    position: relative;
    border: 0;
	}

	/* RATING - Form - Legend */
	.rating-form .form-legend {
		display: none;
		margin: 0;
		padding: 0;
		font-size: 20px; font-size: 2rem;
		/*background: green;*/
	}

	/* RATING - Form - Item */
	.rating-form .form-item {
		position: relative;
		margin: auto;
		width: 30%;
		text-align: center;
		direction: rtl;
		/*background: green;*/
	}

	.rating-form .form-legend + .form-item {
		padding-top: 10px;
	}

		.rating-form input[type='radio'] {
			position: absolute;
			left: -9999px;
		}

	  /* RATING - Form - Label */
	  .rating-form label {
		display: inline-block;
		cursor: pointer;
	  }

		.rating-form .rating-star {
       display: inline-block;
			position: relative;
		}

	.rating-form input[type='radio'] + label:before {
		content: attr(data-value);
		position: absolute;
		right: 1rem; top: 2rem;
		bottom: 20px;
		font-size: 10px; font-size: 1rem;
		opacity: 0;
		direction: ltr;
		.transition();
	}

	.rating-form input[type='radio']:checked + label:before {
		right: 25px;
		opacity: 1;
	}

/* 	.rating-form input[type='radio'] + label:after {
		content: "/ 5";
		position: absolute;
		right: 5px; top: 96px;
		font-size: 10px; font-size: 1.6rem;
		opacity: 0;
		direction: ltr;
		.transition();
	} */

	.rating-form input[type='radio']:checked + label:after {
		/*right: 5px;*/
		opacity: 1;
	}

		.rating-form label .fa {
		  font-size: 10px; font-size: 1rem;
		  line-height: 30px;
		  .transition();
		}

		.rating-form label .fa-star-o {

		}

		.rating-form label:hover .fa-star-o,
		.rating-form label:focus .fa-star-o,
		.rating-form label:hover ~ label .fa-star-o,
		.rating-form label:focus ~ label .fa-star-o,
		.rating-form input[type='radio']:checked ~ label .fa-star-o {
		  opacity: 0;
		}

		.rating-form label .fa-star {
		  position: absolute;
		  left: 0; top: 0;
		  opacity: 0;
		}

		.rating-form label:hover .fa-star,
		.rating-form label:focus .fa-star,
		.rating-form label:hover ~ label .fa-star,
		.rating-form label:focus ~ label .fa-star,
		.rating-form input[type='radio']:checked ~ label .fa-star {
		  opacity: 1;
		}

		.rating-form input[type='radio']:checked ~ label .fa-star {
		  color: gold;
		}

		.rating-form .ir {
		  position: absolute;
		  left: -9999px;
		}

	/* RATING - Form - Action */
	.rating-form .form-action {
		opacity: 0;
		position: absolute;
		left: 5px; bottom: -40px;
		.transition();
	}

	.rating-form input[type='radio']:checked ~ .form-action {
	  cursor: pointer;
	  opacity: 1;
	}

	.rating-form .btn-reset {
		display: inline-block;
		margin: 0;
		font-size: 1rem; font-size: 1rem;
		background: #fff;
		color: #333;
		cursor: auto;
		border-radius: 5px;
		outline: 0;
		.transition();
	}

	   .rating-form .btn-reset:hover,
	   .rating-form .btn-reset:focus {
		 background: gold;
	   }

	   .rating-form input[type='radio']:checked ~ .form-action .btn-reset {
		 cursor: pointer;
	   }


	/* RATING - Form - Output */
	.rating-form .form-output {
		display: none;
		position: absolute;
		right: 15px; bottom: -45px;
		font-size: 30px; font-size: 3rem;
		opacity: 0;
		.transition();
	}

	.no-js .rating-form .form-output {
		right: 5px;
		opacity: 1;
	}

	.rating-form input[type='radio']:checked ~ .form-output {
		right: 5px;
		opacity: 1;
	}
	    .profile {
	    width: 110px;
	    height: 110px;
	    object-fit: cover;
	}
	.box {
	    width: 100px;
	    height: 100px;
	    border-radius: 40%;
	    overflow: hidden;
	}
.textarea-review {
	width: 70%;
	height: 30%;
	padding: 15px;
	box-sizing: border-box;
	border: solid 2px orange;
	border-radius: 7px;
	font-size: 10pt;
	resize: none;
}
</style>


<style>
	.div-style{
		width: 100%;
		height: 90%;
		border: 5px solid #FFC19E;
		border-radius: 10%;
		align-content: center;		
		overflow: scroll;
	}
	img{
		margin-left: auto;
		margin-right: auto;
		display: block;
	}
	.chat-div{
		width: auto;
		height: auto;
		/* overflow: scroll; */
	}
	.div-saleInfo{
		width: 75px;
		height:  auto;
		border: 2px solid #4641D9;
		background-color : #4641D9;
		font-size:11pt;
		color : #FFFFFF;
		border-radius: 10%;
		align-content: center;	
		margin-bottom: 50;
	}
	.chatArea{
	width: 350px;
	border-radius: 8px;
	}

</style>


<script type="text/javascript">
	function updateDealStatus(sellerid,buyerid){
		location.href="updateDeal.prd?no="+${pno}+"&deal="+${pbean.dealstatus}
					+"&sellerid="+sellerid+"&buyerid="+buyerid;
						
	}
	
	function saleCompleted(){
		alert("이미 판매완료 된 상품입니다.");
	}
	function goDetail() {
		var no = "<c:out value="${sbean.id }"/>";
		var id = "<c:out value="${pbean.no }"/>";
		window.opener.location.href="detail.prd?no=${pbean.no }&sellerid=${sbean.id }";
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
			<p style="opacity: 0.9; background-color: #DADADA" class="chatArea" align="right" ><span style="opacity: 1.0; font-weight: bold;">${chat.contents }</span></p>
			</c:if>
			<c:if test="${login!=chat.talker }">
			<p style="opacity: 0.9; background-color: #E5EFFF" class="chatArea" align="left" ><span style="opacity: 1.0; font-weight: bold;">${chat.contents }</span></p>
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
	<textarea rows="4" cols="50" name="contents" style="border: #FFC19E solid 2px"></textarea></td>
	<td>
		<!-- 판매자 -->
		<c:if test="${sbean.id eq login && pbean.dealstatus == 1 }">
		<input type="button" value="거래완료" onclick="updateDealStatus('${sbean.id }','${bbean.id }')"><br><br>
		</c:if>
		
		<c:if test="${sbean.id eq login && pbean.dealstatus == 0 }">
		<div class="div-saleInfo" onclick="saleCompleted()"><b>판매 완료</b>	</div><br>
		</c:if>
		
		<!-- 거래자 -->
		<c:if test="${sbean.id ne login && pbean.dealstatus == 1}">
		<div class="div-saleInfo"><b>구매 가능</b>	</div><br>
		</c:if>
		
		<c:if test="${sbean.id ne login && pbean.dealstatus == 0}">
		<div class="div-saleInfo"><b>구매 완료</b>	</div><br>
		</c:if>
	

		<input class="btn btn-warning" type="submit" value="전송">
	</td>
	</tr>
	<tr align="center">
	<td colspan="2" > 
		<br>
		<c:if test="${sbean.id ne login && pbean.dealstatus == 0 }">
		<button type="button" value="구매 리뷰 등록" data-toggle="modal"
		data-target="#myModal"> 구매리뷰 등록 </button>
		</c:if>
		<input type="button" onclick="goDetail()" value="상품보기" class="btn btn-warning">
		<input type="button" onclick="self.close()" value="대화닫기" class="btn btn-warning">
	
	</td>
	</tr>
	</table>
		<br>
</form>
</div>

<!-- 거래후기 남기기 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">거래후기 남기기</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div id="rating-form" align="center">
						<form class="rating-form" action="tradeReview.mb" method="post"
							name="rating-movie">
							<h6>${sbean.id }님과의거래는어떠셨나요?</h6>
							<input type="hidden" value="1" name="productNo"> <input
								type="hidden" value="${sbean.id}" name="sellerId"> <input
								type="hidden" value="${loginInfo.id}" name="buyerId">
							<fieldset class="form-group">
								<div class="form-item">
									<input id="rating-5" name="rating" type="radio" value="5" /> <label
										for="rating-5" data-value="최고예요!"> <span
										class="rating-star"> <i class="fa fa-star-o"></i> <i
											class="fa fa-star"></i>
									</span> <span class="ir">5</span>
									</label> <input id="rating-4" name="rating" type="radio" value="4" />
									<label for="rating-4" data-value="좋아요!"> <span
										class="rating-star"> <i class="fa fa-star-o"></i> <i
											class="fa fa-star"></i>
									</span> <span class="ir">4</span>
									</label> <input id="rating-3" name="rating" type="radio" value="3" />
									<label for="rating-3" data-value="그저그래요!"> <span
										class="rating-star"> <i class="fa fa-star-o"></i> <i
											class="fa fa-star"></i>
									</span> <span class="ir">3</span>
									</label> <input id="rating-2" name="rating" type="radio" value="2" />
									<label for="rating-2" data-value="별로예요!"> <span
										class="rating-star"> <i class="fa fa-star-o"></i> <i
											class="fa fa-star"></i>
									</span> <span class="ir">2</span>
									</label> <input id="rating-1" name="rating" type="radio" value="1" />
									<label for="rating-1" data-value="최악이예요!"> <span
										class="rating-star"> <i class="fa fa-star-o"></i> <i
											class="fa fa-star"></i>
									</span> <span class="ir">1</span>
									</label>
									
								</div>
							</fieldset>
							<div>
								<textarea name="contents" class="textarea-review"></textarea>
							</div>
							<input type="submit" value="구매리뷰 등록" />
						</form>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>




</body>
   <!-- Js Plugins -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.countdown.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.zoom.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.dd.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>



<%-- <%@include file="./../common/main_bottom.jsp" %> --%>
</html>
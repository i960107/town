<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- PDetailViewControlelr > 
상품 자세히 보기 페이지
 -->
<title>상품 보기</title>
<c:set var="val" value="0" />
<c:set var="limit" value="${fn:length(fileList) }" />
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
textarea {
	width: 70%;
	height: 30%;
	padding: 30px;
	box-sizing: border-box;
	border: solid 2px orange;
	border-radius: 7px;
	font-size: 1.2rem;
	resize: none;
}
</style>
<script type="text/javascript" src="<%=source%>/resources/js/jquery.js"></script>

<script type="text/javascript">
	/* 좋아요 싫어요 함수 호출 */
	function prdLike() {
		location.href = "like.prd?no=${pBean.no}";
	}
	function prdUnLike(liker) {
		location.href = "unlike.prd?no=${pBean.no}&like=" + liker;
	}
</script>
<%@include file="prdStyle.jsp"%>
<%
	String loginId = "";
	if (loginInfo != null) {
		loginId = loginInfo.getId();
	}
%>
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<!-- 상품정보 -->
				<td><img alt="" src="<%=source%>resources/${pBean.image1}"
					height="360" width="300"></td>
				<td>
					<table>
						<tr height="72">
							<td colspan="3"><span class="subject">${pBean.subject }</span></td>
						</tr>
						<tr height="72">
							<td colspan="3"><span class="price"> <fmt:formatNumber
										pattern="###,###">${pBean.price }</fmt:formatNumber> 원
							</span> <br>
								<hr></td>
						</tr>
						<tr height="72">
							<!-- 조회수 / 등록일 / 신고 -->
							<td width="120"><span class="mcontent">&#128065;
									${pBean.readcount }</span></td>
							<td width="120"><span class="mcontent">${pBean.regdate }</span></td>
							<td width="120"><a href="report.mb"><span
									class="mcontent">신고하기</span></a></td>
						</tr>
						<tr height="72">
							<td colspan="3" valign="top"><span class="mcontent">거래지역</span>
								<span
								style="font-size: 15px; font-weight: bold; color: #A0A0A0;">:
									${pBean.address1 } ${pBean.address2 }</span></td>
						</tr>
						<tr height="72">

							<!------------- 좋아요 싫어요 하트 색 / 유동 함수 -------------->
							<td><c:set var="loginId"><%=loginId%></c:set> <c:set
									var="heart" value="&#10084;" /> <c:set var="likecondition"
									value="prdLike()" /> <c:forEach var="i" items="${likeList }">
									<c:if test="${loginId==i.userid }">
										<c:set var="heart">&#128151; </c:set>
										<c:set value="${i.no }" var="likeNo" />
										<c:set var="likecondition" value="prdUnLike(${likeNo })" />
									</c:if>
								</c:forEach> <input type="button" name="like" value="${heart } 찜 ${likeCnt}"
								onclick="${likecondition}" class="btn_img_like" id="btn_like">
							</td>
							<!------------- 좋아요 싫어요 하트 색 / 유동 함수 -------------->


							<td>
								<!-- 판매자 = 수정하기 / 구매자 = 연락하기 --> <c:set var="btnType">연락하기</c:set>
								<c:set var="scriptType">chat()</c:set> <c:if
									test="${loginId==pBean.sellerid }">
									<c:set var="btnType">수정하기</c:set>
									<c:set var="scriptType">updateProduct()</c:set>
								</c:if> <input type="button" value="${btnType }"
								onclick="${scriptType}" class="btn_img_nomal">
							</td>
							<td></td>
						</tr>

					</table>

				</td>
			</tr>
		</table>


		<table>
			<tr>
				<!-- 회원 정보 -->
				<td><a href="tradeDetail.mb?sellerid=${mbean.id }"> 
				<div class="box">
				<img alt="" src="<%=source%>resources/members/${mbean.image}" width="70" height="70" class="profile">
				</a>
				</div>
				</td>
				<td valign="top"><a href="tradeDetail.mb?sellerid=${sellerid}"><span
						style="font-size: 14px; color: #101010; font-weight: bold;">${sellerid }</span>
				</a></td>
			</tr>
		</table>


		<!-- 상품 내용 -->
		<table>
			<tr>
				<td width="400" valign="top" height="370">
					<hr> <span>${pBean.contents }</span>
				</td>
				<td height="370"><c:forEach var="i" items="${fileList }">
						<c:set var="val" value="${val+1 }" />
						<a><img alt="" src="<%=source%>resources/${i.filename }"
							class="imgsize"></a>
						<c:if test="${val%2==0 }">
							<br>
						</c:if>
					</c:forEach></td>
			</tr>
		</table>
	</div>
	<!-- 거래후기 -->
	<!-- Button trigger modal no=1 id=sellerid=kim-->
	<button type="button" class="btn btn-default" data-toggle="modal"
		data-target="#myModal">거래후기 남기기</button>

	<!-- Modal -->
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
							<h6>${pBean.sellerid}님과의거래는어떠셨나요?</h6>
							<input type="hidden" value="1" name="productNo"> <input
								type="hidden" value="kim" name="sellerId"> <input
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
								<textarea name="contents"></textarea>
							</div>
							<input type="submit" value="거래후기 제출" />
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
</html>

<%@ include file="./../common/main_bottom.jsp"%>
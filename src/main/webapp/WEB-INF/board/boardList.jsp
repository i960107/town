<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="./../common/main_top.jsp" %>
<%@include file="../common/common.jsp"%>

<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>당근마켓</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet" />
<<<<<<< HEAD
<link rel="stylesheet">
=======
	
>>>>>>> ad326e8482c745f0e139cad1d6f823f69bad6d6c
</head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js">
	$(function() {
		alert(1);
		$("#contents").show();
		/* 	$("#load").click(function(e){
		 e.preventDefault();
		 $("#contents:hidden").show();
		 if($("#contents:hidden").length==0){
		 alert("컨텐츠 마지막");
		 }
		 }) */

	})
</script>

<!-- Portfolio Grid-->
<section class="page-section bg-light" id="portfolio">
	<div class="container">
		<div class="text-center">
			<h2 class="section-heading text-uppercase">동네생활</h2>
			<h3 class="section-subheading text-muted">우리 동네의 다양한 이야기를 이웃과 함께
				나누어요.</h3>
		</div>
			<form method="post" actoin="list.bd">
		<div class="row" style="background-color: cyan; width: 100%">
			<c:forEach begin="0" end="5">
				<div class="col-md-2">
					<input type="checkbox" name="category" value="선택">선택
				</div>
			</c:forEach>
			<div>
		</div>
			결과 내 재검색 <input type="text" name="keyword"> 
			<input type="submit" value="검색">
			</div>
			</form>
		<div class="row">
			<table class="table">
				<tr>
					<th>
						<button type="button" class="btn btn-warning" onClick="location.href='insert.bd'">글쓰기</button>
						<select name="address2" style="float: right">
							<option>동을 선택</option>
					</select> <select name="address1" style="float: right">
							<option>시를 선택</option>
					</select>
					</th>
				</tr>
				<tr>
					<td style="background-color: orange" align="center">
						<div class="col-lg-3 col-sm-3 mb-4" style="float: left">
							<div class="portfolio-item">
								<a class="portfolio-link" data-toggle="modal"
									href="#portfolioModal1">
									<div class="portfolio-hover">
										<div class="portfolio-hover-content">
											<i class="fas fa-plus fa-3x"></i>
										</div>
									</div>
							</div>

							<img class="img-fluid"
								src="${pageContext.request.contextPath}/resources/assets/img/portfolio/01-thumbnail.jpg"
								alt="" /> </a>
							<div class="portfolio-caption">
								<table width="100%">
									<tr>
										<td align="left"><img src="..." class="img-circle"
											width=50 height=50>아이디</td>
										<td align="right">10분전</td>
									</tr>
									<tr>
										<td colspan=2>
		<input type="button" value="공감하기" onClick="location.href='like.bd'">
											</td>
									</tr>
									<tr>
										<td colspan=2>
											<form action="insert.bd" method="post">
												<input type="hidden" name="writer" value="">
												<textarea rows="3" cols="100" name="contents"
													style="float: left">내용</textarea>
												<button type="submit" 
													style="float: right">댓글쓰기</button>
											</form>
										</td>
									</tr>
								</table>

							</div>

						</div>
						</div>
						<div style="float: left; background-color: blue">
							<div id="contents" style="display: none">요기는 내용 입니다. 요기는 내용
								입니다.요기는 내용 입니다.요기는 내용 입니다.</div>
							<a href="#" id="load">더 보기</a>
						</div>
					</td>

				</tr>
			</table>

		</div>
	</div>
</section>


<!-- Portfolio Modals-->
<div class="portfolio-modal modal fade" id="portfolioModal1"
	tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<img src="assets/img/close-icon.svg" alt="Close modal" />
			</div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="modal-body">
							<!-- Project Details Go Here-->
							<h2 class="text-uppercase">Project Name</h2>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet
								consectetur.</p>
							<img class="img-fluid d-block mx-auto"
								src="assets/img/portfolio/01-full.jpg" alt="" />
							<p>Use this area to describe your project. Lorem ipsum dolor
								sit amet, consectetur adipisicing elit. Est blanditiis dolorem
								culpa incidunt minus dignissimos deserunt repellat aperiam quasi
								sunt officia expedita beatae cupiditate, maiores repudiandae,
								nostrum, reiciendis facere nemo!</p>
							<ul class="list-inline">
								<li>Date: January 2020</li>
								<li>Client: Threads</li>
								<li>Category: Illustration</li>
							</ul>
							<button class="btn btn-primary" data-dismiss="modal"
								type="button">
								<i class="fas fa-times mr-1"></i> Close Project
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Bootstrap core JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Contact form JS-->
<script
	src="<%=request.getContextPath()%>/resources/assets/mail/jqBootstrapValidation.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/assets/mail/contact_me.js"></script>
<!-- Core theme JS-->
</body>
</html>

<%@ include file="./../common/main_bottom.jsp" %>
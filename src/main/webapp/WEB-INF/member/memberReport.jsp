<%@page import="member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>신고하기</title>

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
<body>

<style>
	.faqfont {
		font-size: 9pt;
		font-family: "Muli", sans-serif;
		margin-left: 2em;
	}
	.faqcontent {
		font-size: 10pt;
		font-family: "Muli", sans-serif;
		margin-left: 2em;
		font-weight: bold;
	}
</style>

<script type="text/javascript">
	// 라디오버튼 체크하지 않았을 경우
	function check(){
		if( $('input[type=radio][name=report]:checked').length == 0 ) {
		    alert("신고 사유를 선택해주세요");
		    return false;
		}
	}
	
</script>

<h2><b> 사용자 신고하기</b></h2>

	<!-- Faq Section Begin -->
    <div class="faq-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="faq-accordin">
                        <div class="accordion" id="accordionExample">
                        <form action="report.mb" name="myform" method="post" onsubmit="return check()">
                         	
                  			<!-- 판매자=신고당한사람 hidden으로 챙겨서 넘겨주기 -->
                         	<input type="hidden" name="reporteduserid" value="${reporteduserid}">
                            
                            <div class="card">
                                <div class="card-heading active">
                                    <a class="active" data-toggle="collapse" data-target="#collapseOne">
                                     	판매 금지 품목
                                    </a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <p>
                                        	<input type="radio" name="report" value="가품(위조품/이미테이션)"> 가품(위조품/이미테이션) <br>
                                        	<input type="radio" name="report" value="개인정보 거래(SNS계정, 인증번호 등)"> 개인정보 거래(SNS계정, 인증번호 등) <br>
                                        	<input type="radio" name="report" value="게임계정/아이템/대리육성"> 게임계정/아이템/대리육성 <br>
                                        	<input type="radio" name="report" value="반려동물(분양/입양 글)"> 반려동물(분양/입양 글) <br>
                                        	<input type="radio" name="report" value="음란물/성인용품(중고속옷 포함)"> 음란물/성인용품(중고속옷 포함) <br>
                                        	<input type="radio" name="report" value="의약품/의료기기"> 의약품/의료기기 <br>
                                        	<input type="radio" name="report" value="조건부 무료나눔"> 조건부 무료나눔 <br>
                                        	<input type="radio" name="report" value="담배/주류"> 담배/주류 <br>
                                        	<input type="radio" name="report" value="욕설"> 욕설 <br>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            
                           <div class="card">
                                <div class="card-heading active">
                                    <a class="active" data-toggle="collapse" data-target="#collapseTwo">
                                     	비매너 사용자
                                    </a>
                                </div>
                                <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <p>
                                      		<input type="radio" name="report" value="욕설"> 욕설&nbsp;&nbsp;
                                      		<input type="radio" name="report" value="성희롱"> 성희롱&nbsp;&nbsp;
                                      		<input type="radio" name="report" value="차별/혐오 표현 사용"> 차별/혐오 표현 사용 <br>
                                      		<input type="radio" name="report" value="특정 이웃 비방"> 특정 이웃 비방&nbsp;&nbsp;
                                      		<input type="radio" name="report" value="특정 업체 비방"> 특정 업체 비방&nbsp;&nbsp;
                                        </p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="card">
                                <div class="card-heading active">
                                    <a class="active" data-toggle="collapse" data-target="#collapseThree">
                                     	부적절한 글
                                    </a>
                                </div>
                                <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <p>
                                        	<input type="radio" name="report" value="광고/홍보"> 광고/홍보&nbsp;&nbsp;
                                        	<input type="radio" name="report" value="금전/물품 요구"> 금전/물품 요구&nbsp;&nbsp;
                                        	<input type="radio" name="report" value="반려동물(분양/입양 글)"> 반려동물(분양/입양 글) <br>
                                        	<input type="radio" name="report" value="의약품/의료기기 판매"> 의약품/의료기기 판매&nbsp;&nbsp;
                                        	<input type="radio" name="report" value="음란성"> 음란성&nbsp;&nbsp;
                                        	<input type="radio" name="report" value="술모임 모집"> 술모임 모집&nbsp;&nbsp;
                                        	<input type="radio" name="report" value="내용없는 글"> 내용없는 글&nbsp;&nbsp;
                                    </div>
                                </div>
                            </div>
                            
                            <div class="card">
                                <div class="card-heading active">
                                    <a class="active" data-toggle="collapse" data-target="#collapseFour">
                                     	사기 사용자
                                    </a>
                                </div>
                                <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <p>
											<input type="radio" name="report" value="카카오톡/안전결제 등으로 유도"> 카카오톡/안전결제 등으로 유도
                             			</p>
                                    </div>
                                </div>
                            </div>  
                            
                            <div class="card">
                                <div class="card-heading active">
                                    <a class="active" data-toggle="collapse" data-target="#collapseFive">
                                     	기타 사유
                                    </a>
                                </div>
                                <div id="collapseFive" class="collapse" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <p> 
                                        	<input type="radio" name="report" value="기타사유입력"> 기타사유입력
                             			</p>
                                    </div>
                                </div>
                            </div> 
                            
                            	<textarea  class="input-group" rows="3" cols="20" name="contents" placeholder="신고 내용을 적어주세요." style="resize: none;"></textarea>
                            	<input type="submit" value="신고하기">    
                                                  
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Faq Section End -->

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

</body>
</html>



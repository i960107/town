<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>main</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
</head>
<body>


	<%
	String login = request.getContextPath() + "/memberlogin.mb"; // 로그인
	String join = request.getContextPath() + "/memberJoin.mb"; // 회원가입
	String myPage = request.getContextPath() + "/myPage.mb"; // 나의당근
	String viewMain = request.getContextPath() + "/main.mk"; // 메인페이지
	String saleList = request.getContextPath() + "/saleList.prd"; // 중고거래
	String boardList = request.getContextPath() + "/list.bd"; // 동네생활
	String productWrite = request.getContextPath() + "/pWrite.prd"; // 글쓰기
	%>
	
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
	<!-- 로그인 영역 시작 -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
            	<div class="ht-right">
                    <!-- <a href="#" class="login-panel"><i class="fa fa-user"></i>Login</a> -->
                    <div class="lan-selector">
                        <a href="<%=myPage %>" class="login-panel">나의당근</a>
                    </div>
                    <div class="top-social">
                        <a href="<%=join %>" class="login-panel">회원가입</a>
                    	<a href="<%=login %>" class="login-panel"><i class="fa fa-user"></i>Login</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 로그인 영역 끝 -->
        
        <!-- 카테고리 영역 시작 -->
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="<%=viewMain %>">
                                <img src="<%=request.getContextPath()%>/resources/img/logo.png" alt="logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                        	<select name="whatColumn" class="category-btn">
                        		<option value="all">전체 검색
                        		<option value="subject">제목 검색
                        		<option value="contents">내용 검색
                        	</select>
                            <div class="input-group">
                                <input type="text" name="keyword" placeholder="검색어를 입력하세요.">
                                <button type="button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
				</div>
			</div>
		</div>
        
       <div class="nav-item">
			<!-- <div class="container"> -->
			<div class="row">
				<div class="col-lg-12">
					<nav class="nav-menu mobile-menu">
						<ul>
							<li class="active"><a href="<%=viewMain %>">Home</a></li>
							<!-- <li> 
								<div class="col-lg-7 col-md-7">
									<div class="advanced-search">
										<button type="button" class="category-btn">All Categories</button>
									<div class="input-group">
										<input type="text" placeholder="What do you need?">
										<button type="button"><i class="ti-search"></i></button>
									</div>
									</div>
								</div>
							</li>  -->
							<li><a href="<%=saleList %>">중고거래</a></li>
							<li><a href="<%=boardList %>">동네생활</a></li>
							<li><a href="<%=productWrite %>">글쓰기</a></li>
							<li><a href="">채팅</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- </div> -->
		</div>
		<!-- 카테고리 영역 끝 -->
    </header>
    <!-- Header End -->

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



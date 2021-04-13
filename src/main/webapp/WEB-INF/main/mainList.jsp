<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="./../common/main_top.jsp" %>
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
    <!-- Banner Section Begin -->
    <div class="banner-section spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="<%=request.getContextPath()%>/resources/img/banner-1.jpg" alt="배너1">
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="<%=request.getContextPath()%>/resources/img/banner-2.jpg" alt="배너2">
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="<%=request.getContextPath()%>/resources/img/banner-3.jpg" alt="배너3">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Section End -->

	<!-- 인기 키워드 시작 -->
	 인기 키워드
	<!-- 인기 키워드 끝 -->

	<!-- 인기매물 시작 -->
	<h3 align="center">인기 매물 리스트</h3>
	
	<table border="1" align="center">
	  	<tr align="center">
			<c:set var="step" value="0"/>
			<c:forEach var="i" items="${list }">
			<c:set var="step" value="${step+1 }"/>
		    	<td height="200px" align="center">
		    		<p><a href="detail.prd?no=${i.rank}&sellerid=${i.sellerid}">
						<img src="<%=request.getContextPath()%>/resources/${i.image1}" width="150" height="150" alt="상품사진"> <br>
		    		</a></p>
					제목: ${i.subject} <br>
					가격: <fmt:formatNumber value="${i.price }" pattern="###,###" /> <br>
					주소: ${i.address1} ${i.address2 } <br>
					조회수: ${i.readcount} <br>
					관심:  <br> <!-- product_like 테이블 -->
				</td>
			<!-- 4개씩 배치 -->
			<c:if test="${(step%4) == 0 }"></tr><tr></c:if>
			</c:forEach>
		</tr>
	</table>
	<!-- 인기매물 끝 -->

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

<%@ include file="./../common/main_bottom.jsp" %>

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
                <div class="col-lg-12">
                    <div class="single-banner">
                        <img src="img/banner-1.jpg" alt="배너">
                        <div class="inner-text">
                            <h4>배너</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner Section End -->

	<!-- 인기 키워드 시작 -->
		인기 키워드<br>
	<!-- 인기 키워드 끝 -->

	<!-- 인기매물 시작 -->
	<!-- 인기매물 시작 -->
	<table border="1">
		<c:set var="count" value="0"/>
		<c:forEach var="i" items="${list }">
			<table border="1">
		  		<tr align="center">
			    	<td width="200px" height="200px">
						<img src="<%=request.getContextPath()%>/resources/${i.image1}" width="150" height="150" alt="상품사진">
			    	</td>
			  	</tr>
			  	
			 	<tr>
			    	<td>
			     		<table border="1">
					        <tr align="center">
					        	<td>제목:</td>
					          	<td>${i.sbject}</td>
					        </tr>
					        <tr align="center">
					         	 <td>가격:</td>
					         	 <td>
					         	 	<fmt:formatNumber value="${i.price }" pattern="###,###" />
					         	 </td>
					        </tr>
					        <tr align="center">
					         	 <td>주소:</td>
					         	 <td>${i.address}</td>
					        </tr>
					        <tr align="center">
					        	<td>조회수: ${i.readcount}</td>
					         	<td>관심: </td> <!-- product_like 테이블 -->
							</tr>
						</table>
					</td>
				</tr>
					
			<c:if test="(count%4) == 0">
				</table><table>
			</c:if>
			</table>
		</c:forEach>
	</table>
	<!-- 인기매물 끝 -->
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

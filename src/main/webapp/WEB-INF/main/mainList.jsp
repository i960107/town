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
<!-- 
<script type="text/javascript">
	function statusChange( statusItem ) {
	   var strText = $(statusItem).text();

	   // strText 에 전체 문자열이 입력됨
	   $("#keyword").val(strText);
	}
</script> 
 -->
 
<style type="text/css">
.popkeyword {
	font-size:16pt;
	color:black;
}
.popkeyword a:link { text-decoration:none; color: black; }
.popkeyword a:visited { text-decoration:none; color: black; }
.popkeyword a:active { text-decoration:none; color: #EDA900; }
.popkeyword a:hover { text-decoration:none; color: #EDA900; } /* #007BFF */
</style>
<!--
	a:link 클릭하지 않았을 때 링크 상태
	a:visited 한번 클릭했거나 들어가보았던 링크 상태
	a:active 링크 부분에서 마우스를 누르고 있는 상태
	a:hover 링크를 클릭하려고 마우스를 가져갔을 때 상태
	text-decoration -> underline; 밑줄, none; 밑줄 없음
 -->
 
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
	<div class="section-title">
		<h2 align="center">중고거래 인기 키워드</h2>
	</div>
	
	<table border="0" align="center" width="500px">
		<tr align="center">
			<c:forEach var="key" items="${klist }">
				<td>
					#<a href="detail.prd?no=${key.no}&sellerid=${sellerid}">${key.keyword}</a>
				</td>
			</c:forEach>
		</tr>
	</table>
	<!-- 인기 키워드 끝 -->
	<br><br><br>
	<!-- 인기매물 시작 -->
	<div class="section-title">
		<h2 align="center">인기 매물 리스트</h2>
	</div>
	
	<table border="0" align="center" width="1200px">
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
				</td>
			<c:if test="${(step%5) == 0 }"></tr><tr></c:if>
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

<br><br><br><br>

<%@ include file="./../common/main_bottom.jsp" %>

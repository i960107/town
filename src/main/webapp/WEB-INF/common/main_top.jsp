<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String login = request.getContextPath() + "/memberlogin.mb"; // 로그인
	String join = request.getContextPath() + "/memberJoin.mb"; // 회원가입
	String myPage = request.getContextPath() + "/myPage.mb"; // 나의당근
	String viewMain = request.getContextPath() + "/main.mk"; // 메인페이지
	String saleList = request.getContextPath() + "/saleList.prd"; // 중고거래
	String boardList = request.getContextPath() + "/list.bd"; // 동네생활
	String productWrite = request.getContextPath() + "/pWrite.prd"; // 글쓰기
%>

<table border="1" width="100%" height="180" align="center">
	<tr>
		<td colspan="8" align="right">
			<a href="<%=login %>">로그인</a> | 
			<a href="<%=join %>">회원가입</a> | 
			<a href="<%=myPage %>">나의당근<img src="" width="30" height="30"></a>
		</td>
	</tr>
	
	<tr>
		<td width="20%" align="center">
			<a href="<%=viewMain %>">로고</a>
		</td>
		<td width="20%" colspan="3">
			<input type="text" placeholder="검색어입력">
		</td>
		<td width="15%" align="center">
			<a href="<%=saleList %>">중고거래</a>
		</td>
		<td width="15%" align="center">
			<a href="<%=boardList %>">동네생활</a>
		</td>
		<td width="15%" align="center">
			<a href="<%=productWrite %>">글쓰기</a>
		</td>
		<td width="15%" align="center">
			<a href="">채팅</a>
		</td>
	</tr>

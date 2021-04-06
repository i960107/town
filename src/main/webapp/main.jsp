<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

webapp\main.jsp <br><br>

<%
	String viewMain = request.getContextPath() + "/main.mk";
	response.sendRedirect(viewMain);	
%>
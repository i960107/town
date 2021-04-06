<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<style type="text/css">
	.err{
		font-size:9pt;
		color:red;
		font-wieght: bold;
	}
</style>

productInsertForm.jsp <br><br>

<form:form commandName="product" method="post" action="pWrite.prd" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<td>상품 이미지</td>
			<td>
				<!-- 다중 파일 선택: multiple="multiple" -->
				<input multiple="multiple" type="file" name="image">
			</td>
			<form:errors cssClass="err" path="image"/>
		</tr>
		
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" placeholder="상세 제목을 입력해 주세요.">
			</td>
			<form:errors cssClass="err" path="title"/>
		</tr>
		
		<tr>
			<td>카테고리</td>
			<td></td>
			<form:errors cssClass="err" path=""/>
		</tr>
		
		<tr>
			<td>거래지역</td>
			<td></td>
			<form:errors cssClass="err" path=""/>
		</tr>
		
		<tr>
			<td>환불</td>
			<td>
				<input type="radio" name="refund">환불 불가
				<input type="radio" name="refund">환불 가능
			</td>
			<form:errors cssClass="err" path="refund"/>
		</tr>
		
		<tr>
			<td>가격</td>
			<td>
				<input type="text" name="price">원
			</td>
			<form:errors cssClass="err" path="price"/>
		</tr>
		
		<tr>
			<td>설명</td>
			<td>
				<textarea rows="5" cols="50" name="contents" placeholder="상품 설명을 입력해주세요." style="resize: none;"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="등록하기">
			</td>
		</tr>
	</table>
</form:form>
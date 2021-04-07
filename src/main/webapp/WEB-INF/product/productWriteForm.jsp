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

<script type="text/javascript">
function goPopup(){
   var pop= window.open("<%=request.getContextPath()%>/popup/jusoPopup.jsp", "pop",
            "width=570,height=420, scrollbars=yes, resizable=yes");
   }
function jusoCallBack(roadFullAddr,siNm,sggNm,emdNm) {
      document.proform.address.value = roadFullAddr;
      document.proform.address1.value = siNm;
      document.proform.address2.value = sggNm;
      document.proform.address3.value = emdNm;
   }
</script>

productInsertForm.jsp <br><br>

<form:form commandName="product" method="post" action="pWrite.prd" enctype="multipart/form-data" name="proform">
	<table border="1">
		<tr>
			<td>상품 이미지
			<input type="hidden" name="seller_id" value="Tester11"> <!-- value값 테스터 나중에 로그인 세션 들어오면 입력 -->
			</td>
			<td>
				<!-- 다중 파일 선택: multiple="multiple" -->
				<input multiple="multiple" type="file" name="upload">
			</td>
			<form:errors cssClass="err" path="image1"/>
		</tr>
		
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="subject" placeholder="상세 제목을 입력해 주세요." value="${subject }">
			</td>
			<form:errors cssClass="err" path="subject"/>
		</tr>
		
		<tr>
			<td>카테고리</td>
			<td>
			<input type="radio" name="category" value="100"> 카테임시
			</td>
			<form:errors cssClass="err" path="category"/>
		</tr>
		
		<tr>
			<td>거래지역</td>
			<td>
			도로명주소 전체<input   type="text" id="roadFullAddr" name="address" /><input type="button" onClick="goPopup()" value="검색"><br> 
		         광역시도명<input type="text" id="siNm" name="address1" /><br> 
		         시군구명<input type="text" id="sggNm" name="address2" /><br> 
		         읍면동명<input type="text" id="emdNm"   name="address3" /><br>
			</td>
			<form:errors cssClass="err" path=""/>
		</tr>
		
		<tr>
			<td>환불</td>
			<td>
				<input type="radio" name="refund_availability" value="1">환불 불가
				<input type="radio" name="refund_availability" value="0">환불 가능
			</td>
			<form:errors cssClass="err" path="refund_availability"/>
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
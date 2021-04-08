<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../common/main_top.jsp"%>
<style type="text/css">
	.err{
		font-size:9pt;
		color:red;
		font-wieght: bold;
	}
	.sectable {
	border-collapse: separate; 
	border-spacing: 0 25px;
	vertical-align: middle;
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
<tr>
	<td colspan="8">

		<table align="center">
			<tr>
				<td>
					<div class="register-login-section spad">
						<div>
<form:form commandName="product" method="post" action="pWrite.prd" enctype="multipart/form-data" name="proform">
	<table class="sectable">
	<div class="group-input">
		<tr>
			<td class="group-input" width="120" align="center"><label>상품 이미지</label>
			<input type="hidden" name="seller_id" value="Tester11"> <!-- value값 테스터 나중에 로그인 세션 들어오면 입력 -->
			</td>
			<td class="group-input" >
				<!-- 다중 파일 선택: multiple="multiple" -->
				<input multiple="multiple" type="file" name="upload">
			</td>
			<form:errors cssClass="err" path="image1"/>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">제목</td>
			<td class="group-input" >
				<input type="text" name="subject" placeholder="상세 제목을 입력해 주세요." value="${subject }">
			</td>
			<form:errors cssClass="err" path="subject"/>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">카테고리</td>
			<td class="group-input" >
			<input type="radio" name="category" value="100"> 카테임시
			</td>
			<form:errors cssClass="err" path="category"/>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">거래지역</td>
			<td class="group-input" >
			<input   type="text" id="roadFullAddr" name="address" /><br>
			<input type="button" onClick="goPopup()" value="검색"> 
		    <input type="hidden" id="siNm" name="address1" />
		    <input type="hidden" id="sggNm" name="address2" > 
		    <input type="hidden" id="emdNm"   name="address3" >
			<form:errors cssClass="err" path=""/>
			</td>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">환불</td>
			<td class="group-input" >
				<input type="radio" name="refund_availability" value="1">환불 불가
				<input type="radio" name="refund_availability" value="0">환불 가능
			</td>
			<form:errors cssClass="err" path="refund_availability"/>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">가격</td>
			<td class="group-input" >
				<input type="text" name="price">원
			</td>
			<form:errors cssClass="err" path="price"/>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">설명</td>
			<td class="group-input" >
				<textarea rows="5" cols="35" name="contents" placeholder="상품 설명을 입력해주세요." style="resize: none;"></textarea>
			</td>
		</tr>
		
		<tr>
			<td class="group-input"  colspan="2" align="right">
				<input type="submit" value="등록하기">
			</td>
		</tr>
	</div>
	</table>
</form:form>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</td>
</tr>
<%@ include file="./../common/main_bottom.jsp"%>
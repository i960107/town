<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../common/mainW_top.jsp"%>
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
	.fileupload-img{
		background: url("<%=source%>resources/img/insert_img.jpg");
		border: none;
	    width: 150px;
	    cursor : pointer;
	    height: 150px;
	}
</style>

<script type="text/javascript">
function goPopup(){
   var pop= window.open("<%=request.getContextPath()%>/popup/jusoPopup.jsp", "pop",
            "width=570,height=420, scrollbars=yes, resizable=yes");
   }
function jusoCallBack(roadFullAddr,siNm,sggNm,emdNm) {
      document.myform.address.value = roadFullAddr;
      document.myform.address1.value = siNm;
      document.myform.address2.value = sggNm;
      document.myform.address3.value = emdNm;
   }
function handleFiles(fileList) {
	if (fileList.length < 1)
		return;
	$("#select_img").empty();
	for (i = 0; i < fileList.length; i++) {
		var reader = new FileReader();
		var file = fileList[i];
		reader.onload = function(e) {
			$("#select_img")
					.append("<img src='"+e.target.result+"' width=115 height=115>");
		}
		reader.readAsDataURL(file);
	}
	;
};
</script>

<!-- productInsertForm.jsp <br><br> -->
<tr>
	<td colspan="8">

		<table align="center">
			<tr>
				<td>
					<div class="register-login-section spad">
						<div>
<form:form commandName="product" method="post" action="pWrite.prd" enctype="multipart/form-data" name="myform" onsubmit="return writecheck(myform)">
	<table class="sectable">
	<div class="group-input">
		<tr>
			<td class="group-input" width="120" align="center"><label>상품 이미지</label>
			<input type="hidden" name="sellerid" value="<%=loginInfo.getId()%>">
			</td>
			<td class="group-input" >
				<!-- 다중 파일 선택: multiple="multiple" -->
				<label for="upload_file" class="fileupload-img"></label><br>
				<input multiple="multiple" type="file" name="upload" id="upload_file" hidden="" onchange="handleFiles(this.files)">
				<div id="select_img">
							
				</div>
				<form:errors cssClass="err" path="image1"/>
			</td>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">제목</td>
			<td class="group-input" >
                <input type="text" name="subject" placeholder="상세 제목을 입력해 주세요." value="${pbean.subject }" class="input-group">
                <form:errors cssClass="err" path="subject"/>
			</td>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">카테고리</td>
			<td class="group-input" >
            <c:set value="0" var="step"></c:set>
			<c:forEach var="cate" items="${cateList }">
            <c:set value="${step+1 }" var="step"/>
            <input type="radio" name="category" value="${cate.no }"> ${cate.categoryName } &nbsp;
            <c:if test="${step%4==0 }"><br></c:if>
			</c:forEach>
			<form:errors cssClass="err" path="category"/>
			</td>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">거래지역</td>
			<td class="group-input" >
			<!-- <input   type="text" id="roadFullAddr" name="address" /><br> -->
			<!-- <input type="button" onClick="goPopup()" value="검색">  -->
			<%@include file="./../common/addrArray.jsp" %>
		    <%-- <input type="hidden" id="siNm" name="address1" value="${mbean.address1 }"/>
		    <input type="hidden" id="sggNm" name="address2" value="${mbean.address2 }" />  --%>
		   <%--  <input type="hidden" id="emdNm"   name="address3"  value="${mbean.address3 }"/> --%>
			<form:errors cssClass="err" path="address2"/>
			</td>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">환불</td>
			<td class="group-input" >
				<div  class="input-group">
				<input type="radio" name="refundavailability" value="1"> &nbsp;환불 불가  &nbsp;
				<input type="radio" name="refundavailability" value="0"> &nbsp;환불 가능  &nbsp;
				</div>
				<form:errors cssClass="err" path="refundavailability"/>
			</td>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">가격</td>
			<td class="group-input" >
                <input type="number" name="price"  class="input-group" value="${pbean.price }">원
            <form:errors cssClass="err" path="price"/>
			</td>
		</tr>
		
		<tr>
			<td class="group-input" width="120" align="center">설명</td>
			<td class="group-input" >
				                <textarea  class="input-group" rows="5" cols="35"
                 name="contents" placeholder="상품 설명을 입력해주세요."
                  style="resize: none;">${pbean.contents }</textarea>
			</td>
		</tr>
		
		<tr>
			<td class="group-input"  colspan="2" align="right">
				<input type="submit" value="등록하기" class="site-btn register-btn">
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
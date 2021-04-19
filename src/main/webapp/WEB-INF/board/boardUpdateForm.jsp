<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/main_top.jsp"%>
<%@include file="../common/common.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">

function goPopup(){
	var pop= window.open("<%=request.getContextPath()%>
	/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr, siNm, sggNm, emdNm) {
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
	}
</script>
<style type="text/css">
.flex-container {
	display: flex;
	justify-content: start;
}

.err {
	font-weight: bold;
	color: red;
	font-size: 15px;
}
</style>
<center>
	<div class="register-form">
		<h2>동네생활 글쓰기</h2>
		<form:form commandName="board" action="update.bd" method="post"
			enctype="multipart/form-data" name="myform">
	<input type="hidden" name="no" value="${board.no}">
			<table class="sectable">
				<tr>
					<td class="group-input" width="200px"><label>제목</label></td>
					<td class="group-input" width="600px"><input type="text"
						name="subject" value="${board.subject}"> <form:errors
							cssClass="err" path="subject">
						</form:errors></td>
				</tr>
				<tr>
					<td class="group-input" width="200px"><label>작성자 </label></td>
					<td class="group-input" width="500px"><input type="text"
						name="writer" readOnly value="${loginInfo.id}"></td>
				</tr>
				<tr>
					<td class="group-input" width="200px"><label>주소</label></td>
					<td class="group-input" width="500px">
							<c:set var="mbean" value="${loginInfo}" />
							<%@include file="../common/addrArray.jsp"%>
						<form:errors cssClass="err" path="address1">
						</form:errors> <form:errors cssClass="err" path="address2">
						</form:errors>
					</td>
				</tr>

				<tr>
					<td rowspan=2 class="group-input" width="200px"></td>
					<td class="group-input" width="500px"><textarea
							class="form-control" rows="20" name="contents" >${fn:replace(board.contents,"<br>","")}</textarea>
				</tr>
				<tr>
					<td><form:errors cssClass="err" path="contents">
						</form:errors></td>
				</tr>


				<tr>
					<td class="group-input" width="200px"><label>사진선택<br>
							<font size="2">ctrl을 누르고 여러개 선택 가능</font></label></td>
					<td class="group-input" width="500px"><input type="file"
						name="uploadFile" id="files" multiple="multiple"
						onchange="handleFiles(this.files)">
						<div id="select_img">
							<c:forEach var="file" items="${boardFileList}">
								<img
									src='${pageContext.request.contextPath}/resources/${file.fileName}'
									width=200 height=200 />
							</c:forEach>
						</div></td>
					<!-- 선택한 파일 미리보기 -->
					<script>
						function handleFiles(fileList) {
							if (fileList.length < 1)
								return;
							$("#select_img").empty();
							for (i = 0; i < fileList.length; i++) {
								var reader = new FileReader();
								var file = fileList[i];
								reader.onload = function(e) {
									$("#select_img")
											.append(
													"<img src='"+e.target.result+"' width=200 height=200>");
								}
								reader.readAsDataURL(file);
							}
							;
						};
					</script>
				</tr>
				<tr>
					<td width="200px" rowspan=2><label>카테고리 선택</label></td>
					<td width="500px" class="checkbox"><c:forEach var="ctg"
							varStatus="i" items="${categoryList}">
							<span> <input type="checkbox"
								style="diplay: inline-block; width: 50px;" name="category"
								value="${ctg.no}"
								<c:forTokens var="cate" items="${board.category}" delims=",">
									<c:if test="${cate==ctg.no}">checked</c:if>
							</c:forTokens>>${ctg.categoryName}
								<c:if test="${i.index!=0 and (i.index+1)%5==0}">
									<br>
								</c:if>
							</span>
						</c:forEach></td>
				</tr>
				<tr>
					<td><form:errors cssClass="err" path="category">
						</form:errors></td>
				</tr>
			</table>

			<center>
				<button type="submit" class="site-btn register-btn">글쓰기</button>
			</center>
		</form:form>

	</div>
</center>
<%@ include file="./../common/main_bottom.jsp"%>
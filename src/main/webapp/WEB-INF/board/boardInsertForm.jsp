<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/mainW_top.jsp"%>
<%@include file="../common/common.jsp"%>

<style type="text/css">
.flex-container {
	display: flex;
	justify-content: start;
}
.err{
font-weight:bold;
color:red;
font-size:15px;
}
.fileupload-img{
		background: url("<%=source%>resources/img/insert_img.jpg");
		border: none;
	    width: 150px;
	    cursor : pointer;
	    height: 150px;
	}
</style>
<center>
	<div class="register-form">
		<h2>동네생활 글쓰기</h2>
		<form:form commandName="board"  action="insert.bd" method="post"
			enctype="multipart/form-data" name="myform">

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
							<jsp:include page="../common/addrArray.jsp"></jsp:include>
							<form:errors cssClass="err" path="address1"/>
						<form:errors cssClass="err" path="address2"/>
					</td>
				</tr>

				<tr>
					<td rowspan=2 class="group-input" width="200px"></td>
					<td class="group-input" width="500px"><textarea
							class="form-control" rows="20" name="contents">${board.contents}</textarea>
				</tr>
				<tr>
					<td><form:errors cssClass="err" path="contents">
						</form:errors></td>
				</tr>


				<tr>
					<td class="group-input" width="200px"><label>사진선택<br><font size="2">ctrl을 누르고 여러개 선택 가능</font></label></td>
					<td class="group-input" width="500px">
					<label for="upload_file" class="fileupload-img"></label><br>
					<input type="file" name="uploadFile" multiple="multiple" onchange="handleFiles(this.files)" id="upload_file" hidden="" >
						<div id="select_img">
							
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
					
					</td>
				</tr>
				<tr>
					<td width="200px" rowspan=2><label>카테고리 선택</label></td>
					<td width="500px" class="checkbox">
					<c:forEach var="ctg" varStatus="i" items="${bCategoryList}" >
					<span>
							<input type="checkbox" style="diplay: inline-block; width: 50px;" name="category" value="${ctg.no}"
							<c:forTokens var="cate" items="${board.category}" delims=",">
									<c:if test="${cate==ctg.no}">checked</c:if>
							</c:forTokens>
							>${ctg.categoryName}
							<c:if test="${i.index!=0 and (i.index+1)%5==0}"><br></c:if>
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
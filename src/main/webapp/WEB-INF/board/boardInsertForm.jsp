<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/main_top.jsp"%>
<%@include file="../common/common.jsp"%>
<script type="text/javascript">
function goPopup(){
	var pop= window.open("<%=request.getContextPath()%>/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr, siNm, sggNm, emdNm) {
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
	}
</script>

<center>
	<div class="register-form">
		<h2>동네생활 글쓰기${board.category}</h2>
		<form:form commandName="board" action="insert.bd" method="post"
			enctype="multipart/form-data" name="form">

			<table width="60%" class="sectable">
				<tr>
					<td class="group-input" width="100px"><label>제목</label></td>
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
					<td class="group-input" width="500px"><input type="text"
						name="writer" readOnly value="${loginInfo.address}"></td>
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
					<td class="group-input" width="200px"><label>사진선택</label></td>
					<td class="group-input" width="500px"><input type="file"
						name="upload1"> <input type="file" name="upload2">
						<input type="file" name="upload3"></td>
				</tr>
				<tr>
					<td width="200px" rowspan=2><label>카테고리 선택</label></td>
					<td width="500px" class="checkbox">
					<c:forEach var="ctg" items="${categoryList}">
							<input type="checkbox" name="category" value="${ctg.no}"
							<c:forTokens var="cate" items="${board.category}" delims=",">
									<c:if test="${cate==ctg.no}">checked</c:if>
							</c:forTokens>
							>${ctg.categoryName}
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

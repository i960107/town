<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp"%>
<script
	src="${pageContext.request.contextPath}/resources/script/timeFormat.js"></script>
<style type="text/css">
.board {
	margin-bottom: 30px;
	background-color: #F8F9FA;
}

.box {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	overflow: hidden;
}

.flex-container {
	display: flex;
	justify-content: space-between;
}

.flex-container-category {
	display: flex;
	justify-content: flex-start;
	margin:20px;
	width: 100%;
	flex-wrap: wrap;
}

.flex-container-product {
	display: flex;
	justify-content: flex-start;
	width: 100%;
	flex-wrap: wrap;

}

.flex-container-product-item {
	font-size: 20px;
	font-family: FontAwesome;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	font-weight: bold;
		margin:40px
}
</style>
<!-- PSaleController -> productSaleList.jsp -->
<br>
<section class="latest-blog spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>우리 동네 중고 직거래 마켓</h2>
					<h3>동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</h3>
				</div>
			</div>
			<!-- 검색필터설정 -->
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<form action="" name="categoryform">
						<input type="hidden" name="isCategorySelected" value="true">
						<script>
							var keyword = document.searchform.keyword.value;

							if (keyword != "") {
								document
										.write("<input type='hidden' name='keyword' value='"+keyword+"'>");
							}
						</script>
						<table>
							<tr style="background-color: #FFFFF0;">
								<td colspan=2 align="center"
									style="padding-top: 10px; padding-bottom: 10px" valign="middle"><h5>
										<b>카테고리</b>
									</h5></td>
							</tr>
							<tr style="background-color: #FFFFF0">
								<td colspan=2 class="flex-container-category"><c:if
										test="${category==null}">
										<c:forEach items="${pCategoryList}" var="ctg">
											<span class="col-md-2"><input type="checkbox"
												name="category" class="category" value="${ctg.no}" checked>${ctg.categoryName}
											</span>
										</c:forEach>
									</c:if> <c:if test="${category!=null}">
										<c:forEach items="${pCategoryList}" var="ctg">
											<span class="col-md-2"> <input type="checkbox"
												name="category" class="category" value="${ctg.no}"
												<c:forTokens items="${category}" delims="," var="ct">
													<c:if test="${ct==ctg.no}">checked</c:if>
													</c:forTokens>>${ctg.categoryName}
											</span>
										</c:forEach>

									</c:if></td>
							</tr>
							<tr>
								<td style="background-color: #FFFFF0;" colspan=2 align="right"><input
									type="submit" value="카테고리 조건 검색"></td>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12 flex-container"
				style="padding-top: 10px; padding-bottom: 10px;">
				<div>
					<button type="button" class="btn btn-warning"
						onClick="location.href='pWrite.prd'"
						style="align: left; width: 100;">
						<b>글쓰기</b>
					</button>
				</div>
				<div>
					<form name="myform">
						<c:set var="mbean" value="${loginInfo}" />
						<script>
							/* 키워드 넘기기 */
							document
									.write("<input type='hidden' name='keyword' value='"+document.searchform.keyword.value+"'>");
							/* 카테고리 넘기기 */
							var categoryObj = document.categoryform.category;
							var category = "";
							for (i = 0; i < categoryObj.length; i++) {

								if (categoryObj[i].checked) {
									if (i != 0) {
										category += ","
									}
									category += categoryObj[i].value
								}
								;

							}
							document
									.write("<input type='hidden' name='category' value='"+category+"'>");
						</script>
						<input type="hidden" name="isCategorySelected" value="true">
						<input type="hidden" name="request" value="saleList.prd">
						<%@include file="./../common/addrArray.jsp"%>
					</form>
				</div>

			</div>
		</div>
		<div class="flex-container-product">
			<c:forEach var="i" items="${searchList}">

				<div class="flex-container-product-item"
					style="background-color: #dcdcdc; margin-bottom: 40px">

					<div>

						<a href="detail.prd?no=${i.no}&sellerid=${i.sellerid}"> <img
							alt="" src="<%=request.getContextPath()%>/resources/${i.image1}"
							height="300" width="300">
						</a> <br> <font color="green"> <script>
							document
									.write(displayTime('<c:out value="${i.regdate}"/>'));
						</script></font><font color="orange">&nbsp&nbsp&nbsp${i.sellerid } </font> <br>
						${i.subject} <br> ${i.price } 원 <br> ${i.address1 }
						${i.address2 }<br>
					</div>
					<div>
						<c:forTokens items="${i.category}" delims="," var="ctg">
							<c:forEach begin="0" end="${fn:length(pCategoryList)-1}" var="i">
								<c:if test="${pCategoryList[i].no==ctg}">
									<button type="button" class="btn btn-danger"
										style="margin: 10px 5px;">${pCategoryList[i].categoryName}</button>
								</c:if>
							</c:forEach>
						</c:forTokens>
					</div>
				</div>

			</c:forEach>

		</div>
	</div>
</section>
<%-- <table align="center" width="1200px";>
		<tr>
			<td colspan="4">
			<div class="section-title">
				<h3>나의 당근 판매 내역 리스트</h3>
			</div>
			</td>
			<tr style="background-color: #FFFFF0;">
									<td colspan=2 align="center" style="padding-top: 10px"
										valign="middle"><h5>
											<b>카테고리</b>
										</h5></td>
								</tr>
								<tr style="background-color: #FFFFF0">
									<td colspan=2 height="100"><c:if test="${category==null}">
										<label for="out_category">
											<c:forEach items="${categoryList}" var="ctg">
												<span class="col-md-2"><input type="checkbox"
													name="category" value="${ctg.no}" checked>${ctg.categoryName}
												</span>
											</c:forEach>
										</c:if> 
										<c:if test="${category!=null}">
											<c:forEach items="${categoryList}" var="ctg">
												<span class="col-md-2"> <input type="checkbox"
													name="category" value="${ctg.no}"
													<c:forTokens items="${category}" delims="," var="ct">
													<c:if test="${ct==ctg.no}">checked</c:if>
													</c:forTokens>>${ctg.categoryName}
												</span>
											</c:forEach>
										</label>
										</c:if></td>
								</tr>
		</tr>
		<tr>
			<c:set var="step" value="0" />
			<c:forEach var="i" items="${searchList}">
				<c:set var="step" value="${step+1 }" />
				<td width="300" height="300">
				<a href="detail.prd?no=${i.no}&sellerid=${i.sellerid}"> <img
						alt="" src="<%=request.getContextPath()%>/resources/${i.image1}"
						height="200" width="200">
				</a> <br><script >
					document.write(displayTime('<c:out value="${i.regdate}"/>'));
				</script> <br> ${i.subject} <br> <span>${i.category}</span> <br>
					${i.price } 원 <br> ${i.address1 } ${i.address2 }<br></td>
				<c:if test="${(step%4)==0 }"></tr><tr></c:if>
			</c:forEach>
		</tr>
	</table> --%>
<%@ include file="./../common/main_bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- PDetailViewControlelr > 
상품 자세히 보기 페이지
 -->
<title>상품 보기</title>
<script type="text/javascript">
	function prdLike() {
		location.href="like.prd";
	}
	function prdUnLike() {
		location.href="unlike.prd";
	}
</script>
<style type="text/css">
	.price{
	font-size: 20px;
	color: #010101;
	font-weight: bold;
	}
	.subject{
	font-size: 15px;
	color: #BBBBBB;
	font-weight: bold;
	}
	.mcontent{
	font-size: 15px;
	color: #CCCCCC;
	}
</style>
<%
String loginId = "";
if(loginInfo!=null){
	loginId = loginInfo.getId();
}
%>
</head>
<body>
<table>
	<tr>
		<td>
		<img alt="" src="<%=source%>resources/${pBean.image1}" height="360" width="300">
		</td>
		<td>
			<table>
				<tr height="72">
						<td colspan="3"><span class="subject">${pBean.subject }</span></td>
					</tr>
				<tr height="72">
					<td colspan="3"><span class="price"><fmt:formatNumber pattern="###,###">${pBean.price }</fmt:formatNumber> 원</span>
					<br>
					<hr>
					</td>
				</tr>
				<tr height="72">
					<td width="120"><span class="mcontent">${pBean.readcount }</span></td>
					<td width="120"><span class="mcontent">${pBean.regdate }</span></td>
					<td width="120"><a href="report.prd"><span class="mcontent">신고하기</span></a></td>
				</tr>
				<tr height="72">
					<td colspan="3" valign="top"><span><img src="<%=source %>resources/img/icon-1.png">${pBean.address }</span></td>
				</tr>
				<tr height="72">
					<td>
					<c:set var="loginId"><%=loginId %></c:set>
					<c:set var="heart" value="&#10084;"/>
					<c:set var="likecondition" value="prdUnLike()"/>
					<c:forEach var="i" items="${likeList }">
						<c:if test="${loginId==i.userid }">
						<c:set var="heart">&#128151; </c:set>
						<c:set var="likecondition" value="prdLike()"/>
						</c:if>
					</c:forEach>
					<input type="button" name="like" value="${heart } 찜 ${likeCnt}" onclick="${likecondition}"> 
					</td>
					<td>
					<c:set var="btnType">연락하기</c:set>
					<c:set var="scriptType">chat()</c:set>
					<c:if test="${loginId==pBean.sellerid }">
					<c:set var="btnType">수정하기</c:set>
					<c:set var="scriptType">updateProduct()</c:set>
					</c:if>
					<input type="button" value="${btnType }" onclick="${scriptType}">
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td>
		<img alt="" src="<%=source%>resources/${member.image}" width="150" height="150">
		</td>
		<td>
		<a href="tradeDetail.mb?sellerid=${sellerid }">${sellerid }</a>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td rowspan="3" width="400" valign="top"><span>${pBean.contents }</span></td>
		<td><a><img alt="" src="<%=source%>resources/${pBean.image1 }" width="200" height="200"></a></td>
	</tr>
	<tr>
		<td><a><img alt="" src="<%=source%>resources/${pBean.image2 }" width="200" height="200"></a></td>
	</tr>
	<tr>
		<td><a><img alt="" src="<%=source%>resources/${pBean.image3 }" width="200" height="200"></a></td>
	</tr>
</table>
<a href="update.prd">수정하기</a><br>

</body>
</html>
<%@ include file="./../common/main_bottom.jsp"%>
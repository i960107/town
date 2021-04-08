<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@ include file="./../common/main_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- PDetailViewControlelr >  -->
<title>상품 보기</title>
<script type="text/javascript">
	function prdLike() {
		location.href="like.prd";
	}
</script>
</head>
<body>
<table>
	<tr>
		<td>
		<img alt="" src="<%=source%>resources/${pBean.image1}" height="300" width="250">
		</td>
		<td>
			<table border="1">
				<tr>
					<td colspan="3"><span>${pBean.subject }</span></td>
				</tr>
				<tr>
					<td colspan="3"><span><fmt:formatNumber pattern="###,###">${pBean.price }</fmt:formatNumber> 원</span></td>
				</tr>
				<tr>
					<td><span>${pBean.readcount }</span></td>
					<td><span>${pBean.regdate }</span></td>
					<td><a href="report.prd"><span>신고하기</span></a></td>
				</tr>
				<tr>
					<td colspan="3" valign="top"><span>${pBean.address }</span></td>
				</tr>
				<tr>
					<td><input type="button" name="like" value="♡찜 ${likeCnt}" onclick="prdLike()"> </td>
					<td><input type="button" name="chat" value="연락하기" onclick="chat()"></td>
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td>
		<img alt="" src="<%=source%>${member.image}" width="150" height="150">
		</td>
		<td>
		<a href="tradeDetail.mb?sellerid=${sellerid }">${sellerid }</a>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td rowspan="3"><span>${pBean.contents }</span></td>
		<td><a><img alt="" src="<%=source%>${pBean.image1 }" width="200" height="200"></a></td>
	</tr>
	<tr>
		<td><a><img alt="" src="<%=source%>${pBean.image2 }" width="200" height="200"></a></td>
	</tr>
	<tr>
		<td><a><img alt="" src="<%=source%>${pBean.image3 }" width="200" height="200"></a></td>
	</tr>
</table>
<a href="update.prd">수정하기</a><br>

</body>
</html>
<%@ include file="./../common/main_bottom.jsp"%>
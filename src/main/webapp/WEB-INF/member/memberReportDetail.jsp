<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기 Detail</title>
</head>
<body>


<form action="memberReportDetail.mb" method="post">
<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>신고 세부 내역</h2>
					
					<table width="1100px" class="sectable" border="1">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>신고 ID </label></th>
								<th class="group-input"><label>신고된 ID </label></th>
								<th class="group-input"><label>신고내용</label></th>
								<th class="group-input"><label>신고횟수</label></th>
							</tr>
							
							<c:forEach var="mrbean" items="${mrbean }">
								<tr align="center">
									<td class="group-input"><label>${mrbean.reportuserid } </label></td>
									<td class="group-input"><label>${mrbean.reporteduserid } </label></td>
									<td class="group-input"><label>${mrbean.contents }</label></td>
									<td class="group-input"><label>${mrbean.count }</label></td>
								</tr>
							</c:forEach>
						</div>
					</table>
					
				</div>
			</div>
		</td>
	</tr>
</table>
</form>


</body>
</html>
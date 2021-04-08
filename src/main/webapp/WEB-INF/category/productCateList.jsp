<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file ="./../common/common.jsp" %>  
<%@ include file="./../../Category.jsp"%>

<br>
productCateList.jsp<br>


<div align="center" class="group-input">
	<table align="center">
			<tr>
				<td>
					<div class="register-login-section spad">
						<div class="register-form">
							<center><h3>중고거래 카테고리</h3></center>
													
								<table width="500px" class="sectable">
									<div class="group-input">
									<tr>
										<td class="group-input" width="150px">
												<label>NO </label>
										</td> 
										<td class="group-input" width="350px">
												<label>카테고리명 </label>
										</td>
									</tr>
									
										<tr>
									<c:forEach var="pclist" items="${pcbean}">
											<td> ${pclist.pcno }</td>
											<td> ${pclist.pcname }</td>
									</c:forEach>
										</tr>
									
									</div>
								</table>
							
						</div>
					</div>
				</td>
			</tr>
		</table>
	<br>
</div>


<%@ include file="./../common/main_bottom.jsp"%>
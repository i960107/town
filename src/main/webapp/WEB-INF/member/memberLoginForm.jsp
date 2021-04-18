<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

MLoginController - > memberLoginForm.jsp
<br>

<%@include file="./../common/main_top.jsp" %>

<tr>
	<td colspan="8">

		<table align="center">
			<tr>
				<td>
					<div class="register-login-section spad">
						<div class="container">
									<div class="login-form">
										<h2>Login</h2>
										<form action="memberlogin.mb" method="post">
											<div class="group-input">
												<label for="username">User ID *</label> 
												<input type="text" name="id" value="${id }">
											</div>
											<div class="group-input">
												<label for="pass">Password *</label> 
												<input type="password" name="pw">
											</div>
											<div class="group-input gi-check">
												<div class="gi-more" >
													 <a href="#" class="forget-pass">Forget your Password</a>
												</div>
											</div>
											<%int myPort = request.getServerPort(); %>
											<button type="submit" class="site-btn login-btn">Sign In</button><br> <Br>
											<a href="https://kauth.kakao.com/oauth/authorize?client_id=6a065330b97f7755c569892d3485de7b&redirect_uri=http://localhost:<%=myPort %>/ex/kakaologin.mb&response_type=code">
											<img src="<%=source%>resources/kakaologin.png"></a>
									</form>
									<div class="switch-login">
									<a href="memberJoin.mb" class="or-login">Or Create An Account</a>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>

		</table>
	</td>
</tr>








<%@ include file="./../common/main_bottom.jsp"%>
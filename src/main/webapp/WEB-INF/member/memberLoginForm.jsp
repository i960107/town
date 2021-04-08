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
											<button type="submit" class="site-btn login-btn">Sign In</button>
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
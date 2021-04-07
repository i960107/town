<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


MJoinController -> memberJoinForm.jsp
<br>


<%@ include file="./../common/main_top.jsp"%>

<tr>
	<td colspan="8">

		<table align="center">
			<tr>
				<td>
					<div class="register-login-section spad">
						<div class="container">
							<div class="row">
								<div class="col-lg-6 offset-lg-3">
									<div class="register-form">
										<h2>회원 가입</h2>
										<form action="memberJoin.mb" method="post">
											<div class="group-input">
												<label for="username">Username or email address *</label> <input
													type="text" id="username">
											</div>
											<div class="group-input">
												<label for="pass">Password *</label> <input type="text"
													id="pass">
											</div>
											<div class="group-input">
												<label for="con-pass">Confirm Password *</label> <input
													type="text" id="con-pass">
											</div>
											<button type="submit" class="site-btn register-btn">REGISTER</button>
										</form>
										<div class="switch-login">
											<a href="./login.html" class="or-login">Or Login</a>
										</div>
									</div>
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
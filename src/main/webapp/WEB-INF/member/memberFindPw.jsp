<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./../common/main_top.jsp"%>

<tr>
	<td colspan="8">

		<table align="center">
			<tr>
				<td>
					<br><br><br><br>
					<div class="login-form">
						<h2>FIND PASSWORD</h2>
						<form action="findpw.mb" method="post">
							<div class="group-input">
								<label>User ID *</label> 
								<input type="text" name="id">
							</div>
							<input type="submit" class="site-btn login-btn" value="FIND PW">
						</form>

					</div>
					<br><br><br><br>
				</td>
			</tr>

		</table>
	</td>
</tr>


<%@ include file="./../common/main_bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./category.jsp"%>
<style type="text/css">
.err{
	font-size: 9pt;
	color: red;
	font-weight: bold;
}
</style>



<div align="center" class="group-input">
	<table align="center">
			<tr>
				<td>
					<div class="register-login-section spad">
						<div class="register-form">
							<center><h3>중고거래 카테고리 등록</h3></center>
							<form:form commandName="pci" action="productCateInsert.ct" method="post">
								
								<table width="500px" class="sectable">
									<div class="group-input">
									<tr>
										<td class="group-input" width="150px"><label>* 카테고리명 </label></td> 
										<td class="group-input" width="350px"><input type="text" name="category_name">
										
										</td>
									</tr>

									</div>
								</table>
							
									<center>
										<button type="submit" class="site-btn register-btn">INSERT</button>
											<div class="switch-login">
											<a href="productCateList.ct" class="or-login">Cancel</a>
										</div>
									</center>
							</form:form>

						</div>
					</div>
				</td>
			</tr>
		</table>
	<br>
</div>

<br>
<br>


<%@ include file="./../common/main_bottom.jsp"%>
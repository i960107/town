<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./WEB-INF/member/memberMyPageTop.jsp"%>

<script type="text/javascript">
	


	function townInsert(){
		alert('동네생활 눌렀니');
		$('#townInsert').show();
		$('#productInsert').hide();
	}
	
	function productInsert(){
		alert('중고거래 눌렀지');
		$('#townInsert').hide();
		$('#productInsert').show();
	}
	
	function townCateList(){
	 	alert("동네생활 리스트");
	 	$('#townInsert').hide();
	 	$('#productInsert').hide();
		location.href="boardCateList.ct";
		
	}
</script>



<span><h3><b>카테고리 관리</b></h3></span>


<div class="filter-control" style="margin: 0 auto; width: 80%">
     <ul>
     <li class="active" onmouseover="style='cursor:pointer'" onclick="townCateList()">동네생활 카테고리</li>
     <li class="active" onmouseover="style='cursor:pointer'" onclick="townInsert()">동네생활 카테고리 등록</li>
     <li class="active">중고거래 카테고리 </li>
     <li class="active" onmouseover="style='cursor:pointer'" onclick="productInsert()">중고거래 카테고리 등록</li>
     </ul>
 </div>
<br>















<div align="center" class="group-input" id="townInsert">
	<table align="center">
			<tr>
				<td>
					<div class="register-login-section spad">
						<div class="register-form">
							<center><h3>동네생활 카테고리 등록</h3></center>
							<form:form commandName="pci" action="boardCateInsert.ct" method="post">
								
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
											<a href="boardCateList.ct" class="or-login">Cancel</a>
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




<div align="center" class="group-input" id="productInsert">
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




<div align="center">
<table border="1">

<h4>카테고리 관리</h4> 
<tr>
	<td>
<a href="boardCateList.ct">동네 카테 목록</a> 

&nbsp;
</td>
<td>
<a href="boardCateInsert.ct">동네 카테 등록</a>

&nbsp;
</td>
<td>
<a href="productCateList.ct">중고물건 카테 목록</a>

&nbsp;
</td>
<td>
<a href="productCateInsert.ct">중고물간 카테 등록</a>
</td>
</tr>
</table>

</div>
<%-- <%@ include file="./../WEB-INF/common/main_bottom.jsp"%> --%>
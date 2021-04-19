<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../../WEB-INF/member/memberMyPageTop.jsp"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('#townInsert').hide();
		$('#productInsert').hide();
		$('#boardCateList').hide();
		$('#prodCateList').hide();
	});

	function townInsert(){
		alert('동네생활 눌렀니');
		$('#productInsert').hide();
		$('#boardCateList').hide();
		$('#prodCateList').hide();
		$('#townInsert').show();
	}
	
	function townCateList(){
	 	alert("동네생활 리스트");
		$('#boardCateList').show();
	 	$('#townInsert').hide();
	 	$('#productInsert').hide();
		$('#prodCateList').hide();
		
	}
	
	function productInsert(){
		alert('중고거래 눌렀지');
		$('#townInsert').hide();
		$('#boardCateList').hide();
		$('#prodCateList').hide();
		$('#productInsert').show();
	}
	
	function prodCateList(){
		alert("중고거래 리스트");
		$('#townInsert').hide();
		$('#productInsert').hide();
		$('#boardCateList').hide();
		$('#prodCateList').show();
		
	}
</script>

<style>
	.listTable{
		border: 1px solid #EAEAEA;
		 line-height: 2rem;
		
	}
	
	span{
		align-self: center;
	}
	
	.div-style{
		position: absolute;
		width: 80%;
		height : 100px;
		margin: 0 29%;
		text-align: center;
	}

</style>

<br><br><br>
<span><h3 align="center"><b>카테고리 관리</b></h3></span>

<div class="div-style filter-control">


     <ul>
     <li class="active" onmouseover="style='cursor:pointer'" onclick="townCateList()">동네생활 카테고리</li>
     <li class="active" onmouseover="style='cursor:pointer'" onclick="townInsert()">동네생활 카테고리 등록</li>
     <li class="active" onmouseover="style='cursor:pointer'" onclick="prodCateList()">중고거래 카테고리 </li>
     <li class="active" onmouseover="style='cursor:pointer'" onclick="productInsert()">중고거래 카테고리 등록</li>
     </ul>
 

</div>
 

 <br><br><br><br>


<div id="boardCateList">
<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>동네생활 카테고리</h2>
					<table width="700px" class="sectable listTable">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>카테고리명 </label></th>
								<th class="group-input"><label>삭제</label></th>

							</tr>

							<c:forEach var="bclist" items="${bcbean }">
								<tr align="center">
									<td class="group-input">${bclist.no }</td>
									<td class="group-input">${bclist.categoryName }</td>
									<td class="group-input"><a href="boardCateDel.ct?no=${bclist.no }">삭제</a></td>
								</tr>
							</c:forEach>
						</div>
					</table>

				</div>
			</div>
		</td>
	</tr>
</table>
</div>



<div align="center" class="group-input" id="townInsert" >
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




<div align="center" class="group-input" id="productInsert" >
	<table align="center">
			<tr>
				<td>
					<div class="register-login-section spad">
						<div class="register-form">
							<center><h3>중고거래 카테고리 등록</h3></center>
							<form:form commandName="pci" action="productCateInsert.ct" method="post">
								
								<table width="500px" class="sectable ">
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

<div id="prodCateList">
<table align="center">
	<tr>
		<td>
			<div class="register-login-section spad">
				<div class="register-form">
					<h2>중고거래 카테고리</h2>
					<table width="700px" class="sectable listTable">
						<div class="group-input">
							<tr align="center">
								<th class="group-input"><label>NO </label></th>
								<th class="group-input"><label>카테고리명 </label></th>
								<th class="group-input"><label>삭제</label></th>

							</tr>

							<c:forEach var="pclist" items="${pcbean }">
								<tr align="center">
									<td class="group-input">${pclist.no }</td>
									<td class="group-input">${pclist.categoryName }</td>
									<td class="group-input"><a href="prodCateDel.ct?no=${pclist.no }">삭제</a></td>
								</tr>
							</c:forEach>
						</div>
					</table>

				</div>
			</div>
		</td>
	</tr>
</table>
</div>


 </td>
</tr>
</table>

<br><br>

<%@ include file="./../../WEB-INF/common/main_bottom.jsp"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp" %>

MUpdateController -> memberUpdateForm.jsp <br><br>

<h2> 회원정보 수정하기 </h2>

<script type="text/javascript">
function goPopup(){
	var pop= window.open("<%=request.getContextPath()%>/popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}
	
function jusoCallBack(roadFullAddr,siNm,sggNm,emdNm) {
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
	}
</script>

<style type="text/css">
	.sectable {
	border-collapse: separate; 
	border-spacing: 0 25px;
	vertical-align: middle;
}

	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}

</style>


<tr>
	<td colspan="8">

		<table align="center">
			<tr>
				<td>
					<div class="register-login-section spad">
						<div class="register-form">
							<h2>Member Update</h2>
							<form:form commandName="member" action="memberUpdate.mb" method="post" enctype="multipart/form-data" name="form">
								
								<table width="700px" class="sectable">
									<div class="group-input">
									<tr>
										<td class="group-input" width="200px"><label>* ID </label></td> 
										<td class="group-input" width="500px"><input type="text" name="id" value=${mbean.id } readonly="readonly">
										</td>
									</tr>

									<tr>
										<td class="group-input"  width="200px"><label>* Password</label></td>
										<td class="group-input" width="500px"><input type="password" name="pw">
										 <form:errors cssClass="err" path="pw"></form:errors> 
										</td>
									</tr>

									<tr>
										<td class="group-input"  width="200px"><label>* Confirm <br> &nbsp; Password</label></td>
										<td class="group-input" width="500px">
											<input type="password" name="pwCheck">
											<form:errors cssClass="err" path="pwCheck"></form:errors> 
										</td>
									</tr>

									<tr>
										<td class="group-input"  width="200px"><label>* Name</label></td>
										<td class="group-input" width="500px"><input type="text" name="name" value="${mbean.name }">
										<form:errors cssClass="err" path="name"></form:errors> 
										
										</td>
									</tr>

									<tr>
										<td class="group-input"  width="200px"><label>* Gender</label></td>
										<td class="gi-more" width="500px"> 
											<input type="radio" name="gender" value="남"> 남   
												&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" name="gender" value="여"> 여
											<form:errors cssClass="err" path="gender"></form:errors> 
										</td>
									</tr>

									<tr>
										<td class="group-input"  width="200px"><label>* Phone Number</label></td>
										<td class="group-input" width="500px">
										<input type="text"	name="phonenumber" value="${mbean.phonenumber }">
										<form:errors cssClass="err" path="phonenumber"></form:errors>
										</td>
										
									</tr>

									<tr>
										<td class="group-input" width="200px"><label>* Email</label></td>
										<td class="group-input" width="500px"><input type="email" name="email" value="${mbean.email }">
										 <form:errors cssClass="err" path="email"></form:errors> 
										</td>
									</tr>

									<tr>
										<td class="group-input" width="200px"><label>* Address</label></td>
										<td class="group-input" width="500px" >
												<input type="text" id="roadFullAddr" name="address" value="${mbean.address }"/>
												<input type="button" onClick="goPopup()" value="검색">
												<form:errors cssClass="err" path="address"></form:errors> 
        										 <input type="hidden" id="siNm" name="address1" value="${mbean.address1 }"/><br> 
        										 <input type="hidden" id="sggNm" name="address2" value="${mbean.address2 }" /><br> 
      											 <input type="hidden" id="emdNm" name="address3" value="${mbean.address3 }"/><br>
										</td>
									</tr>
									
									<tr>
										<td class="group-input" width="200px"><label>Image</label></td>
										<td class="group-input" width="500px">
											<input type="file" name="upload">
											<input type="hidden" name="orgImage" value="${mbean.image }">
										</td>
									</tr>

									</div>
								</table>
							
									<center>
										<button type="submit" class="site-btn register-btn">UPDATE</button>
											<div class="switch-login">
											<a href="main.mk" class="or-login">Or Cancel</a>
										</div>
									</center>
							</form:form>

						</div>
					</div>
				</td>
			</tr>
		</table>
	</td>
</tr>










<%@ include file="./../common/main_bottom.jsp" %>
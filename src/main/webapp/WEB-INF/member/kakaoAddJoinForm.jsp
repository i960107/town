<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="./../common/common.jsp"%>
<%@ include file="./../common/main_top.jsp"%>

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
							<h2>추가 정보 입력</h2>
							<form:form commandName="member" action="kakaoJoin.mb" method="post" enctype="multipart/form-data" name="form">
								
								<table width="700px" class="sectable">
									<div class="group-input">
									<tr>
										<td class="group-input" width="200px"><label>* Address</label></td>
										<td class="group-input" width="500px" >
											<input type="hidden" name="id" value="${loginInfo.id }">
												<input type="text" id="roadFullAddr" name="address" value="${mbean.address }"/>
												<input type="button" onClick="goPopup()" value="검색">
												<form:errors cssClass="err" path="address"></form:errors> 
        										 <input type="hidden" id="siNm" name="address1" value="${mbean.address1 }"/><br> 
        										 <input type="hidden" id="sggNm" name="address2" value="${mbean.address2 }" /><br> 
      											 <input type="hidden" id="emdNm" name="address3" value="${mbean.address3 }"/><br>
										</td>
									</tr>
									</div>
								</table>
							
									<center>
										<button type="submit" class="site-btn register-btn">REGISTER</button>
									</center>
							</form:form>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</td>
</tr>

<%@ include file="./../common/main_bottom.jsp"%>
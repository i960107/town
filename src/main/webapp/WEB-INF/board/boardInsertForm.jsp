<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
insertform
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
<form action="insert.bd" method="post">
	<div class="form-group">
		<label for="exampleInputEmail1">주소 선택</label> <select name="address2"
			style="float: right">
			<option>동을 선택</option>
		</select> <select name="address1" style="float: right">
			<option>시를 선택</option>
		</select>
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">제목</label> <input type="password"
			class="form-control" id="exampleInputPassword1" placeholder="암호">
	</div>
	<div class="form-group">
		<textarea rows="20" cols="100"></textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputFile">파일 업로드</label> <input type="file"
			id="exampleInputFile"> <input type="file"
			id="exampleInputFile"> <input type="file"
			id="exampleInputFile">
		<p class="help-block">이미지는 세개까지 선택가능</p>
	</div>
	<div class="checkbox">
		<label> <input type="checkbox">카테고리 선택
		</label>
	</div>
	<button type="submit" class="btn btn-default">제출</button>
</form>
<form name="form" method="post">
	도로명주소 전체<input   type="text" id="roadFullAddr" name="address" /><input type="button" onClick="goPopup()" value="검색"><br> 
         광역시도명<input type="text" id="siNm" name="address1" /><br> 
         시군구명<input type="text" id="sggNm" name="address2" /><br> 
         읍면동명<input type="text" id="emdNm"   name="address3" /><br>
</form>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
insertform
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
    <label for="exampleInputFile">파일 업로드</label>
    <input type="file" id="exampleInputFile">
    <input type="file" id="exampleInputFile">
    <input type="file" id="exampleInputFile">
  <p class="help-block">이미지는 세개까지 선택가능</p>
  </div>
	<div class="checkbox">
		<label> <input type="checkbox">카테고리 선택
		</label>
	</div>
	<button type="submit" class="btn btn-default">제출</button>
</form>
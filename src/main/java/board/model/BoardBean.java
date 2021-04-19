package board.model;

import javax.validation.constraints.AssertFalse;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class BoardBean {
private int no;
private String writer;
	/* @Pattern(regexp="^[^0]",message="광역시도를 선택하세요") */
@Length(min = 2, message = "주소를 입력하세요")
private String address1;
	/* @Pattern(regexp="^[^0]" ,message="시/군/구를 선택하세요") */
@Length(min = 2, message = "주소를 입력하세요")
private String address2;
@NotBlank(message = "제목은 필수 입력사항입니다.")
private String subject;
@NotNull(message="카테고리 1개 이상 선택해주세요")
private String category;
@NotNull(message = "10자 이상 입력해주세요.")
@Size(min=10, message = "10자 이상 입력해주세요.")
private String contents;
private int ref;
private int reLevel;
private int reStep;
private String regDate;
private int readcount;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getAddress1() {
	return address1;
}
public void setAddress1(String address1) {
	this.address1 = address1;
}
public String getAddress2() {
	return address2;
}
public void setAddress2(String address2) {
	this.address2 = address2;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {

	this.contents = 	contents.replaceAll("\n", "<br>");
}
public int getRef() {
	return ref;
}
public void setRef(int ref) {
	this.ref = ref;
}
public int getReLevel() {
	return reLevel;
}
public void setReLevel(int reLevel) {
	this.reLevel = reLevel;
}
public int getReStep() {
	return reStep;
}
public void setReStep(int reStep) {
	this.reStep = reStep;
}
public String getRegDate() {
	return regDate;
}
public void setRegDate(String regDate) {
	this.regDate = regDate;
}
public int getReadcount() {
	return readcount;
}
public void setReadcount(int readcount) {
	this.readcount = readcount;
}

}

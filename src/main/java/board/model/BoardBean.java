package board.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

public class BoardBean {
private int no;
private String writer;
private String address;
@NotBlank(message = "제목은 필수 입력사항입니다.")
private String subject;
@NotNull(message="카테고리 1개 이상 선택해주세요")
private String category;
@NotNull(message = "10자 이상 입력해주세요.")
@Size(min=10, message = "10자 이상 입력해주세요.")
private String contents;
public BoardBean() {
	super();
	// TODO Auto-generated constructor stub
}
public BoardBean(int no, String writer, String address, String subject, String category, String contents, int ref,
		int reLevel, int reStep, String regDate, int readcount) {
	super();
	this.no = no;
	this.writer = writer;
	this.address = address;
	this.subject = subject;
	this.category = category;
	this.contents = contents;
	this.ref = ref;
	this.reLevel = reLevel;
	this.reStep = reStep;
	this.regDate = regDate;
	this.readcount = readcount;
}
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
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
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
	this.contents = contents;
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
private int ref;
private int reLevel;
private int reStep;
private String regDate;
private int readcount;

}

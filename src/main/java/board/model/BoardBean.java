package board.model;

public class BoardBean {
private int no;
private String writer;
private String address;
private String subject;
private int category;
private String contents;
private String image1;
private String image2;
private String image3;
private int ref;
private int reLevel;
private int reStep;
private String regDate;
private int readcount;
public BoardBean() {
	super();
	// TODO Auto-generated constructor stub
}
public BoardBean(int no, String writer, String address, String subject, int category, String contents, String image1,
		String image2, String image3, int ref, int reLevel, int reStep, String regDate, int readcount) {
	super();
	this.no = no;
	this.writer = writer;
	this.address = address;
	this.subject = subject;
	this.category = category;
	this.contents = contents;
	this.image1 = image1;
	this.image2 = image2;
	this.image3 = image3;
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
public int getCategory() {
	return category;
}
public void setCategory(int category) {
	this.category = category;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public String getImage1() {
	return image1;
}
public void setImage1(String image1) {
	this.image1 = image1;
}
public String getImage2() {
	return image2;
}
public void setImage2(String image2) {
	this.image2 = image2;
}
public String getImage3() {
	return image3;
}
public void setImage3(String image3) {
	this.image3 = image3;
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

package board.model;

public class BoardFileBean {
private int no;
private int bno;
private String fileName;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public int getBno() {
	return bno;
}
public void setBno(int bno) {
	this.bno = bno;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}
public BoardFileBean(int no, int bno, String fileName) {
	super();
	this.no = no;
	this.bno = bno;
	this.fileName = fileName;
}
public BoardFileBean() {
	super();
	// TODO Auto-generated constructor stub
}


}

package board.model;

public class BoardLikeBean {
private int no;
private int townBoardNo;
private String userId;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public int getTownBoardNo() {
	return townBoardNo;
}
public void setTownBoardNo(int townBoardNo) {
	this.townBoardNo = townBoardNo;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public BoardLikeBean(int no, int townBoardNo, String userId) {
	super();
	this.no = no;
	this.townBoardNo = townBoardNo;
	this.userId = userId;
}
public BoardLikeBean() {
	super();
	// TODO Auto-generated constructor stub
}


}

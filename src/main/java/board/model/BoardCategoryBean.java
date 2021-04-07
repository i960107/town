package board.model;

public class BoardCategoryBean {
private int no;
private String categoryName;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public BoardCategoryBean(int no, String categoryName) {
	super();
	this.no = no;
	this.categoryName = categoryName;
}
public BoardCategoryBean() {
	super();
}

}

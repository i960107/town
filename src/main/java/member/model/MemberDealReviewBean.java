package member.model;

import javax.validation.constraints.NotNull;

public class MemberDealReviewBean {
private int no;
private int productNo;
public int getProductNo() {
	return productNo;
}
public void setProductNo(int productNo) {
	this.productNo = productNo;
}
private String sellerId;
private String buyerId;
private String contents;
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
@NotNull(message="별점을 매겨주세요")
private int rating;


private String regDate;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public String getSellerId() {
	return sellerId;
}
public void setSellerId(String sellerId) {
	this.sellerId = sellerId;
}
public String getBuyerId() {
	return buyerId;
}
public void setBuyerId(String buyerId) {
	this.buyerId = buyerId;
}
public int getRating() {
	return rating;
}
public void setRating(int rating) {
	this.rating = rating;
}
public String getRegDate() {
	return regDate;
}
public void setRegDate(String regDate) {
	this.regDate = regDate;
}
}

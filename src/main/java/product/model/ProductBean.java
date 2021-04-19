package product.model;

import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class ProductBean {

	private int no ;
	private String  sellerid ;
	@NotEmpty(message = "제목을 입력하세요")
	private String subject  ;
	@NotNull(message = "카테고리를 선택하세요")
	private int category  ;
	private String address  ;
	@Length(min = 2, message = "주소를 입력하세요")
	private String address1  ;
	@Length(min = 2, message = "주소를 입력하세요")
	private String address2  ;
	private String address3  ;
	private String contents  ;
	
	@Min(value = 1, message = "가격을 입력하세요")
	private int price;
	
	@NotNull(message = "교환여부를 선택하세요")
	private int refundavailability  ;
	private String regdate;
	private int dealstatus  ;
	private int readcount  ;
	private List<MultipartFile> upload;
	private String image1;
	private String filename;
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}

	// mysalelist에서 카테고리 볼라고 넣어둠
	private String categoryName;
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	// 메인에서 디테일뷰 넘어가는것 땜에 넣어둠
	private int rank;
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}

	// 이거 나의당근 찜하기 목록 때문에 넣어둔거!
	private String userid;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	// 메인 인기 키워드 
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRefundavailability() {
		return refundavailability;
	}
	public void setRefundavailability(int refundavailability) {
		this.refundavailability = refundavailability;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getDealstatus() {
		return dealstatus;
	}
	public void setDealstatus(int dealstatus) {
		this.dealstatus = dealstatus;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public ProductBean(int no, String sellerid, String subject, int category, String address, String address1,
			String address2, String address3, String contents, int price, int refundavailability, String regdate,
			int dealstatus, int readcount, List<MultipartFile> upload, String image1) {
		super();
		this.no = no;
		this.sellerid = sellerid;
		this.subject = subject;
		this.category = category;
		this.address = address;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.contents = contents;
		this.price = price;
		this.refundavailability = refundavailability;
		this.regdate = regdate;
		this.dealstatus = dealstatus;
		this.readcount = readcount;
		this.upload = upload;
		this.image1 = image1;
	}
	
	public ProductBean() {
		super();
	}
	
	@Override
	public String toString() {
		return "ProductBean [no=" + no + ", sellerid=" + sellerid + ", subject=" + subject + ", category=" + category
				+ ", address=" + address + ", address1=" + address1 + ", address2=" + address2 + ", address3="
				+ address3 + ", contents=" + contents + ", price=" + price + ", refundavailability="
				+ refundavailability + ", regdate=" + regdate + ", dealstatus=" + dealstatus + ", readcount="
				+ readcount + ", upload=" + upload + ", image1=" + image1 + "]";
	}
	
	
		
	
}

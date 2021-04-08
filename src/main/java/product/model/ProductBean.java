package product.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class ProductBean {

	private int no ;
	private String  sellerid ;
	@NotEmpty(message = "제목을 입력하세요")
	private String subject  ;
	@NotNull(message = "카테고리를 선택하세요")
	private int category  ;
	@NotNull(message = "주소를 입력하세요")
	private String address  ;
	private String image1  ;
	private String image2  ;
	private String image3  ;
	private String contents  ;
	@Min(value = 1, message = "가격을 입력하세요")
	private int price  ;
	@NotNull(message = "교환여부를 선택하세요")
	private int refundavailability  ;
	private String regdate;
	private int dealstatus  ;
	private int readcount  ;
	private MultipartFile upload;
	
	public ProductBean(int no, String sellerid, String subject, int category, String address, String image1,
			String image2, String image3, String contents, int price, int refundavailability, String regdate,
			int dealstatus, int readcount, MultipartFile upload) {
		super();
		this.no = no;
		this.sellerid = sellerid;
		this.subject = subject;
		this.category = category;
		this.address = address;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.contents = contents;
		this.price = price;
		this.refundavailability = refundavailability;
		this.regdate = regdate;
		this.dealstatus = dealstatus;
		this.readcount = readcount;
		this.upload = upload;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.image1 = upload.getOriginalFilename();
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
	public ProductBean(int no, String sellerid, String subject, int category, String address, String image1,
			String image2, String image3, String contents, int price, int refundavailability, String regdate,
			int dealstatus, int readcount) {
		super();
		this.no = no;
		this.sellerid = sellerid;
		this.subject = subject;
		this.category = category;
		this.address = address;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.contents = contents;
		this.price = price;
		this.refundavailability = refundavailability;
		this.regdate = regdate;
		this.dealstatus = dealstatus;
		this.readcount = readcount;
	}
	public ProductBean() {
		super();
	}
	
	
}

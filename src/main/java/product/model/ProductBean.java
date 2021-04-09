package product.model;

import java.util.List;

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
	private String contents  ;
	@Min(value = 1, message = "가격을 입력하세요")
	private int price  ;
	@NotNull(message = "교환여부를 선택하세요")
	private int refundavailability  ;
	private String regdate;
	private int dealstatus  ;
	private int readcount  ;
	private List<MultipartFile> upload;
	private String image1;
	
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
	public ProductBean(int no, String sellerid, String subject, int category, String address, String contents,
			int price, int refundavailability, String regdate, int dealstatus, int readcount,
			List<MultipartFile> upload, String image1) {
		super();
		this.no = no;
		this.sellerid = sellerid;
		this.subject = subject;
		this.category = category;
		this.address = address;
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
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	
		
	
}

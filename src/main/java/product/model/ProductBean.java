package product.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class ProductBean {

	private int no ;
	private String  seller_id ;
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
	private int refund_availability  ;
	private String reg_date;
	private int deal_status  ;
	private int readcount  ;
	private MultipartFile upload;
	
	public ProductBean(int no, String seller_id, String subject, int category, String address, String image1,
			String image2, String image3, String contents, int price, int refund_availability, String reg_date,
			int deal_status, int readcount, MultipartFile upload) {
		super();
		this.no = no;
		this.seller_id = seller_id;
		this.subject = subject;
		this.category = category;
		this.address = address;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.contents = contents;
		this.price = price;
		this.refund_availability = refund_availability;
		this.reg_date = reg_date;
		this.deal_status = deal_status;
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
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
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
	public int getRefund_availability() {
		return refund_availability;
	}
	public void setRefund_availability(int refund_availability) {
		this.refund_availability = refund_availability;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getDeal_status() {
		return deal_status;
	}
	public void setDeal_status(int deal_status) {
		this.deal_status = deal_status;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public ProductBean(int no, String seller_id, String subject, int category, String address, String image1,
			String image2, String image3, String contents, int price, int refund_availability, String reg_date,
			int deal_status, int readcount) {
		super();
		this.no = no;
		this.seller_id = seller_id;
		this.subject = subject;
		this.category = category;
		this.address = address;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.contents = contents;
		this.price = price;
		this.refund_availability = refund_availability;
		this.reg_date = reg_date;
		this.deal_status = deal_status;
		this.readcount = readcount;
	}
	public ProductBean() {
		super();
	}
	
	
}

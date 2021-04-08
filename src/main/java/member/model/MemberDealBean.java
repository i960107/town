package member.model;

public class MemberDealBean {
	
	private int no;
	private int productNo;
	private String sellerId;
	private String buyerId;
	private int dealStatus;
	private String dealDate;
	
	public MemberDealBean() {
		super();
	}

	public MemberDealBean(int no, int productNo, String sellerId, String buyerId, int dealStatus, String dealDate) {
		super();
		this.no = no;
		this.productNo = productNo;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.dealStatus = dealStatus;
		this.dealDate = dealDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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

	public int getDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(int dealStatus) {
		this.dealStatus = dealStatus;
	}

	public String getDealDate() {
		return dealDate;
	}

	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}
	
	
	

}

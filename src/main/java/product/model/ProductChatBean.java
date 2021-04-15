package product.model;

public class ProductChatBean {

	private int pno  ;
	private String sellerid ;
	private String buyerid ;
	private String contents ;
	private String regdate ;
	private String chatno ;
	
	public ProductChatBean() {
		super();
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getsellerid() {
		return sellerid;
	}
	public void setsellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public String getbuyerid() {
		return buyerid;
	}
	public void setbuyerid(String buyerid) {
		this.buyerid = buyerid;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getregdate() {
		return regdate;
	}
	public void setregdate(String regdate) {
		this.regdate = regdate;
	}
	public String getChatno() {
		return chatno;
	}
	public void setChatno(String chatno) {
		this.chatno = chatno;
	}
	public ProductChatBean(int pno, String sellerid, String buyerid, String contents, String regdate,
			String chatno) {
		super();
		this.pno = pno;
		this.sellerid = sellerid;
		this.buyerid = buyerid;
		this.contents = contents;
		this.regdate = regdate;
		this.chatno = chatno;
	}
	
	
}
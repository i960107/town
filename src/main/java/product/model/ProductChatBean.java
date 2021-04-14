package product.model;

public class ProductChatBean {

	private int pno  ;
	private String sellerid ;
	private String buyerid ;
	private String contents ;
	private String reg_date ;
	private String chatno ;
	
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getChatno() {
		return chatno;
	}
	public void setChatno(String chatno) {
		this.chatno = chatno;
	}
	public ProductChatBean(int pno, String sellerid, String buyerid, String contents, String reg_date,
			String chatno) {
		super();
		this.pno = pno;
		this.sellerid = sellerid;
		this.buyerid = buyerid;
		this.contents = contents;
		this.reg_date = reg_date;
		this.chatno = chatno;
	}
	
	
}

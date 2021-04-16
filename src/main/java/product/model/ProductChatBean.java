package product.model;

public class ProductChatBean {

	private int no ;
	private int pno  ;
	private String sellerid ;
	private String buyerid ;
	private int room;
	private String subject;
	private String contents ;
	private String regdate ;
	private String talker;
	
	public String getTalker() {
		return talker;
	}
	public void setTalker(String talker) {
		this.talker = talker;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getSellerid() {
		return sellerid;
	}
	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}
	public String getBuyerid() {
		return buyerid;
	}
	public void setBuyerid(String buyerid) {
		this.buyerid = buyerid;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public ProductChatBean(int no, int pno, String sellerid, String buyerid, int room, String subject, String contents,
			String regdate, String talker) {
		super();
		this.no = no;
		this.pno = pno;
		this.sellerid = sellerid;
		this.buyerid = buyerid;
		this.room = room;
		this.subject = subject;
		this.contents = contents;
		this.regdate = regdate;
		this.talker = talker;
	}
	public ProductChatBean() {
		super();
	}
	
	

}
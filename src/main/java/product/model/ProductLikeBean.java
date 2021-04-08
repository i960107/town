package product.model;

public class ProductLikeBean {

	private int no  ;
	private int productno  ;
	private String userid  ;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public ProductLikeBean(int no, int productno, String userid) {
		super();
		this.no = no;
		this.productno = productno;
		this.userid = userid;
	}
	public ProductLikeBean() {
		super();
	}
	
	
}

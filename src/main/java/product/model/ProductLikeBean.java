package product.model;

public class ProductLikeBean {

	private int no  ;
	private int product_no  ;
	private String user_id  ;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public ProductLikeBean(int no, int product_no, String user_id) {
		super();
		this.no = no;
		this.product_no = product_no;
		this.user_id = user_id;
	}
	public ProductLikeBean() {
		super();
	}
	
	
}

package product.model;

public class ProductFileBean {

	private int no ;
	private int pno ;
	private String filename;
	
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public ProductFileBean(int no, int pno, String filename) {
		super();
		this.no = no;
		this.pno = pno;
		this.filename = filename;
	}
	public ProductFileBean() {
		super();
	}
	
	
	
}

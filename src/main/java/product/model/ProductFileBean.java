package product.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductFileBean {

	private int no ;
	private int pno ;
	private String filename;
	private List<String> filetemp;
	
	public ProductFileBean(int no, int pno, String filename, List<String> filetemp) {
		super();
		this.no = no;
		this.pno = pno;
		this.filename = filename;
		this.filetemp = filetemp;
	}
	public List<String> getFiletemp() {
		return filetemp;
	}
	public void setFiletemp(List<String> filetemp) {
		this.filetemp = filetemp;
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

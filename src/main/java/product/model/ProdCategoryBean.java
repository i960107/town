package product.model;

import org.hibernate.validator.constraints.NotEmpty;

public class ProdCategoryBean {
	
	private int pcno;
	
	@NotEmpty(message = "카테고리명은 필수입니다.")
	private String pcname;
	
	public ProdCategoryBean() {
		super();
	}

	public ProdCategoryBean(int pcno, String pcname) {
		super();
		this.pcno = pcno;
		this.pcname = pcname;
	}

	public int getPcno() {
		return pcno;
	}

	public void setPcno(int pcno) {
		this.pcno = pcno;
	}

	public String getPcname() {
		return pcname;
	}

	public void setPcname(String pcname) {
		this.pcname = pcname;
	}
	
	
	
	

}

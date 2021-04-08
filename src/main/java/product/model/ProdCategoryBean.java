package product.model;

import org.hibernate.validator.constraints.NotEmpty;

public class ProdCategoryBean {
	
	private String pcno;
	
	@NotEmpty(message = "카테고리명은 필수입니다.")
	private String pcname;
	
	public ProdCategoryBean() {
		super();
	}

	public ProdCategoryBean(String pcno, String pcname) {
		super();
		this.pcno = pcno;
		this.pcname = pcname;
	}

	public String getPcno() {
		return pcno;
	}

	public void setPcno(String pcno) {
		this.pcno = pcno;
	}

	public String getPcname() {
		return pcname;
	}

	public void setPcname(String pcname) {
		this.pcname = pcname;
	}
	
	
	
	

}

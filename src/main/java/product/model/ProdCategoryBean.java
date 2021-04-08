package product.model;

import org.hibernate.validator.constraints.NotEmpty;

public class ProdCategoryBean {
	

	
	@NotEmpty(message = "카테고리명은 필수입니다.")
	private String pcname;
	private int no;
	private String categoryName;

	public ProdCategoryBean() {
		super();
	}

	public ProdCategoryBean(int no, String categoryName) {

		super();
		this.no = no;
		this.categoryName = categoryName;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	
	

}

package product.model;

public class ProductKeywordBean {
	
	private int no;
	private String keyword;
	private int count;
	
	public ProductKeywordBean() {
		super();
	}

	public ProductKeywordBean(int no, String keyword, int count) {
		super();
		this.no = no;
		this.keyword = keyword;
		this.count = count;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	

}

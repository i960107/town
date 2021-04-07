package product.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myProductDao")
public class ProductDao {

	private String nameSpace = "product.model.ProductBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductBean> getList(){
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".getList");
		return lists;
	}

	public int insertProduct(ProductBean productbean) {
		System.out.println(productbean.getAddress());
		System.out.println(productbean.getImage1());
		int cnt = sqlSessionTemplate.insert(nameSpace+".insertProduct", productbean);
		return cnt;
	}
}

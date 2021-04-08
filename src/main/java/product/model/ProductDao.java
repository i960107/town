package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myProductDao")
public class ProductDao {

	private String nameSpace = "product.model.ProductBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductBean> getList(Map<String, String> map){
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".getList", map);
		return lists;
	}

	public int insertProduct(ProductBean productbean) {
		System.out.println(productbean.getAddress());
		System.out.println(productbean.getImage1());
		int cnt = sqlSessionTemplate.insert(nameSpace+".insertProduct", productbean);
		return cnt;
	}

	public ProductBean getProduct(int no) {
		ProductBean pBean = new ProductBean();
		pBean = sqlSessionTemplate.selectOne(nameSpace+".getProduct", no);
		return pBean;
	}

	public int getLike(int no) {
		int likeCnt = sqlSessionTemplate.selectOne(nameSpace+".getLike", no);
		
		return likeCnt;
	}
}

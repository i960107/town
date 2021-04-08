package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberDealBean;

@Component("myProductDao")
public class ProductDao {

	private String nameSpace = "product.model.ProductBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//전체 리스트 호출
	public List<ProductBean> getList(Map<String, String> map){
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".getList", map);
		return lists;
	}

	//상품 등록
	public int insertProduct(ProductBean productbean) {
		System.out.println(productbean.getAddress());
		System.out.println(productbean.getImage1());
		int cnt = sqlSessionTemplate.insert(nameSpace+".insertProduct", productbean);
		return cnt;
	}

	//상품 상세보기
	public ProductBean getProduct(int no) {
		ProductBean pBean = new ProductBean();
		pBean = sqlSessionTemplate.selectOne(nameSpace+".getProduct", no);
		return pBean;
	}

	//상품 찜하기 체크용 - productLike 전체 호출
	public List<ProductLikeBean> getLike(int no) {
		List<ProductLikeBean> likeList = new ArrayList<ProductLikeBean>();
		likeList = sqlSessionTemplate.selectList(nameSpace+".getLike", no);
		
		return likeList;
	}

	//상품 찜하기
	public void productLike(ProductLikeBean likeBean) {
		sqlSessionTemplate.insert(nameSpace+".productLike", likeBean);
	}

	//상품 싫어요
	public void productunLike(int no) {
		sqlSessionTemplate.delete(nameSpace+".productunLike", no);
	}

	//조회수 증가
	public void incrementReadCount(int no) {
		sqlSessionTemplate.update(nameSpace+".incrementReadCount", no);
	}

	// 나의당근 - 판매내역 
	public List<ProductBean> getListById(String loginID) {
		 List<ProductBean> lists = new ArrayList<ProductBean>();
		 lists = sqlSessionTemplate.selectList(nameSpace+".getListById",loginID);
		return lists;
	}

}

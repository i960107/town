package product.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import category.model.ProdCateBean;
import main.model.MainBean;
import member.model.MemberBean;
import member.model.MemberDealBean;

@Component("myProductDao")
public class ProductDao {

	private String nameSpace = "product.model.ProductBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//메인 검색어 입력
	public List<ProductBean> getSearchList(Map<Object, String> map) {
		List<ProductBean> searchList = new ArrayList<ProductBean>();
		System.out.println("map keyword ck : " + map.get("keyword"));
		searchList = sqlSessionTemplate.selectList(nameSpace+".getSearchList", map);
		System.out.println("searchList" + searchList);
		return searchList;
	}
	
	//메인 인기상품
	public List<ProductBean> getPopList() {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".getPopList");
		return lists;
	}
	
	//전체 리스트 호출
	public List<ProductBean> getList(){
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".getList");
		return lists;
	}

	//상품 등록
	public int insertProduct(ProductBean productbean) {
		System.out.println(productbean.getAddress());
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
	

	//-----파일 업로드-----
	public void fileUpload(String originalfileName, String saveFileName, int pno) {
		 Map<String, Object> hm = new HashMap<String, Object>();
		    hm.put("originalfileName", originalfileName);
		    hm.put("saveFileName", saveFileName);
		    hm.put("pno", pno);
		    sqlSessionTemplate.insert(nameSpace+".fileUpload", hm);
	}

	public int getPno() {
		int pno = sqlSessionTemplate.selectOne(nameSpace+".getPno");
		return pno;
	}

	public void fileUpload2(String saveFileName, int pno) {
		Map<String, Object> hm = new HashMap<String, Object>();
	    hm.put("saveFileName", saveFileName);
	    hm.put("pno", pno);
		sqlSessionTemplate.update(nameSpace+".fileUpload2", hm);
	}
	//-----파일 업로드-----

	public List<ProductFileBean> getFile(int no) {
		List<ProductFileBean> fileList = new ArrayList<ProductFileBean>();
		fileList = sqlSessionTemplate.selectList(nameSpace+".getFile", no);
		return fileList;
	}

	// 나의 당근 - 구매내역
	public List<MemberDealBean> getPurListById(String loginID) {
		List<MemberDealBean> lists = new ArrayList<MemberDealBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".GetPurListById",loginID);
		
		return lists;
	}


	public MemberBean getSellerInfo(String sellerid) {
		MemberBean mbean = new MemberBean();
		mbean = sqlSessionTemplate.selectOne(nameSpace+".getSellerInfo", sellerid);
		return mbean;
	}

	public List<ProdCateBean> getAllCategory() {
		List<ProdCateBean> cateList = new ArrayList<ProdCateBean>();
		cateList = sqlSessionTemplate.selectList(nameSpace+".getAllCategory");
		return cateList;
	}

	public List<ProductBean> getLikeProdList(String loginID) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".GetLikeProdList",loginID);
		
		return lists;
	}


	public int updateProduct(ProductBean pbean) {
		int cnt = sqlSessionTemplate.update(nameSpace+".updateProduct", pbean);
		return cnt;
	}

	public int deleteFile(String filename) {
		int cnt = sqlSessionTemplate.delete(nameSpace+".deleteFile", filename);
		return cnt;
	}
	
	public int deleteByNo(int pno) {
		System.out.println("삭제하러 dao왔어?");
		int delCnt = sqlSessionTemplate.delete(nameSpace+".deleteByNo",pno);
		return delCnt;
	}

	public int upDealStatus(ProductBean pbean) {
		int upDealCnt = sqlSessionTemplate.update(nameSpace+".upDealStatus",pbean);
		System.out.println("upDealCnt:"+upDealCnt);
		return 0;
	}

	public List<ProductChatBean> getChat(ProductChatBean cbean) {
		List<ProductChatBean> clist = new ArrayList<ProductChatBean>();
		int cnt = sqlSessionTemplate.selectOne(nameSpace+".checkChat", cbean);
		if(cnt==0) {
			sqlSessionTemplate.insert(nameSpace+".createChat", cbean);
		}
		clist = sqlSessionTemplate.selectList(nameSpace+".getChat", cbean);
		return clist;
	}




}
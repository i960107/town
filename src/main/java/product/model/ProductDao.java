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
import member.model.MemberBean;
import member.model.MemberDealBean;

@Component("myProductDao")
public class ProductDao {

	private String nameSpace = "product.model.ProductBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 메인 검색어 입력
	public List<ProductBean> getSearchList(Map<Object, String> map) {
		List<ProductBean> searchList = new ArrayList<ProductBean>();
		System.out.println("map keyword ck : " + map.get("keyword"));
		searchList = sqlSessionTemplate.selectList(nameSpace + ".getSearchList", map);
		System.out.println("searchList" + searchList);
		return searchList;
	}

	// 메인 인기상품
	public List<ProductBean> getPopList() {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(nameSpace + ".getPopList");
		return lists;
	}

	// 전체 리스트 호출
	public List<ProductBean> getList(String keyword, String category, String address1, String address2) {
		List<ProductBean> lists = new ArrayList<ProductBean>();

		// parameter로 넘길 map 설정
		Map<String, Object> map = new HashMap<String, Object>();
		if (keyword != null) {
			map.put("keyword", "%" + keyword + "%");
		} else {
			map.put("keyword", null);
		}
		List<String> cateList = null;
		if (category != null) {
			cateList = new ArrayList<String>();
			String[] cateArr = category.split(",");
			for (String c : cateArr) {

				cateList.add(c);
			}
		}
		map.put("category", cateList);
		map.put("address1", address1);
		map.put("address2", address2);
		lists = sqlSessionTemplate.selectList(nameSpace + ".getList",map);
		return lists;
	}

	// 상품 등록
	public int insertProduct(ProductBean productbean) {
		System.out.println(productbean.getAddress());
		int cnt = sqlSessionTemplate.insert(nameSpace + ".insertProduct", productbean);
		return cnt;
	}

	// 상품 상세보기
	public ProductBean getProduct(int no) {
		ProductBean pBean = new ProductBean();
		pBean = sqlSessionTemplate.selectOne(nameSpace + ".getProduct", no);
		return pBean;
	}

	// 상품 찜하기 체크용 - productLike 전체 호출
	public List<ProductLikeBean> getLike(int no) {
		List<ProductLikeBean> likeList = new ArrayList<ProductLikeBean>();
		likeList = sqlSessionTemplate.selectList(nameSpace + ".getLike", no);

		return likeList;
	}

	// 상품 찜하기
	public void productLike(ProductLikeBean likeBean) {
		sqlSessionTemplate.insert(nameSpace + ".productLike", likeBean);
	}

	// 상품 싫어요
	public void productunLike(int no) {
		sqlSessionTemplate.delete(nameSpace + ".productunLike", no);
	}

	// 조회수 증가
	public void incrementReadCount(int no) {
		sqlSessionTemplate.update(nameSpace + ".incrementReadCount", no);
	}

	// 나의당근 - 판매내역
	public List<ProductBean> getListById(String loginID) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(nameSpace + ".getListById", loginID);
		return lists;
	}

	// -----파일 업로드-----
	public void fileUpload(String originalfileName, String saveFileName, int pno) {
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("originalfileName", originalfileName);
		hm.put("saveFileName", saveFileName);
		hm.put("pno", pno);
		sqlSessionTemplate.insert(nameSpace + ".fileUpload", hm);
	}

	public int getPno() {
		int pno = sqlSessionTemplate.selectOne(nameSpace + ".getPno");
		return pno;
	}

	public void fileUpload2(String saveFileName, int pno) {
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("saveFileName", saveFileName);
		hm.put("pno", pno);
		sqlSessionTemplate.update(nameSpace + ".fileUpload2", hm);
	}
	// -----파일 업로드-----

	public List<ProductFileBean> getFile(int no) {
		List<ProductFileBean> fileList = new ArrayList<ProductFileBean>();
		fileList = sqlSessionTemplate.selectList(nameSpace + ".getFile", no);
		return fileList;
	}

	// 나의 당근 - 구매내역
	public List<MemberDealBean> getPurListById(String loginID) {
		List<MemberDealBean> lists = new ArrayList<MemberDealBean>();
		lists = sqlSessionTemplate.selectList(nameSpace + ".GetPurListById", loginID);

		return lists;
	}

	public MemberBean getSellerInfo(String sellerid) {
		MemberBean mbean = new MemberBean();
		mbean = sqlSessionTemplate.selectOne(nameSpace + ".getSellerInfo", sellerid);
		return mbean;
	}

	public List<ProdCateBean> getAllCategory() {
		List<ProdCateBean> cateList = new ArrayList<ProdCateBean>();
		cateList = sqlSessionTemplate.selectList(nameSpace + ".getAllCategory");
		return cateList;
	}

	public List<ProductBean> getLikeProdList(String loginID) {
		List<ProductBean> lists = new ArrayList<ProductBean>();
		lists = sqlSessionTemplate.selectList(nameSpace + ".GetLikeProdList", loginID);

		return lists;
	}

	public int updateProduct(ProductBean pbean) {
		int cnt = sqlSessionTemplate.update(nameSpace + ".updateProduct", pbean);
		return cnt;
	}

	public int deleteFile(ProductFileBean fbean) {
		int cnt = sqlSessionTemplate.delete(nameSpace + ".deleteFile", fbean);
		return cnt;
	}

	public int deleteByNo(int pno) {
		System.out.println("삭제하러 dao왔어?");
		int delCnt = sqlSessionTemplate.delete(nameSpace + ".deleteByNo", pno);
		return delCnt;
	}

	public int upDealStatus(ProductBean pbean) {
		int upDealCnt = sqlSessionTemplate.update(nameSpace + ".upDealStatus", pbean);
		System.out.println("upDealCnt:" + upDealCnt);
		return 0;
	}

	// 채팅 시작
	public List<ProductChatBean> getChat(ProductChatBean cbean) {
		List<ProductChatBean> clist = new ArrayList<ProductChatBean>();
		int cnt = sqlSessionTemplate.selectOne(nameSpace + ".checkChat", cbean); // 채팅방 있는지 탐색
		if (cnt == 0) { // 없으면 만듬
			sqlSessionTemplate.insert(nameSpace + ".createChat", cbean);
		}
		clist = sqlSessionTemplate.selectList(nameSpace + ".getChat", cbean); // 채팅 내역 불러옴
		return clist;
	}

	// 채팅 입력
	public void insertChat(ProductChatBean cbean) {
		sqlSessionTemplate.insert(nameSpace + ".insertChat", cbean);
	}

	// 채팅 리스트 호출
	public List<ProductChatBean> getChatList(String id) {
		List<ProductChatBean> clist = new ArrayList<ProductChatBean>();
		clist = sqlSessionTemplate.selectList(nameSpace + ".getChatList", id);
		return clist;
	}

	// 채팅방 정보 호출
	public ProductChatBean getChatInfo(ProductChatBean room) {
		ProductChatBean cbean = sqlSessionTemplate.selectOne(nameSpace + ".getChatInfo", room);
		return cbean;
	}

	// 키워드 입력값 DB 삽입
	public void inputKeyword(ProductKeywordBean keywordBean) {
		sqlSessionTemplate.insert(nameSpace + ".inputKeyword", keywordBean);
	}

	// 키워드 존재 여부 확인
	public boolean isKeyword(String keyword) {
		int keywordCnt = sqlSessionTemplate.selectOne(nameSpace + ".getKeyword", keyword);
		return keywordCnt > 0;
	}

	// 키워드 중복 입력 시 count up
	public void upKeywordCnt(String keyword) {
		int upKeywordCnt = sqlSessionTemplate.update(nameSpace + ".upKeywordCnt", keyword);

	}

	/* 인기 키워드 리스트 */
	public List<ProductBean> getKeywordList() {
		List<ProductBean> klist = new ArrayList<ProductBean>();
		klist = sqlSessionTemplate.selectList(nameSpace + ".getKeywordList");
		return klist;
	}

	// memberDeal 삽입
	public int insertDeal(MemberDealBean mdbean) {
		int cnt = sqlSessionTemplate.insert(nameSpace + ".insertDeal", mdbean);
		System.out.println("memberDeal insert Cnt:" + cnt);
		return cnt;
	}

	// 카테고리 호출
	public List<ProdCategoryBean> getAllPrdCategory() {
		List<ProdCategoryBean> clist = new ArrayList<ProdCategoryBean>();
		clist = sqlSessionTemplate.selectList(nameSpace + ".getAllPrdCategory");
		return clist;
	}

	public ProductFileBean getFileNameMin(int pno) {
		ProductFileBean fbean = sqlSessionTemplate.selectOne(nameSpace+".getFileNameMin", pno);
		return fbean;
	}

}
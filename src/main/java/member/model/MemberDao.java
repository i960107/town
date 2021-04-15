package member.model;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.model.BoardBean;
import product.model.ProductBean;

@Component("MyMemberDao")
public class MemberDao {

	private String nameSpace = "member.model.MemberBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// MLoginController -> 아이디 있는지 체크
	public MemberBean loginCkId(MemberBean mbean) {
		MemberBean midBean = sqlSessionTemplate.selectOne(nameSpace + ".LoginCkId", mbean);
		return midBean;
	}

	public List<MemberBean> getAllData() {
		List<MemberBean> lists = new ArrayList<MemberBean>();
		
		lists = sqlSessionTemplate.selectList(nameSpace+".GetAllData");
		
		return lists;
	}

	public int register(MemberBean mbean) {
		int cnt = sqlSessionTemplate.insert(nameSpace+".Register",mbean);
		sqlSessionTemplate.insert(nameSpace+".mannerTemp", mbean);
		System.out.println("회원가입 cnt :"+cnt);
		
		return cnt;
	}

	//ProductDetailView - 회원정보 검색
	public MemberBean getMember(String sellerid) {
		MemberBean mBean = new MemberBean();
		mBean = sqlSessionTemplate.selectOne(nameSpace+".getMember", sellerid);
		return mBean;
	}

	//회원정보 업데이트
	public int memberModify(MemberBean mbean) {
		int upCnt = sqlSessionTemplate.update(nameSpace+".MemberModify", mbean);
		System.out.println("업데이트 cnt:"+upCnt);
		return upCnt;
	}

	//매너온도
	public float getTemp(String id) {
		float mtemp = sqlSessionTemplate.selectOne(nameSpace+".getTemp", id);
		return mtemp;
	}

	//판매자 상품 상세보기
	public List<ProductBean> getAllProductByID(String sellerid) {
		List<ProductBean> plists = new ArrayList<ProductBean>();
		plists = sqlSessionTemplate.selectList(nameSpace+".getAllProductByID", sellerid);
		return plists;
	}
	//판매자 글 보기
	public List<BoardBean> getBoardById(String writer) {
		List<BoardBean> blists = new ArrayList<BoardBean>();
		blists = sqlSessionTemplate.selectList(nameSpace+".getBoardById", writer);
		return blists;
	}

	public void insertDealReview(MemberDealReviewBean bean) {
		sqlSessionTemplate.selectList(nameSpace+".insertDealReview", bean);
	}

	public void updateMannertemp(String sellerId, int rating) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("sellerId", sellerId);
		map.put("rating", rating);
		System.out.println(map.get("sellerId"));
		System.out.println(map.get("rating"));
		sqlSessionTemplate.selectList(nameSpace+".updateMannertemp", map);
	}
	
	//신고하기
	public int reportUser(MemberReportBean reportBean) {
		int cnt = sqlSessionTemplate.insert(nameSpace+".reportUser", reportBean);
		System.out.println("insert Cnt:"+cnt);
		return cnt;
	}

	//신고하기 갯수 가져오기
	public int getReportCnt(String reported_userid, int count) {
		int reportCnt = sqlSessionTemplate.selectOne(nameSpace+".getReportCnt");
		return reportCnt;
	}
	
	// memberTable count 업데이트
	public void getUpCount(String reported_userid) {
		int upCountmember = sqlSessionTemplate.update(nameSpace+".getUpCount",reported_userid);
			System.out.println("멤버 신고하기 갯수 업데이트:"+upCountmember);
	}
	
	// memberTable status 업데이트
	public int getUpStatus(MemberBean mbean) {
		int upStatus = sqlSessionTemplate.update(nameSpace+".getUpStatus", mbean);
		System.out.println("upStatus:" + upStatus);
		return 0;
	}

	public int kakaoLogin(MemberBean mbean) {
		int ck = sqlSessionTemplate.selectOne(nameSpace+".ckkakaoLogin", mbean);
		return ck;
	}

	public int kakaoRegister(MemberBean mbean) {
		int cnt = sqlSessionTemplate.insert(nameSpace+".kakaoRegister", mbean);
		sqlSessionTemplate.insert(nameSpace+".mannerTemp", mbean);
		return cnt;
	}



}

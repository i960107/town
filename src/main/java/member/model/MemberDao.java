package member.model;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

	
	
	
	

}

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
	public MemberBean loginCkId(String id) {
		MemberBean midBean = sqlSessionTemplate.selectOne(nameSpace + ".LoginCkId", id);
		return midBean;
	}

	public List<MemberBean> getAllData() {
		List<MemberBean> lists = new ArrayList<MemberBean>();
		
		lists = sqlSessionTemplate.selectList(nameSpace+".GetAllData");
		
		return lists;
	}
	
	
	
	

}

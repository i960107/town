package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyMemberDao")
public class MemberDao {

	private String nameSpace = "member.model.MemberBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
}

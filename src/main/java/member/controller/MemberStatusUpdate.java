package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberStatusUpdate {
	
	private final String command = "memberStatusUpdate.mb";
	private final String getPage = "redirect:/memberList.mb";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="id", required = true) String id,
			@RequestParam(value="memberstatus", required = true) String memberstatus) {
		System.out.println("updateReport id:" + id);
		System.out.println("updateReport memberstatus:" + memberstatus);
		
		MemberBean mbean = new MemberBean();
		mbean.setId(id);
		mbean.setMemberstatus(memberstatus);
		System.out.println("mbean.getId():" + mbean.getId());
		System.out.println("mbean.getMemberstatus():" + mbean.getMemberstatus());
		
		if(memberstatus.equals("1")) { // 활동 가능
			mbean.setMemberstatus("0");
		}
		if(memberstatus.equals("0")) { // 활동 불가
			mbean.setMemberstatus("1");
		}
		
		int upStatus = mdao.getUpStatus(mbean);

		return getPage;
	}
	
}

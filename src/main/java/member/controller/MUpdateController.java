package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MUpdateController {
	
	private final String command = "memberUpdate.mb";
	private final String getPage = "memberUpdateForm";
	
	@Autowired
	MemberDao mdao;
	
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet(HttpSession session, Model model) {
		
		// 로그인한 아이디 가져오기 
		MemberBean midBean = (MemberBean) session.getAttribute("loginInfo");
		
		
		MemberBean mbean = mdao.loginCkId(midBean);
		
		model.addAttribute("mbean", mbean);
		
		return getPage;
	}
	
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String doActionPost() {
		
		return getPage;
	}

}

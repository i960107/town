package product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import member.model.MemberDao;
import member.model.MemberDealBean;

@Controller
public class PMyPurchaseController {
	
	private final String command = "myPurchaseList.prd";
	private final String getPage = "myPurchaseList";

	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session, Model model) {
		
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		String loginID = member.getId();
		
		List<MemberDealBean> lists = mdao.getListById(loginID);
		
		model.addAttribute("saleLists", lists);
		
		return getPage;
	}
}

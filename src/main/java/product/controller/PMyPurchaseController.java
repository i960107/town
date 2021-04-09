package product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import member.model.MemberDealBean;
import product.model.ProductDao;

@Controller
public class PMyPurchaseController {

	private final String command ="/myPurchaselist.prd";
	private final String getPage ="productMyPurchaseList";
	
	@Autowired
	ProductDao pdao;
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session,Model model) {
		
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		String loginID = member.getId();
		
		List<MemberDealBean> mdlists =pdao.getPurListById(loginID);
		
		model.addAttribute("mdlists", mdlists);
		
		return getPage;
	}

	
}

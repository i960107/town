package product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class PMySaleListController {
	
	private final String command = "/mySaleList.prd";
	private final String getPage = "productMySaleList";
	
	@Autowired
	ProductDao pdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(HttpSession session, Model model) {
		
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		String loginID = member.getId();
		
		List<ProductBean> pbean = pdao.getListById(loginID);
		model.addAttribute("mySaleLists", pbean);
		model.addAttribute("sellerid", loginID);
		
		return getPage;
	}

}

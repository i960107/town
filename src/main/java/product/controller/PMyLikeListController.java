package product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductLikeBean;

@Controller
public class PMyLikeListController {
	
	private final String command = "mylikeList.prd";
	private final String getPage = "productMyLikeList";
	
	@Autowired
	ProductDao pdao;
	
		
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(HttpSession session, Model model) {
		
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		String loginID = member.getId();
		
		System.out.println("찜하기 아이디 :"+loginID);
		
		// 찜한 상품 리스트 가져오기
		List<ProductBean> prodLikeLists = pdao.getLikeProdList(loginID);
		
		System.out.println("찜하기 제목:"+prodLikeLists.get(0).getSubject());
		
		model.addAttribute("plLists", prodLikeLists);	
		return getPage;
	}

}

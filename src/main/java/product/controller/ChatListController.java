package product.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import product.model.ProductChatBean;
import product.model.ProductDao;

@Controller
public class ChatListController {

	private final String command = "chatList.prd";
	private final String getPage = "productChatList";
	private final String gotoPage = "";
	
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(
			HttpSession session
			) {
		
		ModelAndView mav = new ModelAndView();
		MemberBean mbean = (MemberBean) session.getAttribute("loginInfo");
		if (mbean == null) {
			//로그인 페이지 로그인하고 다시 나의당근으로 가기 
			mav.setViewName("redirect:memberlogin.mb");
			mav.addObject("plzLogin", false);
			session.setAttribute("destination", "redirect:pWrite.prd");
			return mav;
		}
		String id = mbean.getId();
		mav.setViewName(getPage);
		System.out.println(id);
		List<ProductChatBean> rooms = pDao.getChatList(id);
		List<ProductChatBean> clist = new ArrayList<ProductChatBean>();
		System.out.println("----chat property test-----");
		for(ProductChatBean room : rooms) {
			ProductChatBean cbean = pDao.getChatInfo(room);	
			//System.out.println(cbean.getSubject());
			clist.add(cbean);
		}
		mav.addObject("clist", clist);
		mav.addObject("mbean", mbean);
		return mav;
	}
}

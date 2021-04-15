package chatList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			HttpSession session
			) {
		
		ModelAndView mav = new ModelAndView();
		MemberBean mbean = (MemberBean) session.getAttribute("loginInfo");
		String id = mbean.getId();
		mav.setViewName(getPage);
		
		List<ProductChatBean> clist = pDao.getChatList(id);
		
		mav.addObject("clist", clist);
		mav.addObject("mbean", mbean);
		return mav;
	}
}

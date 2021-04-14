package product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import category.model.ProdCateBean;
import member.model.MemberBean;
import product.model.ProductChatBean;
import product.model.ProductDao;

@Controller
public class PReply {

	// 상품 올리기
		private final String command = "reply.prd";
		private final String getPage = "productReplyForm";
		private final String gotoPage = "redirect:saleList.prd";
		
		@Autowired
		ProductDao pDao;
		
		//채팅 : session login id/ seller의 아이디와 상품 no를 get으로 넘겨줘야 함
		@RequestMapping(value = command, method = RequestMethod.GET)
		public ModelAndView doAction(
				HttpSession session, 
				HttpServletResponse response,
				@RequestParam("sellerid") String sellerid,
				@RequestParam("no") int pno
				) throws IOException {
			ModelAndView mav = new ModelAndView();

			
			//글쓰기 로그인 체크
			MemberBean member = (MemberBean) session.getAttribute("loginInfo");

			if (member == null) {
				//로그인 페이지 로그인하고 다시 나의당근으로 가기 
				mav.setViewName("redirect:memberlogin.mb");
				mav.addObject("plzLogin", false);
				session.setAttribute("destination", getPage);
				return mav;
			}else {
				mav.setViewName(getPage);	
			}
			String buyerid = member.getId();
			
			ProductChatBean cbean = new ProductChatBean(pno, sellerid, buyerid, "", "", "");
			
			List<ProductChatBean> clist = pDao.getChat(cbean);
			
			MemberBean sbean = pDao.getSellerInfo(sellerid); //판매자 정보 조회
			MemberBean bbean = pDao.getSellerInfo(buyerid);
			mav.addObject("bbean", bbean);
			mav.addObject("sbean", sbean);
			mav.addObject("clist", clist);
			return mav;
		}
		
		@RequestMapping(value = command, method = RequestMethod.POST)
		public ModelAndView doAction(
				ProductChatBean cbean
				) {
			
			ModelAndView mav = new ModelAndView();
			
			return mav;
		}
}

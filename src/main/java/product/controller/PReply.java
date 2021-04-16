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
import product.model.ProductBean;
import product.model.ProductChatBean;
import product.model.ProductDao;

@Controller
public class PReply {

	// 상품 올리기
		private final String command = "reply.prd";
		private final String getPage = "productReply";
		private final String gotoPage = "redirect:saleList.prd";
		
		@Autowired
		ProductDao pDao;
		
		//채팅 : session login id/ seller의 아이디와 상품 no를 get으로 넘겨줘야 함
		@RequestMapping(value = command, method = RequestMethod.GET)
		public ModelAndView doAction(
				HttpSession session, 
				HttpServletResponse response,
				@RequestParam(value =  "sellerid", required = false) String sellerid,
				@RequestParam(value =  "buyerid", required = false) String buyerid,
				@RequestParam("no") int pno
				) throws IOException {
			ModelAndView mav = new ModelAndView();

			
			//글쓰기 로그인 체크
			MemberBean member = (MemberBean) session.getAttribute("loginInfo");

			if (member == null) {
				//로그인 페이지 로그인하고 다시 나의당근으로 가기 
				mav.setViewName("redirect:memberlogin.mb");
				mav.addObject("plzLogin", false);
				session.setAttribute("destination", "redirect:saleList.prd");
				return mav;
			}else {
				mav.setViewName(getPage);	
			}
			if(buyerid==null) { //구매자면 로그인 기록으로 변수 입력
				buyerid = member.getId();				
			}
			if(sellerid==null) { //팬매자면 로그인 기록으로 변수 입력
				sellerid = member.getId();				
			}
			ProductBean pbean = pDao.getProduct(pno);
			ProductChatBean cbean = new ProductChatBean(0, pno, sellerid, buyerid, 0, pbean.getSubject(), "", "", member.getId());
			
			List<ProductChatBean> clist = pDao.getChat(cbean);
			int room = clist.get(0).getRoom();
			MemberBean sbean = pDao.getSellerInfo(sellerid); //판매자 정보 조회
			MemberBean bbean = pDao.getSellerInfo(buyerid);
			mav.addObject("pno", pno);
			mav.addObject("login", member.getId());
			mav.addObject("bbean", bbean);
			mav.addObject("pbean", pbean);
			mav.addObject("sbean", sbean);
			mav.addObject("clist", clist);
			mav.addObject("room", room);
			return mav;
		}
		
		@RequestMapping(value = command, method = RequestMethod.POST)
		public ModelAndView doAction(
				ProductChatBean cbean
				) {
			
			ModelAndView mav = new ModelAndView();
			pDao.insertChat(cbean);
			mav.setViewName("redirect:reply.prd?sellerid="+cbean.getSellerid()+"&buyerid="+cbean.getBuyerid()+"&no="+cbean.getPno());
			
			return mav;
		}
}

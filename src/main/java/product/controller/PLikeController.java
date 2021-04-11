package product.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import product.model.ProductDao;
import product.model.ProductLikeBean;

@Controller
public class PLikeController {

	//상품 찜하기
	private final String command = "like.prd";
	private final String getPage = "productLikeList";
	private final String gotoPage = "redirect:detail.prd";
	private String addGetData = "?no=";
	private final String command2 = "unlike.prd";
	
	@Autowired
	ProductDao pDao;
	
	//좋아요
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value = "no", required = true) int no,
			HttpSession session, 
			HttpServletResponse response
			) {
		
		ModelAndView mav = new ModelAndView();
		
		//글쓰기 로그인 체크
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");

		if (member == null) {
			//로그인 페이지 로그인하고 다시 나의당근으로 가기 
			mav.setViewName("redirect:memberlogin.mb");
			mav.addObject("plzLogin", false);
			session.setAttribute("destination", getPage);
			return mav;
		}
		addGetData = "?no="+no+"&sellerid="+member.getId();
		
		mav.setViewName(gotoPage+addGetData);
		ProductLikeBean likeBean = new ProductLikeBean();
		likeBean.setProductno(no);
		likeBean.setUserid(member.getId());
		pDao.productLike(likeBean);
		
		return mav;
	}
	
	// 싫어요
	@RequestMapping(value=command2)
	public ModelAndView doAction2(
			@RequestParam(value = "no", required = true) int no,
			@RequestParam(value = "like", required = true) int like,
			HttpSession session, 
			HttpServletResponse response
			) {
		
		ModelAndView mav = new ModelAndView();
		
		//글쓰기 로그인 체크
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");

		if (member == null) {
			//로그인 페이지 로그인하고 다시 나의당근으로 가기 
			mav.setViewName("redirect:memberlogin.mb");
			mav.addObject("plzLogin", false);
			session.setAttribute("destination", getPage);
			return mav;
		}
		addGetData = "?no="+no+"&sellerid="+member.getId();
		mav.setViewName(gotoPage+addGetData);
		pDao.productunLike(like);
		
		return mav;
	}
			
}

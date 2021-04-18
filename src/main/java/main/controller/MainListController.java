package main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductKeywordBean;

@Controller
public class MainListController {
	private final String command = "/main.mk";
	private final String getPage = "mainList";
	
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(Model model,
			HttpSession session) {
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		List<ProductBean> list = pDao.getPopList();
		mav.addObject("list", list);
		//System.out.println("메인리스트 prd no:"+ list.get(0).getNo()); //null이 맞음  rank 별칭선언으로 넘어오는거 rank로 받아옴
		
		List<ProductBean> klist = pDao.getKeywordList();
		mav.addObject("klist", klist);
		
		//주소 셀렉용
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		if (member != null) {
			MemberBean mbean = pDao.getSellerInfo(member.getId());
			mav.addObject("mbean", mbean);
		}
		mav.addObject("requestPage", "saleList.prd");
		return mav;
	}
}

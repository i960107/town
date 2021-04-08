package product.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;


@Controller
public class PDetailViewController {

	//상품 상세보기
	private final String command = "detail.prd";
	private final String getPage = "productDetailView";
	private final String gotoPage = "";
	
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "no") int no,
			@RequestParam(value = "sellerid") String sellerid
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		
		ProductBean pBean = pDao.getProduct(no);
		int likeCnt = pDao.getLike(no);
		
		mav.addObject("pBean", pBean);
		mav.addObject("sellerid", sellerid);
		mav.addObject("likeCnt", likeCnt);
		
		return mav;
	}
	
}

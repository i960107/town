package product.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView doAction() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		return mav;
	}
	
}

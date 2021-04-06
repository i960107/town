package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;

@Controller
public class PWriteContoller {
	
	//상품 올리기
	private final String command = "write.prd";
	private final String getPage = "productWrite";
	private final String gotoPage = "saleList.prd";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(
			ProductBean productbean) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(gotoPage);
		return mav;
	}
}

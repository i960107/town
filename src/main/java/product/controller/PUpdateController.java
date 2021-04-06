package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PUpdateController {

	//상품 정보 변경, 거래상태 변경
	private final String command = "update.prd";
	private final String getPage = "productUpdate";
	private final String gotoPage = "";
	
	@RequestMapping(value = command)
	public ModelAndView doAction() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		return mav;
	}
}

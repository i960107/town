package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PLikeController {

	//상품 찜하기
	private final String command = "like.prd";
	private final String getPage = "productLikeList";
	private final String gotoPage = "redirect:saleList.prd";
	
	@RequestMapping(value=command)
	public ModelAndView doAction() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		
		return mav;
	}
			
}

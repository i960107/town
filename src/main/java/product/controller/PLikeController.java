package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PLikeController {

	//상품 찜하기
	private final String command = "like.prd";
	private final String getPage = "productLikeList";
	private final String gotoPage = "redirect:detail.prd";
	private String addGetData = "&no=";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value = "no", required = false) int no //�ӽ� false DB�����Ǹ� ��������
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(gotoPage+addGetData+no);
		
		return mav;
	}
			
}

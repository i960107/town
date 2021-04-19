package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductDao;

@Controller
public class PDeleteController {

	//상품 삭제
	private final String command = "delete.prd";
	private final String getPage = "redirect:saleList.prd";
	private final String gotoPage = "";
	
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "no") int no,
			@RequestParam(value = "sellerid") String sellerid
			) {
	
		ModelAndView mav = new ModelAndView();
		
		pDao.deleteByNo(no);
		mav.setViewName(getPage);
		return mav;
	}
}

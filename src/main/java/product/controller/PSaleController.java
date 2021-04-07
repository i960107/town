package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class PSaleController {
	
	//전체 상품 목록 보기
	private final String command = "saleList.prd";
	private final String getPage = "productSaleList";
	
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		List<ProductBean> list = pDao.getList();
		
		mav.addObject("list", list);
		
		return mav;
	}

}

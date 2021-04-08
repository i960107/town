package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword) {
		
		System.out.println("whatColumn:" + whatColumn);
		System.out.println("keyword:" + keyword);
		
		/* mainList.jsp 검색어 조회 설정 */
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		List<ProductBean> list = pDao.getList(map);	
		
		mav.addObject("list", list);
		
		return mav;
	}

}

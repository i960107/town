package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
			@RequestParam(value="keyword",required = false) String keyword,
			HttpServletRequest request) {
		
		/* mainList.jsp 검색어 조회 설정 */
		Map<Object,String> map = new HashMap<Object,String>();
		map.put("whatColumn", whatColumn);
		
		if(keyword != null) { //keyword 공백제거 검색 성능 향상
			keyword.trim();			
			System.out.println("keyword : " + keyword);
			map.put("keyword", "%"+keyword+"%");
		}
		
		ModelAndView mav = new ModelAndView();
		List<ProductBean> list = pDao.getList();
		mav.addObject("list", list);
		System.out.println("list:" + list);
		
		List<ProductBean> searchList = pDao.getSearchList(map);
		mav.addObject("searchList", searchList);
		System.out.println("searchList:" + searchList);
		
		mav.setViewName(getPage);
		
		return mav;
	}

}

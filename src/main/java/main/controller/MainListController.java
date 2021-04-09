package main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class MainListController {
	private final String command = "/main.mk";
	private final String getPage = "mainList";
	
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			Model model) {
		
		System.out.println("whatColumn:" + whatColumn);
		System.out.println("keyword:" + keyword);
		
		/* mainList.jsp 검색어 조회 설정 */
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		List<ProductBean> list = pDao.getPopList(map);
		
		mav.addObject("list", list);
		
		return mav;
	}
}

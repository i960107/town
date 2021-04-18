package category.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryDao;

@Controller
public class CategoryDeleteController {

	@Autowired
	CategoryDao cdao;
	
	//보드 카테고리 삭제
	@RequestMapping(value="boardCateDel.ct", method = RequestMethod.GET)
	public String doAction(@RequestParam(value="no",required = true) int bcno ) {
		
		int cnt = cdao.delBoardCate(bcno);
		
		return "redirect:/categoryList.ct";
	}
	
	
	//중고거래 카테고리 삭제
	@RequestMapping(value="prodCateDel.ct", method = RequestMethod.GET)
	public String doActionPC(@RequestParam(value="no",required = true) int pcno ) {
		
		int cnt = cdao.delProdCate(pcno);
		
		return "redirect:/categoryList.ct";
	}
	

	
}

package category.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardCategoryBean;
import category.model.CategoryDao;
import product.model.ProdCategoryBean;

@Controller
public class CategoryController {

	@Autowired
	CategoryDao cdao;
	
	@RequestMapping(value="/categoryList.ct")
	public String doAction(Model model) {
		
		List<BoardCategoryBean> bcbean = cdao.getBoardCateData();
		List<ProdCategoryBean> pcbean = cdao.getProdCateData();
		
		model.addAttribute("bcbean", bcbean);
		model.addAttribute("pcbean", pcbean);
		
		return "category";
	}

	
	@RequestMapping(value="/boardCateInsert.ct", method = RequestMethod.POST)
	public String doActionI(@RequestParam(value="category_name") String category_name) {
		
		int cnt = cdao.insertBoardCate(category_name);
		
		return "redirect:/categoryList.ct";
	}
	

	@RequestMapping(value="/productCateInsert.ct", method = RequestMethod.POST)
	public String doActionPCI(@RequestParam(value="category_name") String category_name) {

		int prodCateInCnt = cdao.insertProdCate(category_name);
		
		return "redirect:/categoryList.ct";
	}
	
}
package category.controller;

import java.util.List;

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
	
	
	@RequestMapping(value="/boardCateList.ct", method = RequestMethod.GET)
	public String doActionL(Model model) {
		
		List<BoardCategoryBean> bcbean = cdao.getBoardCateData();
		
		System.out.println(bcbean.get(0).getCategoryname());
		//System.out.println(bcbean.get(0).getName());
		
		model.addAttribute("bcbean", bcbean);
		
		
		return "boardCateList";
	}
	
	@RequestMapping(value="/boardCateInsert.ct", method = RequestMethod.GET)
	public String doActionI() {
		
		return "boardCateInsertForm";
	}
	
	@RequestMapping(value="/boardCateInsert.ct", method = RequestMethod.POST)
	public String doActionI(@RequestParam(value="category_name") String category_name) {
		
		int cnt = cdao.insertBoardCate(category_name);
		
		return "redirect:/boardCateList.ct";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* Product CateGory */
	@RequestMapping(value="/productCateList.ct" , method = RequestMethod.GET)
	public ModelAndView doActionPCL() {
		
	
		return null;
	}
	
	
	@RequestMapping(value="/productCateInsert.ct", method = RequestMethod.GET)
	public String doActionPCI() {
		return "productCateInsertForm";
	}
	
	@RequestMapping(value="/productCateInsert.ct", method = RequestMethod.POST)
	public ModelAndView doActionPCI(@ModelAttribute("pci") @Valid ProdCategoryBean pcbean,
			BindingResult result) {

		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName("productCateInsertForm");
		}
		else {
			int prodCateInCnt = cdao.insertProdCate(pcbean);
			mav.setViewName("redirect:/productCateList.ct");
		}
		
		return mav;
	}
	
}
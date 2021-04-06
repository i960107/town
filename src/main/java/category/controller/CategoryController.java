package category.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {

	
	@RequestMapping(value="/boardCateList.ct")
	public String doActionL() {
		
		return "boardCateList";
	}
	
	@RequestMapping("/boardCateInsert.ct")
	public String doActionI() {
		
		return "boardCateInsertForm";
	}
	
	@RequestMapping("/productCateList.ct")
	public String doActionPCL() {
		return "productCateList";
	}
	
	@RequestMapping("/productCateInsert.ct")
	public String doActionPCI() {
		return "productCateInsertForm";
	}
	
}
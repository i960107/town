package category.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryDao;

@Controller
public class CategoryUpdateController {

	@Autowired
	CategoryDao cdao;

	//동네생활
	@RequestMapping(value = "boardCateUp.ct", method = RequestMethod.GET)
	public String doActionb(@RequestParam(value = "no", required = true) int bcno) {

		//BoardCateBean bcbean = cdao.selectBcateNum(bcno);

		return "redirect:/boardCateList.ct";
	}
	
	
	
	//중고거래
	@RequestMapping(value = "prodCateUp.ct", method = RequestMethod.GET)
	public String doActionp(@RequestParam(value="no",required = true) int pcno) {
		
		//ProdCateBean pcbean= cdao.selectPcateNum(pcno);
		
		return "redirect:/productCateList.ct";
	}
}

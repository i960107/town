package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductDao;

@Controller
public class PProdDeleteController {
	
	private final String command = "/delete.prd";
	private final String getPage = "redirect:/mySaleList.prd";
	
	@Autowired
	ProductDao pdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value="no", required = true) int pno) {
		
		System.out.println("삭제하러 넘어와야지 :"+pno);
		
		int cnt = pdao.deleteByNo(pno);
		
		return getPage;
	}

}

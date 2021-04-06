package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PSaleController {
	
	//상품 목록
	private final String command = "saleList.prd";
	private final String getPage = "productSaleList";
	
	@RequestMapping(value=command)
	public String doAction() {
		
		return getPage;
	}

}

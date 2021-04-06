package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PSaleController {
	
	//전체 상품 목록 보기
	private final String command = "saleList.prd";
	private final String getPage = "productSaleList";
	
	@RequestMapping(value=command)
	public String doAction() {
		
		return getPage;
	}

}

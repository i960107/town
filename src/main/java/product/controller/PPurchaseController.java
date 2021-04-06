package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PPurchaseController {

	//구매상품 목록보기
	private final String command = "purchaseList.prd";
	private final String getPage = "productPurchaseList";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
}

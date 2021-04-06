package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PPurchaseController {

	private final String command = "purchaseList.prd";
	private final String getPage = "productPurchaseList";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
}

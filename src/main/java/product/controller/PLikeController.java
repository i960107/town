package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PLikeController {

	private final String command = "like.prd";
	private final String getPage = "productLikeList";
	private final String gotoPage = "redirect:saleList.prd";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
			
}

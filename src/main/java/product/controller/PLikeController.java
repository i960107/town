package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PLikeController {

	private final String command = "likeList.prd";
	private final String getPage = "productLikeList";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
			
}

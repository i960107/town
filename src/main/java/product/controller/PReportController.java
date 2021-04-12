package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PReportController {
	
	private final String command = "report.prd";
	private final String getPage = "productReport";
	
	@RequestMapping(value=command)
	public String doAction() {
		
		
		return getPage;
	}
	

}

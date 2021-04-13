package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MReportController {
	
	private final String command = "report.mb";
	private final String getPage = "memberReport";
	
	@RequestMapping(value=command)
	public String doAction() {
		
		
		return getPage;
	}
	

}

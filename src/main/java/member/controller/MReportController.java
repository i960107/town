package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MReportController {
	
	private final String command = "report.mb";
	private final String getPage = "memberReport";
	private final String gotoPage = "redirect:/detail.prd";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String doAction_() {
		
		
		
		
		return null;
	}
	

}

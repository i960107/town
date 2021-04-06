package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MLoginController {
	
	private final String command = "memberlogin.mb";
	private final String getPage = "memberLoginForm";
	private final String gotoPage = "redirect:/list.mk";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionG() {
		
		return getPage;
	}
	
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String doActionP() {
		
		return gotoPage;
	}

}

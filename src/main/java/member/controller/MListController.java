package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MListController {

	private final String command = "memberList.mb";
	private final String getPage = "memberList";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
	
}

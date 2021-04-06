package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MMyPageController {
	
	private final String command = "myPage.mb";
	private final String getPage = "memberMyPageTop";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	

}

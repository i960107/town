package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MUpdateController {
	
	private final String command = "memberUpdate.mb";
	private final String getPage = "memberUpdateForm";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doActionGet() {
		
		return getPage;
	}
	
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String doActionPost() {
		
		return getPage;
	}

}

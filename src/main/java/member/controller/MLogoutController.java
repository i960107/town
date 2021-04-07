package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MLogoutController {

	private final String command = "/memberlogout.mb";
	private final String gotoPage = "redirect:/main.mk";
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session) {
		
		session.invalidate();
		
		return gotoPage;
	}
	
	
}

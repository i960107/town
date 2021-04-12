package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class boardLike {
	private final String command="like.bd";
	private String goToPage="redirect:/list.bd";
	@RequestMapping(command)
	public String doAction() {
		return goToPage;
	}
}

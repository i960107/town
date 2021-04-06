package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class boardInsertController {
	private final String command="insert.bd";
	private String getPage="boardInsertForm";
	private String goToPage="redirect:/list.bd";
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doActionGet() {
		return getPage;
	}
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doActionPost() {
		return goToPage;
	}
}

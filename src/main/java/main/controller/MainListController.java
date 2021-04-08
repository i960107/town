package main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainListController {
	private final String command = "/main.mk";
	private final String getPage = "mainList";
	
	@RequestMapping(value=command)
	public String doAction() {
		
		return getPage;
	}
}

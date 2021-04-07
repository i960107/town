package main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;

@Controller
public class MainListController {
	private final String command = "/main.mk";
	private final String getPage = "mainList";
	
	@RequestMapping(value=command)
	
	public String doAction() {
		
		
		return getPage;
		
	}
}

package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class boardListController {
private final String command="list.bd";
private String goToPage="boardList";
@RequestMapping(command)
public String doAction() {
	return goToPage;
}
}

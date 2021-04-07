package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class boardListController {
private final String command="list.bd";
private String goToPage="boardList";
@Autowired
BoardDao dao;
@RequestMapping(value=command, method=RequestMethod.GET)
public String doActionGet(Model model,
		@RequestParam(value="category",required=false) String category,
		@RequestParam(value="keyword",required=false) String keyword
		) {
	List<String> cateogory_list=dao.getAllCategory();
	model.addAttribute("category",category);
	model.addAttribute("keyword",keyword);
	model.addAttribute("cateogory_list",cateogory_list);
	List<BoardBean> board_list=dao.getBoard(category,keyword);
	model.addAttribute("board_list",board_list);
	return goToPage;
}
}

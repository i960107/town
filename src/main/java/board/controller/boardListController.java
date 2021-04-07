package board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardCategoryBean;
import board.model.BoardDao;

@Controller
public class boardListController {
private final String command="list.bd";
private String goToPage="boardList";
@Autowired
BoardDao dao;
@RequestMapping(value=command, method=RequestMethod.GET)
public String doActionGet(HttpSession session,Model model
		) {
	List<BoardCategoryBean> category_list=dao.getAllCategory();
	session.setAttribute("category_list",category_list );
	List<BoardBean> board_list=dao.getAllBoard();
	model.addAttribute("board_list",board_list);
	return goToPage;
}
@RequestMapping(value=command, method=RequestMethod.POST)
public String doActionPost(Model model,
		@RequestParam(value="category",required=false) String category,
		@RequestParam(value="keyword",required=false) String keyword
		) {
	model.addAttribute("category",category);
	model.addAttribute("keyword",keyword);
	List<BoardBean> board_list=dao.getBoardByKeyword(category,keyword);
	model.addAttribute("board_list",board_list);
	return goToPage;
}
}

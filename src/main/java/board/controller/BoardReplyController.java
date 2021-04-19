package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
@Controller
public class BoardReplyController {
	private final String command = "/reply.bd";
	
	@Autowired
	BoardDao dao;
	@RequestMapping(command)
	public String doAction(Model model,
			@RequestParam("writer") String writer,
			@RequestParam("contents") String contents,
			@RequestParam("ref") int ref,
			@RequestParam("reLevel") int reLevel
			) {
		String getPage = "redirect:/detailView.bd";
		dao.insertReply(writer,contents,ref,reLevel);
		getPage+="?no="+ref;
		return getPage;
	}
}

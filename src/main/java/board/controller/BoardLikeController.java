package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import board.model.BoardLikeBean;

@Controller
public class BoardLikeController {
	private final String command = "/like.bd";
	private final String command2 = "unlike.bd";
	private String goToPage = "redirect:/detailView.bd";
	@Autowired
	BoardDao dao;

	@RequestMapping(command)
	public String doActionLike(@RequestParam("townBoardNo") int townBoardNo, BoardLikeBean likeBean) {
		dao.boardLike(likeBean);
		goToPage += "?no=" + townBoardNo;
		return goToPage;
	}

	@RequestMapping(command2)
	public String doActionUnlike(@RequestParam("townBoardNo") int townBoardNo, @RequestParam("no") int no) {
		dao.boardUnlike(no);
		goToPage += "?no=" + townBoardNo;
		return goToPage;
	}
}
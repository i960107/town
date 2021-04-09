package board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardFileBean;
import board.model.BoardLikeBean;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class BoardDetailViewController {
	private final String command = "detailView.bd";
	private String getPage = "boardDetailView";
	@Autowired
	BoardDao dao;
	@Autowired
	MemberDao mdao;

	@RequestMapping(command)
	public String doAction(@RequestParam("no") int no, Model model) {
		dao.addReadcount(no);
		BoardBean board = dao.getBoardByNo(no);
		List<BoardFileBean> boardFileList = new ArrayList<BoardFileBean>();
		List<BoardLikeBean> likeList = new ArrayList<BoardLikeBean>();
		likeList = dao.getLike(no);
		boardFileList = dao.getFileBeans(boardFileList, no);
		MemberBean writer = mdao.getMember(board.getWriter());
		model.addAttribute("writer", writer);
		model.addAttribute("board", board);
		model.addAttribute("boardFileList", boardFileList);
		model.addAttribute("likeList", likeList);
		model.addAttribute("likeCnt", likeList.size());
		return getPage;
	}
}

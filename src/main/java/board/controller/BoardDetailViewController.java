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
	private final String command = "/detailView.bd";
	private String getPage = "boardDetailView";
	@Autowired
	BoardDao dao;
	@Autowired
	MemberDao mdao;

	@RequestMapping(command)
	public String doAction(@RequestParam("no") int no, Model model) {
		
		//조회수 올리기
		dao.addReadcount(no);
		// 글,댓글 가져오기
		BoardBean board = dao.getBoardByNo(no);
		model.addAttribute("board", board);
		List<BoardFileBean> boardFileList = new ArrayList<BoardFileBean>();
		boardFileList = dao.getFileBeans(boardFileList, no);
		model.addAttribute("boardFileList", boardFileList);
		List<BoardBean> replyList = new ArrayList<BoardBean>();
		replyList = dao.getReplyByNo(no);
		model.addAttribute("replyList", replyList);
		
		// 이전글 가져오기
		int previousNo = no - 1;
		BoardBean previousBoard = null;
		while (previousBoard == null) {
			previousBoard = dao.getBoardByNo(previousNo);
			previousNo = previousNo - 1;
			if (previousNo < 1)
				break;
		}
		if (previousBoard != null) {
			String prevImage=dao.getThumnailName(previousBoard.getNo());
			model.addAttribute("previousBoard", previousBoard);
			model.addAttribute("prevImage", prevImage);
		}
		//다음글 가져오기
		int nextNo = no + 1;
		int maxNo=dao.getMaxBoardNo();
		BoardBean nextBoard = null;
		while (nextBoard == null) {
			nextBoard = dao.getBoardByNo(nextNo);
			nextNo = nextNo + 1;
			if (nextNo > maxNo)
				break;
		}
		if (nextBoard != null) {
			String nextImage=dao.getThumnailName(nextBoard.getNo());
			model.addAttribute("nextBoard", nextBoard);
			model.addAttribute("nextImage", nextImage);
		}
			
		
		//공감하기 가져오기
		List<BoardLikeBean> likeList = new ArrayList<BoardLikeBean>();
		likeList = dao.getLike(no);
	
		
		//글쓴이 정보 가져오기
		MemberBean writer = mdao.getMember(board.getWriter());
		model.addAttribute("writer", writer);

	
	
		model.addAttribute("likeList", likeList);
		model.addAttribute("likeCnt", likeList.size());
		return getPage;
	}
}
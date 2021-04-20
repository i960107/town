package board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;

@Controller
public class BoardMyListController {
	
	private final String command = "/myBoard.bd";
	//private final String getPage = "boardMyList";
	private final String getPage = "myTown";
	
	@Autowired
	BoardDao bdao;

	@RequestMapping(value=command)
	public String doAction(HttpSession session, Model model) {
		
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		String loginID = member.getId();
		
		//게시글
		List<BoardBean> mblists = bdao.getBoardListById(loginID);
		
		//댓글
		List<BoardBean> mbrlists = bdao.getBoardReplyListById(loginID);
	
		
		model.addAttribute("mblists", mblists);
		model.addAttribute("mbrlists", mbrlists);
		return getPage;
	}
}

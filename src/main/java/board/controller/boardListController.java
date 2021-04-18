package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
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
import board.model.BoardFileBean;
import member.model.MemberBean;

@Controller
public class boardListController {
	private final String command = "/list.bd";
	private String getPage = "/list.bd";
	private String goToPage = "boardList";
	@Autowired
	BoardDao dao;
	@Autowired
	ServletContext context;

	@RequestMapping(value = command)
	public String doActionGet(Model model, HttpSession session,
			@RequestParam(value = "address1", required = false) String address1,
			@RequestParam(value = "address2", required = false) String address2,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "keyword", required = false) String keyword, HttpServletResponse response)
			throws IOException {
		System.out.println("address1" + address1);
		System.out.println("address2" + address2);
		System.out.println("category" + category);
		System.out.println("keyword" + keyword);
		

		// 카테고리 들고오기
		List<BoardCategoryBean> categoryList = dao.getAllCategory();
		context.setAttribute("categoryList", categoryList);

		// 조건에 맞는 board가져오기
		List<BoardBean> boardList = dao.getBoardList(keyword, category, address1, address2);
		// 조건에 맞는 boardfile 가져오기
		List<BoardFileBean> boardFileList = new ArrayList<BoardFileBean>();
		for (int i = 0; i < boardList.size(); i++) {
			int bno = boardList.get(i).getNo();
			boardFileList = dao.getFileBeans(boardFileList, bno);
		}

		model.addAttribute("boardList", boardList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("address1", address1);
		model.addAttribute("address2", address2);
		model.addAttribute("boardFileList", boardFileList);
		model.addAttribute("requestPage", "list.bd");
		return goToPage;
	}

}

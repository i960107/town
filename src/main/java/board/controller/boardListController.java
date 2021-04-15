package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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

@Controller
public class boardListController {
	private final String command = "/list.bd";
	private String getPage = "redirect:/list.bd";
	private String goToPage = "boardList";
	@Autowired
	BoardDao dao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(Model model, HttpSession session,
			@RequestParam(value = "address1", required = false) String address1, 
			@RequestParam(value = "address2", required = false) String address2
			) {
		List<BoardCategoryBean> categoryList = dao.getAllCategory();
		session.setAttribute("categoryList", categoryList);
		List<BoardBean> boardList = dao.getAllBoard(address1,address2);
		List<BoardFileBean> boardFileList = new ArrayList<BoardFileBean>();
		for (int i = 0; i < boardList.size(); i++) {
			int bno = boardList.get(i).getNo();
			boardFileList = dao.getFileBeans(boardFileList, bno);
		}
		model.addAttribute("searchAddress1", address1);
		model.addAttribute("searchAddress2", address2);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardFileList", boardFileList);
		return goToPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionPost(Model model, @RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "keyword", required = false) String keyword, 
			@RequestParam(value = "address1", required = false) String address1, 
			@RequestParam(value = "address2", required = false) String address2,
			HttpServletResponse response)
			throws IOException {
		if (category == null) {
			System.out.println("여기오나");
			PrintWriter pwriter = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			pwriter.print("<script type='text/javascript'>");
			pwriter.print("alert('카테고리는 하나이상 선택해주세요')");
			pwriter.print("location.href='" + getPage + "'");
			pwriter.print("</script>");
			pwriter.flush();
		}
		System.out.println("주소"+address1+address2);
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		List<BoardBean> boardList = dao.getBoardByCategoryKeyword(category, keyword);
		model.addAttribute("boardList", boardList);
		List<BoardFileBean> boardFileList = new ArrayList<BoardFileBean>();
		for (int i = 0; i < boardList.size(); i++) {
			int bno = boardList.get(i).getNo();
			boardFileList = dao.getFileBeans(boardFileList, bno);
		}
		model.addAttribute("boardFileList", boardFileList);
		return goToPage;
	}
}

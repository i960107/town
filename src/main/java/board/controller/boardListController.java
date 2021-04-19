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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardCategoryBean;
import board.model.BoardDao;
import board.model.BoardFileBean;

@Controller
public class boardListController {
	private final String command = "/list.bd";
	private String goToPage = "boardList";
	@Autowired
	BoardDao dao;
	@Autowired
	ServletContext context;

	@RequestMapping(value = command)
	public ModelAndView doActionGet(HttpSession session,
			@RequestParam(value = "isCategorySelected", required = false) boolean isCategorySelected,
			@RequestParam(value = "address1", required = false) String address1,
			@RequestParam(value = "address2", required = false) String address2,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "keyword", required = false) String keyword, HttpServletResponse response)
			throws IOException {
		System.out.println("address1" + address1);
		System.out.println("address2" + address2);
		System.out.println("category" + category);
		System.out.println("keyword" + keyword);
		ModelAndView mav = new ModelAndView();

		// 카테고리 들고오기
		List<BoardCategoryBean> categoryList = dao.getAllCategory();
		context.setAttribute("bCategoryList", categoryList);
		// 카테고리 하나이상 선택 필수
		if (isCategorySelected == true && category == null) {
			System.out.println("여기");
			PrintWriter pwriter = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			pwriter.print("<script type='text/javascript'>");
			pwriter.print("alert('카테고리는 하나이상 선택해주세요')");
			pwriter.print("</script>");
			pwriter.flush();
			mav.addObject("category", null);
			mav.addObject("categoryList", categoryList);
			mav.addObject("keyword", keyword);
			mav.addObject("address1", address1);
			mav.addObject("address2", address2);
			mav.setViewName(goToPage);
			return mav;
		}

		// 조건에 맞는 board가져오기
		List<BoardBean> boardList = dao.getBoardList(keyword, category, address1, address2);
		// 조건에 맞는 boardfile 가져오기
		List<BoardFileBean> boardFileList = new ArrayList<BoardFileBean>();
		for (int i = 0; i < boardList.size(); i++) {
			int bno = boardList.get(i).getNo();
			boardFileList = dao.getFileBeans(boardFileList, bno);
		}
	

		mav.addObject("boardList", boardList);
		mav.addObject("keyword", keyword);
		mav.addObject("category", category);
		mav.addObject("address1", address1);
		mav.addObject("address2", address2);
		mav.addObject("boardFileList", boardFileList);
		mav.addObject("requestPage", "list.bd");
		mav.setViewName(goToPage);
		return mav;
	}

}

package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardCategoryBean;
import board.model.BoardDao;
@Controller
public class boardListController {
private final String command="list.bd";
private String getPage="redirect:/list.bd";
private String goToPage="boardList";
@Autowired
BoardDao dao;
@RequestMapping(value=command, method=RequestMethod.GET)
public String doActionGet(Model model,HttpSession session
		) {
	List<BoardCategoryBean> categoryList=dao.getAllCategory();
	session.setAttribute("categoryList",categoryList);
	List<BoardBean> boardList=dao.getAllBoard();
	model.addAttribute("boardList",boardList);
	return goToPage;
}
@RequestMapping(value=command, method=RequestMethod.POST)
public ModelAndView doActionPost(ModelAndView mav,
		@RequestParam(value="category",required=false) String category,
		@RequestParam(value="keyword",required=false) String keyword,
		 HttpServletResponse response
		) throws IOException {
	if(category==null) {
		System.out.println("여기오나");
		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		pwriter.print("<script type='text/javascript'>");
		pwriter.print("alert('카테고리는 하나이상 선택해주세요')");
		pwriter.print("</script>");
		pwriter.flush();
		mav.setViewName(getPage);
	}
	mav.addObject("category",category);
	mav.addObject("keyword",keyword);
	List<BoardBean> boardList=dao.getBoardByCategoryKeyword(category,keyword);
	mav.addObject("boardList",boardList);
	mav.setViewName(goToPage);
	return mav;
}
}

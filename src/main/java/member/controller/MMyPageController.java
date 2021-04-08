package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;

@Controller
public class MMyPageController {

	private final String command = "myPage.mb";
	private final String getPage = "memberMyPageTop";
	private String gotoPage = "memberLoginForm";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(HttpSession session, HttpServletResponse response) throws IOException {

		// LoginController에서 가져옴
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");

		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");

		ModelAndView mav = new ModelAndView();
		
		

		if (member == null) {
			pwriter.print("<script type='text/javascript'>");
			pwriter.print("alert('로그인 후 이용가능합니다')");
			pwriter.print("</script>");
			pwriter.flush();

			//로그인 페이지 로그인하고 다시 나의당근으로 가기 
			session.setAttribute("destination", getPage);
			mav.setViewName(gotoPage);

		} else {
			System.out.println(member.getImage());
			session.setAttribute("profileImage", member.getImage());
			mav.setViewName(getPage);
		}

		return mav;
	}

}

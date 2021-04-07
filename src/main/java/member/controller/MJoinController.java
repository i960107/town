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
public class MJoinController {

	private final String command = "memberJoin.mb";
	private final String getPage = "memberJoinForm";
	private final String gotoPage = "memberMyPageTop";
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView doAction(
			HttpSession session, HttpServletResponse response) throws IOException {
		
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		ModelAndView mav = new ModelAndView();
		
		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		if(member == null) {
			mav.setViewName(getPage);
		}
		else {
			pwriter.print("<script type='text/javascript'>");
			pwriter.print("alert('회원가입은 로그아웃 후 가능합니다')");
			pwriter.print("</script>");
			pwriter.flush();

			
			mav.setViewName(gotoPage);
		}
		
		return mav;
	}
	
	
	
	
	
}

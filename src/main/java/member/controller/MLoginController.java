package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MLoginController {

	private final String command = "memberlogin.mb";
	private final String getPage = "memberLoginForm";
	private String gotoPage = "redirect:/main.mk";

	@Autowired
	MemberDao mdao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionG() {

		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionP(HttpServletRequest request,@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "pw", required = true) String pw, HttpServletResponse response, HttpSession session)
			throws IOException {

		MemberBean mbean = new MemberBean();
		mbean.setId(id);

		// 아이디 체크하기
		MemberBean midBean = mdao.loginCkId(mbean);

		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");

		ModelAndView mav = new ModelAndView();

	
		// 아이디 없음
		if (midBean == null) {
			pwriter.print("<script type='text/javascript'>");
			pwriter.print("alert('존재하는 ID가 없습니다.')");
			pwriter.print("</script>");
			pwriter.flush();
			mav.setViewName(getPage);
		}
		// 아이디 존재
		else {
			// id + pw
			if (pw.equals(midBean.getPw())) {
				session.setAttribute("loginInfo", midBean);
				session.setAttribute("destination", "redirect:/main.mk");
				
				if(session.getAttribute("destination")!=null) {
					gotoPage=(String)session.getAttribute("destination");
				}
				mav.setViewName(gotoPage);
			}
			// id o, pw x
			else {
				pwriter.print("<script type='text/javascript'>");
				pwriter.print("alert('비밀번호가 일치하지 않습니다.')");
				pwriter.print("</script>");
				pwriter.flush();

				mav.addObject("id", id);
				mav.setViewName(getPage);

			}
		}

		return mav;
	}

}

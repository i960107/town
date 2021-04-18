package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MOAuthJoinCotroller {

	private final String command = "kakaoJoin.mb";
	private final String getPage = "redirect:/main.mk";
	private final String gotoPage = "memberMyPageTop";
	private final String goLogin = "memberLoginForm";
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(
			MemberBean mbean,
			HttpServletResponse response
			) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		PrintWriter pwriter = response.getWriter();
		return mav;
	}
		
		@RequestMapping(value = command, method = RequestMethod.POST)
		public ModelAndView doAction(
				MemberBean mbean
				) {
			
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(getPage);
		
		mdao.updateAddrOAuth(mbean);
		return mav;
	}
}

package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MFindPwController {
	
	private final String command = "/findpw.mb";
	private final String getPage = "memberFindPw";
	private final String gotoPage = "memberLoginForm";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction() {
		
		return getPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String doActionp(@RequestParam(value="id") String findId, HttpServletResponse response) throws IOException {
		
		System.out.println("비번찾을id:"+findId);
		
		MemberBean mbean = mdao.getPwbyId(findId);
		//System.out.println(mbean.getPw());
		
		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		if(mbean == null) {
			pwriter.println("<script>"
					+ "alert('존재하지 않는 아이디 입니다.');"
					+ "history.go(-2);"
					 + "</script>");
		}
		else {
			pwriter.println("<script>"
					+ "alert('회원님의 비밀번호는 "+mbean.getPw()+" 입니다.');"
					+ "history.go(-2);"
					 + "</script>");
		}
		 
		return null;
	}
	

}

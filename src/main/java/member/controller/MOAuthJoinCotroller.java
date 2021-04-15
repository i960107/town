package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MOAuthJoinCotroller {

	private final String command = "kakaoJoin.mb";
	private final String getPage = "";
	private final String gotoPage = "memberMyPageTop";
	private final String goLogin = "memberLoginForm";
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			MemberBean mbean,
			HttpServletResponse response
			) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("oauthjoin : " + mbean.getId());
		//1. 업로드 위치
		String uploadPath = servletContext.getRealPath("/resources/members");
		System.out.println("uploadPath:"+uploadPath+mbean.getImage());
		
		
		MultipartFile multi = mbean.getUpload();
		
		int joinCnt = mdao.kakaoRegister(mbean);
		
		if(joinCnt == 1) {
			if(mbean.getImage() != "") {
				File file = new File(uploadPath+"/"+mbean.getImage());
				multi.transferTo(file);
				
				pwriter.print("<script type='text/javascript'>");
				pwriter.print("alert('정상적으로 회원가입 완료 되었습니다.')");
				pwriter.print("</script>");
				pwriter.flush();
				
				mav.setViewName(goLogin);
			}
			else {
				pwriter.print("<script type='text/javascript'>");
				pwriter.print("alert('정상적으로 회원가입 완료 되었습니다.')");
				pwriter.print("</script>");
				pwriter.flush();
				
				mav.setViewName(goLogin);

			}
			
			
		}
		
		return mav;
	}
}

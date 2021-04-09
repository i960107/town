package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MJoinController {

	private final String command = "memberJoin.mb";
	private final String getPage = "memberJoinForm";
	private final String gotoPage = "memberMyPageTop";
	private final String goLogin = "memberLoginForm";
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	ServletContext servletContext;
	
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
			System.out.println(member.getId());
			pwriter.print("<script type='text/javascript'>");
			pwriter.print("alert('회원가입은 로그아웃 후 가능합니다')");
			pwriter.print("</script>");
			pwriter.flush();
			
			mav.setViewName(gotoPage);
		}
		
		return mav;
	}
	
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("member") @Valid MemberBean mbean,BindingResult result,
			HttpServletResponse response) throws IOException {
		
		
		System.out.println("getId:"+mbean.getId());
		System.out.println("getPw:"+mbean.getPw());
		System.out.println("getPwCheck:"+mbean.getPwCheck());
		System.out.println("getName:"+mbean.getName());
		System.out.println("getGender:"+mbean.getGender());
		System.out.println("getPhonenumber:"+mbean.getPhonenumber());
		System.out.println("getEmail:"+mbean.getEmail());
		System.out.println("getAddress:"+mbean.getAddress());
		System.out.println("getAddress1:"+mbean.getAddress1());
		System.out.println("getAddress2:"+mbean.getAddress2());
		System.out.println("getAddress3:"+mbean.getAddress3());
		System.out.println("getImage:"+mbean.getImage());
		
		
		System.out.println(servletContext.getRealPath("/"));
		// C:\Users\jihye\Project\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Town\
				
		ModelAndView mav = new ModelAndView();
		
		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		//1. 업로드 위치
		String uploadPath = servletContext.getRealPath("/resources/members");
		System.out.println("uploadPath:"+uploadPath+mbean.getImage());
		
		
		MultipartFile multi = mbean.getUpload();
		
		
		if(result.hasErrors()) {
			System.out.println("오류야");
			
			mav.addObject("mbean", mbean);
			mav.setViewName(getPage);
			
		}
		else {
			System.out.println("오류안나 ");
			
			// 아이디 있나 체크 
			MemberBean midBean =  mdao.loginCkId(mbean);
			
			// 중복아이디 없으면 DB , 이미지 삽입
			if(midBean == null) {
			
				int joinCnt = mdao.register(mbean);
				
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
				else {
					pwriter.print("<script type='text/javascript'>");
					pwriter.print("alert('회원가입 실패.')");
					pwriter.print("</script>");
					pwriter.flush();
					
					mav.addObject("mbean", mbean);
					mav.setViewName(getPage);
					
				}
			}
			else { // 중복아이디 있으면 불가  
				pwriter.print("<script type='text/javascript'>");
				pwriter.print("alert('이미 사용중인 ID 입니다')");
				pwriter.print("</script>");
				pwriter.flush();
				
				mav.addObject("mbean", mbean);
				mav.setViewName(getPage);
			}
			
				
		}
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
}

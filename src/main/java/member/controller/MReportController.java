package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import member.model.MemberReportBean;

@Controller
public class MReportController {
	
	private final String command = "report.mb";
	private final String getPage = "memberReport";
	private final String gotoPage = "redirect:saleList.prd";
	
	@Autowired
	MemberDao mDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(
			@RequestParam(value="reported_userid") String reported_userid,
			Model model) {
		
		System.out.println("reported_userid:"+reported_userid);
		model.addAttribute("reported_userid", reported_userid);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(MemberReportBean reportBean,
			HttpSession session, HttpServletResponse response) throws IOException {
		
		// radio
		System.out.println("reportBean.getReport():"+reportBean.getReport());
		
		// contents값
		System.out.println("reportBean.getContents:"+reportBean.getContents());
		
		if(reportBean.getContents() == null) {
			reportBean.setContents(" "); /// contents의 값이 null이면 빈칸 으로 설정
		}
		
		// [radio] + contents값
		String radioContents = "["+reportBean.getReport()+"]"+reportBean.getContents();
		reportBean.setContents(radioContents);
		
		
		// 판매자 변수 설정 하기 
		System.out.println("reported_userid:"+reportBean.getReported_userid());
		
		String reported_userid = reportBean.getReported_userid();
		System.out.println("신고하기 reported_userid:" + reported_userid);
		
		// 로그인한 session 정보 가져온거
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		String reportID = member.getId();
		System.out.println("리포트아이디(로그인아이디):"+reportID);
		
		//사용자  ---- MemberReportBean 에 report_userid에 로그인한 아이디 setting
		reportBean.setReport_userid(reportID); 
		System.out.println("셋팅된 리포트ID:"+ reportBean.getReport_userid());
		
		
		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		
		if(reportBean.getReport() != null) {
			if(reportID.equals(reportBean.getReported_userid())) {
				System.out.println("아이디 같아");
				/*pwriter.print("<script type='text/javascript'>");
				pwriter.print("alert('판매자와 신고자가 같습니다.");
				pwriter.print("</script>");
				pwriter.flush();
				redirect 전에 alert 창 띄우기
				컨트롤러 redirect 전에 script로 alert 창 띄우기 안됨 ................
				*/
				
			}else {
				// 신고하기 DB에 삽입
				int cnt = mDao.reportUser(reportBean);
				mDao.getUpCount(reported_userid);
			}
		}
		
		//로그인아이디(신고자) = 판매자 같을 경우 신고 불가
		/*if(reportID.equals(reported_userid)) {
			pwriter.print("<script type='text/javascript'>");
			pwriter.print("alert('판매자와 신고자가 같습니다.");
			pwriter.print("window.location.href='-2'");
			pwriter.print("</script>");
			pwriter.flush();
			mav.setViewName(getPage);
			return mav;
		}
		else {
			// DB에 삽입하기 	
			int cnt = mDao.reportUser(reportBean);
			
			mav.addObject("reported_userid", reported_userid);
			mav.setViewName("gotoPage");
			return mav;
		}*/
		
		mav.setViewName(gotoPage);
		return mav;
		
		
	}
	

}

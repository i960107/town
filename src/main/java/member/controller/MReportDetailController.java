package member.controller;

import java.util.List;

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
public class MReportDetailController {
	
	private final String command = "/memberReportDetail.mb";
	private final String getPage = "memberReportDetail";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value = "id") String id) {
		
		ModelAndView mav = new ModelAndView();
		
		List<MemberReportBean> mrbean = mdao.getReportDetailById(id);
		
		mav.addObject("mrbean", mrbean);
		mav.addObject("id", id);
		
		//System.out.println("mrbean:" + mrbean); 주소만 출력
		System.out.println("신고된 id:" + id);
		
		mav.setViewName(getPage);
		return mav;
	}
	
}

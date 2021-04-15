package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;
import member.model.MemberReportBean;

public class MReportDetailController {
	
	private final String command = "/memberReportDetail.mb";
	private final String getPage = "memberReportDetail";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model) {
		
		MemberBean member = new MemberBean();
		String id = member.getId();
		
		List<MemberReportBean> mrbean = mdao.getReportDetailById(id);
		
		model.addAttribute("mrbean", mrbean);
		model.addAttribute("id", id);
		
		return getPage;
	}
	
}

package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MListController {

	private final String command = "memberList.mb";
	private final String getPage = "memberList";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView doAction(Model model) {
		
		//전체 member리스트 가져오기 
		List<MemberBean> lists = mdao.getAllData();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	
}

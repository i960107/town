package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;

@Controller
public class MTradeReview {
	
	//�ŷ� �ı� �ۼ�
	private final String command = "tradeReview.mb";
	private final String getPage = "tradeReView";
	private final String gotoPage = "redirect:detail.prd";
	private String addGetData = "&no=";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		
		return mav;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(
			MemberBean mBean	
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		
		return mav;
	}
}

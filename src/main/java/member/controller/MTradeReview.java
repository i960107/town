package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberDao;
import member.model.MemberDealReviewBean;

@Controller
public class MTradeReview {

	private final String command = "tradeReview.mb";
	private String gotoPage = "redirect:detail.prd";
	@Autowired
	MemberDao dao;

	@RequestMapping(value = command)
	public ModelAndView doAction(MemberDealReviewBean bean) {
		ModelAndView mav = new ModelAndView();
		dao.insertDealReview(bean);
		gotoPage +="?no="+bean.getProductNo()+"&sellerid="+bean.getSellerId();
		dao.updateMannertemp(bean.getSellerId(),bean.getRating());
		System.out.println(gotoPage+"gotoPage");
		mav.setViewName(gotoPage);
		return mav;
	}

}

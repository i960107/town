package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MTradeDetailView {

	
	//상품 등록한 사용자 정보 확인
	private final String command = "tradeDetail.mb";
	private final String getPage = "tradeDetailView";
	private final String gotoPage = "redirect:detail.prd";
	private String addGetData = "&no=";
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "no", required = false) int no //임시 데이터 requ = false 데이터베이스 만들면 지워야함
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage+addGetData+no);
		return mav;
	}
}

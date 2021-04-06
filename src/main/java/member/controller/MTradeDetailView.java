package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MTradeDetailView {

	
	//��ǰ ����� ����� ���� Ȯ��
	private final String command = "tradeDetail.mb";
	private final String getPage = "tradeDetailView";
	private final String gotoPage = "redirect:detail.prd";
	private String addGetData = "&no=";
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "no", required = false) int no //�ӽ� ������ requ = false �����ͺ��̽� ����� ��������
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage+addGetData+no);
		return mav;
	}
}

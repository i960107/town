package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class MTradeDetailView {

	
	//상품 등록자 자세히보기
	private final String command = "tradeDetail.mb";
	private final String getPage = "tradeDetailView";
	private final String gotoPage = "redirect:detail.prd";
	private String addGetData = "&sellerid=";
	
	@Autowired
	MemberDao mDao;
	
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "sellerid", required = false) String sellerid
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		MemberBean mBean = mDao.getMember(sellerid);

		List<ProductBean> pList = pDao.getProductBySeller(sellerid);
		float tbean = mDao.getTemp(sellerid);
		mav.addObject("tbean", tbean);
		mav.addObject("mBean", mBean);
		return mav;
	}
}

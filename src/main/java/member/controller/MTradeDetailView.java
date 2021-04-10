package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class MTradeDetailView {

	// 상품 등록자 자세히보기
	private final String command = "tradeDetail.mb";
	private final String getPage = "tradeDetailView";
	private final String gotoPage = "redirect:detail.prd";
	private String addGetData = "&sellerid=";


	
	@Autowired
	MemberDao mDao;

	@RequestMapping(value = command)

	public ModelAndView doAction(
			@RequestParam(value = "sellerid", required = true) String sellerid
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);

		MemberBean mBean = mDao.getMember(sellerid);

		List<ProductBean> pList = mDao.getProductBySeller(sellerid);
		float mtemp = mDao.getTemp(sellerid);

		mav.addObject("mBean", mBean);
		mav.addObject("mtemp", mtemp);
		mav.addObject("pList", pList);

		return mav;
	}
}
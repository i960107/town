package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
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

		//판매자 정보
		MemberBean mBean = mDao.getMember(sellerid);

		//판매자 상품리스트
		List<ProductBean> pList = mDao.getAllProductByID(sellerid);
		
		//판매자 게시글 리스트
		List<BoardBean> bList = mDao.getBoardById(sellerid);
		
		//매너온도
		float mtemp = mDao.getTemp(sellerid);

		//데이터 넘김
		mav.addObject("mBean", mBean);
		mav.addObject("bList", bList);
		mav.addObject("mtemp", mtemp);
		mav.addObject("pList", pList);

		return mav;
	}
}
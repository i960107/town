package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;
import member.model.MemberDao;
import member.model.MemberDealReviewBean;
import product.model.ProductBean;

@Controller
public class MTradeDetailView {

	// 상품 등록자 자세히보기
	private final String command = "tradeDetail.mb";
	private final String getPage = "tradeDetailView";
	private final String gotoPage = "redirect:detail.prd";
	private String addGetData = "&sellerid=";


	
	@Autowired
	MemberDao mDao;
	@Autowired
	BoardDao bDao;

	@RequestMapping(value = command)

	public ModelAndView doAction(
			@RequestParam(value = "sellerid", required = true) String sellerid,
			HttpServletResponse response
			) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		//판매자 정보
		
		response.setContentType("text/plain;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
		MemberBean mbean = mDao.getMember(sellerid);
		if(mbean.getMemberstatus().equals("0")) { // 활동 불가
			System.out.println("계정정지됨");
		}
		//판매자 상품리스트
		List<ProductBean> pList = mDao.getAllProductByID(sellerid);
		//판매자 게시글 리스트
		List<BoardBean> bList = bDao.getBoardListById(sellerid);
		//판매자 댓글 리스크
		List<BoardBean> rList = bDao.getBoardReplyListById(sellerid);
		//매너온도
		float mtemp = mDao.getTemp(sellerid);
		//멤버 딜 리뷰
		List<MemberDealReviewBean> reviewList =mDao.getMemberDealReview(sellerid);
		//데이터 넘김
		mav.addObject("mbean", mbean);
		mav.addObject("bList", bList);
		mav.addObject("rList", rList);
		mav.addObject("mtemp", mtemp);
		mav.addObject("pList", pList);
		mav.addObject("reviewList", reviewList);

		return mav;
	}
}
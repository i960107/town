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
		MemberBean mBean = mDao.getMember(sellerid);
		//판매자 상품리스트
		List<ProductBean> pList = mDao.getAllProductByID(sellerid);
		//판매자 게시글 리스트
		List<BoardBean> bList = bDao.getBoardListById(sellerid);
		//판매자 댓글 리스크
		List<BoardBean> rList = bDao.getBoardReplyListById(sellerid);
		//매너온도
		float mtemp = mDao.getTemp(sellerid);
		//조회하려는 유저가 관리자일때 뒤로가기
		if(mBean.getAuthority()==0) {
			response.setCharacterEncoding("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			String str="<script type='text/javascript'>";
			str+="alert('관리자는 조회할 수 없습니다')";
			str+="history.go(-1)";
			str+="</script>";
			out.println(str);
			return null;
		}
		//데이터 넘김
		mav.addObject("mBean", mBean);
		mav.addObject("bList", bList);
		mav.addObject("rList", rList);
		mav.addObject("mtemp", mtemp);
		mav.addObject("pList", pList);

		return mav;
	}
}
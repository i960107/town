package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

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
	public String doAction(MemberDealReviewBean bean, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		int insertCnt = dao.insertDealReview(bean);
		gotoPage +="?no="+bean.getProductNo()+"&sellerid="+bean.getSellerId();
		dao.updateMannertemp(bean.getSellerId(),bean.getRating());
		System.out.println(gotoPage+"gotoPage");
		mav.setViewName(gotoPage);
		
		System.out.println("리뷰 삽입됨?:"+insertCnt);
		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		if(insertCnt == 1) {
			pwriter.println("<script>"
					+ "alert('정상적으로 리뷰 등록 되었습니다.');"
					 + "self.close();"
					 + "</script>");
		}
		return null;
	}

}

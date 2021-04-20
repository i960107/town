package product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDealBean;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class PProdDealUpController {
	
	private final String command="/updateDeal.prd";
	private final String getPage = "redirect:/mySaleList.prd";
	
	@Autowired
	ProductDao pdao;
	
	
	@RequestMapping(value=command)
	public String doAction(@RequestParam(value="no",required = true) int pno,
			@RequestParam(value="deal",required = true) int deal,
			@RequestParam(value="sellerid",required = true) String sellerid,
			@RequestParam(value="buyerid",required = true) String buyerid,
			HttpServletResponse response) throws IOException {
		
		System.out.println("수정 no:"+ pno);
		System.out.println("수정 deal:"+ deal);
		System.out.println("sellerid:"+sellerid); // 판매자
		System.out.println("buyerid:"+buyerid);  // 구매자
		
		ProductBean pbean = new ProductBean();
		pbean.setNo(pno);
		
		if(deal == 1) {  //판매중
			pbean.setDealstatus(0);
		}
		if(deal == 0) {  // 거래완료
			pbean.setDealstatus(1);
		}
		
		int updealCnt = pdao.upDealStatus(pbean);
		
		MemberDealBean mdbean = new MemberDealBean(0, pno, sellerid, buyerid, 0, "0");
		int insertCnt = pdao.insertDeal(mdbean);
		
		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		if(insertCnt == 1) {
			pwriter.println("<script>"
					+ "alert('거래 완료 되었습니다.');"
					 + "self.close();"
					 + "</script>");
		}
		
		return null;
	}

}

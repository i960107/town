package product.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
			@RequestParam(value="deal",required = true) int deal) {
		
		System.out.println("수정 no:"+ pno);
		System.out.println("수정 deal:"+ deal);
		
		ProductBean pbean = new ProductBean();
		pbean.setNo(pno);
		
		if(deal == 1) {  //판매중
			pbean.setDealstatus(0);
		}
		if(deal == 0) {  // 거래완료
			pbean.setDealstatus(1);
		}
		
		int updealCnt = pdao.upDealStatus(pbean);
		
		
		
		
		return getPage;
	}

}

package product.controller;


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
import product.model.ProductFileBean;
import product.model.ProductLikeBean;


@Controller
public class PDetailViewController {

	//상품 상세보기
	private final String command = "detail.prd";
	private final String getPage = "productDetailView";
	private final String gotoPage = "";
	
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "no") int no,
			@RequestParam(value = "sellerid") String sellerid
			) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		
		//상품 정보 받아옴
		ProductBean pBean = pDao.getProduct(no);
		
		//좋아요 데이터 받아옴
		List<ProductLikeBean> likeList = pDao.getLike(no);
		
		//상품 이미지 정보 받아옴
		List<ProductFileBean> fileList = pDao.getFile(no);
		
		//판매자 정보 받아옴
		MemberBean mBean = pDao.getSellerInfo(sellerid);
		
		//조회수 증가
		pDao.incrementReadCount(no);
		
		//데이터 전송
		mav.addObject("pBean", pBean);
		mav.addObject("mbean", mBean);
		mav.addObject("sellerid", sellerid);
		mav.addObject("likeList", likeList);
		mav.addObject("fileList", fileList);
		mav.addObject("likeCnt", likeList.size());
		
		return mav;
	}
	
}

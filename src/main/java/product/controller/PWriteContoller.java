package product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class PWriteContoller {
	// 상품 올리기
	private final String command = "pWrite.prd";
	private final String getPage = "productWriteForm";
	private final String gotoPage = "redirect:saleList.prd";
	
	@Autowired
	ProductDao pDao;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(
			HttpSession session, 
			HttpServletResponse response
			) throws IOException {
		ModelAndView mav = new ModelAndView();

		
		//글쓰기 로그인 체크
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");

		if (member == null) {
			//로그인 페이지 로그인하고 다시 나의당근으로 가기 
			mav.setViewName("redirect:memberlogin.mb");
			mav.addObject("plzLogin", false);
			session.setAttribute("destination", getPage);
		}else {
			mav.setViewName(getPage);	
		}
		return mav;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(
			@ModelAttribute("product") @Valid ProductBean productbean,
			BindingResult result,
			MultipartHttpServletRequest mftrequest) throws IllegalStateException, IOException {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(gotoPage);
		
		//파일 업로드
		String uploadPath = application.getRealPath("resources");
		String image1 = productbean.getImage1();
		
		System.out.println("Image : "+image1);
		MultipartFile multi = productbean.getUpload();
		
		//유효성 검사
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			mav.addObject("productbean", productbean);
			return mav;
		}
		
		//데이터 입력
		int cnt = pDao.insertProduct(productbean);
		
		//데이터 입력확인 > 파일 입력
		if(cnt==1) {
			File f = new File(uploadPath+"/"+image1);
			multi.transferTo(f);
			
		}else {
			mav.setViewName(getPage);
		}
		
		return mav;
	}
}

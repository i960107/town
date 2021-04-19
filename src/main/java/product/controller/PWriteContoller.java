package product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

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

import category.model.ProdCateBean;
import member.model.MemberBean;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class PWriteContoller {
	// 상품 올리기
	private final String command = "pWrite.prd";
	private final String getPage = "productWriteForm";
	private final String gotoPage = "redirect:/saleList.prd";
	
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

		
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");


		MemberBean mbean = pDao.getSellerInfo(member.getId()); //판매자 정보 조회
		List<ProdCateBean> cateList = pDao.getAllCategory(); //카테고리 목록 호출
		mav.addObject("mbean", mbean);
		mav.addObject("cateList", cateList);
		mav.setViewName(getPage);
		return mav;
	}
	
	//상품 등록
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(
			@ModelAttribute("product") @Valid ProductBean pbean,
			BindingResult result,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {
		
		ModelAndView mav = new ModelAndView();
		
		MemberBean mbean = pDao.getSellerInfo(pbean.getSellerid()); //판매자 정보 조회
		List<ProdCateBean> cateList = pDao.getAllCategory(); //카테고리 목록 호출
		mav.addObject("mbean", mbean);
		mav.addObject("cateList", cateList);
		
		//유효성 검사
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			mav.addObject("pbean", pbean);
			return mav;
		}
		
		//파일 업로드
		String uploadPath = application.getRealPath("resources/");
		System.out.println(uploadPath);
        
        //게시글 엔터
        if(!pbean.getContents().trim().equals("")) {
        String temp = pbean.getContents().replace("\r\n", "<br>");
        pbean.setContents(temp);
        }
        
		//데이터 입력
		pbean.setImage1("img/insert_img.jpg");
		int cnt = pDao.insertProduct(pbean);
		
		//데이터 입력확인 > 파일 입력
		if(cnt==1) {
			List<MultipartFile> mf = pbean.getUpload(); //이미지 list로 받음
			File dir = new File(uploadPath);
			if (!dir.isDirectory()) { //파일충돌 방지?
	            dir.mkdirs();
	        }
			
			int pno = pDao.getPno();
			if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) { //파일 넘어왔는지 체크
				
			}else {
				String saveName = ""; //product.image 넣을 임시변수
				for (int i = 0; i < mf.size(); i++) {
					String genId = UUID.randomUUID().toString(); //파일이름 난수 생성
					String originalfileName = mf.get(i).getOriginalFilename();  //파일 이름 받아옴
					String saveFileName = genId + "." + originalfileName; //저장 파일 이름
					if(i==0) {
						System.out.println("여기로 오세요~");
						saveName = genId + "." + originalfileName; //대표 이미지 저장용 임시 변수
					}
					String savePath = uploadPath+saveFileName; //저장 경로
					mf.get(i).transferTo(new File(savePath)); //파일 폴더에 입력
					
					pDao.fileUpload(originalfileName, saveFileName, pno); //파일 테이블 입력
				}
				pDao.fileUpload2(saveName, pno); //대표 이미지 주소 업데이트
			}

			
		}else {
			mav.setViewName(getPage); //실패 - 되 돌아가기
		}
		
		return mav; //성공 - 리스트 출력
	}
}

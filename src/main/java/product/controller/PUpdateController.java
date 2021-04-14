package product.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import category.model.ProdCateBean;
import member.model.MemberBean;
import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductFileBean;

@Controller
public class PUpdateController {

	//상품 수정, 거래 상태 변경
	private final String command = "update.prd";
	private final String getPage = "productUpdate";
	private final String gotoPage = "redirect:detail.prd";
	
	@Autowired
	ProductDao pDao;
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(
			@ModelAttribute("product") @Valid ProductBean pbean,
			BindingResult result,
			MultipartHttpServletRequest mhsq,
			ProductFileBean fbean
			) throws IllegalStateException, IOException {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(gotoPage+"?no="+pbean.getNo()+"&sellerid="+pbean.getSellerid());
		
		MemberBean mbean = pDao.getSellerInfo(pbean.getSellerid()); //판매자 정보 조회
		List<ProdCateBean> cateList = pDao.getAllCategory(); //카테고리 목록 호출 유효성 검사후 변수 자동입력 용도
		mav.addObject("mbean", mbean);
		mav.addObject("cateList", cateList);
		
		System.out.println("contents message : " + pbean.getContents());
		//유효성 검사
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			pbean.setContents(pbean.getContents().replace("\t", ""));
			mav.addObject("pbean", pbean);
			return mav;
		}
		
		//게시글 엔터
		if(!pbean.getContents().trim().equals("")) {
			String temp = pbean.getContents().replace("\r\n", "<br>");
			pbean.setContents(temp);
		}
		
		//파일 업로드
		String uploadPath = application.getRealPath("resources/"); //업로드 경로
		System.out.println(uploadPath);
		
		//데이터 수정
		pbean.setImage1("img/insert_img.jpg");
		int cnt = pDao.updateProduct(pbean);
		int delcnt = 0;
		//데이터 입력확인 > 파일 입력
		if(cnt==1) {
			List<MultipartFile> mf = pbean.getUpload(); //이미지 list로 받음
			List<String> pf = fbean.getFiletemp();
			File dir = new File(uploadPath);
			if (!dir.isDirectory()) { //파일충돌 방지?
	            dir.mkdirs();
	        }
			
			if(pf!=null) {
				for (int i = 0; i < pf.size(); i++) { //삭제할 이미지 처리
					System.out.println("delfile name : " + pf.get(i));
					File f = new File(uploadPath+"/"+pf.get(i)); //폴더에서 파일 삭제
					f.delete();
					delcnt += pDao.deleteFile(pf.get(i));
				}
			}
			System.out.println("삭제한 파일 수 : " + delcnt);
			
			int pno = pbean.getNo();
			if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) { //파일 넘어왔는지 체크
				
			}else {
				String saveName = ""; //product.image 넣을 임시변수
				for (int i = 0; i < mf.size(); i++) {
					String genId = UUID.randomUUID().toString(); //파일이름 난수 생성
					String originalfileName = mf.get(i).getOriginalFilename();  //파일 이름 받아옴
					String saveFileName = genId + "." + originalfileName; //저장 파일 이름
					if(i==0) {
						saveName = genId + "." + originalfileName; //대표 이미지 저장용 임시 변수
					}
					String savePath = uploadPath+saveFileName; //저장 경로
					mf.get(i).transferTo(new File(savePath)); //파일 폴더에 입력
					
					pDao.fileUpload(originalfileName, saveFileName, pno); //파일 테이블 입력 - product_file table
				}
				pDao.fileUpload2(saveName, pno); //대표 이미지 주소 업데이트 - product table
			}

			
		}else {
			mav.setViewName(getPage); //실패 - 되 돌아가기
		}
		
		return mav; //성공 - 리스트 출력
	}
}

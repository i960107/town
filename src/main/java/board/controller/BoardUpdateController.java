package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardFileBean;

@Controller
public class BoardUpdateController {
	private final String command = "/update.bd";
	private String getPage = "boardUpdateForm";
	private String goToPage = "redirect:/list.bd";
	@Autowired
	BoardDao dao;
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	private String doActionGet(@RequestParam("no") int no, Model model) {
		BoardBean board = dao.getBoardByNo(no);
		List<BoardFileBean> boardFileList=new ArrayList<BoardFileBean>();
		boardFileList= dao.getFileBeans(boardFileList, no);
		model.addAttribute("board", board);
		model.addAttribute("boardFileList", boardFileList);
		return getPage;

	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	private String doActionPost(MultipartHttpServletRequest mhsq, @ModelAttribute("board") @Valid BoardBean board,
			BindingResult result) throws Exception, IOException {
		if (result.hasErrors()) {
			System.out.println("오류인데");
			return getPage;
		} else {
		
		}
			//DB 업데이트
			int cnt=dao.updateBoard(board);
			//DB 업데이트 성공시
			if(cnt==1) {	
			
				String uploadPath = servletContext.getRealPath("resources");
			List<MultipartFile> mf = mhsq.getFiles("uploadFile");
			//선택한 사진 있을때
			if (mf.size() >= 1 && !(mf.get(0).getOriginalFilename().equals(""))) {
				for (int i = 0; i < mf.size(); i++) {
					dao.fileDelete(board.getNo());
					String originalFileName = mf.get(i).getOriginalFilename();
					mf.get(i).transferTo(new File(uploadPath + "/"+originalFileName));
					dao.fileUpload(board.getNo(), originalFileName);
				}
			}
			}
		/*
		 * if(cnt==1) { List<MultipartFile> mf = pbean.getUpload(); //이미지 list로 받음
		 * List<String> pf = fbean.getFiletemp(); File dir = new File(uploadPath); if
		 * (!dir.isDirectory()) { //파일충돌 방지? dir.mkdirs(); }
		 * 
		 * if(pf!=null) { for (int i = 0; i < pf.size(); i++) { //삭제할 이미지 처리
		 * System.out.println("delfile name : " + pf.get(i)); File f = new
		 * File(uploadPath+"/"+pf.get(i)); //폴더에서 파일 삭제 f.delete(); delcnt +=
		 * pDao.deleteFile(pf.get(i)); } } System.out.println("삭제한 파일 수 : " + delcnt);
		 * 
		 * int pno = pbean.getNo(); if(mf.size() == 1 &&
		 * mf.get(0).getOriginalFilename().equals("")) { //파일 넘어왔는지 체크
		 * 
		 * }else { String saveName = ""; //product.image 넣을 임시변수 for (int i = 0; i <
		 * mf.size(); i++) { String genId = UUID.randomUUID().toString(); //파일이름 난수 생성
		 * String originalfileName = mf.get(i).getOriginalFilename(); //파일 이름 받아옴 String
		 * saveFileName = genId + "." + originalfileName; //저장 파일 이름 if(i==0) { saveName
		 * = genId + "." + originalfileName; //대표 이미지 저장용 임시 변수 } String savePath =
		 * uploadPath+saveFileName; //저장 경로 mf.get(i).transferTo(new File(savePath));
		 * //파일 폴더에 입력
		 * 
		 * pDao.fileUpload(originalfileName, saveFileName, pno); //파일 테이블 입력 -
		 * product_file table } pDao.fileUpload2(saveName, pno); //대표 이미지 주소 업데이트 -
		 * product table }
		 * 
		 * 
		 * }else { mav.setViewName(getPage); //실패 - 되 돌아가기 }
		 * 
		 * 
		 * 
		 */		return goToPage;
	}
}

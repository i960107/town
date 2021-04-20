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
		model.addAttribute("address1",board.getAddress1());
		model.addAttribute("address2",board.getAddress2());
		List<BoardFileBean> boardFileList=new ArrayList<BoardFileBean>();
		boardFileList= dao.getFileBeans(boardFileList, no);
		model.addAttribute("board", board);
		model.addAttribute("boardFileList", boardFileList);
		return getPage;

	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	private String doActionPost(MultipartHttpServletRequest mhsq, @ModelAttribute("board") @Valid BoardBean board,
			BindingResult result) throws Exception, IOException {
		System.out.println("no"+board.getNo());
		System.out.println("address1"+board.getAddress1());
		System.out.println("address2"+board.getAddress2());
		System.out.println("category"+board.getCategory());
		System.out.println("subject"+board.getSubject());
		System.out.println("contents"+board.getContents());
		if (result.hasErrors()) {
			System.out.println("오류인데");
			return getPage;
		} else {
		
		}
			//DB 업데이트
			int cnt=dao.updateBoard(board);
			System.out.println("삭제");
			//DB 업데이트 성공시
			if(cnt==1) {	
				System.out.println("db업데이트?");
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
			return goToPage;

	}
}

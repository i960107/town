package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;

@Controller
public class BoardInsertController {
	private final String command = "/insert.bd";
	private String getPage = "boardInsertForm";
	private String goToPage = "redirect:/list.bd";
	@Autowired
	BoardDao dao;
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(HttpSession session,
			Model model) {
		
		//주소 셀렉용
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");
		if (member != null) {
			MemberBean mbean = dao.getMemberById(member.getId());
			model.addAttribute("mbean", mbean);
		}
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionPost(MultipartHttpServletRequest mhsq, @ModelAttribute("board") @Valid BoardBean board,
			BindingResult result) throws IllegalStateException, IOException {
		if (result.hasErrors()) {
			return getPage;
		} else {
			dao.insertBoard(board);
			int bno=dao.getMaxBoardNo();
			String uploadPath = servletContext.getRealPath("resources");
			List<MultipartFile> mf = mhsq.getFiles("uploadFile");
			/* 서버 및 테이블에 이미지 파일 업로드 */
			if (mf.size() >= 1 && !(mf.get(0).getOriginalFilename().equals(""))) {
				for (int i = 0; i < mf.size(); i++) {
					String originalFileName = mf.get(i).getOriginalFilename();
					mf.get(i).transferTo(new File(uploadPath + "/"+originalFileName));
					dao.fileUpload(bno, originalFileName);
				}
			}
		}

		return goToPage;
	}
}

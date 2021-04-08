package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class boardInsertController {
	private final String command = "insert.bd";
	private String getPage = "boardInsertForm";
	private String goToPage = "redirect:/list.bd";
	@Autowired
	BoardDao dao;
	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet() {
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doActionPost(@ModelAttribute("board" )@Valid BoardBean board, BindingResult result) throws IllegalStateException, IOException {
		if (result.hasErrors()) {
			System.out.println("오류인데");
			return getPage;
		} else {
			dao.insertBoard(board);
			String uploadPath = servletContext.getRealPath("resources");
			MultipartFile multi1 = board.getUpload1();
			if (multi1 != null) {
				File file = new File(uploadPath + "/" + board.getImage1());
				multi1.transferTo(file);
			}
			MultipartFile multi2 = board.getUpload2();
			if (multi2 != null) {
				File file = new File(uploadPath + "/" + board.getImage2());
				multi2.transferTo(file);
			}
			MultipartFile multi3 = board.getUpload3();
			if (multi3 != null) {
				File file = new File(uploadPath + "/" + board.getImage3());
				multi3.transferTo(file);
			}
		}

		return goToPage;
	}
}

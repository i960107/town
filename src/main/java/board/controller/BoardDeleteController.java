package board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.model.BoardDao;
import board.model.BoardFileBean;

@Controller
public class BoardDeleteController {
	private final String command = "/delete.bd";
	private String getPage = "redirect:/myBoard.bd";
	@Autowired
	BoardDao dao;
	@Autowired
	ServletContext context;

	@RequestMapping(command)
	private String doAction(@RequestParam("no") int no) {
		dao.deleteBoard(no);
		dao.fileDelete(no);
		List<BoardFileBean> boardFileList = new ArrayList<BoardFileBean>();
		boardFileList = dao.getFileBeans(boardFileList, no);
		String uploadPath = context.getRealPath("resources");
		System.out.println("사이즈"+boardFileList.size());
		for (BoardFileBean bean : boardFileList) {
			File file = new File(uploadPath + "/" + bean.getFileName());
			file.delete();
			System.out.println("삭제성공");
		}
		dao.deleteLike(no);
		return getPage;
	}

}

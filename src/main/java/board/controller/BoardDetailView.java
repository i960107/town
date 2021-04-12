package board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.BoardFileBean;

@Controller
public class BoardDetailView {
private final String command="detailView.bd";
private String getPage="boardDetailView";
@Autowired
BoardDao dao;

@RequestMapping(command)
public String doAction(@RequestParam("no") int no,Model model) {
    BoardBean board=dao.getBoardByNo(no);
    List<BoardFileBean> boardFileList=new ArrayList<BoardFileBean>();
    boardFileList=dao.getFileBeans(boardFileList, no);
    model.addAttribute("board",board);
    model.addAttribute("boardFileList",boardFileList);
    return getPage;
}
}
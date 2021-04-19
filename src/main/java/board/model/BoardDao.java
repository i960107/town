package board.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;
import member.model.MemberDao;

@Component
public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	MemberDao mdao;
	private String namespace = "board.BoardBean";

	public List<BoardCategoryBean> getAllCategory() {
		List<BoardCategoryBean> category_list = new ArrayList<BoardCategoryBean>();
		category_list = sqlSessionTemplate.selectList(namespace + ".getAllCategory");
		return category_list;
	}

	public List<BoardBean> getBoardList(String keyword, String category, String address1, String address2) {
		
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (keyword != null) {
			map.put("keyword", "%" + keyword + "%");
		} else {
			map.put("keyword", null);
		}

		List<String> cateList = null;
		if (category != null) {
			cateList = new ArrayList<String>();
			String[] cateArr = category.split(",");
			for (String c : cateArr) {

				cateList.add(c);
			}
		}
		//블락된 아이디 가져오기
		List<String> blockedId=new ArrayList<String>();
		blockedId=mdao.getBlockedId();
		map.put("category", cateList);
		map.put("address1", address1);
		map.put("address2", address2);
		map.put("blockedId", blockedId);
		System.out.println(map);
		boardList = sqlSessionTemplate.selectList(namespace + ".getBoardList", map);
		return boardList;
	}
	
	public void insertBoard(BoardBean board) {
		sqlSessionTemplate.selectList(namespace + ".insertBoard", board);
	}

	public void fileUpload(int no, String originalFileName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", no);
		map.put("fileName", originalFileName);
		sqlSessionTemplate.selectList(namespace + ".fileUpload", map);
	}

	public List<BoardFileBean> getFileBeans(List<BoardFileBean> boardFileList, int bno) {
		List<BoardFileBean> list = sqlSessionTemplate.selectList(namespace + ".getFileBeans", bno);
		for (BoardFileBean bean : list) {
			boardFileList.add(bean);
		}
		return boardFileList;
	}

	public int getMaxBoardNo() {
		int maxNo = sqlSessionTemplate.selectOne(namespace + ".getMaxBoardNo");
		return maxNo;
	}

	public BoardBean getBoardByNo(int no) {
		BoardBean board = sqlSessionTemplate.selectOne(namespace + ".getBoardByNo", no);
		return board;
	}

	// 나의당근 - 내 글
	public List<BoardBean> getBoardListById(String loginID) {
		List<BoardBean> lists = new ArrayList<BoardBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetBoardListById", loginID);
		return lists;
	}

	// 나의 당근 - 댓글
	public List<BoardBean> getBoardReplyListById(String loginID) {
		List<BoardBean> lists = new ArrayList<BoardBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".GetBoardReplyListById", loginID);
		return lists;
	}

	// 조회수 증가
	public void addReadcount(int no) {
		sqlSessionTemplate.update(namespace + ".addReadcount", no);
	}

	// 찜한 갯수 가져오기
	public List<BoardLikeBean> getLike(int no) {
		List<BoardLikeBean> likeList = new ArrayList<BoardLikeBean>();
		likeList = sqlSessionTemplate.selectList(namespace + ".getLike", no);
		return likeList;
	}

	// 게시글 찜하기
	public void boardLike(BoardLikeBean likeBean) {
		sqlSessionTemplate.insert(namespace + ".boardLike", likeBean);
	}

	// 게시글 싫어요
	public void boardUnlike(int no) {
		sqlSessionTemplate.delete(namespace + ".boardUnlike", no);
	}

	// 게시글 삭제
	public void deleteBoard(int no) {
		sqlSessionTemplate.delete(namespace + ".deleteBoard", no);
	}

//댓글 입력
	public void insertReply(String writer, String contents, int ref, int reLevel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", writer);
		map.put("contents", contents);
		map.put("ref", ref);
		map.put("reLevel", reLevel);
		int prevStep = getpreStep(ref);
		map.put("reStep", prevStep + 1);
		System.out.println(writer + contents + ref + reLevel);
		sqlSessionTemplate.insert(namespace + ".insertReply", map);
	}

	/* 대댓글 이전 스텝 가져오기 */
	private int getpreStep(int ref) {
		int prevStep = sqlSessionTemplate.selectOne(namespace + ".getpreStep", ref);
		return prevStep;
	}

//댓글 가져오기
	public List<BoardBean> getReplyByNo(int no) {
		List<BoardBean> lists = new ArrayList<BoardBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getReplyByNo", no);
		return lists;
	}

	// 이미지 하나만 가져오기
	public String getThumnailName(int no) {
		String thumbailName = sqlSessionTemplate.selectOne(namespace + ".getThumnailName", no);
		return thumbailName;
	}

	// 게시글 업데이트
	public int updateBoard(BoardBean board) {
		int cnt = sqlSessionTemplate.update(namespace + ".updateBoard", board);
		return cnt;
	}

	public void fileDelete(int bno) {
		sqlSessionTemplate.update(namespace + ".fileDelete", bno);
	}

	public MemberBean getMemberById(String id) {
		MemberBean mbean = sqlSessionTemplate.selectOne(namespace + ".getMemberById", id);
		return mbean;
	}

	// 우리동네 검색
	public List<BoardBean> getSearchBoardList(Map<Object, String> map) {
		List<BoardBean> searchBoardList = new ArrayList<BoardBean>();
		searchBoardList = sqlSessionTemplate.selectList(namespace + ".getSearchBoardList", map);
		System.out.println("searchBoardList" + searchBoardList);
		return searchBoardList;

	}

}

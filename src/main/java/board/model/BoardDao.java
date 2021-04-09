package board.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BoardDao {
	@Autowired
	DataSource dataSource;
	@Autowired
	SqlSessionFactoryBean sqlSessionFactoryBean;
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "board.BoardBean";

	// 전체 카테고리 가져오기
	public List<BoardCategoryBean> getAllCategory() {
		List<BoardCategoryBean> category_list = new ArrayList<BoardCategoryBean>();
		category_list = sqlSessionTemplate.selectList(namespace + ".getAllCategory");
		return category_list;
	}

	// 전체 글 가져오기
	public List<BoardBean> getAllBoard() {
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		boardList = sqlSessionTemplate.selectList(namespace + ".getAllBoard");
		System.out.println("getAllBoard" + boardList.size());
		return boardList;
	}

	// 키워드 카테고리 조건 검색 결과 가져오기
	public List<BoardBean> getBoardByCategoryKeyword(String category, String keyword) {
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		List<String> categoryList = new ArrayList<String>();
		try {
			String categoryArr[] = category.split(",");
			for (String ctg : categoryArr) {
				categoryList.add(ctg);
			}
		} catch (IndexOutOfBoundsException e) {
			System.out.println("그럼 여기로 와야지");
			categoryList.add(category);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("categoryList" + categoryList.get(0));
		map.put("categoryList", categoryList);
		map.put("keyword", "%" + keyword + "%");
		boardList = sqlSessionTemplate.selectList(namespace + ".getBoardByCategoryKeyword", map);
		return boardList;
	}

	// 원글쓰기
	public void insertBoard(BoardBean board) {
		sqlSessionTemplate.selectList(namespace + ".insertBoard", board);
	}

	// 원글 이미지이름 테이블에 넣기
	public void fileUpload(int no, String originalFileName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", no);
		map.put("fileName", originalFileName);
		sqlSessionTemplate.selectList(namespace + ".fileUpload", map);
	}

	// 원글 이미지 가져오기
	public List<BoardFileBean> getFileBeans(List<BoardFileBean> boardFileList, int bno) {
		List<BoardFileBean> list = sqlSessionTemplate.selectList(namespace + ".getFileBeans", bno);
		for (BoardFileBean bean : list) {
			boardFileList.add(bean);
		}
		return boardFileList;
	}

	// 이미지 테이블 삽입시 참조할 no가져오기
	public int getMaxBoardNo() {
		int maxNo = sqlSessionTemplate.selectOne(namespace + ".getMaxBoardNo");
		return maxNo;
	}

	// no로 게시글 가져오기
	public BoardBean getBoardByNo(int no) {
		BoardBean board = sqlSessionTemplate.selectOne(namespace + ".getBoardByNo", no);
		return board;
	}
	
	// 나의당근 - 내 글 
	public List<BoardBean> getBoardListById(String loginID) {
		List<BoardBean> lists = new ArrayList<BoardBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetBoardListById",loginID);
		return lists;
	}
	// 나의 당근 - 댓글
	public List<BoardBean> getBoardReplyListById(String loginID) {
		List<BoardBean> lists = new ArrayList<BoardBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetBoardReplyListById",loginID);
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
		System.out.println("likeBean.getUserId()"+likeBean.getUserId());
		System.out.println("likeBean.getTownBoardNo()"+likeBean.getTownBoardNo());
		sqlSessionTemplate.insert(namespace + ".boardLike", likeBean);
	}

	// 게시글 싫어요
	public void boardUnlike(int no) {
		sqlSessionTemplate.delete(namespace + ".boardUnlike", no);
	}


}

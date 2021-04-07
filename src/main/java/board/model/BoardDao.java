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

	public List<BoardCategoryBean> getAllCategory() {
		List<BoardCategoryBean> category_list = new ArrayList<BoardCategoryBean>();
		category_list = sqlSessionTemplate.selectList(namespace + ".getAllCategory");
		return category_list;
	}

	public List<BoardBean> getAllBoard() {
		List<BoardBean> board_list = new ArrayList<BoardBean>();
		board_list = sqlSessionTemplate.selectList(namespace + ".getBoard");
		return board_list;
	}

	public List<BoardBean> getBoardByKeyword(String category, String keyword) {
		List<String> category_List = new ArrayList<String>();
		if (category != null) {
			String[] category_arr = category.split(",");
			for (String ctg : category_arr) {
				category_List.add(ctg);
			}
		}
		List<BoardBean> board_list = new ArrayList<BoardBean>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category_List", category_List);
		map.put("keyword", "%" + keyword + "%");
		board_list = sqlSessionTemplate.selectList(namespace + ".getBoardByKeyword", map);
		return board_list;
	}
}

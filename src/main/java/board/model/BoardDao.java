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
	private String namespace="board.BoardBean";
	public List<String> getAllCategory() {
		List<String> category_list=new ArrayList<String>();
		category_list=sqlSessionTemplate.selectList(namespace+".getAllCategory");
		return category_list;
	}
	public List<BoardBean> getBoard(String category, String keyword) {
		List<BoardBean> board_list=new ArrayList<BoardBean>();
		Map<String,String> map=new HashMap<String,String>();
		map.put("category", category);
		map.put("category", "%"+category+"%");
		board_list=sqlSessionTemplate.selectList(namespace+".getBoard",map);
		return board_list;
	}
}

package category.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import board.model.BoardCategoryBean;
import product.model.ProdCategoryBean;



@Component("myCate")
public class CategoryDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String nameSpace = "category.model.CateBean";

	public List<BoardCategoryBean> getBoardCateData() {
		List<BoardCategoryBean> lists = new ArrayList<BoardCategoryBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".GetBoardCateData");
		
		String catename = lists.get(0).getCategoryname();
		System.out.println("catename:"+catename);
		
		return lists;
	}

	public int insertProdCate(ProdCategoryBean pcbean) {
		int cnt = sqlSessionTemplate.insert(nameSpace+".InsertProdCate",pcbean);
		
		return cnt;
	}

	public int insertBoardCate(String category_name) {
		
		int cnt = sqlSessionTemplate.insert(nameSpace+".InsertBoardCate",category_name);
		
		return cnt ;
	}

	

}

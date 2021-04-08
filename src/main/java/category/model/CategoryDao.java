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
		
		String catename = lists.get(0).getCategoryName();
		System.out.println("catename:"+catename);
		
		return lists;
	}


	public int insertBoardCate(String category_name) {
		
		int cnt = sqlSessionTemplate.insert(nameSpace+".InsertBoardCate",category_name);
		
		return cnt ;
	}

	public int delBoardCate(int bcno) {
		int cnt = sqlSessionTemplate.delete(nameSpace+".DelBoardCate", bcno);
		
		return cnt;
	}

	
	
	
	
	public int insertProdCate(String category_name) {
		int cnt = sqlSessionTemplate.insert(nameSpace+".InsertProdCate",category_name);
		
		return cnt;
	}


	public List<ProdCategoryBean> getProdCateData() {
		List<ProdCategoryBean> lists = new ArrayList<ProdCategoryBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".GetProdCateData");
		
		return lists;
	}


	public int delProdCate(int pcno) {
		int cnt = sqlSessionTemplate.delete(nameSpace+".DelProdCate", pcno);
		
		return cnt;
	}

}

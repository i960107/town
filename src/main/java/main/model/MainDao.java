package main.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMainDao")
public class MainDao {
	
	private String nameSpace = "main.model.MainBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MainBean> getAllList(Map<String, String> map){
		List<MainBean> lists = new ArrayList<MainBean>();
		lists = sqlSessionTemplate.selectList(nameSpace+".getAllList", map);
		return lists;
	}
	
}

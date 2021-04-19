package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductDao;

@Controller
public class PUpdateRegDateController {

	private final String command = "updateRegDate.prd";
	private String getPage = "redirect:detail.prd";
	
	@Autowired
	ProductDao pDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "no") int no,
			@RequestParam(value = "sellerid") String sellerid
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage+"?no="+no+"&sellerid="+sellerid);
		pDao.PUpdateRegDate(no);
		
		return mav;
	}
}

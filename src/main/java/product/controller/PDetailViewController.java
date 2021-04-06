package product.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class PDetailViewController {

	private final String command = "DetailView.prd";
	private final String getPage = "";
	private final String gotoPage = "";
	
	@RequestMapping(value = command)
	public ModelAndView doAction() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		return mav;
	}
	
}

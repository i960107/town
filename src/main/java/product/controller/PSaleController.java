package product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import category.model.ProdCateBean;
import member.model.MemberBean;
import product.model.ProdCategoryBean;
import product.model.ProductBean;
import product.model.ProductDao;
import product.model.ProductKeywordBean;

@Controller
public class PSaleController {

	// 전체 상품 목록 보기
	private final String command = "saleList.prd";
	private final String getPage = "productSaleList";
	private final String gotoPage = "redirect:saleList.mk";

	@Autowired
	ProductDao pDao;

	@RequestMapping(value = command)
	public ModelAndView doAction(@RequestParam(value = "address1", required = false) String address1,
			@RequestParam(value = "address2", required = false) String address2,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "keyword", required = false) String keyword, HttpServletResponse response,
			@RequestParam(value = "isCategorySelected", required = false) boolean isCategorySelected,
			ProductKeywordBean keywordBean, HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView();
		List<ProdCategoryBean> clist = pDao.getAllPrdCategory();
		
		// 카테고리 1이상 선택 필수
		if (isCategorySelected == true && category == null) {
			System.out.println("여기");
			PrintWriter pwriter = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
			pwriter.print("<script type='text/javascript'>");
			pwriter.print("alert('카테고리는 하나이상 선택해주세요')");
			pwriter.print("</script>");
			pwriter.flush();
			mav.addObject("category", null);
			mav.addObject("categoryList", clist);
			mav.addObject("keyword", keyword);
			mav.addObject("address1", address1);
			mav.addObject("address2", address2);
			mav.setViewName(getPage);
			return mav;
		}

		
		MemberBean member = (MemberBean) session.getAttribute("loginInfo");

		if (member != null) {
			MemberBean mbean = pDao.getSellerInfo(member.getId());
			mav.addObject("mbean", mbean);
		}

		// 검색조건에 따른 list 가져오기
		List<ProductBean> searchList = pDao.getList(keyword, category, address1, address2);
		mav.setViewName(getPage);
		mav.addObject("searchList", searchList);
		mav.addObject("requestPage", "saleList.prd");
		// 키워드
		Map<Object, String> map = new HashMap<Object, String>();
		if (keyword != null && keyword != "") { // keyword 공백제거 검색 성능 향상
			keyword = keyword.trim();
			System.out.println("keyword : " + keyword);
			map.put("keyword", "%" + keyword + "%");

			// 키워드 존재여부 확인
			boolean isKeyword = pDao.isKeyword(keyword);

			// 조건, 키워드 존재 && 키워드 조회여부
			if (isKeyword) {
				/* 키워드 갯수 업데이트 */
				pDao.upKeywordCnt(keyword);
			} else {
				/* 키워드 DB 삽입 */
				pDao.inputKeyword(keywordBean);
			}
		}

		// 카테고리 리스트
		mav.addObject("categoryList", clist);
		mav.addObject("category", category);
		return mav;
	}

	/*
	 * @RequestMapping(value=command, method = RequestMethod.POST) public
	 * ModelAndView doAction(
	 * 
	 * @RequestParam(value="whatColumn",required = false) String whatColumn,
	 * 
	 * @RequestParam(value="keyword",required = false) String keyword,
	 * 
	 * @RequestParam(value = "category", required = false) String category,
	 * ProductKeywordBean keywordBean, HttpServletRequest request, HttpSession
	 * session, HttpServletResponse response) throws IOException {
	 * 
	 * System.out.println(category);
	 * 
	 * if (category == null) { PrintWriter pwriter = response.getWriter();
	 * response.setContentType("text/html; charset=UTF-8");
	 * pwriter.print("<script type='text/javascript'>");
	 * pwriter.print("alert('카테고리는 하나이상 선택해주세요')"); pwriter.print("location.href='"
	 * + getPage + "'"); pwriter.print("</script>"); pwriter.flush(); }
	 * 
	 * 
	 * mainList.jsp 검색어 조회 설정 Map<Object,String> map = new HashMap<Object,String>();
	 * map.put("whatColumn", whatColumn); map.put("category", category); MemberBean
	 * member = (MemberBean) session.getAttribute("loginInfo");
	 * System.out.println("whatColumn:" + whatColumn);
	 * 
	 * if (keyword != null) { //keyword 공백제거 검색 성능 향상 keyword = keyword.trim();
	 * System.out.println("keyword : " + keyword); map.put("keyword",
	 * "%"+keyword+"%");
	 * 
	 * // 키워드 존재여부 확인 boolean isKeyword = pDao.isKeyword(keyword);
	 * 
	 * // 조건, 키워드 존재 && 키워드 조회여부 if (isKeyword) { 키워드 갯수 업데이트
	 * pDao.upKeywordCnt(keyword); } else { 키워드 DB 삽입
	 * pDao.inputKeyword(keywordBean); } }
	 * 
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * List<ProductBean> list = pDao.getList(); //상품 리스트 검색 mav.addObject("list",
	 * list); //상품 리스트 System.out.println("list:" + list); mav.setViewName(getPage);
	 * 
	 * 
	 * //검색 카테고리 선택 시 if(whatColumn.equals("town")) { mav.addObject("keyword",
	 * keyword); mav.setViewName("redirect:/list.bd");
	 * 
	 * } else { // whatColumn == product //Map<Object,String> map2 = new
	 * HashMap<Object,String>(); List<ProductBean> searchList =
	 * pDao.getSearchList(map); mav.addObject("searchList", searchList);
	 * System.out.println("searchList:" + searchList); mav.setViewName(getPage); }
	 * 
	 * //로그인 정보 if (member != null) { MemberBean mbean =
	 * pDao.getSellerInfo(member.getId()); mav.addObject("mbean", mbean); } //카테고리
	 * 리스트 mav.addObject("category", category); mav.setViewName(getPage);
	 * mav.addObject("requestPage", "saleList.prd"); return mav; }
	 */

}

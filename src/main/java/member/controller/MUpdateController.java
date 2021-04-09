package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MUpdateController {

	private final String command = "memberUpdate.mb";
	private final String getPage = "memberUpdateForm";
	private final String gotoPage = "redirect:/myPage.mb";

	@Autowired
	MemberDao mdao;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionGet(HttpSession session, Model model) {

		// 로그인한 아이디 가져오기
		MemberBean midBean = (MemberBean) session.getAttribute("loginInfo");

		MemberBean mbean = mdao.loginCkId(midBean);

		model.addAttribute("mbean", mbean);

		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionPost(@ModelAttribute("member") @Valid MemberBean mbean, BindingResult result,
			HttpServletResponse response, @RequestParam(value = "orgImage", required = true) String orgImage,
			HttpSession session)
			throws IOException {

		System.out.println("오리진 이미지:" + orgImage); // ""
		System.out.println("새로 업데이트할 이미지:" + mbean.getImage()); // cake1.jpg

		// 위치설정
		String uploadPath = servletContext.getRealPath("/resources/members");

		ModelAndView mav = new ModelAndView();

		PrintWriter pwriter = response.getWriter(); // IOException
		response.setContentType("text/html; charset=UTF-8");

		MultipartFile multi = mbean.getUpload();

		// 유효성 오류 > 폼
		if (result.hasErrors()) {
			mav.addObject("mbean", mbean);
			mav.setViewName(getPage);

			// 유효성 오류 x
		} else {

			// 비밀번호 다르면
			if (!mbean.getPw().equals(mbean.getPwCheck())) {
				pwriter.print("<script type='text/javascript'>");
				pwriter.print("alert('비밀번호가 일치하지 않습니다')");
				pwriter.print("</script>");
				pwriter.flush();

				mav.addObject("mbean", mbean);
				mav.setViewName(getPage);

			} else {
				// 비밀번호 같으면 업데이트

				if (orgImage != "") { // 오리진이미지 잇고
					if (mbean.getImage() != "") { // 새파일 있고
						// 여기서 오리진 파일 삭제, 새 파일 업로드
						int upCnt = mdao.memberModify(mbean);

						File delFile = new File(uploadPath + "/" + orgImage);
						delFile.delete();

						File uploadFile = new File(uploadPath + "/" + mbean.getImage());
						multi.transferTo(uploadFile);

						mav.setViewName(gotoPage);
					} else { // 새 파일 없어,
								// 여기서 오리진 삭제 안하고, 뉴삽입도 안해
						mbean.setImage(orgImage);
						int upCnt = mdao.memberModify(mbean);

						mav.setViewName(gotoPage);
					}
				} else { // 오리진이미지 x ,
					int upCnt = mdao.memberModify(mbean);
					File uploadFile = new File(uploadPath + "/" + mbean.getImage());
					multi.transferTo(uploadFile);

					mav.setViewName(gotoPage);

				}
			
			}
			session.setAttribute("loginInfo", mbean);
		}

		return mav;
	}

}

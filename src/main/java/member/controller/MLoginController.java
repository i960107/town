package member.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import member.model.OAuthTokenBean;
import member.model.KakaoBean;
import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MLoginController {

	private final String command = "memberlogin.mb";
	private final String getPage = "memberLoginForm";
	private String gotoPage = "redirect:/main.mk";

	@Autowired
	MemberDao mdao;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doActionG() {

		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doActionP(HttpServletRequest request, @RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "pw", required = true) String pw, HttpServletResponse response, HttpSession session)
			throws IOException {

		MemberBean mbean = new MemberBean();
		mbean.setId(id);
		// 아이디 체크하기
		MemberBean midBean = mdao.loginCkId(mbean);

		PrintWriter pwriter = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");

		ModelAndView mav = new ModelAndView();

		// 아이디 없음
		if (midBean == null) {
			pwriter.print("<script type='text/javascript'>");
			pwriter.print("alert('존재하는 ID가 없습니다.')");
			pwriter.print("</script>");
			pwriter.flush();
			mav.setViewName(getPage);
		}
		// 아이디 존재
		else {
			// id + pw
			if (pw.equals(midBean.getPw())) {
				session.setAttribute("loginInfo", midBean);

				if (session.getAttribute("destination") != null) {
					gotoPage = (String) session.getAttribute("destination");
					session.removeAttribute("destination");
				}
				mav.setViewName(gotoPage);
			}
			// id o, pw x
			else {
				pwriter.print("<script type='text/javascript'>");
				pwriter.print("alert('비밀번호가 일치하지 않습니다.')");
				pwriter.print("</script>");
				pwriter.flush();

				mav.addObject("id", id);
				mav.setViewName(getPage);

			}
		}

		return mav;
	}
	
	@RequestMapping(value = "kakaologin.mb", method = RequestMethod.GET)
	public @ResponseBody ModelAndView doAction(String code,
			HttpServletResponse httpresponse,
			HttpSession session) throws IllegalStateException, IOException {
		System.out.println(code);
		ModelAndView mav = new ModelAndView();
		RestTemplate rt = new RestTemplate(); //httpsURLConnection post방식으로 java에서 넘기기
		HttpHeaders header = new HttpHeaders();//header object
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>(); //map으로 param값 받음
		
		//content-type header 넘기는 url
		header.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//http object 토큰과 코드들
		params.add("grant_type", "authorization_code");
		params.add("client_id", "6a065330b97f7755c569892d3485de7b");
		params.add("redirect_uri", "http://localhost:8080/ex/kakaologin.mb");
		params.add("code", code);
		
		//http로 넘길 map파일
		HttpEntity<MultiValueMap<String, String>> kakaoToken = new HttpEntity<MultiValueMap<String, String>>(params, header);
		
		// post 방식으로 http 요청
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token", HttpMethod.POST, kakaoToken, String.class
				); //토큰 발급 요청주소, 요청방식, 넘길 데이터, 받을 데이터 타입
		mav.setViewName(gotoPage);
		
		//요청한 http 결과값 받음
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthTokenBean otoken = objectMapper.readValue(response.getBody(), OAuthTokenBean.class);
		System.out.println(otoken.getAccess_token()); //oauth 토큰
		System.out.println(otoken.getScope()); //넘어오는 데이터
		System.out.println("----------");
		
		RestTemplate rt2 = new RestTemplate(); //httpsURLConnection post방식으로 java에서 넘기기
		HttpHeaders header2 = new HttpHeaders();//header object
		
		//kakao 필요한 property header
		header2.add("Authorization", "Bearer "+otoken.getAccess_token());
		header2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		HttpEntity<MultiValueMap<String, String>> kakaoProfile = new HttpEntity<MultiValueMap<String, String>>(params, header2);
		
		// post 방식으로 http 요청
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me", 
				HttpMethod.POST,
				kakaoProfile,
				String.class
				); //토큰 발급 요청주소, 요청방식, 넘길 데이터, 받을 데이터 타입

		System.out.println(response2.getBody());
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoBean kakaoProfile2 = objectMapper2.readValue(response2.getBody(), KakaoBean.class);
		
		System.out.println("-------카카오 정보-----");
		System.out.println(kakaoProfile2.getId());
		System.out.println(kakaoProfile2.getkakao_account().getEmail());
		
		MemberBean mbean = new MemberBean();
		//id name password email
		//아이디
		mbean.setId(String.valueOf(kakaoProfile2.getId()));
		//이메일
		mbean.setEmail(kakaoProfile2.getkakao_account().getEmail());
		//성별
		String gender = "여";
		if(kakaoProfile2.getkakao_account().gethas_gender()==null) {
			gender = "여";
			if(kakaoProfile2.getkakao_account().gethas_gender().equals("남자")) {
				gender = "남";
			}
		}
		mbean.setName(kakaoProfile2.getkakao_account().getProfile().getNickname());
		mbean.setGender(gender);
		//패스워드 랜덤값
		UUID temppw = UUID.randomUUID();
		mbean.setPw(String.valueOf(temppw));
		//이름
		mbean.setName(kakaoProfile2.getkakao_account().getProfile().getNickname());
		//프로필 이미지
		mbean.setImage(kakaoProfile2.getkakao_account().getProfile().getthumbnail_image_url());
		//회원정보 세팅
		mav.addObject("mbean", mbean);
		int ck = mdao.kakaoLogin(mbean);
		System.out.println("logincontroller : " + mbean.getId());
		if(ck==0) {
			httpresponse.setContentType("text/html; charset=UTF-8");
			System.out.println("oauthjoin : " + mbean.getId());
			
			mdao.kakaoRegister(mbean);

		}
		mbean = mdao.getMember(mbean.getId());

		if (session.getAttribute("destination") != null) {
			gotoPage = (String) session.getAttribute("destination");
			session.removeAttribute("destination");
		}
		session.setAttribute("loginInfo", mbean);
		mav.setViewName(gotoPage);
		
		return mav;
	}

}

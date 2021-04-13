package test.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object obj = session.getAttribute("loginInfo");

		if (obj == null) {
			String uri=request.getRequestURI();
			System.out.println(request.getRequestURL());
			System.out.println(request.getContextPath());
			System.out.println(request.getHeader("referer"));
			String destination ="redirect:"+request.getHeader("referer").substring(25);
			// 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
			session.setAttribute("destination", destination);
			System.out.println("Dest" + destination);
			response.sendRedirect(request.getContextPath() + "/memberlogin.mb");
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}
		// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
		// 따라서 true로하면 컨트롤러 uri로 가게 됨.
		return true;
	}

}

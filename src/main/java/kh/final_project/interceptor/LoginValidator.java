package kh.final_project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginValidator implements HandlerInterceptor {
	// 지하철역 카드찍는 기계 같은거임
	@Autowired
	private HttpSession httpSession;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String code = (String) httpSession.getAttribute("code");
		if (code != null)
			return true; // 카드 찍고 지하철타러 감
		response.sendRedirect("/error");
		return false;
		// 무임승차는 안됨
	}
}

package kh.final_project.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import kh.final_project.repositories.MemberDAO;

public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();

		logout(session);
	}

	public static void logout(HttpSession session) {
		if (session.getAttribute("code") != null) {
			int loginCode = (int) session.getAttribute("code");

			// 세션 비우기
			session.invalidate();

			// DB 접속중 컬럼 변경
			MemberDAO dao = (MemberDAO) WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()).getBean("memberDAO");
			if (dao != null)
				dao.logout(loginCode);
		}
	}

}

package web.listener;

import java.util.Set;

import dto.LoginUser;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

public class LoginUserRemoveListener implements HttpSessionListener {

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
		
		ServletContext application = session.getServletContext();
		Set<LoginUser> set = (Set<LoginUser>) application.getAttribute("LOGIN_USERS");
		if (set != null) {
			set.remove(loginUser);
		}
	}
	
}

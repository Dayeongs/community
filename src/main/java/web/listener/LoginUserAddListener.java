package web.listener;

import java.util.HashSet;
import java.util.Set;

import dto.LoginUser;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

public class LoginUserAddListener implements HttpSessionAttributeListener {

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		
		// 세션에 추가된 속성값을 조회한다.
		LoginUser loginUser = (LoginUser) se.getValue();
		
		// HttpSession객체를 획득한다. (세션을 알아야 ServletContext객체 획득 가능)
		HttpSession session = se.getSession();
		
		// ServletContext 객체를 획득한다. (누구나 볼 수 있도록 하기 위해서)
		ServletContext application = session.getServletContext();
		Set<LoginUser> set = (Set<LoginUser>) application.getAttribute("LOGIN_USERS");
		if (set == null) {
			set = new HashSet<LoginUser>();
			application.setAttribute("LOGIN_USERS", set);
		}
		set.add(loginUser);

	}
	
}

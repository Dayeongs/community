package web;

import java.io.IOException;
import java.util.Set;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/*
@WebFilter(urlPatterns = "/*", 
           initParams = {
        		   @WebInitParam(name = "attrName", value = "LOGIN_USER")
           }
)
*/
public class LoginCheckFilter implements Filter {
	
	// 로그인한 사용자만 접근이 허용된 요청 URI를 저장하는 Set객체다.
	private Set<String> urlSet = Set.of(
			"/community/board/form.jsp", 
			"/community/board/insert.jsp", 
			"/community/board/modifyform.jsp",
			"/community/board/modify.jsp",
			"/community/board/delete.jsp",
			"/community/user/info.jsp",
			"/community/todo/form.jsp",
			"/community/todo/insert.jsp",
			"/community/file/form.jsp",
			"/community/file/insert.jsp");
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
	@Override
	public void destroy() {	
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {	
		
		HttpServletRequest httpReq = (HttpServletRequest) req;
		HttpServletResponse httpRes = (HttpServletResponse) res;
		
		// 전처리 코드 작성하는 곳
		
		// 요청 URI값을 조회한다.
		// 요청 URI는 URI에서 url-path 값을 반환한다.
		String requestURI = httpReq.getRequestURI();
		
		if (urlSet.contains(requestURI)) {
			// 로그인이 필요한 요청이다.
			HttpSession session = httpReq.getSession();
			if (session.getAttribute("LOGIN_USER") != null) {
				filterChain.doFilter(req, res);
			} else {
				httpRes.sendRedirect("/community/loginform.jsp?error=deny");
			}
		} else {
			// 로그인이 필요하지 않는 요청이다.
			filterChain.doFilter(req, res);
		}
		
		// 후처리 코드 작성하는 곳
				
	}
	
}

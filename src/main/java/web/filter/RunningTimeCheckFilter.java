package web.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class RunningTimeCheckFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {
		
		// 서블릿/jsp 실행전 시간을 조회한다.
		long startUnixTime = System.currentTimeMillis();
		
		filterChain.doFilter(req, res);
		
		// 서블릿/jsp 실행후 시간을 조회한다.
		long endUnixTime = System.currentTimeMillis();
		
		// 두 시간간의 간격을 계산한다.
		long runningTime = endUnixTime - startUnixTime;
		System.out.println("실행시간:" + runningTime + "밀리초");
		
	}

}

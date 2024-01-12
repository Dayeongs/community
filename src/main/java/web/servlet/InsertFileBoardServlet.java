package web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import dao.FileBoardDao;
import dto.LoginUser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vo.FileBoard;
import vo.User;

/*
 * @WebServlet
 * 		+ 이 클래스가 HTTP 요청을 처리하는 서블릿으로 동작하게 하는 어노테이션이다.
 * 		+ urlPatterns는 이 서블릿을 실행하기 위한 요청 URL을 지정한다.
 * 
 * @MultipartConfig
 * 		+ 멀티파트 요청을 처리할 수 있는 서블릿으로 동작하게 하는 어노테이션이다.
 * 		+ 이 어노테이션이 지정되어 있지 않으면
 * 			요청파라미터값을 조회할 수 없고, 첨부파일 업로드도 할 수 없다.
 */
@WebServlet(urlPatterns = "/file/insert")
@MultipartConfig
public class InsertFileBoardServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청파라미터값 조회하기
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		
		// 업로드된 첨부파일 처리하기
		// <input type="file" name="upfile">입력필드에 대한 처리
		// Part 객체를 생성하여 Part 객체의 값(파일이름, 사이즈)을 꺼낸다.
		Part part = request.getPart("upfile");
		String fileName = System.currentTimeMillis() + part.getSubmittedFileName();
		long fileSize = part.getSize();
		
		// 로그인된 사용자정보 조회하기
		HttpSession session = request.getSession();
		LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
		
		User user = new User();
		user.setNo(loginUser.getNo());
		
		// FileBoard객체를 생성해서 조회된 정보를 저장한다.
		FileBoard fileBoard = new FileBoard();
		fileBoard.setTitle(title);
		fileBoard.setDescription(description);
		fileBoard.setFileName(fileName);
		fileBoard.setFileSize(fileSize);
		fileBoard.setUser(user);
		
		// fileBoardDao객체를 생성한다.
		FileBoardDao fileBoardDao = new FileBoardDao();
		try {
			// 새 파일게시글 정보를 insertFileBoard(FileBoard fileBoard) 메소드
			// 실행시 전달해서 저장시킨다.
			fileBoardDao.insertFileBoard(fileBoard);			
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
		
		// 업로드된 첨부파일을 원하는 폴더에 저장시킨다.
		
		// 지정된 폴더에 업로드된 파일명으로 파일정보를 기록하는 스크림을 생성한다.
		String saveDirectory = "c:/workspace/files";
		File file = new File(saveDirectory, fileName);
		OutputStream out = new FileOutputStream(file);
		
		// 업로드된 첨부파일을 읽어오는 스트림을 획득한다.
		InputStream in = part.getInputStream();
		
		// InputStream으로 첨부파일의 정보를 읽어서, OutputStream으로 파일을 기록한다.
		byte[] buf = new byte[1024];
		int len = 0;
		while ((len = in.read(buf)) != -1) {
			out.write(buf, 0, len);
		}
		out.close();
		
		// 파일게시글 목록을 재요청하는 URL을 응답으로 보낸다.
		response.sendRedirect("list.jsp");
		
	}
	
}

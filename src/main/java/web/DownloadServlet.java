package web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.SQLException;

import org.apache.commons.io.IOUtils;

import dao.FileBoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.FileBoard;

@WebServlet(urlPatterns = "/file/download")
public class DownloadServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 요청 URL
		 * 		localhost/community/file/download?no=xxx
		 * 요청 파라미터
		 * 		no=xxx
		 * 		* no 파일 게시글 번호
		 */
		try {
			// 요청 파라미터 조회
			int fileBoardNo = Integer.valueOf(request.getParameter("no"));
			
			FileBoardDao fileBoardDao = new FileBoardDao();
			FileBoard fb = fileBoardDao.getFileBoardByNo(fileBoardNo);
			
			String directory = "c:/workspace/files";
			String fileName = fb.getFileName();
			String realFileName = fb.getRealFileName();
			long fileSize = fb.getFileSize();
			
			// 응답컨텐츠의 타입을 지정한다.
			response.setContentType("application/octet-stream");
			// 응답컨텐츠의 길이를 지정한다.
			response.setContentLengthLong(fileSize);
			// 응답메세지의 응답헤더에 다운로드되는 첨부파일의 이름을 지정한다.
			// Content-Disposition은 응답 메세지의 바디부에 오는 컨텐츠의 특성을 알려주는 헤더정보다.
			String encodedFileName = URLEncoder.encode(realFileName, "UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + encodedFileName);
			
			// 다운로드할 파일을 읽어오는 스트림을 생성한다.
			InputStream in = new FileInputStream(new File(directory, fileName));
			// 브라우저로 이전데이터를 출력하는 스트림을 획득한다.
			OutputStream out = response.getOutputStream();
			
			// InputStream으로 읽어온 데이터를 OutputStream으로 내려보낸다.
			IOUtils.copy(in, out);
			
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
}

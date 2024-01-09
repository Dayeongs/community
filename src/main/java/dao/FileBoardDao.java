package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.FileBoard;

public class FileBoardDao {
	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	/**
	 * 새 파일 게시글 정보를 전달받아서 테이블에 저장시킨다.
	 * @param fileBoard 새 파일 게시글 정보
	 * @throws SQLException
	 */
	public void insertFileBoard(FileBoard fileBoard) throws SQLException {
		ibatis.insert("file-boards.insertFileBoard", fileBoard);
	}
	
	/**
	 * 모든 파일게시글 정보를 조회해서 반환한다.
	 * @return 모든 파일 게시글 정보 목록
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<FileBoard> getFileBoards() throws SQLException {
		return (List<FileBoard>) ibatis.queryForList("file-boards.getFileBoards");
	}

	/**
	 * 지정된 파일 게시글 번호에 해당하는 파일 게시글 정보를 반환한다.
	 * @param no 조회할 파일 게시글 번호
	 * @return 파일 게시글 정보
	 * @throws SQLException
	 */
	public FileBoard getFileBoardByNo(int no) throws SQLException {
		return (FileBoard) ibatis.queryForObject("file-boards.getFileBoardByNo", no);
	}
}


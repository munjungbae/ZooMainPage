package co.kh.dev.boardone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import co.kh.dev.common.ConnectionPool;

public class BoardDAO {
	// 1. DAO를 싱글톤 방식으로 변경하는 방법 - 1
	private static BoardDAO instance;

	// 2. DAO를 싱글톤 방식으로 변경하는 방법 - 2 (생성자)
	private BoardDAO() {

	}

	// 2. DAO를 싱글톤 방식으로 변경하는 방법 - 3 (getter)
	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}

	private final String SELECT_SQL = "SELECT * FROM BOARD ORDER BY NUM DESC";

	private final String SELECT_START_END_SQL = "select * from "
			+ "(select rownum as rnum, num, writer,email, subject, pass,regdate, readcount, ref, step, depth, content, ip from "
			+ "(select * from board order by ref desc, step asc))" + " where rnum>=? and rnum<=?";

	private final String SELECT_COUNT_SQL = "SELECT COUNT(*) AS COUNT FROM BOARD";
	private final String SELECT_MAX_NUM_SQL = "select max(num) as NUM from board";
	private final String SELECT_ONE_SQL = "SELECT * FROM BOARD WHERE NUM = ?";
	private final String SELECT_PASS_SQL = "select count(*) as count from board where num = ? and pass = ?";

	private final String INSERT_SQL = "insert into board(num, writer, subject, pass, regdate, ref, step, depth, content) "
			+ "values(board_seq.nextval,?,?,?,?,?,?,?,?)";

	private final String UPDATE_STEP_SQL = "update board set step=step+1 where ref= ? and step > ?";
	private final String UPDATE_SQL = "update board set writer= ?, subject= ?, content= ? where num= ?";
	private final String UPDATE_READCOUNT_SQL = "update board set readcount=readcount+1 where num = ?";
	private final String DELETE_SQL = "DELETE FROM BOARD WHERE NUM = ? AND PASS = ?";

	public Boolean insertDB(BoardVO bvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		int count = 0;
		int number = 0;
		int step = 0;
		int depth = 0;
		int ref = 1;
		try {
			pstmt = con.prepareStatement(SELECT_MAX_NUM_SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 가장 최고값 + 1
				number = rs.getInt("NUM") + 1;
			} else {
				// 가장 최고값이 없다면 1
				number = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			if (bvo.getNum() != 0) {// 답변글일경우
				pstmt = con.prepareStatement(UPDATE_STEP_SQL);
				pstmt.setInt(1, bvo.getRef());
				pstmt.setInt(2, bvo.getStep());
				pstmt.executeUpdate();
				ref = bvo.getRef();
				step = bvo.getStep() + 1;
				depth = bvo.getDepth() + 1;
			} else {// 새 글일 경우
				ref = number; // 가장최고값 + 1
				step = 0;
				depth = 0;
			} // 쿼리를 작성
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 게시판 글 입력
		try {
			pstmt = con.prepareStatement(INSERT_SQL);
			pstmt.setString(1, bvo.getWriter());
			pstmt.setString(2, bvo.getSubject());
			pstmt.setString(3, bvo.getPass());
			pstmt.setTimestamp(4, bvo.getRegdate());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, step);
			pstmt.setInt(7, depth);
			pstmt.setString(8, bvo.getContent());

			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count != 0) ? (true) : (false);
	}

	public ArrayList<BoardVO> selectDB() {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = (rs.getInt("num"));
				String writer = (rs.getString("writer"));
				String eamil = (rs.getString("email"));
				String subject = (rs.getString("subject"));
				String pass = (rs.getString("pass"));
				Timestamp regdate = (rs.getTimestamp("regdate"));
				int readcount = (rs.getInt("readcount"));
				int ref = (rs.getInt("ref"));
				int step = (rs.getInt("step"));
				int depth = (rs.getInt("depth"));
				String content = (rs.getString("content"));
				String ip = (rs.getString("ip"));

				BoardVO bvo = new BoardVO(num, writer, eamil, subject, pass, readcount, ref, step, depth, regdate,
						content, ip);

				boardList.add(bvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return boardList;
	}

	public int selectCounteDB() {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(SELECT_COUNT_SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return count;
	}

	public BoardVO selectBoardDB(BoardVO bvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO vo = null;
		int count = 0;
		try {
			// 조회수 증가.
			pstmt = con.prepareStatement(UPDATE_READCOUNT_SQL);
			pstmt.setInt(1, bvo.getNum());
			count = pstmt.executeUpdate();

			// num에 따른 전체내용
			pstmt = con.prepareStatement(SELECT_ONE_SQL);
			pstmt.setInt(1, bvo.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int num = (rs.getInt("num"));
				String writer = (rs.getString("writer"));
				String eamil = (rs.getString("email"));
				String subject = (rs.getString("subject"));
				String pass = (rs.getString("pass"));
				Timestamp regdate = (rs.getTimestamp("regdate"));
				int readcount = (rs.getInt("readcount"));
				int ref = (rs.getInt("ref"));
				int step = (rs.getInt("step"));
				int depth = (rs.getInt("depth"));
				String content = (rs.getString("content"));
				String ip = (rs.getString("ip"));

				vo = new BoardVO(num, writer, eamil, subject, pass, readcount, ref, step, depth, regdate, content, ip);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return vo;
	}

	public BoardVO selectBoardOneDB(BoardVO bvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO vo = null;
		int count = 0;

		try {

			// num에 따른 전체내용
			pstmt = con.prepareStatement(SELECT_ONE_SQL);
			pstmt.setInt(1, bvo.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int num = (rs.getInt("num"));
				String writer = (rs.getString("writer"));
				String eamil = (rs.getString("email"));
				String subject = (rs.getString("subject"));
				String pass = (rs.getString("pass"));
				Timestamp regdate = (rs.getTimestamp("regdate"));
				int readcount = (rs.getInt("readcount"));
				int ref = (rs.getInt("ref"));
				int step = (rs.getInt("step"));
				int depth = (rs.getInt("depth"));
				String content = (rs.getString("content"));
				String ip = (rs.getString("ip"));

				vo = new BoardVO(num, writer, eamil, subject, pass, readcount, ref, step, depth, regdate, content, ip);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return vo;
	}

	public int updateDB(BoardVO bvo) {
		// 반환값이 1일때 : 성공
		// 2일때 : 패스워드 문제
		// 3일때 : 수정문제
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int passCheckCount = 0;
		int count = 0;
		int returnValue = 1;

		try {
			pstmt = con.prepareStatement(SELECT_PASS_SQL);
			pstmt.setInt(1, bvo.getNum());
			pstmt.setString(2, bvo.getPass());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				passCheckCount = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (passCheckCount != 0) {
			// 게시판 입력시 패스워드를 입력하였으니 수정을 위한 키로 사용.
			try {
				pstmt = con.prepareStatement(UPDATE_SQL);
				pstmt.setString(1, bvo.getWriter());
				pstmt.setString(2, bvo.getSubject());
				pstmt.setString(3, bvo.getContent());
				pstmt.setInt(4, bvo.getNum());
				count = pstmt.executeUpdate();
				if (count == 0) {
					returnValue = 3;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				cp.dbClose(con, pstmt);
			}
		} else {
			returnValue = 2;
		}
		return returnValue;
	}

	public boolean deleteDB(BoardVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(DELETE_SQL);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getPass());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}

		return (count > 0) ? (true) : (false);
	}

	public ArrayList<BoardVO> selectStartEndDB(int start, int end) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>(end - start + 1);// end-start+1 ArrayList의 개수를 10개로 먼저 지정
		try {
			pstmt = con.prepareStatement(SELECT_START_END_SQL);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = (rs.getInt("num"));
				String writer = (rs.getString("writer"));
				String eamil = (rs.getString("email"));
				String subject = (rs.getString("subject"));
				String pass = (rs.getString("pass"));
				Timestamp regdate = (rs.getTimestamp("regdate"));
				int readcount = (rs.getInt("readcount"));
				int ref = (rs.getInt("ref"));
				int step = (rs.getInt("step"));
				int depth = (rs.getInt("depth"));
				String content = (rs.getString("content"));
				String ip = (rs.getString("ip"));

				BoardVO bvo = new BoardVO(num, writer, eamil, subject, pass, readcount, ref, step, depth, regdate,
						content, ip);

				boardList.add(bvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return boardList;
	}
}

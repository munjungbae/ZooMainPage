package co.kh.dev.memberone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.kh.dev.common.ConnectionPool;

public class StudentDAO {
	private final String SELECT_ID_SQL = "SELECT COUNT(*) AS COUNT FROM STUDENT WHERE ID = ?";
	private final String SELECT_LOGIN_SQL = "SELECT * FROM STUDENT WHERE ID = ?";

	private final String SELECT_ZIPCODE_SQL = "SELECT ZIPCODE, SIDO, GUGUN, DONG, BUNJI FROM ZIPCODE WHERE DONG LIKE ?";
	private final String INSERT_STUDENT = "INSERT INTO STUDENT VALUES(?,?,?,?,?,?,?,?,?,?)";
	private final String UPDATE_STUDENT = "UPDATE STUDENT SET PASS=?, PHONE2=?, PHONE3=?, EMAIL=?, ZIPCODE=?, ADDRESS1=?, ADDRESS2=? WHERE ID = ?";
	private final String DELETE_STUDENT = "DELETE FROM STUDENT WHERE ID = ?";
	// 전체를 DB에서 출력

	public ArrayList<StudentVO> selectDB() {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StudentVO> tmList = new ArrayList<StudentVO>();
		try {
			pstmt = con.prepareStatement(SELECT_ID_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("ID");
				String pass = rs.getString("PASS");
				String name = rs.getString("NAME");
				String phone1 = rs.getString("PHONE1");
				String phone2 = rs.getString("PHONE2");
				String phone3 = rs.getString("PHONE3");
				String eMail = rs.getString("EMAIL");
				String zipcode = rs.getString("ZIPCODE");
				String address1 = rs.getString("ADDRESS");
				String address2 = rs.getString("JOB");
				
				StudentVO svo = new StudentVO(id, pass, name, phone1, phone2, phone3, eMail, zipcode, address1, address2);
				tmList.add(svo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return tmList;
	}

	public boolean selectIdCheck(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int count = 0;
		try {
			pstmt = con.prepareStatement(SELECT_ID_SQL);
			pstmt.setString(1, svo.getId());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return (count != 0) ? true : false;
	}

	public int selectLoginCheck(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String pass = null;
		int check = -1;

		try {
			pstmt = con.prepareStatement(SELECT_LOGIN_SQL);
			pstmt.setString(1, svo.getId());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				pass = rs.getString("PASS");
				check = (pass.equals(svo.getPass())) ? (1) : (0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return check;
	}

	public Boolean insertDB(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(INSERT_STUDENT);
			pstmt.setString(1, svo.getId());
			pstmt.setString(2, svo.getPass());
			pstmt.setString(3, svo.getName());
			pstmt.setString(4, svo.getPhone1());
			pstmt.setString(5, svo.getPhone2());
			pstmt.setString(6, svo.getPhone3());
			pstmt.setString(7, svo.getEmail());
			pstmt.setString(8, svo.getZipcode());
			pstmt.setString(9, svo.getAddress1());
			pstmt.setString(10, svo.getAddress2());

			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count != 0) ? (true) : (false);
	}

	public ArrayList<ZipCodeVO> selectZipCodeCheck(ZipCodeVO zvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ZipCodeVO> zList = new ArrayList<ZipCodeVO>();

		try {
			pstmt = con.prepareStatement(SELECT_ZIPCODE_SQL);
			String dongValue = "%" + zvo.getDong() + "%";
			pstmt.setString(1, dongValue);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				String zipcode = rs.getString("ZIPCODE");
				String sido = rs.getString("SIDO");
				String gugun = rs.getString("GUGUN");
				String dong = rs.getString("DONG");
				String bunji = rs.getString("BUNJI");

				ZipCodeVO obj = new ZipCodeVO(zipcode, sido, gugun, dong, bunji);
				zList.add(obj);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return zList;
	}

	public StudentVO selectOneDB(StudentVO svo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentVO resultVO = null;

		try {
			pstmt = con.prepareStatement(SELECT_LOGIN_SQL);
			pstmt.setString(1, svo.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {// 해당 아이디에 대한 회원이 존재
				String id = rs.getString("ID");
				String pass = rs.getString("PASS");
				String name = rs.getString("NAME");
				String phone1 = rs.getString("PHONE1");
				String phone2 = rs.getString("PHONE2");
				String phone3 = rs.getString("PHONE3");
				String eMail = rs.getString("EMAIL");
				String zipcode = rs.getString("ZIPCODE");
				String address1 = rs.getString("ADDRESS1");
				String address2 = rs.getString("ADDRESS2");
				resultVO = new StudentVO(id, pass, name, phone1, phone2, phone3, eMail, zipcode, address1, address2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return resultVO;
	}

	public Boolean updateDB(StudentVO svo){
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(UPDATE_STUDENT);
			pstmt.setString(1, svo.getPass());
			pstmt.setString(2, svo.getPhone2());
			pstmt.setString(3, svo.getPhone3());
			pstmt.setString(4, svo.getEmail());
			pstmt.setString(5, svo.getZipcode());
			pstmt.setString(6, svo.getAddress1());
			pstmt.setString(7, svo.getAddress2());
			pstmt.setString(8, svo.getId());

			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count != 0) ? (true) : (false);
	}
	
	
	public Boolean deleteDB(StudentVO svo){
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(DELETE_STUDENT);
			pstmt.setString(1, svo.getId());
			
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count != 0) ? (true) : (false);
	}
}

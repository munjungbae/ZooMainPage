package co.kh.dev.memberone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import co.kh.dev.common.ConnectionPool;

public class BasketDAO {

	private final String SELECT_BASKET_SQL = "SELECT * FROM BASKET WHERE ID = ? ORDER BY \"DATE\" DESC";
	private final String INSERT_BASKET = "INSERT INTO BASKET(ID, NAME, EMAIL, TITLE, PRICE, COUNT) VALUES(?,?,?,?,?,?)";

	public ArrayList<BasketVO> selectDB(BasketVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BasketVO bvo = null;
		ArrayList<BasketVO> bList = new ArrayList<BasketVO>();
		try {
			pstmt = con.prepareStatement(SELECT_BASKET_SQL);
			pstmt.setString(1, vo.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String eMail = rs.getString("EMAIL");
				Timestamp date = rs.getTimestamp("DATE");
				String title = rs.getString("TITLE");
				int price = rs.getInt("PRICE");
				int count = rs.getInt("COUNT");

				bvo = new BasketVO(id, name, eMail, date, title, price, count);
				bList.add(bvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return bList;
	}

	public Boolean insertDB(BasketVO bvo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(INSERT_BASKET);
			pstmt.setString(1, bvo.getId());
			pstmt.setString(2, bvo.getName());
			pstmt.setString(3, bvo.getEmail());
			pstmt.setString(4, bvo.getTitle());
			pstmt.setInt(5, bvo.getPrice());
			pstmt.setInt(6, bvo.getCount());

			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count != 0) ? (true) : (false);
	}
}

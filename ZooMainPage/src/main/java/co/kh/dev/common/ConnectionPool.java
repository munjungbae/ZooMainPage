package co.kh.dev.common;

import java.io.FileReader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

//싱글톤처리
public final class ConnectionPool {
	// 1. 클래스 oracle 드라이버를 정적처리
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 멤버변수
	private ArrayList<Connection> free;
	private ArrayList<Connection> used;
	private int initialCons = 10;
	private int maxCons = 20;
	private int numCons = 0;
	private String id = null;
	private String pw = null;
	private String url = null;

	// 싱글톤 (자기참조 멤버변수, 생성자 함수를 만든다 (private), 자기참조멤버변수 겟터)
	private static ConnectionPool cp;

	public static ConnectionPool getInstance() {
		try {
			if (cp == null) {
				synchronized (ConnectionPool.class) {
					cp = new ConnectionPool();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cp;
	}

	// 생성자 (ArrayList 생성, properties 로드, Connection 10개를 사전에 생성하여 free에 넣는다.
	private ConnectionPool() {
		// ArrayiList 10개 까지만 사용
		free = new ArrayList<Connection>(initialCons);
		used = new ArrayList<Connection>(initialCons);

		String filePath = "C:\\dev\\eclipseWorkspace\\jspStudy\\src\\main\\java\\db.properties";
		Properties pt = new Properties();
		try {
			pt.load(new FileReader(filePath));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		id = pt.getProperty("id");
		pw = pt.getProperty("pw");
		url = pt.getProperty("url");

		// DB에 연결된 Connection 10개를 만들어서 free Connection에 저장
		while (numCons < initialCons) {
			addConnection();
		}
	}

	// Connection을 배열 free에 추가
	private void addConnection() {
		free.add(getNewConnection());

	}

	// Connection 을 만들어서 리턴
	private Connection getNewConnection() {
		Connection con = null;

		try {
			con = DriverManager.getConnection(url, id, pw);
			numCons++;
			System.out.println("Current Connection count : " + numCons);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return con;
	}

	public synchronized Connection dbCon() {
		// 1. free ArrayList Connection 에 들어있는지 확인 (10개 추정)
		Connection con = null;
		if (free.isEmpty()) {
			// 커넥션 풀에 있던 자원을 모두 소모시 재 생성(maxCons 값 만큼)
			while (numCons < maxCons) {
				addConnection();
			}
		}
		con = free.get(free.size() - 1);
		free.remove(con);
		used.add(con);
		return con;
	}

	public void dbClose(Connection con, Statement stmt, ResultSet rs) {
		if (con != null) {
			releaseConnection(con);
		}
		if (stmt != null) {
			try {
				stmt.close();

			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
		if (rs != null) {
			try {
				rs.close();

			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}

	}

	public void dbClose(Connection con, Statement stmt) {
		if (con != null) {
			releaseConnection(con);
		}
		if (stmt != null) {
			try {
				stmt.close();

			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}

	}

	public void dbClose(Connection con, Statement stmt, CallableStatement cstmt) {
		if (con != null) {
			releaseConnection(con);
		}
		if (stmt != null) {
			try {
				stmt.close();

			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
		if (cstmt != null) {
			try {
				cstmt.close();

			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
	}

	// ConnectionPool 에서 만들어진 Connection이면 freeArrayList에 반납하고 아니면 con.close() 실행.
	public synchronized void releaseConnection(Connection con) {

		boolean flag = false;

		if (used.contains(con) == true) {
			used.remove(con);
			numCons--;
			free.add(con);
			numCons++;
			flag = true;
		}

		if (flag == false) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void closeAll() {
		// used에 있는 커넥션을 모두 삭제해 버림.
		for (int i = 0; i < used.size(); i++) {
			Connection _con = (Connection) used.get(i);
			used.remove(i--);
			try {
				_con.close();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		// free에 있는 커넥션을 모두 삭제해 버림.
		for (int i = 0; i < free.size(); i++) {
			Connection _con = (Connection) free.get(i);
			free.remove(i--);
			try {
				_con.close();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}

	}
}

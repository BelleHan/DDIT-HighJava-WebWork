package kr.or.ddit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// JDBC����̹��� �ε��ϰ� Connection��ü�� �����Ͽ� ��ȯ�ϴ� �޼���� ����
public class DBUtil {
	
	static {  // static �ʱ�ȭ �� - DBUtilŬ������ ȣ���ϸ� ó�� �� �ѹ��� ����ȴ�.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("����̹� �ε� ����~~~~");
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"HHS96", "java");
		} catch (SQLException e) {
			System.out.println("����Ŭ DB ���� ����~~~");
			return null;
		}
	}
}

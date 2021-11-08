package com.wdelivery.admin.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PostgresTest {
	public static void main(String[] args) {
		try {
			Class.forName("org.postgresql.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:postgresql://wcdonald-instance.cph9qliocypr.ap-northeast-2.rds.amazonaws.com:5432/wcdonald_database",
					"postgres", "postgres");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			pstmt = conn.prepareStatement("select * from user_info");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getString("user_email") + " " + rs.getString("user_password") + " "
						+ rs.getString("user_name"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	}
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Config;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NewClass {
    public static void main(String[] args) throws ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3306/SpaceCinema";
        String user = "root";
        String password = "123456";
        String newSchema = "spacecinemaexport";
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {

            // Tạo schema mới
            stmt.executeUpdate("CREATE SCHEMA " + newSchema);

            // Lấy danh sách các bảng trong schema cũ
            ResultSet rs = stmt.executeQuery("SHOW TABLES");
            List<String> tables = new ArrayList<>();
            while (rs.next()) {
                tables.add(rs.getString(1));
            }

            // Tạo tất cả các bảng trong schema mới mà không cần sao chép dữ liệu
            for (String tableName : tables) {
                stmt.executeUpdate("CREATE TABLE " + newSchema + "." + tableName + " LIKE SpaceCinema." + tableName);
            }

            // Sao chép dữ liệu từ các bảng không có khóa ngoại trước
            for (String tableName : tables) {
                if (!hasForeignKey(conn, "SpaceCinema", tableName)) {
                    stmt.executeUpdate("INSERT INTO " + newSchema + "." + tableName + " SELECT * FROM SpaceCinema." + tableName);
                }
            }

            // Sao chép dữ liệu từ các bảng có khóa ngoại sau khi các bảng tham chiếu đã được sao chép dữ liệu
            for (String tableName : tables) {
                if (hasForeignKey(conn, "SpaceCinema", tableName)) {
                    stmt.executeUpdate("INSERT INTO " + newSchema + "." + tableName + " SELECT * FROM SpaceCinema." + tableName);
                }
            }

            System.out.println("Schema renamed and data copied successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Hàm kiểm tra xem bảng có khóa ngoại hay không
    private static boolean hasForeignKey(Connection conn, String schema, String tableName) throws SQLException {
        ResultSet rs = conn.createStatement().executeQuery(
            "SELECT COUNT(*) FROM information_schema.KEY_COLUMN_USAGE " +
            "WHERE TABLE_SCHEMA = '" + schema + "' " +
            "AND TABLE_NAME = '" + tableName + "' " +
            "AND REFERENCED_TABLE_NAME IS NOT NULL"
        );
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
        return false;
    }
}
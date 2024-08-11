package day20240809;

import java.sql.*;

/**
 * @author XinhaoZheng
 * @version 1.0
 * @description: TODO
 * @date 2024/8/11 19:42
 */
public class JDBCDemo {
        public static void main(String[] args) throws SQLException {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo01", "root", "123456");
        System.out.println("Connected to database");

        // 查询
        select(connection);

        System.out.println("=== === ===");

        // 插入
        insert(connection);

        System.out.println("=== === ===");

        // 插入之后再次查询
        select(connection);
    }

    private static void select(Connection connection) throws SQLException {
        Statement stmt = connection.createStatement();
        String selectSql = "select id, name, balance from user;";
        ResultSet rs = stmt.executeQuery(selectSql);
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int balance = rs.getInt("balance");
            System.out.println(id + "\t" + name + "\t" + balance);
        }
    }

    private static void insert(Connection connection) throws SQLException {
        String insertSql = "insert into user(name, balance) values(?, ?);";
        PreparedStatement pStmt = connection.prepareStatement(insertSql);
        pStmt.setString(1, "alex__");
        pStmt.setInt(2, 90);
        int i = pStmt.executeUpdate();
        System.out.println(i>0 ? "插入成功" : "未知情况");
    }
}

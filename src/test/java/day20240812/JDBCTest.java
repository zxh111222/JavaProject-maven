package day20240812;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.sql.*;

/**
 * @author XinhaoZheng
 * @version 1.0
 * @description: TODO
 * @date 2024/8/12 16:23
 */
public class JDBCTest {

    static Connection connection;
    @BeforeAll
    public static void getConnection() throws SQLException {
        // 获取 Connection (连接到 MySQL 服务器)
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo01", "root", "secret_mysql");
        System.out.println("Connected to database");
    }

    @AfterAll
    public static void closeConnection() throws SQLException {
        // 关闭连接
        connection.close();
        System.out.println("close connection");
    }

    @Test
    public void testStatement() throws SQLException {
        // 获取 Connection (连接到 MySQL 服务器)
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo01", "root", "123456");
        System.out.println("Connected to database");
        // 对 `MySQL 服务器` 讲它听得懂的话：SQL 之 Statement
        String query = "select id, name, balance from user;";
        Statement statement = connection.createStatement();
        // 需要结果，就用 ResultSet 来接收
        ResultSet rs = statement.executeQuery(query);
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int balance = rs.getInt("balance");
            System.out.println(id + "\t" + name + "\t" + balance);
        }
    }

    @Test
    public void testPreparedStatement() throws SQLException {
        // 对 `MySQL 服务器` 讲它听得懂的话：SQL 之 PreparedStatement
        String query = "select id, name, balance from user where id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, 1);
        // 需要结果，就用 ResultSet 来接收
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int balance = rs.getInt("balance");
            System.out.println(id + "\t" + name + "\t" + balance);
        }
    }

    @Test
    public void insert() {
        String insertSql = "insert into user(name, balance) values(?, ?);";
        try (PreparedStatement pStmt = connection.prepareStatement(insertSql)) {
            pStmt.setString(1, "alex000");
            pStmt.setInt(2, 50);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        }
    }

    @Test
    public void batchInsert() {
        String insertSql = "insert into user(name, balance) values(?, ?);";
        try (PreparedStatement pStmt = connection.prepareStatement(insertSql)) {

            pStmt.setString(1, "alex");
            pStmt.setInt(2, 50);
            pStmt.addBatch();

            pStmt.setString(1, "bob");
            pStmt.setInt(2, 30);
            pStmt.addBatch();

            pStmt.executeBatch();
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        }

    }

    @Test
    public void update() {
        String updateSql = "update user set balance = balance + 5 where name = ?";
        try (PreparedStatement pStmt = connection.prepareStatement(updateSql)) {
            pStmt.setString(1, "alex");
            pStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        }
    }

    @Test
    public void delete() {
        String updateSql = "delete from user where name = ?";
        try (PreparedStatement pStmt = connection.prepareStatement(updateSql)) {
            pStmt.setString(1, "alex");
            pStmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        }
    }

    @Test
    public void testWithoutTransactions() {
        PreparedStatement ppstmt1 = null;
        PreparedStatement ppstmt2 = null;
        String update1 = "update user set balance = balance - 10 where id = ?";
        String update2 = "update user set balance = balance + 10 where id = ?";

        try {
            ppstmt1 = connection.prepareStatement(update1);
            ppstmt1.setInt(1, 4);
            ppstmt1.executeUpdate();

            int i = 2 / 0;

            ppstmt2 = connection.prepareStatement(update2);
            ppstmt2.setInt(1, 6);
            ppstmt2.executeUpdate();
        } catch (Exception e) {
            System.out.println("SQLException: " + e.getMessage());
        } finally {
            try {
                if (ppstmt1 != null) {
                    ppstmt1.close();
                }
                if (ppstmt2 != null) {
                    ppstmt2.close();
                }
            } catch (SQLException e) {
                System.out.println("finally 中又遇到了 SQLException: " + e.getMessage());
            }
        }
    }

    @Test
    public void testWithTransactions() {

    }
}

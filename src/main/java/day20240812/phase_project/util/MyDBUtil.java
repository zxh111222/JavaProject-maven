package day20240812.phase_project.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MyDBUtil {
    private static Connection connection;

    public synchronized static Connection getConnection() {
        if (connection != null) {
            return connection;
        }

        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "123456");
            createDatabaseIfNotExists(connection);
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/xmfish", "root", "123456");
            createTableIfNotExists(connection);
            System.out.println("Connected to database");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    // 创建数据库
    private static void createDatabaseIfNotExists(Connection connection) throws SQLException {
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            String createDbSql = "CREATE DATABASE IF NOT EXISTS xmfish;";
            stmt.execute(createDbSql);
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
    }

    // 创建表结构
    private static void createTableIfNotExists(Connection connection) throws SQLException {
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            String createTableSql = "CREATE TABLE IF NOT EXISTS xmfish (" +
                    "`id` INT AUTO_INCREMENT PRIMARY KEY, " +
                    "`title` VARCHAR(255) NOT NULL, " +
                    "`url` VARCHAR(255) NOT NULL UNIQUE, " +
                    "`createdAt` VARCHAR(50) NOT NULL, " +
                    "`updatedAt` VARCHAR(50) NOT NULL" +
                    ");";
            stmt.execute(createTableSql);
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
    }
}

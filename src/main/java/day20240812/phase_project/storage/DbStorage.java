package day20240812.phase_project.storage;

import day20240812.phase_project.dto.CustomResult;
import day20240812.phase_project.storage.Storage;
import day20240812.phase_project.util.MyDBUtil;

import java.io.IOException;
import java.sql.*;
import java.util.List;

/**
 * @author XinhaoZheng
 * @version 1.0
 * @description: TODO
 * @date 2024/8/12 9:24
 */
public class DbStorage implements Storage {
    @Override
    public void save(List<CustomResult> information) throws IOException, SQLException {
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;
        String checkSql = "SELECT COUNT(*) FROM xmfish WHERE url = ?;";
        String insertSql = "INSERT INTO xmfish (title, url, createdAt, updatedAt) VALUES (?, ?, ?, ?);";

        try {
            // 获取数据库连接
            Connection connection = MyDBUtil.getConnection();
            // 准备查询和插入的 SQL 语句
            checkStmt = connection.prepareStatement(checkSql);
            insertStmt = connection.prepareStatement(insertSql);
            for (CustomResult result : information) {
                // 检查 URL 是否存在
                checkStmt.setString(1, result.getUrl());
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    // URL 已经存在，提示并跳过
                    System.out.println("URL 已存在，跳过: " + result.getUrl());
                    continue;
                }

                // 插入记录
                insertStmt.setString(1, result.getTitle());
                insertStmt.setString(2, result.getUrl());
                insertStmt.setString(3, result.getCreatedAt());
                insertStmt.setString(4, result.getUpdatedAt());
                insertStmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // 关闭资源
            if (checkStmt != null) {
                checkStmt.close();
            }
            if (insertStmt != null) {
                insertStmt.close();
            }

        }
    }

}

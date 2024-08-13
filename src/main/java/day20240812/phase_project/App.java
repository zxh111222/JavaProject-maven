package day20240812.phase_project;

import day20240812.phase_project.downloader.Downloader;
import day20240812.phase_project.dto.CustomResult;
import day20240812.phase_project.notificator.Notificator;
import day20240812.phase_project.parser.Parser;
import day20240812.phase_project.storage.Storage;

import java.io.*;
import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * @author XinhaoZheng
 * @version 1.0
 * @description: TODO
 * @date 2024/6/6  18:16
 */


public class App {

    public static final Properties PROPERTIES;
    private static Connection CONNECTION;
    private static Map<String, String> URLPARSERMAP = new HashMap<>();

    static {
        PROPERTIES = loadFromConfiguration();
    }

    public static void main(String[] args) throws Exception {
        // 读取配置文件
        // === --- ===

//        Properties properties = new Properties();
//        File file = new File("src/day20240729/phase_project/resources/config_local.properties");
//        properties.load(new FileInputStream(file));
//        System.out.println("配置文件读取成功!");

        // === --- ===

        // 开始项目
        String app = PROPERTIES.getProperty("app");
        System.out.println("程序名称 : " + app);
        System.out.println("程序开始运行...");

        for (Map.Entry<String, String> site : URLPARSERMAP.entrySet()) {
            String urlName = PROPERTIES.getProperty("urlName");
            String url = site.getKey();
            String url_parser = site.getValue();

            if (url_parser == null) {
                System.out.println("没有找到解析器配置，跳过 URL: " + url);
                continue;
            }

            System.out.println("当前下载、解析的网站是:" + urlName);

            // 下载模块: 根据配置文件的信息进行不同方式的下载
            System.out.println("Downloader - 正在下载...:" + url);
            Downloader downloader = Downloader.getInstance(PROPERTIES.getProperty("downloader"));
            String html = downloader.download(url);
            System.out.println("Downloader -下载完成");

            // 解析模块: 根据配置文件的信息进行不同 url 的解析
            System.out.println("Parser - 正在解析...");
            Parser parser = Parser.getInstance(url_parser);
            List<CustomResult> information = parser.parse(html);
            System.out.println("Parser - 解析完成！(共获取到" + information.size() + "条数据)");
            // System.out.println(information);

            // 存储模块: 根据配置文件的信息进行不同方式的存储
            System.out.println("Storage - 正在存储...");
            Storage storage = Storage.getInstance(PROPERTIES.getProperty("storage"));
            storage.save(information);
            System.out.println("Storage - 存储完成...");

            // 通知模块: 根据配置文件的信息选择通知方式，配置文件含有通知的相关信息
            System.out.println("Notificator - 正在通知...");
            Notificator notificator = Notificator.getInstance();
            notificator.notify(information);
            System.out.println("Notificator - 通知完成...");
        }

        //结束
        System.out.println("程序运行结束!");
    }

    private static Properties loadFromConfiguration() {
        Properties properties = new Properties();
        String appConfigQuery  = "SELECT `config_name`, `key`, `value` FROM app_config WHERE app_name = ? AND version = ?";
        String urlParseQuery = "SELECT * FROM url_parse"; // URL 解析配置的查询

        try {
            CONNECTION = DriverManager.getConnection("jdbc:mysql://localhost:3306/app", "root", "123456");
            PreparedStatement appConfigPstmt  = CONNECTION.prepareStatement(appConfigQuery );

            appConfigPstmt.setString(1, "阶段项目");
            appConfigPstmt.setString(2, "1.0");

            ResultSet appConfigResultSet  = appConfigPstmt .executeQuery();
            while (appConfigResultSet.next()) {
                String config_name = appConfigResultSet .getString("config_name");
                String value = appConfigResultSet .getString("value");
                properties.setProperty(config_name, value);
            }
            // 读取 URL 解析配置
            PreparedStatement urlParsePstmt = CONNECTION.prepareStatement(urlParseQuery);
            ResultSet urlParseResultSet = urlParsePstmt.executeQuery();
            while (urlParseResultSet.next()) {
                String urlName = urlParseResultSet.getString("name");
                String url = urlParseResultSet.getString("url");
                String parser = urlParseResultSet.getString("parser");
                URLPARSERMAP.put(url, parser);
                properties.setProperty("urlName", urlName);
                properties.setProperty("url", url);
                properties.setProperty("parser", parser);
            }
            System.out.println("配置文件从数据库读取成功！");
        } catch (SQLException e) {
            System.out.println("从数据库读取配置时出错: " + e.getMessage());
            throw new RuntimeException(e);
        }
        return properties;
    }

}

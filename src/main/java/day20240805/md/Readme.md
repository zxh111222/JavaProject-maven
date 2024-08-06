## 回顾 - 如果要把第三方的 `Jsoup` 提高功能，我们的步骤是怎样的？
回顾 day20240420

### 继续思考  
- 下一个问题: 如果要更新 `Jsoup` 又该怎么做？
- 在回忆之前引入邮件发送功能，不止一个 jar 包，它的更新又如何？
  - ![img.png](img.png) 

## Maven 初见
记得看一手资源

### 引出 Build System
![img_1.png](img_1.png)

## `settings.xml`
![img_2.png](img_2.png)

### 暗转之前: `Verify the signature`
提升安全意识 - 如何判断下载下来的软件有没有被动过手脚  
![img_5.png](img_5.png)
![img_6.png](img_6.png)
![img_7.png](img_7.png)

### 安装 Install Apache Maven  
![img_3.png](img_3.png)

### 创建 Maven 项目
![img_4.png](img_4.png)
![img_8.png](img_8.png)
- 验证
![img_9.png](img_9.png)

### 复习部分 git 操作
![img_10.png](img_10.png)
![img_11.png](img_11.png)

### 在 gitee 或 github 上创建新的仓库存储新的 maven 项目代码
![img_12.png](img_12.png)

## 用 `maven` 的方式替换之前手动维护第三方依赖

### Jsoup 依赖的 maven 管理方式测试
![img_13.png](img_13.png)
![img_14.png](img_14.png)
![img_15.png](img_15.png)
![img_16.png](img_16.png)

### 远程仓库之一
- https://mvnrepository.com/
![img_17.png](img_17.png)
![img_18.png](img_18.png)
![img_19.png](img_19.png)

### Email 相关依赖的 maven 管理方式测试
![img_20.png](img_20.png)



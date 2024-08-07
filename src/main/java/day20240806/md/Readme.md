## 回顾
见上次课的笔记

## 根据昨天的 `.gitignore` 额外引出
![img_1.png](img_1.png)
- 从本质上理解为什么可以忽略它、删除它
  - .idea
  - target
- `临界条件` 的思路
  - 比如: 假设 gitee 每个仓库超过 5M 就要收费

## 通过 GAV 唯一定义
- ![img_2.png](img_2.png)
  - https://maven.apache.org/guides/getting-started/index.html
- ![img_3.png](img_3.png)
  - https://maven.apache.org/guides/mini/guide-naming-conventions.html
  - 《Java 开发手册》

## 可以开始准备域名了
![img_4.png](img_4.png)

## `Java Bean` 、 `POJO`
![img.png](img.png)

## `lombok`  
### 分析 `lombok` 的作用
![img_5.png](img_5.png)
### `lombok` 插件
![img_6.png](img_6.png)
### `lombok` 背后的思想  
![img_7.png](img_7.png)

## 由 `lombok` 引出 Java 的 `record` 关键字  
![img_8.png](img_8.png)

## 额外引出的 `git` 操作及命令
### IDEA 集成操作
![img_9.png](img_9.png)
![img_10.png](img_10.png)
### 额外命令
- 查看当前仓库下的所有 git 操作记录 
  - `git reflog --date=iso` 
- 后悔药（危险操作，考虑清楚之后才执行）
  - `git reset --hard` 【具体要回退到哪个commit 2aabfa4】

## 将自己打包好的 `jar` 包，分享给别人使用
![img_11.png](img_11.png)

## 引出 `JUnit5`、体会单元测试与以前普通测试的差异
![img_12.png](img_12.png)
![img_13.png](img_13.png)
![img_14.png](img_14.png)
![img_15.png](img_15.png)

## Maven Build Lifecycle
![img_16.png](img_16.png)

## 测试几个命令
- `mvn clean` 清理
- `mvn compile` 编译
- `mvn test` 执行单元测试
- `mvn package` 打包

### `mvn install`
![img_17.png](img_17.png)








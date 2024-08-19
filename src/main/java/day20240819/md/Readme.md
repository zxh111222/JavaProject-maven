## 上次课作业解答
### 题目回顾
![img.png](img.png)
### 总体思路
约定: 所有表名用英文单词、小写、单数形式
#### 需要哪些表？哪些字段？字段应该是什么类型？
- 用户 `user`
  - `username` 需求文档中就能直接看出来的字段
  - 需求文档没体现，但是通过自己的分析，觉得应该存在的字段
    - `id` 唯一表示表中的每条记录
    - `password` 密码
- 角色 `role`
  - `name`
  - `id`
- 菜单 `menu`
  - `id`
  - `name`
#### 表中、表之间需要什么约束，有什么关联？
- 简单分析: 
  - 用户和角色之间，多对多的关系
  - 用户和菜单之间，没有直接的关系
  - 角色和菜单之间，多对多的关系
- 根据之前的知识，可以增加中间表来表达多对多的关系
  - `user_role`
    - `user_id` references user 表中的id字段
    - `role_id` references role 表中的id字段
  - `role_menu`
    - `role_id` references role 表中的id字段
    - `menu_id` references menu 表中的id字段 
#### 通过 SQL 语句来描述需求
##### 基础信息
- 3 个用户
  - `insert into user(id, username, password) values (1, 'admin', password), (2, 'root', password), (3, 'user', password)`
- 3 个角色
  -`insert into role(id, name) values (1, 'root'), (2, 'admin'), (3, ''article_manager')` 
- 4 个菜单
- `insert into menu(id, name) values (1, 'user/users'), (2, 'article/articles'), (3, 'config/system'), (4, 'config/permissions')`

##### 关联信息
- 给用户分配角色
  - 给 root 分配角色 `insert into user_role(user_id, role_id) value (1, 1)`
  - 给 admin 分配角色 `insert into user_role(user_id, role_id) value (2, 2)`
  - 给 user 分配角色 `insert into user_role(user_id, role_id) value (3, 3)`
- 给角色分配菜单
  - 超级管理员，具有全部菜单的访问权限，可以全部分配，也可以不分配，对它做特殊处理
  - 给 系统配置员 角色分配菜单 `insert into role_menu(role_id, menu_id) values (2, 1), (2, 2), (2, 3)`
  - 给 文章管理员 角色分配菜单 `insert into role_menu(role_id, menu_id) values (3, 2)`















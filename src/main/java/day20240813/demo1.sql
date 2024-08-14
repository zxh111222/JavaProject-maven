-- 查询所有数据库
show databases;

-- 创建数据库
create database if not exists demo;

-- 删除数据库
drop database demo;

-- 再创建一个下面语句需要的数据库
create database if not exists demo;

-- 使用/进入指定的数据库
use demo;

-- 查看: 当前数据库下的表
show tables;

create table demo_user
(
    id int primary key auto_increment comment '表头单元格之ID, int数据类型，主键，唯一标识，自动递增',
    username char(20),
    name varchar(20) comment '真实姓名',
    age int comment '年龄',
    gender char(1) comment '性别：男、女、中'
);

insert into demo_user(username, name, age, gender) value('u001', '张xx', 18, '男');

select * from demo_user;

-- 修改字段
alter table demo_user
    modify name varchar(20) not null  comment '真实姓名';

alter table demo_user
    modify age int not null comment '年龄';

drop table demo_user;

-- DDL : 表结构
-- 创建: 基本语法
create table demo_table(
                        id int comment 'ID, 唯一标识',
                        field1 varchar(20) comment 'field1 注释',
                        field2 varchar(10) comment 'field2 注释',
                        field3 int comment 'field3 注释'
) comment '表注释';


-- 创建: 基本语法 (约束)
create table demo_user
(
    id       int primary key auto_increment comment 'ID, 唯一标识，主键，自动递增',
    username varchar(20) not null comment '用户名',
    name     varchar(10) not null comment '姓名',
    age      int comment '年龄',
    gender   char(1) default '男' comment '性别：男、女、中'
) comment '用户表';

-- 增加约束：让 username 字段是唯一的
-- alter table demo_user add unique (username);
alter table demo_user
    modify username varchar(20) not null unique comment '用户名';

-- 查看: 查看指定表结构
desc demo_user;

-- 查看: 数据库的建表语句
show create table demo_user;


-- 图形化界面创建表 students
create table students
(
    id          int primary key auto_increment comment '主键ID',
    username    varchar(20)                  not null comment '姓名',
    password    varchar(32) default '123456' null comment '密码',
    gender      tinyint unsigned             not null comment '性别, 1=男, 2=女，0=未知',
    avatar      varchar(300)                 null comment '头像 url',
    job         tinyint unsigned             null comment '角色/职务。1=班长, 2=助教, 3=组长',
    enrolled_at date                         null comment '注册/入学日期',
    created_at  datetime                     not null comment '创建时间',
    updated_at  datetime                     not null comment '修改时间',
    constraint students_username_uindex unique (username)
) comment '学生表';

--
-- drop table students;


-- DDL: 修改表结构
-- 修改: 为表 students 添加字段 hometown varchar(11)
alter table students add hometown varchar(11) comment '家乡';

-- 修改: 修改 students 字段类型 hometown varchar(13)
alter table students modify hometown varchar(13) comment 'hometown';

-- 修改: 修改 students 字段名 hometown 为 hometown2 varchar(13)
alter table students change hometown hometown2 varchar(13) comment 'hometown';

-- 修改: 删除 students 的 hometown2 字段
alter table students drop column hometown2;

-- 修改: 将 students 表名修改为 student
rename table students to student;

rename table student to students;

-- DDL: 删除表结构
-- 删除: 删除 students 表
# drop table if exists students;


-- DML : 数据操作语言
-- DML : 插入数据 - insert
-- 1. 为 students 表的 username, name, gender 字段插入值
insert into students(username, gender, created_at, updated_at) values ('小王', 1, now(), now());

-- 2. 为 students 表的所有字段插入值
insert into students(id, username, password, gender, avatar, job, enrolled_at, created_at, updated_at)
values (null, '小吴', '123xxx098', 1, '1.jpg', 1, '2024-03-01', now(), now());

insert into students values (null, '小林', 'xxx0yyy0zzz', 1, '2.jpg', 1, '2024-03-01', now(), now());


-- 3. 批量为 students 表的 username, gender 字段插入数据
insert into students(username, gender, created_at, updated_at)
values ('小江', 1, now(), now()),
       ('小陈', 1, now(), now());

-- DML : 更新数据 - update
-- 1. 将 students 表的 ID 为 1 学生 username 字段更新为 '大Y'
update students set username = '大Y', updated_at = now() where id = 1;

-- 2. 将 students 表的所有学生的入职日期更新为 '2024-03-01'
update students set updated_at = now();

-- DML : 删除数据 - delete
-- 1. 删除 students 表中 ID为1的
delete from students where id = 1;

-- 2. 删除 students 表中的所有学生
delete from students;

-- 3. 清空 students 表数据，同时重置自增值
truncate table students;


CREATE TABLE `xmfish`
(
    `id`    int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(255) DEFAULT NULL,
    `url`   varchar(255) DEFAULT NULL UNIQUE,
    `createdAt` date DEFAULT NULL,
    `updatedAt` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
);

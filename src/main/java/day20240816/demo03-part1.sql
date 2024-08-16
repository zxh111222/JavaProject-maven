-- 一对多：班级 与 学生
--        博客 与 评论
--        ...

show databases;

create database demo03;

create database if not exists demo03;

use demo03;

show tables;

-- 班级
create table if not exists class
(
    id          int primary key auto_increment comment '主键ID',
    name        varchar(50) not null unique comment '班级名',
    description varchar(512) comment '班级描述',
    created_at  datetime    not null comment '创建时间',
    updated_at  datetime    not null comment '修改时间'
    ) comment '班级';

-- alter table class modify updated_at datetime null comment '修改时间';

-- 添加班级数据
insert into class (id, name, created_at, updated_at)
values (1, 'JavaSE', now(), now()),
       (2, 'HTML+CSS+JS', now(), now()),
       (3, 'MySQL', now(), now());

insert into class (id, name, created_at, updated_at)
values (1, 'JavaSE', now(), now()),
       (2, 'HTML+CSS+JS', now(), now()),
       (3, 'MySQL', now(), now());

-- 复习：删除/清空表数据
delete from class;
truncate table class;

delete from class;
truncate table class;

-- 注释复习：
# 单行注释方式一，井号开头;
-- 单行注释方式二，第二个破折号后面至少要又一个空格或者制表符
/*
 多行注释
 */

-- 学生
create table if not exists students
(
    id          int primary key auto_increment comment '主键ID',
    username    varchar(20)                  not null comment '姓名',
    password    char(8) default '12345678'   null comment '密码',
    gender      tinyint unsigned             not null comment '性别, 1=男, 2=女，0=未知',
    avatar      varchar(300)                 null comment '头像 url',
    job         tinyint unsigned             null comment '角色/职务。1=班长, 2=助教, 3=组长',
    enrolled_at date                         null comment '注册/入学日期',
    created_at  datetime                     not null comment '创建时间',
    updated_at  datetime                     null comment '修改时间',
    class_id     int comment '对应班级表的ID'
    ) comment '学生表';

select * from class where id=2;




-- truncate table students;

-- 添加学生数据
INSERT INTO students(id, username, password, gender, avatar, job, enrolled_at, created_at, updated_at, class_id)
VALUES (1, '张xx', '123xyz98', 1, '1.jpg', 3, '2024-01-01', now(), now(), 1),
       (2, '林xx', '123xyz98', 1, '2.jpg', 0, '2024-02-03', now(), now(), 1),
       (3, '廖xx', '123xyz98', 1, '3.jpg', 0, '2024-02-11', now(), now(), 1),
       (4, '郑xx', '123xyz88', 1, '4.jpg', 3, '2024-02-21', now(), now(), 1),
       (5, '林yy', '123xyz98', 1, '5.jpg', 0, '2024-02-05', now(), now(), 1),
       (6, '林zz', '123xyz98', 1, '6.jpg', 3, '2024-03-05', now(), now(), 1),
       (7, '林aa', '123xyz98', 1, '7.jpg', 0, '2024-02-01', now(), now(), 1),
       (8, '李xx', '123xyz98', 1, '8.jpg', 0, '2024-01-09', now(), now(), 1),
       (9, '林cc', '123xyz98', 1, '9.jpg', 0, '2024-03-11', now(), now(), 1),
       (10, '李xx', '123xyz98', 1, '10.jpg', 3, '2024-01-05', now(), now(), 1),
       (11, '杨xx', '123xyz98', 1, '11.jpg', 0, '2024-02-01', now(), now(), 1),
       (12, '王xx', '123xyz89', 1, '12.jpg', 0, '2024-01-18', now(), now(), 1),
       (13, '尧xx', '123xyz98', 1, '13.jpg', 0, '2024-03-01', now(), now(), 1),
       (14, '朱xx', '123xyz98', 1, '14.jpg', 0, '2024-01-11', now(), now(), 1),
       (15, '吴BB', '123xyz98', 1, '15.jpg', 0, '2024-02-05', now(), now(), 1),
       (16, '张JJ', '123xyz98', 1, '16.jpg', 0, '2024-05-01', now(), now(), 1),
       (17, '叶X', '123xyz68', 2, '17.jpg', 2, '2024-06-01', now(), now(), 2),
       (18, '赵YY', '123xyz98', 2, '18.jpg', 1, '2024-06-11', now(), now(), 2),
       (19, '钱ZZ', '123xyz98', 2, '19.jpg', 2, '2024-06-12', now(), now(), 3),
       (20, 'BB孙', '123xyz98', 1, '20.jpg', null, '2024-06-13', now(), now(), 3)
;

-- 复习 select，查找出班级id=3的学生信息
select * from students where class_id=3;

-- 复习 insert，给ID=3的班级增加一名新学生
insert into students(username, gender, created_at, class_id) value ('王CC', 2, now(), 3);
insert into students(username, gender, created_at, class_id) value ('王CC', 2, now(), 3);

-- 给ID=4的班级增加一名新学生
insert into students(username, gender, created_at, class_id) value ('王CC', 2, now(), 4);
insert into students(username, gender, created_at, class_id) value ('王CC', 2, now(), 4);

-- 复习 delete，删除班级ID=4的所有学生
delete from students where class_id=4;
delete from students where class_id=4;

-- 增加外键约束（如果 students 表的 class_id 字段类型是 `int unsigned`，class 表的 id 字段类型是 `int`，执行这句会报错，见下一段注释的语句）
alter table students
    add constraint students_class_fk
        foreign key (`class_id`) references class (`id`);

alter table students
    add constraint students_class_fk
        foreign key (`class_id`) references class (`id`);

-- 再次操作：给ID=4的班级增加一名新学生（备注：class_id=4的班级并不存在）
insert into students(username, gender, created_at, class_id) value ('王CC', 2, now(), 4);
insert into students(username, gender, created_at, class_id) value ('王CC', 2, now(), 4);

-- 尝试把 class 表中 id=2 的班级删除(备注：students表中，有学生是属于 class_id=2)
delete from class where id=2;
-- 由于有外键约束 foreign key constraint，需要确保 class 表中，id=2班级没有呗其他表引用
-- 要么先删除 students 表中 class_id=2 的学生
delete from students where class_id=2;
-- 或者把 students 表中class_id=2 的学生 移到其他班级
update students set class_id=3 where class_id=2;
-- 确保 students 表中没有学生是 class_id=2
select count(*) from students where class_id=2;
-- 再次尝试把 class 表中 id=2 的班级删除
delete from class where id=2;



alter table class add other_id bigint null;
alter table students add other_class_id int null;

alter table students
    add constraint students_class_fk_other
        foreign key (`other_class_id`) references  class (`other_id`);

alter table class modify other_id int null;

alter table students
    add constraint students_class_fk_other
        foreign key (`other_class_id`) references  class (`other_id`);

create index class_other_id_index on class (other_id);

alter table students
    add constraint students_class_fk_other
        foreign key (`other_class_id`) references  class (`other_id`);




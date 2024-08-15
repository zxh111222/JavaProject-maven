-- 查询语法
/*
select
    字段列表
from
    表名列表
where
    条件列表
group by
    分组字段列表
having
    分组后条件列表
order by
    排序字段列表
limit
    分页参数
*/

show databases;

create database demo02;

use demo02;

-- 学生表
create table if not exists students(
    id          int primary key auto_increment comment '主键ID',
    username    varchar(20)                  not null comment '姓名',
    password    char(8) default '12345678'   null comment '密码',
    gender      tinyint unsigned             not null comment '性别, 1=男, 2=女，0=未知',
    avatar      varchar(300)                 null comment '头像 url',
    job         tinyint unsigned             null comment '角色/职务。1=班长, 2=助教, 3=组长，0=其他',
    enrolled_at date                         null comment '注册/入学日期',
    created_at  datetime                     not null comment '创建时间',
    updated_at  datetime                     null comment '修改时间',
    constraint students_username_uindex unique (username)
    ) comment '学生表';

-- 学生表演示数据
INSERT INTO students(id, username, password, gender, avatar, job, enrolled_at, created_at, updated_at)
VALUES (1, '张xx', '123xyz98', 1, '1.jpg', 3, '2024-01-01', now(), now()),
       (2, '林xx', '123xyz98', 1, '2.jpg', 0, '2024-02-03', now(), now()),
       (3, '廖xx', '123xyz98', 1, '3.jpg', 0, '2024-02-11', now(), now()),
       (4, '郑xx', '123xyz88', 1, '4.jpg', 3, '2024-02-21', now(), now()),
       (5, '林yy', '123xyz98', 1, '5.jpg', 0, '2024-02-05', now(), now()),
       (6, '林zz', '123xyz98', 1, '6.jpg', 3, '2024-03-05', now(), now()),
       (7, '林aa', '123xyz98', 1, '7.jpg', 0, '2024-02-01', now(), now()),
       (8, '李xx', '123xyz98', 1, '8.jpg', 0, '2024-01-09', now(), now()),
       (9, '林cc', '123xyz98', 1, '9.jpg', 0, '2024-03-11', now(), now()),
       (10, '李dd', '123xyz98', 1, '10.jpg', 3, '2024-01-05', now(), now()),
       (11, '杨xx', '123xyz98', 1, '11.jpg', 0, '2024-02-01', now(), now()),
       (12, '王xx', '123xyz89', 1, '12.jpg', 0, '2024-01-18', now(), now()),
       (13, '尧xx', '123xyz98', 1, '13.jpg', 0, '2024-03-01', now(), now()),
       (14, '朱xx', '123xyz98', 1, '14.jpg', 0, '2024-01-11', now(), now()),
       (15, '吴BB', '123xyz98', 1, '15.jpg', 0, '2024-02-05', now(), now()),
       (16, '张JJ', '123xyz98', 1, '16.jpg', 0, '2024-05-01', now(), now()),
       (17, '叶X', '123xyz68', 2, '17.jpg', 2, '2024-06-01', now(), now()),
       (18, '赵YY', '123xyz98', 2, '18.jpg', 1, '2024-06-11', now(), now()),
       (19, '钱ZZ', '123xyz98', 2, '19.jpg', 2, '2024-06-12', now(), now()),
       (20, 'BB孙', '123xyz98', 1, '20.jpg', null, '2024-06-13', now(), now())
;


-- ====================================> DQL <=======================================
-- select * from students;
-- select * from students;
select * from students;

--  =================== 基本查询 ======================
-- 1. 查询指定字段 username,enrolled_at 并返回
-- select username, enrolled_at from students;
-- select username, enrolled_at from students;
select username, enrolled_at from students;


-- 2. 查询返回所有字段（非 select * 的方式）
-- 2.1 all columns
-- select id, username, password, gender, avatar, job, enrolled_at, created_at, updated_at from students;
-- 先写出 SQL 语句的整体轮廓，select xxx from students; 再去完善 xxx 的细节
-- select id, username, password, gender, avatar, job, enrolled_at, created_at, updated_at from students;
select id, username, password, gender, avatar, job, enrolled_at, created_at, updated_at from students;


-- 2.2 *
select * from students;


-- 3. 查询所有学生的 username,enrolled_at, 并起别名(姓名、入学日期)
-- select username as '姓名', enrolled_at as '入学日期' from students;
select username as '姓名', enrolled_at as '入学日期' from students;
-- as omit
select username '姓名', enrolled_at '入学日期' from students;

select username as '姓名',enrolled_at as '入学日期' from students;

select username '姓名',enrolled_at '入学日期' from students;




-- 4. 查询学生的职务字段 （角色/职务。1=班长, 2=助教, 3=组长, 0=其他）
select job from students;
select job from students;



-- 5. 查询学生有哪几种职位(不要重复)
-- distinct
select distinct job from students;
select distinct job from students;



--  =================== 条件查询 ======================
-- 1. 查询 姓名 为 孙BB 的学生
-- select * from students where username='孙BB';
select * from students where username='孙BB';
select * from students where username='郑xx';

-- 2. 查询在 id 小于等于 5 的学生信息
select * from students where id<=5;
select * from students where id between 5 and 10;

-- 3. 查询 没有分配职位 的学生信息
/*
-- 判断 null , 用 is null
select * from students where job is null;
 */
select * from students where job is null;
select * from students where job is null;

-- 4. 查询 有职位 的学生信息
/*
-- 判断 不是 null , 用 is not null
select * from students where job is not null ;
 */
select * from students where job is not null;
select * from students where job is not null;

-- 5. 查询 密码不等于 '123xyz98' 的学生信息
select * from students where password != '123xyz98';
select * from students where password <> '123xyz98';
select * from students where password != '123xyz98';
select * from students where password <> '123xyz98';

-- 6. 查询入学日期 在 '2024-01-01' (包含) 到 '2024-06-01' (包含) 之间的学生信息 -- between ... and ...
/*
select * from students where enrolled_at between '2024-01-01' and '2024-06-01' ;
 */
select * from students where enrolled_at between '2024-01-01' and '2024-06-01';
select * from students where enrolled_at >= '2024-01-01' and enrolled_at <='2024-06-01';
select * from students where enrolled_at between '2024-01-01' and '2024-06-01';
select * from students where enrolled_at >= '2024-01-01' and enrolled_at <='2024-06-01';


-- 7. 查询 入学时间 在 '2024-01-01' (包含) 到 '2024-06-01'(包含) 之间 且 性别为女 的学生信息
/*
select * from students where (enrolled_at between '2024-01-01' and '2024-06-01') and  gender = 2;
 */
select * from students where enrolled_at between '2024-01-01' and '2024-06-01' and gender=2;
select * from students where enrolled_at between '2024-01-01' and '2024-06-01';
select * from students where gender=2;
select * from students where (enrolled_at between '2024-01-01' and '2024-06-01') and gender=2;



-- 8. 查询 职位是 2 (助教), 3 (组长) 的学生信息 -- orin
select * from students where job=2 or job=3;
select * from students where job in (2, 3);
select * from students where job=2 or job=3;
select * from students where job in (2, 3);


-- 9. 查询姓名为两个字的学生信息
select * from students where username like '__';
select * from students where username like '__';

-- 10. 查询姓 '张' 的学生信息
select * from students where username like '张%';
select * from students where username like '张%';

-- 11. 查询姓名中包含 'B' 的学生信息
select * from students where username like '%B%';




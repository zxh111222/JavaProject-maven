-- 【上面】动手练习时间 part3


-- 表之间的关系
-- 没关系、一对一、一对多（多对一）、多对多

-- 多对多：博客 与 标签
--        学生 与 课程
--        用户、角色、权限
--        ...

# 课程表
create table course
(
    id   int auto_increment primary key comment '主键ID',
    name varchar(20) comment '课程名称'
) comment '课程表';
# 课程数据
insert into course (name) values ('Java'), ('物理'), ('数学') , ('MySQL');



# 学生和课程关联表
create table student_course
(
    id         int auto_increment comment '主键' primary key,
    student_id int not null comment '学生ID',
    course_id  int not null comment '课程ID',

    constraint fk_student_id_ foreign key (student_id) references students (id),
    constraint fk_course_id foreign key (course_id) references course (id)
) comment '学生与课程关联的中间表';

insert into student_course(student_id, course_id)
values (1, 1),
       (1, 4),
       (3, 2),
       (3, 3),
       (3, 1);

-- 给张xx再选一门物理
insert into student_course(student_id, course_id)
    value (1, 2);

-- 查看 张xx 总共选修了哪些课
# 分步
# 1. 查询关联表 student_course 根据 张xx 的ID进行过滤，查询 course_id 字段（具体选了哪些课）
select course_id from student_course where student_id=1;
# 2. 根据上一步得到的 course_id，再查询课程的详细信息
select * from course where id in (1, 4, 2);

# 一次性查询
select * from course where id in (select course_id from student_course where student_id=1);
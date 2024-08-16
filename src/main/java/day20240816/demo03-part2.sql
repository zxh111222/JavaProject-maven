
-- 尝试把 class 表中 id = 2 的班级删除（备注：students 表中，有学生是属于 class_id=2）
delete from class where id=2;
-- 由于有外键约束 foreign key constraint，需要确保 class 表中 id=2 班级没有被其他表引用
-- 要么先删除 students 表中 class_id=2 的学生
delete from students where class_id=2;
-- 或者把 students 表中 class_id=2 的学生移到其他班级去
update students set class_id=3 where class_id=2;
-- 确保现在的 students 表中没有学生是 class_id=2
select count(*) from students where class_id=2;
-- 再次尝试把 class 表中 id = 2 的班级删除（备注：此时 students 表中，没有学生是属于 class_id=2）
delete from class where id=2;


-- 增加外键约束语句可能会涉及到的其他问题：字段类型不兼容或者被参考字段不是索引...
-- class 表增加一个 bigint 类型的 other_id
alter table class add other_id bigint null;
-- students 表增加一个 int 类型的 other_class_id
alter table students add other_class_id int null;
-- 再次演示增加外键约
# [HY000][3780] Referencing column 'other_class_id' and referenced column 'other_id' in foreign key constraint 'students_class_fk_other' are incompatible.
alter table students
    add constraint students_class_fk_other
        foreign key (`other_class_id`) references class (`other_id`);

-- 解决办法：修改 class 表 other_id 的数据类类型，改成跟 students 表的 other_class_id 一致
alter table class modify other_id int null;
-- 再次执行“增加外键约束”的语句
alter table students
    add constraint students_class_fk_other
        foreign key (`other_class_id`) references class (`other_id`);
-- 被参考的那个字段，需要有索引 index
-- [HY000][1822] Failed to add the foreign key constraint. Missing index for constraint 'students_class_fk_other' in the referenced table 'class'
create index class_other_id_index on class (other_id);
-- 再次执行“增加外键约束”的语句
alter table students
    add constraint students_class_fk_other
        foreign key (`other_class_id`) references class (`other_id`);
show databases;

create database if not exists homework01;

use homework01;

show tables;

-- 创建用户表，有三种用户类型: `user`、`admin`、`root` 分别对应三个角色 `文章管理员`、`系统配置员`、`超级管理员`
create table users
(
    id  int auto_increment comment '用户ID'
        primary key,
    username varchar(255) not null comment '用户名',
    password varchar(255) not null comment '用户的密码',
    role_id  int null comment '对应的角色ID',
    constraint users_fk
        foreign key (role_id) references roles (id)
) comment '用户表';

insert into users(username, password, role_id)
values ('user', '123***456', 3),
       ('admin', '123***456', 2),
       ('root', '123***456', 1);


-- 创建角色表，有三个角色: `超级管理员`、`系统配置员`、`文章管理员`
create table roles
(
    id  int auto_increment comment '角色ID'
        primary key,
    role_name varchar(255) not null comment '角色名称'
) comment '角色表';

insert into roles(role_name) value ('超级管理员');
insert into roles(role_name) value ('系统配置员');
insert into roles(role_name) value ('文章管理员');

-- 创建菜单表，有四个菜单项: `用户管理`、`文章管理`、`系统配置`、`权限分配`
create table menus
(
    id  int auto_increment comment '菜单ID'
        primary key,
    menu_name varchar(255) not null comment '菜单名称',
    url       varchar(255) null comment '菜单对应跳转的url'
) comment '菜单表';

insert into menus(menu_name, url) value ('权限分配', '权限分配url');
insert into menus(menu_name, url) value ('用户管理', '用户管理url');
insert into menus(menu_name, url) value ('系统配置', '系统配置url');
insert into menus(menu_name, url) value ('文章管理', '文章管理url');

-- 创建角色-菜单关系表，这个表用来定义每个角色能访问的菜单项
create table role_menu
(
    role_id int not null comment '关联角色表的ID',
    menu_id int not null comment '关联到菜单表的ID',
    constraint role_menu_pk
        primary key (role_id, menu_id),
    constraint role_menu_fk_menu
        foreign key (menu_id) references menus (id),
    constraint role_menu_fk_role
        foreign key (role_id) references menus (id)
) comment '角色-菜单关系表';

insert into role_menu(role_id, menu_id)
values (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (2, 2),
       (2, 3),
       (2, 4),
       (3, 4);
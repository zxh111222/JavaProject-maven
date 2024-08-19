show databases;

create database if not exists hw01;

use hw01;

show tables;

create table user
(
    id  int auto_increment comment '用户ID'
        primary key,
    username varchar(255) not null comment '用户名',
    password varchar(255) not null comment '用户的密码'

) comment '用户表';

create table role
(
    id  int auto_increment comment '角色ID'
        primary key,
    name varchar(255) not null comment '角色名称'
) comment '角色表';


create table menu
(
    id  int auto_increment comment '菜单ID'
        primary key,
    name varchar(255) not null comment '菜单名称'
) comment '菜单表';


create table user_role
(
    user_id int null,
    role_id int null,
    constraint user_role__fk
        foreign key (user_id) references user (id),
    constraint user_role_fk_1
        foreign key (role_id) references role (id)
);

create table role_menu
(
    role_id int null,
    menu_id int null,
    constraint role_menu_fk
        foreign key (role_id) references role (id),
    constraint role_menu_fk_1
        foreign key (menu_id) references menu (id)
);


insert into user(id, username, password) values
    (1, 'root', '123456'), (2, 'admin', '123456'), (3, 'user', '123456');

insert into role(id, name) values
    (1, 'root'), (2, 'admin'), (3, 'article_manager');

insert into menu(id, name) values
    (1, 'user/users'), (2, 'article/articles'), (3, 'config/system'), (4, 'config/permissions');

insert into user_role(user_id, role_id) value (1, 1);
insert into user_role(user_id, role_id) value (2, 2);
insert into user_role(user_id, role_id) value (3, 3);


insert into role_menu(role_id, menu_id) values (2, 1), (2, 2), (2, 3);
insert into role_menu(role_id, menu_id) values (3, 2);

















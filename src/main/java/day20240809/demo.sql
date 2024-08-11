CREATE TABLE `user`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT,
    `name`    varchar(255) DEFAULT NULL,
    `balance` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

## -------

select id, name, balance from user;

insert into user(name, balance) values('小白', 999);

update user set balance = balance + 5 where name = '小白';

delete from user where name = '小白';

## -------

CREATE TABLE `article`
(
    `id`    int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(10) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

insert into article(title) values ('打折转让XXX');
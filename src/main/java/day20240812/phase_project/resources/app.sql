use app;

CREATE TABLE `xmfish`
(
    `id`    int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(255) DEFAULT NULL,
    `url`   varchar(255) DEFAULT NULL UNIQUE,
    `createdAt` date DEFAULT NULL,
    `updatedAt` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
);

ALTER TABLE `xmfish` MODIFY createdAt TIMESTAMP NULL;
ALTER TABLE `xmfish` MODIFY updatedAt TIMESTAMP NULL;



CREATE TABLE `app_config` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `app_name` VARCHAR(50) NOT NULL,
    `version` VARCHAR(50) NOT NULL,
    `config_name` VARCHAR(255) NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL
);

INSERT INTO `app_config` (`app_name`, `version`, `config_name`, `key`, `value`)
VALUES
    ('阶段项目', '1.0', 'app', 'app', '阶段项目'),
    ('阶段项目', '1.0', 'version', 'version', '1.0'),
    ('阶段项目', '1.0', 'downloader', 'MyIODownloader', 'day20240812.phase_project.downloader.MyIODownloader'), -- JsoupDownloader

    ('阶段项目', '1.0', 'storage', 'DbStorage', 'day20240812.phase_project.storage.DbStorage'),   -- ConsoleStorage、FileStorage
    ('阶段项目', '1.0', 'keywords', 'keywords', '小米,华为,闲置'),
    ('阶段项目', '1.0', 'notificator', 'ConsoleNotificator', 'day20240812.phase_project.notificator.ConsoleNotificator'),  -- EmailNotificator
    ('阶段项目', '1.0', 'from', 'from', 'from.xxx@qq.com'),
    ('阶段项目', '1.0', 'secret_token', 'secret_token', 'xxx'),
    ('阶段项目', '1.0', 'to', 'to', 'to.xxx@qq.com');


CREATE TABLE `url_parse` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `parser` VARCHAR(255) NOT NULL
);

INSERT INTO `url_parse` (`name`, `url`, `parser`)
VALUES
    ('厦门小鱼', 'http://bbs.xmfish.com/thread-htm-fid-55-search-all-orderway-postdate-asc-DESC-page-1.html', 'day20240812.phase_project.parser.XmfishParser')


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

CREATE TABLE `app_config` (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            app_name VARCHAR(255) NOT NULL,
                            version VARCHAR(50),
                            downloader VARCHAR(255),
                            url varchar(255),
                            parser VARCHAR(255),
                            storage VARCHAR(255),
                            keywords varchar(255),
                            notificator VARCHAR(255),
                            email_from VARCHAR(255),
                            secret_token VARCHAR(255),
                            email_to VARCHAR(255)
);

INSERT INTO app_config (app_name, version, downloader, url, parser, storage, keywords, notificator, email_from, secret_token, email_to)
    VALUES ('app', '1.0', 'day20240812.phase_project.downloader.MyIODownloader', 'http://bbs.xmfish.com/thread-htm-fid-55-search-all-orderway-postdate-asc-DESC-page-1.html',
            'day20240812.phase_project.parser.XmfishParser', 'day20240812.phase_project.storage.DbStorage', '小米,华为,闲置',
            'day20240812.phase_project.notificator.ConsoleNotificator', 'from.1305894626@qq.com', 'pkosdfvogudhjghf', 'to.2010824936@qq.com');

# simple_blog

ORM
- http://javalite.io/activejdbc

Templet Enging
- http://velocity.apache.org

Formvalidation.io
- https://formvalidation.io
=> 현재 쓰고 있는 버전은 하위 버전으로 API가 많이 다름

CREATE DATABASE blog DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE USER 'user'@'210.94.173.%' IDENTIFIED BY 'Password123!!';
CREATE USER 'user'@'localhost' IDENTIFIED BY 'Password123!!';
CREATE USER 'user'@'127.0.0.1' IDENTIFIED BY 'Password123!!';

grant all privileges on blog.* to 'user'@'127.0.0.1';
grant all privileges on blog.* to 'user'@'localhost';
grant all privileges on blog.* to 'user'@'210.94.173.%';

$> mysql -u root;
$> use blog;
$> desc articles;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int(11)      | NO   | PRI | NULL    | auto_increment |
| title      | varchar(255) | NO   |     | NULL    |                |
| content    | text         | YES  |     | NULL    |                |
| created_at | datetime     | YES  |     | NULL    |                |
| updated_at | datetime     | YES  |     | NULL    |                |
| deleted    | char(1)      | YES  |     | 0       |                |
| writer     | varchar(45)  | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

$>show create table articles;

CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` char(1) DEFAULT '0',
  `writer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |

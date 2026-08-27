D:\Dev\IT30B- PAQUIBOT\backups

1.CREATE DATABASE <database_name>;
2.SHOW DATABASES;
3.CONNECT <database_name>;
4.CREATE TABLE <table_name_in_plural> ();
5.INSERT INTO <table_name_in_plural>
(columns)
VALUES(values);

Utility Commands
\! cls
mysqldump -u root -p --database library_db > "C:\xampp\htdocs\it30B\backups\%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%_08182026_library_db.sql"
mysqldump -u root -p --database library_db > "C:\xampp\htdocs\it30B\backups%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%_08182026_library_db.sql"
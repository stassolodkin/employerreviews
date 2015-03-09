DROP DATABASE employerreviews;
CREATE DATABASE employerreviews;



SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI';
CREATE DATABASE temp_db;
USE temp_db;
DROP PROCEDURE IF EXISTS temp_db.drop_user_if_exists ;
DELIMITER $$
CREATE PROCEDURE temp_db.drop_user_if_exists()
BEGIN
  DECLARE foo BIGINT DEFAULT 0 ;
  SELECT COUNT(*)
  INTO foo
    FROM mysql.user
      WHERE User = 'employerreviews' and  Host = 'localhost';
   IF foo > 0 THEN
         DROP USER 'employerreviews'@'localhost' ;
  END IF;
END ;$$
DELIMITER ;
CALL temp_db.drop_user_if_exists() ;
DROP PROCEDURE IF EXISTS temp_db.drop_users_if_exists ;
SET SQL_MODE=@OLD_SQL_MODE;

DROP DATABASE temp_db;

CREATE USER 'employerreviews'@'localhost' IDENTIFIED BY 'employerreviews';
GRANT ALL PRIVILEGES ON employerreviews.* TO 'employerreviews'@'localhost';
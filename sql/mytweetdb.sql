DROP DATABASE IF EXISTS MyTweetDB;

CREATE DATABASE mytweetdb;

CREATE TABLE MyTweetDB.Accounts (
	id INT(11) NOT NULL AUTO_INCREMENT,
	username VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255) NOT NULL,
	PRIMARY KEY(id)
) ENGINE = InnoDB;

CREATE TABLE MyTweetDB.Messages (
	id INT(11) NOT NULL AUTO_INCREMENT,
	content TEXT NOT NULL,
	account_id INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (account_id)
		REFERENCES MyTweetDB.Accounts(id)
) ENGINE = InnoDB; 

CREATE TABLE MyTweetDB.Followings (
	acc_id INT(11),
	following_id INT(11)
) ENGINE = InnoDB; 

DELIMITER //	

CREATE PROCEDURE CheckUser(IN uname VARCHAR(20), OUT CheckUser BOOL)
BEGIN
 
SELECT
  EXISTS(
   SELECT
    *
   FROM
    accounts
   WHERE
    accounts.username = uname
  )
 INTO
  CheckUser;

END //

DROP PROCEDURE getPassword;
CREATE PROCEDURE getPassword(IN uname VARCHAR(255),OUT pass VARCHAR(255))

BEGIN


SELECT password INTO pass
FROM accounts
where (username = uname);


END//

CREATE PROCEDURE get_message(IN uname VARCHAR(20), OUT Messages TEXT)

BEGIN
SELECT 

BEGIN 

DELIMITER ;

	
	
	INSERT INTO `mytweetdb`.`accounts` (`username`, `password`) 
	VALUES ('Nikolai', '4321'),
			('Ivan', '1234'),
			('Profyy', '1234'),
			('Petar', '1234');
			
	INSERT INTO `mytweetdb`.`messages` (id, content, account_id)
	VALUES (DEFAULT, 'Hello, I am here !!!',1),
			(DEFAULT, 'Let me tell you something!!!',1),
			(DEFAULT, 'What??',2),
			(DEFAULT, 'I am curios to know !!!',1);
			
			
	INSERT INTO `mytweetdb`.`followings` (acc_id, following_id)
	VALUES (1,2),
			(1,3),
			(1,4),
			(2,2),
			(2,3);
			


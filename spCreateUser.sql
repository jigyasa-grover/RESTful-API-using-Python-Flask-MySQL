USE ItemListDB;

DROP procedure IF EXISTS spCreateUser;

DELIMITER $$

USE ItemListDB$$
CREATE PROCEDURE spCreateUser (
	IN p_Username varchar(50),
	IN p_Password varchar(50)
								)

BEGIN

IF ( SELECT EXISTS 
		(SELECT 1 FROM tableUser WHERE Username = p_Username) 
	) 
	THEN

    SELECT 'Username Exists !!';

ELSE

INSERT INTO tableUser
	(
    	Username,
    	Password
	)
VALUES
(
    p_Username,
    p_Password
);

END IF;

END$$

DELIMITER ;

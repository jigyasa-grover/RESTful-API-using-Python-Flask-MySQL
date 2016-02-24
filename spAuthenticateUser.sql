USE ItemListDB;

DROP procedure IF EXISTS spAuthenticateUser;

DELIMITER $$

USE ItemListDB$$
CREATE PROCEDURE spAthenticateUser (
	IN p_Username varchar(50)
								)

BEGIN

	SELECT * FROM tableUser WHERE Username = p_Username;

END$$

DELIMITER ;

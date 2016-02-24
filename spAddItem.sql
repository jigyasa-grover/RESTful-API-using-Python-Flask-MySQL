USE ItemListDB;

DROP procedure IF EXISTS spAddItem;

DELIMITER $$

CREATE DEFINER = root@localhost PROCEDURE spAddItem
(
	IN p_UserID INT,
	IN p_ItemName VARCHAR(25)
)

BEGIN

	INSERT INTO tableItem
	(
		UserID,
		ItemName
	)
	VALUES
	(
		p_UserID,
		p_ItemName
	);
	

END$$

DELIMITER ;

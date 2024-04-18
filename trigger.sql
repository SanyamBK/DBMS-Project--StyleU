use styleu;

DELIMITER //

CREATE TRIGGER Block_User_After_Five_Attempts
AFTER INSERT ON Login_Attempts
FOR EACH ROW
BEGIN
    DECLARE attempts INT;
    DECLARE user_id INT;
    
    -- Get the user ID and count the number of failed attempts
    SELECT COUNT(*), UserID INTO attempts, user_id
    FROM Login_Attempts
    WHERE UserID = NEW.UserID
    AND Attempt_Date > DATE_SUB(NOW(), INTERVAL 1 DAY)
    GROUP BY UserID;
    
    -- If there are five or more failed attempts, update the user status
    IF attempts >= 5 THEN
        UPDATE User_Details SET Status = 'Blocked' WHERE UserID = user_id;
    END IF;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER IncreaseInventory
AFTER UPDATE ON Inventory
FOR EACH ROW
BEGIN
    IF NEW.Quantity < 5 THEN
        UPDATE Inventory
        SET Quantity = Quantity + 50
        WHERE ProductID = NEW.ProductID;
    END IF;
END;
//

DELIMITER ;

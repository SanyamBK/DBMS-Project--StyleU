use styleu;

DELIMITER //

CREATE TRIGGER if not exists Block_User_After_Five_Attempts
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
        UPDATE User_Details SET User_Status = 'Blocked' WHERE UserID = user_id;
    END IF;
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER if not exists Update_Inventory_On_Low_Stock
AFTER INSERT ON Order_User
FOR EACH ROW
BEGIN
    DECLARE stock_count INT;
    DECLARE product_id INT;

    -- Get the product ID and current stock count
    SELECT Quantity, ProductID INTO stock_count, product_id
    FROM Inventory
    WHERE ProductID = NEW.ProductID;

    -- If the stock count is less than 10, add 30 to the inventory
    IF stock_count < 10 THEN
        UPDATE Inventory SET Quantity = Quantity + 30 WHERE ProductID = product_id;
    END IF;
END//

DELIMITER ;



begin;

INSERT INTO User_Details (UserName, Passwords, Contact_Number, Email_ID, Address, City, State, Pincode, User_Status)
VALUES ('Aditri', 'password1', '8098787654', 'aditri@iiitd.ac.in', 'dwarka sector 10', 'Delhi', 'Delhi', '110075', 'Active');
commit;

begin;

UPDATE Clothing_Item
SET Price = 1299
WHERE ProductID = 1;
commit;

begin;

INSERT INTO Order_User (Value_Order, UserID, Placement, Delivery_Date, Delivery_Personnel, ProductID, Product_Name, Product_Size, Status_Order, AgentID)
VALUES (2999, 1, 'Online', '2024-04-2', 'Adi', 2, 'Men Tshirt Peach', 'M', 'ND', 1);
commit;

begin;

SELECT * FROM Product_Feedback WHERE Product_FeedbackID = LAST_INSERT_ID();
UPDATE Product_Feedback
SET Product_Descriptions = 'Updated feedback description', Product_Rating = 4
WHERE Product_FeedbackID = LAST_INSERT_ID();
commit;


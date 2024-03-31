drop database if exists StyleU;

create database if not exists StyleU;
use StyleU;


Create Table if not exists User_Details
(
	UserID int Primary Key auto_increment not null,
    UserName varchar(100) not null,
    Passwords varchar(100) not null,
    Contact_Number varchar(100) not null,
    Email_ID varchar(100) not null,
    Address varchar(100) not null,
    City varchar(100) not null,
    State varchar(100) not null,
    Pincode varchar(100) not null,
    UNIQUE(Email_ID)
);


Create Table if not exists Clothing_Item
(
    ProductID int Primary Key auto_increment not null,
    Brand varchar(100) not null,
    Price DECIMAL(10, 2) not null,
    Sex enum('M', 'F', 'U') ,
    Size enum('XS', 'S', 'M', 'L', 'XL', 'XXL') DEFAULT null,
    Colour varchar(100) null,
    Descriptions text not null,
    Rating int not null
);


Create Table if not exists Product_Feedback
(
    Product_FeedbackID int Primary Key auto_increment not null,
    ProductID int not null,
    UserID int not null,
    Brand varchar(100) not null,
    Customer_Name varchar(100) not null,
    Feedback_date date not null,
    Product_Descriptions text not null,
    Product_Rating int not null,
    Foreign Key(ProductID) References Clothing_Item(ProductID) On Delete Cascade,
    Foreign Key(UserID) References User_Details(UserID) On Delete Cascade
);



Create Table if not exists Delivery_Person
(
        AgentID int Primary Key auto_increment not null,
    Agent_Name varchar(100) not null,
    Contact_Number varchar(100) not null,
    OrderID int not null,
    Person_Rating int not null
);
Alter Table Delivery_Person
MODIFY OrderID int DEFAULT null;

Alter TABLE Delivery_Person
Add Column Status Enum('A', 'NA') DEFAULT 'A';

Create Table if not exists Delivery_Feedback
(
        Delivery_FeedbackID int Primary Key auto_increment not null,
    AgentID int not null,
    Agent_Name varchar(100) not null,
    UserID int not null,
    UserName varchar(100) not null,
    Delivery_Feedback_Date date not null,
    Delivery_Description text not null,
    Delivery_Rating int not null,
    
    Unique Key(AgentID),
    Foreign Key(AgentID) References Delivery_Person(AgentID) On Delete Cascade
);
Alter Table Delivery_Feedback
Add Foreign Key(UserID) references User_Details(UserID) On Delete Cascade;


Create Table if not exists Brand_Table
(
    BrandID int Primary Key auto_increment not null,
    Brand varchar(100) not null,
    Contact_number varchar(100) not null,
    Email varchar(100) not null,
    Brand_Rating int not null,
    Registered_Date date not null
);



CREATE TABLE IF NOT EXISTS Cart (
    CartID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Value_Cart DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User_Details(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Clothing_Item(ProductID) ON DELETE CASCADE
);
Alter Table Cart
Add Size enum('XS', 'S', 'M', 'L', 'XL', 'XXL') not null;

-- Drop the existing foreign key constraint


Create Table if not exists Purchase_history
(
    UserID int Primary Key auto_increment not null,
    OrderID int not null,
    Order_Date date not null,
    Status_Order enum('D', 'ND'),
    Delivery_Date date not null,
    
    Foreign Key (UserID) references user_details(UserID) on delete Cascade
);




Create Table if not exists Inventory
(
    ProductID int Primary Key auto_increment not null,
    Quantity int not null,
    
    Foreign Key (ProductID) references clothing_item(ProductID) on Delete Cascade
);


Create Table if not exists Order_User
(
    OrderID int Primary Key auto_increment not null,
    Value_Order DOUBLE not null,
    UserID int not null,
    Placement varchar(100) not null,
    Delivery_Date date not null,
    Delivery_Personnel varchar(100) not null,
    ProductID int not null,
    Product_Name varchar(100) not null,
    Status_Order Enum('D', 'ND'),
    AgentID int not null,
    
    Foreign Key(UserID) references User_Details(UserID) On Delete Cascade,
    Foreign Key(UserID) references Cart(UserID),
    Foreign Key(ProductID) references Cart(ProductID),
    Foreign Key(AgentID) references delivery_person(AgentID) On delete Cascade
);
ALTER TABLE order_user ADD Product_Size ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL') NOT NULL AFTER Product_Name;

use styleu;

-- Step 1: Add a new column
ALTER TABLE clothing_item
ADD COLUMN Price_new DECIMAL(10, 2);

-- Step 2: Update the new column with values from the old column
UPDATE clothing_item
SET Price_new = Price;

-- Step 3: Drop the old column
ALTER TABLE clothing_item
DROP COLUMN Price;

-- Step 4: Rename the new column to the original column name
ALTER TABLE clothing_item
CHANGE COLUMN Price_new Price DECIMAL(10, 2);


use styleu;

-- Step 1: Add a new column
ALTER TABLE clothing_item
ADD COLUMN Value_Cart_new DECIMAL(12, 2);

-- Step 2: Update the new column with values from the old column
UPDATE Cart
SET Value_Cart_new = Value_Cart;

-- Step 3: Drop the old column
ALTER TABLE Cart
DROP COLUMN Value_Cart;

-- Step 4: Rename the new column to the original column name
ALTER TABLE Cart
CHANGE COLUMN Value_Cart_new Value_Cart DECIMAL(12, 2);


USE StyleU;

INSERT INTO Clothing_Item (Brand, Price, Sex, Size, Colour, Descriptions, Rating)
VALUES
('French Crown', 9999.00, 'M', NULL, 'Beige', 'Men\'s Slim Fit 3 Piece Suit', 5),
('Peter England', 9999.00, 'M', NULL, 'Peach', 'Men\'s Classic: Peach', 5),
('Louis Philippe', 9999.00, 'M', NULL, 'Maroon', 'Men\'s Suit Slim Fit 3 Piece Suit Blazer One Button Tuxedo', 5),
('French Crown', 9999.00, 'M', NULL, 'Black', 'Jade Black Subtle Sheen Wool Rich Hand Crafted Designer Tuxedo Blazer', 5),
('YSMLOIU', 9999.00, 'M', NULL, 'Blue', 'Slim Fit 3 Piece Wedding Suit for Men', 5),
('YouthUp', 9999.00, 'M', NULL, 'Grey Black', 'Men\'s 3 Piece Suit Slim Fit with Single Row Jacket Suits and Vest', 5),
('unbranded', 9999.00, 'M', NULL, 'Dark Blue', 'Men\'s Suits Leisure Suit For Men Four Seasons Business Groom Wedding Dress Formal Fashion Slim-fit Two-piece', 5),
('TOPGH', 9999.00, 'M', NULL, 'Blue Black', 'Men\'s 3 PCS Suit Notch Lapel Solid Wedding Work Slim Tuxedo Fit', 5);
('Lhuilier', 80999.00, 'F', NULL, 'White', 'Stunning off shoulder lace wedding dress long train', 5),
('Ricco India', 100000.00, 'F', NULL, 'Black', 'Black Gown', 5),
('LimeRoad', 9999.00, 'F', NULL, 'Cyan', 'Women Gorgeous Gowns Flower Printed Sky', 5),
('unbranded', 9999.00, 'F', NULL, 'Sky Blue', 'Lace Middle Sleeves V-neck Lace-up Floor Length Ball Gown Dress', 5),
('unbranded', 9999.00, 'F', NULL, 'Pastel Green', 'Pastel Green Net High Netted Gown', 5);
('Nike', 999.00, 'M', 'XS', NULL, 'Floral Lily Shirt', 5),
('Adidas', 499.00, 'M', 'S', NULL, 'Cartoon Astronaut Shirt', 5),
('Van Heusen', 799.00, 'M', 'M', NULL, 'Floral Shirt', 5),
('Forever 21', 999.00, 'M', 'L', 'White', 'White Shirt with Pink flowers', 5),
('Jian Jing', 1599.00, 'M', 'XL', 'Orange Blue', 'Orange Blue Shirt', 5),
('H&M', 1999.00, 'M', 'XXL', 'Blue', 'Denim Full Sleeves Shirt', 5),
('GAP', 999.00, 'M', NULL, 'Grey', 'Full sleeves shirt with check pattern', 5),
('Khadi', 999.00, 'M', 'L', 'Greyish Black', 'Simple Shirt', 5),
('Zara', 2599.00, 'M', NULL, 'Black', 'Black T-shirt', 5);
('H&M', 1999.00, 'F', NULL, 'Black', 'Black Dress', 5),
('H&M', 999.00, 'F', NULL, 'Grey', 'Casual Dress in Grey', 5),
('Van Heusen', 1799.00, 'F', NULL, 'Black', 'Black Dress for Night Wear', 5),
('Forever 21', 4999.00, 'F', NULL, 'White with Pink flowers', 'White Dress with Pink flowers', 5),
('Louis Vuitton', 2599.00, 'F', NULL, 'Blue', 'Blue Dress for Party', 5),
('Manyavar', 6999.00, 'F', NULL, 'Yellow', 'Yellow Dress for Mehndi', 5),
('GAP', 1599.00, 'F', NULL, 'Green', 'Casual Wear Green Dress', 5),
('Zara', 4999.00, 'F', NULL, 'Silver', 'Silver Flower Dress', 5);


INSERT INTO Inventory (ProductID, Quantity)
VALUES
(1, 30),
(2, 30),
(3, 30),
(4, 30),
(5, 30),
(6, 30),
(7, 30),
(8, 30),
(9, 30),
(10, 30),
(11, 30),
(12, 30),
(13, 30),
(14, 30),
(15, 30),
(16, 30),
(17, 30),
(18, 30),
(19, 30),
(20, 30),
(21, 30),
(22, 30),
(23, 30),
(24, 30),
(25, 30),
(26, 30),
(27, 30),
(28, 30),
(29, 30),
(30, 30);


INSERT INTO Delivery_Person (AgentID,Agent_Name, Contact_Number, OrderID, Person_Rating)
VALUES
(1,'Ravi Kumar', '9876543210', NULL, 4),
(2,'Priya Gupta', '9871234560', NULL, 5),
(3,'Amit Singh', '9876541230', NULL, 4),
(4,'Neha Sharma', '7891234560', NULL, 4),
(5,'Sanjay Patel', '6543217890', NULL, 5),
(6,'Anita Verma', '3216549870', NULL, 3),
(7,'Rahul Mishra', '9874563210', NULL, 4),
(8,'Pooja Reddy', '1472583690', NULL, 5),
(9,'Suresh Tiwari', '3698521470', NULL, 4),
(10,'Meera Joshi', '8529637410', NULL, 3);

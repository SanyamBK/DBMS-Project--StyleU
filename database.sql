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
    Pincode varchar(100) not null
);


Create Table if not exists Clothing_Item
(
        ProductID int Primary Key auto_increment not null,
    Brand varchar(100) not null,
    Price float4 not null,
    Sex enum('M', 'F', 'U'),
    Size int not null,
    Colour varchar(100) not null,
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



Create Table if not exists Cart
(
        UserID int Primary Key auto_increment not null,
    ProductID int not null,
    Quantity int not null,
    Value_Cart int not null,
    
    Foreign Key(ProductID) references clothing_item(ProductID) on delete cascade
);



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
    Value_Order int not null,
    UserID int not null,
    Placement varchar(100) not null,
    Delivery_Date date not null,
    Delivery_Personnel varchar(100) not null,
    ProductID int not null,
    Product_Name varchar(100) not null,
    Status_Order Enum('D', 'ND'),
    AgentID int not null,
    
    Foreign Key(UserID) references User_Details(UserID) On Delete Cascade,
    Foreign Key(UserID) references Cart(UserID) On delete Cascade,
    Foreign Key(ProductID) references Cart(ProductID) On Delete Cascade,
    Foreign Key(AgentID) references delivery_person(AgentID) On delete Cascade
);




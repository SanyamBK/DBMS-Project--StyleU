-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 02:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `styleu`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_table`
--

CREATE TABLE `brand_table` (
  `BrandID` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Contact_number` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Brand_Rating` int(11) NOT NULL,
  `Registered_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Size` enum('XS','S','M','L','XL','XXL') NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Value_Cart` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clothing_item`
--

CREATE TABLE `clothing_item` (
  `ProductID` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Sex` enum('M','F','U') DEFAULT NULL,
  `Size` enum('XS','S','M','L','XL','XXL') DEFAULT NULL,
  `Colour` varchar(100) DEFAULT NULL,
  `Descriptions` text NOT NULL,
  `Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clothing_item`
--

INSERT INTO `clothing_item` (`ProductID`, `Brand`, `Price`, `Sex`, `Size`, `Colour`, `Descriptions`, `Rating`) VALUES
(1, 'French Crown', 9999.00, 'M', NULL, 'Beige', 'Men\'s Slim Fit 3 Piece Suit', 5),
(2, 'Peter England', 9999.00, 'M', NULL, 'Peach', 'Men\'s Classic: Peach', 5),
(3, 'Louis Philippe', 9999.00, 'M', NULL, 'Maroon', 'Men\'s Suit Slim Fit 3 Piece Suit Blazer One Button Tuxedo', 5),
(4, 'French Crown', 9999.00, 'M', NULL, 'Black', 'Jade Black Subtle Sheen Wool Rich Hand Crafted Designer Tuxedo Blazer', 5),
(5, 'YSMLOIU', 9999.00, 'M', NULL, 'Blue', 'Slim Fit 3 Piece Wedding Suit for Men', 5),
(6, 'YouthUp', 9999.00, 'M', NULL, 'Grey Black', 'Men\'s 3 Piece Suit Slim Fit with Single Row Jacket Suits and Vest', 5),
(7, 'unbranded', 9999.00, 'M', NULL, 'Dark Blue', 'Men\'s Suits Leisure Suit For Men Four Seasons Business Groom Wedding Dress Formal Fashion Slim-fit Two-piece', 5),
(8, 'TOPGH', 9999.00, 'M', NULL, 'Blue Black', 'Men\'s 3 PCS Suit Notch Lapel Solid Wedding Work Slim Tuxedo Fit', 5),
(9, 'Lhuilier', 80999.00, 'F', NULL, 'White', 'Stunning off shoulder lace wedding dress long train', 5),
(10, 'Ricco India', 100000.00, 'F', NULL, 'Black', 'Black Gown', 5),
(11, 'LimeRoad', 9999.00, 'F', NULL, 'Cyan', 'Women Gorgeous Gowns Flower Printed Sky', 5),
(12, 'unbranded', 9999.00, 'F', NULL, 'Sky Blue', 'Lace Middle Sleeves V-neck Lace-up Floor Length Ball Gown Dress', 5),
(13, 'unbranded', 9999.00, 'F', NULL, 'Pastel Green', 'Pastel Green Net High Netted Gown', 5),
(14, 'Nike', 999.00, 'M', 'XS', NULL, 'Floral Lily Shirt', 5),
(15, 'Adidas', 499.00, 'M', 'S', NULL, 'Cartoon Astronaut Shirt', 5),
(16, 'Van Heusen', 799.00, 'M', 'M', NULL, 'Floral Shirt', 5),
(17, 'Forever 21', 999.00, 'M', 'L', 'White', 'White Shirt with Pink flowers', 5),
(18, 'Jian Jing', 1599.00, 'M', 'XL', 'Orange Blue', 'Orange Blue Shirt', 5),
(19, 'H&M', 1999.00, 'M', 'XXL', 'Blue', 'Denim Full Sleeves Shirt', 5),
(20, 'GAP', 999.00, 'M', NULL, 'Grey', 'Full sleeves shirt with check pattern', 5),
(21, 'Khadi', 999.00, 'M', 'L', 'Greyish Black', 'Simple Shirt', 5),
(22, 'Zara', 2599.00, 'M', NULL, 'Black', 'Black T-shirt', 5),
(23, 'H&M', 1999.00, 'F', NULL, 'Black', 'Black Dress', 5),
(24, 'H&M', 999.00, 'F', NULL, 'Grey', 'Casual Dress in Grey', 5),
(25, 'Van Heusen', 1799.00, 'F', NULL, 'Black', 'Black Dress for Night Wear', 5),
(26, 'Forever 21', 4999.00, 'F', NULL, 'White with Pink flowers', 'White Dress with Pink flowers', 5),
(27, 'Louis Vuitton', 2599.00, 'F', NULL, 'Blue', 'Blue Dress for Party', 5),
(28, 'Manyavar', 6999.00, 'F', NULL, 'Yellow', 'Yellow Dress for Mehndi', 5),
(29, 'GAP', 1599.00, 'F', NULL, 'Green', 'Casual Wear Green Dress', 5),
(30, 'Zara', 4999.00, 'F', NULL, 'Silver', 'Silver Flower Dress', 5);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_feedback`
--

CREATE TABLE `delivery_feedback` (
  `Delivery_FeedbackID` int(11) NOT NULL,
  `AgentID` int(11) NOT NULL,
  `Agent_Name` varchar(100) NOT NULL,
  `UserID` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Delivery_Feedback_Date` date NOT NULL,
  `Delivery_Description` text NOT NULL,
  `Delivery_Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_person`
--

CREATE TABLE `delivery_person` (
  `AgentID` int(11) NOT NULL,
  `Agent_Name` varchar(100) NOT NULL,
  `Contact_Number` varchar(100) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `Person_Rating` int(11) NOT NULL,
  `Status` enum('A','NA') DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_person`
--

INSERT INTO `delivery_person` (`AgentID`, `Agent_Name`, `Contact_Number`, `OrderID`, `Person_Rating`, `Status`) VALUES
(1, 'Ravi Kumar', '9876543210', 2, 4, 'A'),
(2, 'Priya Gupta', '9871234560', NULL, 5, 'A'),
(3, 'Amit Singh', '9876541230', NULL, 4, 'A'),
(4, 'Neha Sharma', '7891234560', NULL, 4, 'A'),
(5, 'Sanjay Patel', '6543217890', NULL, 5, 'A'),
(6, 'Anita Verma', '3216549870', NULL, 3, 'A'),
(7, 'Rahul Mishra', '9874563210', NULL, 4, 'A'),
(8, 'Pooja Reddy', '1472583690', NULL, 5, 'A'),
(9, 'Suresh Tiwari', '3698521470', NULL, 4, 'A'),
(10, 'Meera Joshi', '8529637410', NULL, 3, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ProductID`, `Quantity`) VALUES
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
(11, 29),
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

-- --------------------------------------------------------

--
-- Table structure for table `order_user`
--

CREATE TABLE `order_user` (
  `OrderID` int(11) NOT NULL,
  `Value_Order` double NOT NULL,
  `UserID` int(11) NOT NULL,
  `Placement` varchar(100) NOT NULL,
  `Delivery_Date` date NOT NULL,
  `Delivery_Personnel` varchar(100) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Product_Name` varchar(100) NOT NULL,
  `Product_Size` enum('XS','S','M','L','XL','XXL') NOT NULL,
  `Status_Order` enum('D','ND') DEFAULT NULL,
  `AgentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_user`
--

INSERT INTO `order_user` (`OrderID`, `Value_Order`, `UserID`, `Placement`, `Delivery_Date`, `Delivery_Personnel`, `ProductID`, `Product_Name`, `Product_Size`, `Status_Order`, `AgentID`) VALUES
(2, 9999, 1, 'Online', '2024-04-25', 'Ravi Kumar', 11, 'Women Gorgeous Gowns Flower Printed Sky', 'L', 'ND', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_feedback`
--

CREATE TABLE `product_feedback` (
  `Product_FeedbackID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Brand` varchar(100) NOT NULL,
  `Customer_Name` varchar(100) NOT NULL,
  `Feedback_date` date NOT NULL,
  `Product_Descriptions` text NOT NULL,
  `Product_Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_history`
--

CREATE TABLE `purchase_history` (
  `Purchase_ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Order_Date` date NOT NULL,
  `Status_Order` enum('D','ND') DEFAULT NULL,
  `Delivery_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_history`
--

INSERT INTO `purchase_history` (`Purchase_ID`, `UserID`, `OrderID`, `Order_Date`, `Status_Order`, `Delivery_Date`) VALUES
(1, 1, 2, '2024-04-18', 'ND', '2024-04-25');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Passwords` varchar(100) NOT NULL,
  `Contact_Number` varchar(100) NOT NULL,
  `Email_ID` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `Pincode` varchar(100) NOT NULL,
  `User_Status` enum('Active','Blocked') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`UserID`, `UserName`, `Passwords`, `Contact_Number`, `Email_ID`, `Address`, `City`, `State`, `Pincode`, `User_Status`) VALUES
(1, 'Sanyam Barwar', 'sanyam04', '07048988343', 'sanyambarwar009@gmail.com', '108-109, Pkt 3, Sec 24', 'Delhi', 'Delhi', '110085', 'Blocked'),
(2, 'Sanyam Barwar', '1234five', '07048988343', 'sanyam22447@iiitd.ac.in', 'Old Boys Hostel, IIIT Delhi, Okhla', 'Delhi', 'Delhi', '110085', NULL),
(3, 'Sanyam', 'sanyam04', '07048988343', 'sanyam@gmail.com', 'Old Boys Hostel, IIIT Delhi, Okhla', 'Delhi', 'Delhi', '110085', 'Blocked');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_table`
--
ALTER TABLE `brand_table`
  ADD PRIMARY KEY (`BrandID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `clothing_item`
--
ALTER TABLE `clothing_item`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `delivery_feedback`
--
ALTER TABLE `delivery_feedback`
  ADD PRIMARY KEY (`Delivery_FeedbackID`),
  ADD UNIQUE KEY `AgentID` (`AgentID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `delivery_person`
--
ALTER TABLE `delivery_person`
  ADD PRIMARY KEY (`AgentID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `order_user`
--
ALTER TABLE `order_user`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `AgentID` (`AgentID`);

--
-- Indexes for table `product_feedback`
--
ALTER TABLE `product_feedback`
  ADD PRIMARY KEY (`Product_FeedbackID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD PRIMARY KEY (`Purchase_ID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email_ID` (`Email_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_table`
--
ALTER TABLE `brand_table`
  MODIFY `BrandID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clothing_item`
--
ALTER TABLE `clothing_item`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `delivery_feedback`
--
ALTER TABLE `delivery_feedback`
  MODIFY `Delivery_FeedbackID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_person`
--
ALTER TABLE `delivery_person`
  MODIFY `AgentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_user`
--
ALTER TABLE `order_user`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_feedback`
--
ALTER TABLE `product_feedback`
  MODIFY `Product_FeedbackID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_history`
--
ALTER TABLE `purchase_history`
  MODIFY `Purchase_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user_details` (`UserID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `clothing_item` (`ProductID`);

--
-- Constraints for table `delivery_feedback`
--
ALTER TABLE `delivery_feedback`
  ADD CONSTRAINT `delivery_feedback_ibfk_1` FOREIGN KEY (`AgentID`) REFERENCES `delivery_person` (`AgentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_feedback_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user_details` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `clothing_item` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `order_user`
--
ALTER TABLE `order_user`
  ADD CONSTRAINT `order_user_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user_details` (`UserID`),
  ADD CONSTRAINT `order_user_ibfk_2` FOREIGN KEY (`AgentID`) REFERENCES `delivery_person` (`AgentID`);

--
-- Constraints for table `product_feedback`
--
ALTER TABLE `product_feedback`
  ADD CONSTRAINT `product_feedback_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `clothing_item` (`ProductID`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_feedback_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user_details` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD CONSTRAINT `purchase_history_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user_details` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

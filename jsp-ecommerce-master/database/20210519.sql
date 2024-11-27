-- MySQL Dump optimized with Database Creation

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `ecommerce_cart` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Use the created database
USE `ecommerce_cart`;

-- Session Settings
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Drop Tables if they exist
DROP TABLE IF EXISTS `orders`, `products`, `users`;

-- Create `orders` table
CREATE TABLE `orders` (
  `o_id` INT NOT NULL AUTO_INCREMENT,
  `p_id` INT NOT NULL,
  `u_id` INT NOT NULL,
  `o_quantity` INT NOT NULL,
  `o_date` DATE NOT NULL, -- Changed from VARCHAR(450) to DATE
  PRIMARY KEY (`o_id`),
  FOREIGN KEY (`p_id`) REFERENCES `products`(`id`) ON DELETE CASCADE, -- Added foreign key
  FOREIGN KEY (`u_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create `products` table
CREATE TABLE `products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL, -- Reduced length for optimization
  `category` VARCHAR(100) NOT NULL, -- Reduced length for optimization
  `price` DECIMAL(10, 2) NOT NULL, -- Changed to DECIMAL for better precision
  `image` VARCHAR(255) NOT NULL, -- Adjusted for standard path lengths
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create `users` table
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL, -- Reduced length for optimization
  `email` VARCHAR(150) NOT NULL UNIQUE, -- Adjusted length and defined unique inline
  `password` VARCHAR(255) NOT NULL, -- Lengthened for hashed passwords
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert Data into `orders`
INSERT INTO `orders` (`o_id`, `p_id`, `u_id`, `o_quantity`, `o_date`) VALUES
(25, 3, 1, 3, '2021-05-15'),
(26, 2, 1, 1, '2021-05-15');

-- Insert Data into `products`
INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(1, 'New Arrival Female Shoes', 'Female Shoes', 120.00, 'female-shoes.jpg'),
(2, 'Ladies Pure PU Shoulder Bag', 'Ladies Bag', 69.99, 'ladis-bag.jpg'),
(3, 'Stylish Men Office Suits', 'Men Clothes', 169.00, 'men-suits.jpg'),
(4, 'Jaeger-LeCoultre Men Watch', 'Men Watch', 2500.99, 'men-watch.jpg'),
(5, 'FreeMax e-cigarettes VB-456', 'E-Cigarettes', 310.00, 'smoking-e-cigarette.jpg'),
(6, 'GeekVape E-Cigarettes MM-632', 'E-Cigarettes', 555.50, 'smoking-e-cigarette-2.jpg');

-- Insert Data into `users`
INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Almamun', 'almamun@mail.com', '123456'); -- Passwords should ideally be hashed.

-- Reset Session Settings
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

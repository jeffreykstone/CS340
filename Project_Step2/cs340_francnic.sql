-- phpMyAdmin SQL Dump
-- version 5.2.0-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 11, 2022 at 08:21 PM
-- Server version: 10.6.8-MariaDB-log
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_francnic`
--

-- Disabling FOREIGN_KEY_CHECKS and AUTOCOMMIT
SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Bags`
--

CREATE OR REPLACE TABLE `Blood_Bags` (
  `bloodBagID` int(11) NOT NULL,
  `bloodDonorID` int(11) NOT NULL,
  `bloodGroup` varchar(5) NOT NULL,
  `bloodComponent` varchar(12) NOT NULL,
  `hbCount` varchar(12) NOT NULL,
  `unitsReceived` int(11) NOT NULL,
  `donationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Blood_Bags`
--

INSERT INTO `Blood_Bags` (`bloodBagID`, `bloodDonorID`, `bloodGroup`, `bloodComponent`, `hbCount`, `unitsReceived`, `donationDate`) VALUES
(1, 1, 'A-', 'Red', '150', 500, '2022-01-02'),
(2, 2, 'O+', 'Plasma', '142', 500, '2022-07-04'),
(3, 3, 'AB-', 'White', '138', 500, '2022-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Banks`
--

CREATE OR REPLACE TABLE `Blood_Banks` (
  `bloodBankID` int(11) NOT NULL,
  `bloodBagID` int(11) NOT NULL,
  `bloodBankName` varchar(155) NOT NULL,
  `bloodBankAddress` varchar(155) NOT NULL,
  `bloodBankPhoneNumber` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Blood_Banks`
--

INSERT INTO `Blood_Banks` (`bloodBankID`, `bloodBagID`, `bloodBankName`, `bloodBankAddress`, `bloodBankPhoneNumber`) VALUES
(1, 1, 'Seattle Blood Bank', '4650 Tolt Ave Seattle, WA', '4255490054'),
(2, 2, 'Pacific Northwest Blood Bank', '17460 NE 67th Ct Seattle, WA', '2067894154'),
(3, 3, 'Portland Blood Bank', '206 Central Way Portland, OR', '5128278002');

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Banks_has_Blood_Donation_Centers`
--

CREATE OR REPLACE TABLE `Blood_Banks_has_Blood_Donation_Centers` (
  `bloodBankID` int(11) NOT NULL,
  `bloodDonationCenterID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Banks_has_Blood_Donation_Inventories`
--

CREATE OR REPLACE TABLE `Blood_Banks_has_Blood_Donation_Inventories` (
  `bloodBankID` int(11) NOT NULL,
  `bloodDonationInventoryID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Donation_Centers`
--

CREATE OR REPLACE TABLE `Blood_Donation_Centers` (
  `bloodDonationCenterID` int(10) UNSIGNED NOT NULL,
  `donationName` varchar(55) NOT NULL,
  `donationAddress` varchar(155) NOT NULL,
  `donationPhoneNumber` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Blood_Donation_Centers`
--

INSERT INTO `Blood_Donation_Centers` (`bloodDonationCenterID`, `donationName`, `donationAddress`, `donationPhoneNumber`) VALUES
(1, 'Seattle Blood Donation', '1081 Main St Seattle, WA', '2062145545'),
(2, 'Lynnwood Blood Donation', '202 21st Pl W Lynnwood, WA', '2516481212'),
(3, 'Portland Blood Donation', '4151 River Way Portland, OR', '4142543127');

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Donation_Inventories`
--

CREATE OR REPLACE TABLE `Blood_Donation_Inventories` (
  `bloodDonationInventoryID` int(10) UNSIGNED NOT NULL,
  `bloodBagID` int(11) NOT NULL,
  `bloodDonationCenterID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Blood_Donation_Inventories`
--

INSERT INTO `Blood_Donation_Inventories` (`bloodDonationInventoryID`, `bloodBagID`, `bloodDonationCenterID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Donors`
--

CREATE OR REPLACE TABLE `Blood_Donors` (
  `bloodDonorID` int(11) NOT NULL,
  `donorGender` varchar(15) NOT NULL,
  `donorLastName` varchar(55) NOT NULL,
  `donorFirstName` varchar(55) NOT NULL,
  `donorPhoneNumber` varchar(25) NOT NULL,
  `donorAddress` varchar(155) NOT NULL,
  `donorEmail` varchar(55) NOT NULL,
  `donorBloodGroup` varchar(5) NOT NULL,
  `donorDOB` date NOT NULL,
  `donorLadtDonation` date NOT NULL,
  `donorBloodComponent` varchar(15) NOT NULL,
  `donationMethod` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Blood_Donors`
--

INSERT INTO `Blood_Donors` (`bloodDonorID`, `donorGender`, `donorLastName`, `donorFirstName`, `donorPhoneNumber`, `donorAddress`, `donorEmail`, `donorBloodGroup`, `donorDOB`, `donorLadtDonation`, `donorBloodComponent`, `donationMethod`) VALUES
(1, 'Male', 'Smith', 'John', '8005551234', '12345 55t Street Seattle, WA', 'john.smith@gmail.com', 'A-', '1990-02-12', '2022-07-02', 'Red', 'Whole'),
(2, 'Female', 'Williams', 'Jane', '8005551212', '1274 2nd Street Portland, Oregon', 'jane.williams@gmail.com', 'O+', '1988-06-14', '2022-07-04', 'Plasma', 'Plasma'),
(3, 'Male', 'Miller', 'Nick', '5418469824', '1253 Pl W Los Angeles, CA', 'nick.miller@gmail.com', 'AB-', '1995-12-15', '2022-01-25', 'White', 'Whole');

-- --------------------------------------------------------

--
-- Table structure for table `Blood_Recipients`
--

CREATE OR REPLACE TABLE `Blood_Recipients` (
  `bloodRecipientID` int(11) NOT NULL,
  `bloodBagID` int(11) NOT NULL,
  `recipientLastName` varchar(55) NOT NULL,
  `recipientFirstName` varchar(55) NOT NULL,
  `bloodComponentTransfused` varchar(15) NOT NULL,
  `recipientBloodGroup` varchar(5) NOT NULL,
  `recipientPhoneNumber` varchar(25) NOT NULL,
  `recipientEmail` varchar(55) NOT NULL,
  `recipientAddress` varchar(155) NOT NULL,
  `recipientDiagnosis` mediumtext DEFAULT NULL,
  `recipientDOB` date NOT NULL,
  `recipientLastTransfusionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Blood_Recipients`
--

INSERT INTO `Blood_Recipients` (`bloodRecipientID`, `bloodBagID`, `recipientLastName`, `recipientFirstName`, `bloodComponentTransfused`, `recipientBloodGroup`, `recipientPhoneNumber`, `recipientEmail`, `recipientAddress`, `recipientDiagnosis`, `recipientDOB`, `recipientLastTransfusionDate`) VALUES
(1, 1, 'Davis', 'Scott', 'Red', 'A-', '7843394510', 'scott.davis@gmail.com', '1123 53rd Pl E Seattle, WA', 'High Blood Pressure', '1984-05-20', '2022-07-08'),
(2, 2, 'Anderson', 'Kelly', 'Plasma', 'O+', '2214683064', 'kelly.anderson@gmail.com', '5412 122nd Road Snohomish, WA', 'None', '1992-10-14', '2022-07-10'),
(3, 3, 'Hernandez', 'Paul', 'White', 'AB-', '5542143694', 'paul.hernandez@gmail.com', '3518 1st Street Lynnwood, WA', 'Diabetes', '1985-09-12', '2022-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `Hospitals`
--

CREATE OR REPLACE TABLE `Hospitals` (
  `hospitalID` int(11) NOT NULL,
  `hospitalName` varchar(155) NOT NULL,
  `hospitalAddress` varchar(155) NOT NULL,
  `hospitalPhoneNumber` varchar(25) NOT NULL,
  `hospitalPrimaryContract` varchar(55) NOT NULL,
  `hospitalLicenseNumber` varchar(25) NOT NULL,
  `bloodRecipientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Hospitals`
--

INSERT INTO `Hospitals` (`hospitalID`, `hospitalName`, `hospitalAddress`, `hospitalPhoneNumber`, `hospitalPrimaryContract`, `hospitalLicenseNumber`, `bloodRecipientID`) VALUES
(1, 'Seattle Hospital', '	32185 Sr 20 # 5 Seattle, WA', '3606759884', 'Johnathan Brown', '4515412', 1),
(2, 'Snohomish Hospital', '	535 Bates St SW Snohomish, WA', '3607544165', 'Jessica Green', '8745215', 2),
(3, 'Everett Hospital', '7531 W 22nd Ave Everett, WA', '2069451941', 'Michael Morar', '1246184', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Hospitals_has_Blood_Banks`
--

CREATE OR REPLACE TABLE `Hospitals_has_Blood_Banks` (
  `hospitalID` int(11) NOT NULL,
  `bloodBankID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Blood_Bags`
--
ALTER TABLE `Blood_Bags`
  ADD PRIMARY KEY (`bloodBagID`,`bloodDonorID`),
  ADD UNIQUE KEY `bloodBagID_UNIQUE` (`bloodBagID`),
  ADD KEY `fk_Blood_Bags_Blood_Donors1_idx` (`bloodDonorID`);

--
-- Indexes for table `Blood_Banks`
--
ALTER TABLE `Blood_Banks`
  ADD PRIMARY KEY (`bloodBankID`,`bloodBagID`),
  ADD UNIQUE KEY `bloodBankID_UNIQUE` (`bloodBankID`),
  ADD KEY `fk_Blood_Banks_Blood_Bags1_idx` (`bloodBagID`);

--
-- Indexes for table `Blood_Banks_has_Blood_Donation_Centers`
--
ALTER TABLE `Blood_Banks_has_Blood_Donation_Centers`
  ADD PRIMARY KEY (`bloodBankID`,`bloodDonationCenterID`),
  ADD KEY `fk_Blood_Banks_has_Blood_Donation_Centers_Blood_Donation_Ce_idx` (`bloodDonationCenterID`),
  ADD KEY `fk_Blood_Banks_has_Blood_Donation_Centers_Blood_Banks1_idx` (`bloodBankID`);

--
-- Indexes for table `Blood_Banks_has_Blood_Donation_Inventories`
--
ALTER TABLE `Blood_Banks_has_Blood_Donation_Inventories`
  ADD PRIMARY KEY (`bloodBankID`,`bloodDonationInventoryID`),
  ADD KEY `fk_Blood_Banks_has_Blood_Donation_Inventories_Blood_Donatio_idx` (`bloodDonationInventoryID`),
  ADD KEY `fk_Blood_Banks_has_Blood_Donation_Inventories_Blood_Banks1_idx` (`bloodBankID`);

--
-- Indexes for table `Blood_Donation_Centers`
--
ALTER TABLE `Blood_Donation_Centers`
  ADD PRIMARY KEY (`bloodDonationCenterID`),
  ADD UNIQUE KEY `donationPhoneNumber_UNIQUE` (`donationPhoneNumber`);

--
-- Indexes for table `Blood_Donation_Inventories`
--
ALTER TABLE `Blood_Donation_Inventories`
  ADD PRIMARY KEY (`bloodDonationInventoryID`,`bloodBagID`,`bloodDonationCenterID`),
  ADD KEY `fk_Blood_Donation_Inventories_Blood_Donation_Centers1_idx` (`bloodDonationCenterID`),
  ADD KEY `fk_Blood_Donation_Inventories_Blood_Bags1_idx` (`bloodBagID`);

--
-- Indexes for table `Blood_Donors`
--
ALTER TABLE `Blood_Donors`
  ADD PRIMARY KEY (`bloodDonorID`),
  ADD UNIQUE KEY `bloodDonorID_UNIQUE` (`bloodDonorID`),
  ADD UNIQUE KEY `donorPhoneNumber_UNIQUE` (`donorPhoneNumber`);

--
-- Indexes for table `Blood_Recipients`
--
ALTER TABLE `Blood_Recipients`
  ADD PRIMARY KEY (`bloodRecipientID`,`bloodBagID`),
  ADD UNIQUE KEY `recipientPhoneNumber_UNIQUE` (`recipientPhoneNumber`),
  ADD UNIQUE KEY `bloodRecipientID_UNIQUE` (`bloodRecipientID`),
  ADD KEY `fk_Blood_Recipients_Blood_Bags1_idx` (`bloodBagID`);

--
-- Indexes for table `Hospitals`
--
ALTER TABLE `Hospitals`
  ADD PRIMARY KEY (`hospitalID`,`bloodRecipientID`),
  ADD UNIQUE KEY `hospitalID_UNIQUE` (`hospitalID`),
  ADD UNIQUE KEY `hospitalPhoneNumber_UNIQUE` (`hospitalPhoneNumber`),
  ADD KEY `fk_Hospitals_Blood_Recipients1_idx` (`bloodRecipientID`);

--
-- Indexes for table `Hospitals_has_Blood_Banks`
--
ALTER TABLE `Hospitals_has_Blood_Banks`
  ADD PRIMARY KEY (`hospitalID`,`bloodBankID`),
  ADD KEY `fk_Hospitals_has_Blood_Banks_Blood_Banks1_idx` (`bloodBankID`),
  ADD KEY `fk_Hospitals_has_Blood_Banks_Hospitals1_idx` (`hospitalID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Blood_Bags`
--
ALTER TABLE `Blood_Bags`
  MODIFY `bloodBagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Blood_Banks`
--
ALTER TABLE `Blood_Banks`
  MODIFY `bloodBankID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Blood_Donation_Centers`
--
ALTER TABLE `Blood_Donation_Centers`
  MODIFY `bloodDonationCenterID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Blood_Donation_Inventories`
--
ALTER TABLE `Blood_Donation_Inventories`
  MODIFY `bloodDonationInventoryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Blood_Donors`
--
ALTER TABLE `Blood_Donors`
  MODIFY `bloodDonorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Blood_Recipients`
--
ALTER TABLE `Blood_Recipients`
  MODIFY `bloodRecipientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Hospitals`
--
ALTER TABLE `Hospitals`
  MODIFY `hospitalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Blood_Bags`
--
ALTER TABLE `Blood_Bags`
  ADD CONSTRAINT `fk_Blood_Bags_Blood_Donors1` FOREIGN KEY (`bloodDonorID`) REFERENCES `Blood_Donors` (`bloodDonorID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Blood_Banks`
--
ALTER TABLE `Blood_Banks`
  ADD CONSTRAINT `fk_Blood_Banks_Blood_Bags1` FOREIGN KEY (`bloodBagID`) REFERENCES `Blood_Bags` (`bloodBagID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Blood_Banks_has_Blood_Donation_Centers`
--
ALTER TABLE `Blood_Banks_has_Blood_Donation_Centers`
  ADD CONSTRAINT `fk_Blood_Banks_has_Blood_Donation_Centers_Blood_Banks1` FOREIGN KEY (`bloodBankID`) REFERENCES `Blood_Banks` (`bloodBankID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Blood_Banks_has_Blood_Donation_Centers_Blood_Donation_Cent1` FOREIGN KEY (`bloodDonationCenterID`) REFERENCES `Blood_Donation_Centers` (`bloodDonationCenterID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Blood_Banks_has_Blood_Donation_Inventories`
--
ALTER TABLE `Blood_Banks_has_Blood_Donation_Inventories`
  ADD CONSTRAINT `fk_Blood_Banks_has_Blood_Donation_Inventories_Blood_Banks1` FOREIGN KEY (`bloodBankID`) REFERENCES `Blood_Banks` (`bloodBankID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Blood_Banks_has_Blood_Donation_Inventories_Blood_Donation_1` FOREIGN KEY (`bloodDonationInventoryID`) REFERENCES `Blood_Donation_Inventories` (`bloodDonationInventoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Blood_Donation_Inventories`
--
ALTER TABLE `Blood_Donation_Inventories`
  ADD CONSTRAINT `fk_Blood_Donation_Inventories_Blood_Bags1` FOREIGN KEY (`bloodBagID`) REFERENCES `Blood_Bags` (`bloodBagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Blood_Donation_Inventories_Blood_Donation_Centers1` FOREIGN KEY (`bloodDonationCenterID`) REFERENCES `Blood_Donation_Centers` (`bloodDonationCenterID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Blood_Recipients`
--
ALTER TABLE `Blood_Recipients`
  ADD CONSTRAINT `fk_Blood_Recipients_Blood_Bags1` FOREIGN KEY (`bloodBagID`) REFERENCES `Blood_Bags` (`bloodBagID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Hospitals`
--
ALTER TABLE `Hospitals`
  ADD CONSTRAINT `fk_Hospitals_Blood_Recipients1` FOREIGN KEY (`bloodRecipientID`) REFERENCES `Blood_Recipients` (`bloodRecipientID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Hospitals_has_Blood_Banks`
--
ALTER TABLE `Hospitals_has_Blood_Banks`
  ADD CONSTRAINT `fk_Hospitals_has_Blood_Banks_Blood_Banks1` FOREIGN KEY (`bloodBankID`) REFERENCES `Blood_Banks` (`bloodBankID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Hospitals_has_Blood_Banks_Hospitals1` FOREIGN KEY (`hospitalID`) REFERENCES `Hospitals` (`hospitalID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Re-Enabling FOREIGN_KEY_CHECKS and AUTOCOMMIT
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
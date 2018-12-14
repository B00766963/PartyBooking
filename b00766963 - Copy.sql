-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2018 at 10:39 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b00766963`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinicepisode`
--

CREATE TABLE `clinicepisode` (
  `clinicEpisodeID` varchar(8) NOT NULL,
  `dateOfEpisode` varchar(8) NOT NULL,
  `episodeCount` int(3) DEFAULT NULL,
  `patientID` varchar(8) NOT NULL,
  `patientDischarged` tinyint(1) DEFAULT NULL,
  `nurseID` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clinicepisode`
--

INSERT INTO `clinicepisode` (`clinicEpisodeID`, `dateOfEpisode`, `episodeCount`, `patientID`, `patientDischarged`, `nurseID`) VALUES
('CE001', '20180901', 1, 'P0001', 0, 'N0003'),
('CE002', '20180901', 1, 'P0002', 0, 'N0012'),
('CE003', '20180902', 1, 'P0003', 0, 'N0008'),
('CE004', '20180903', 4, 'P0004', 0, 'N0005'),
('CE005', '20180904', 1, 'P0005', 0, 'N0007'),
('CE006', '20180905', 2, 'P0005', 0, 'N0011'),
('CE007', '20180906', 1, 'P0006', 0, 'N0004'),
('CE008', '20180907', 1, 'P0008', 1, 'N0009'),
('CE009', '20180908', 1, 'P0009', 0, 'N0010'),
('CE010', '20180920', 2, 'P0001', 1, 'N0005');

-- --------------------------------------------------------

--
-- Table structure for table `nextofkin`
--

CREATE TABLE `nextofkin` (
  `patientID` varchar(8) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `relationship` varchar(30) NOT NULL,
  `address1` varchar(30) DEFAULT NULL,
  `address2` varchar(30) DEFAULT NULL,
  `county` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `telNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nextofkin`
--

INSERT INTO `nextofkin` (`patientID`, `firstName`, `surname`, `relationship`, `address1`, `address2`, `county`, `country`, `telNumber`) VALUES
('P0001', 'Sarah', 'Bergin', 'Mother', '1 Park View', 'Hansfield', 'Dublin 15', 'Ireland', '8863458456'),
('P0002', 'Jannie', 'Jansen', 'Father', '2 Park Heights', 'Hansfield', 'Dublin 15', 'Ireland', '88631234456'),
('P0003', 'Anneke', 'Flax', 'Mother', '3 Park Gardens', 'Finglas', 'Dublin 11', 'Ireland', '8456458456'),
('P0004', 'Bob', 'Black', 'Father', '4 Park Avenue', 'Harare', 'Mashonaland', 'Zimbabwe', '8863458336'),
('P0005', 'Neil', 'Strasberg', 'Guardian', '1Main Street', 'Pretoria', 'Gauteng', 'South Africa', '8863423465'),
('P0006', 'Raith', 'Turunen', 'Mother', '17 Park Crescent', 'Blackrock', 'Co Dublin', 'Ireland', '886334656'),
('P0007', 'Aine', 'Murphy', 'Grandmother', '6 Park Lawns', 'Zurich', '', 'Switzerland', '8863459873'),
('P0008', 'Riley', 'Green', 'Mother', '9 Park Drive', 'Blackpitts', 'Dublin 8', 'Ireland', '88623438456'),
('P0009', 'Martha', 'Oble', 'Mother', '22 Park Meadow', 'Clonee', 'Meath ', 'Ireland', '8875658456'),
('P0010', 'Natalie', 'Holmes', 'Mother', '44 Park Drive', 'Castleknock', 'Dublin 15', 'Ireland', '8895538456');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurseID` varchar(8) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `managerID` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurseID`, `firstName`, `surname`, `gender`, `managerID`) VALUES
('N0003', 'Sue', 'Golding', 'Female', NULL),
('N0004', 'John', 'Hope', 'Male', NULL),
('N0005', 'Mary', 'Fields', 'Female', NULL),
('N0006', 'Gloria', 'Smith', 'Female', NULL),
('N0007', 'Xen', 'Li', 'Male', NULL),
('N0008', 'Fleur', 'Chapman', 'Female', NULL),
('N0009', 'Barry', 'Westman', 'Male', NULL),
('N0010', 'Bobbi', 'Winter', 'Female', 'N0010'),
('N0011', 'Xanthe', 'Robin', 'Female', 'N0011'),
('N0012', 'Walter', 'Green', 'Male', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientID` varchar(8) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `address1` varchar(30) DEFAULT NULL,
  `address2` varchar(30) DEFAULT NULL,
  `county` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `telNumber` varchar(15) DEFAULT NULL,
  `PPS` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientID`, `firstName`, `surname`, `gender`, `DOB`, `address1`, `address2`, `county`, `country`, `telNumber`, `PPS`) VALUES
('P0001', 'Ellie', 'Bergin', 'Female', '2008-09-15', '1 Park View', 'Hansfield', 'Dublin 15', 'Ireland', '8863458456', '0807061V'),
('P0002', 'Floor', 'Jansen', 'Female', '2006-12-12', '2 Park Heights', 'Hansfield', 'Dublin 15', 'Ireland', '88631234456', '0815061X'),
('P0003', 'Annette', 'Flax', 'Female', '2018-01-25', '3 Park Gardens', 'Finglas', 'Dublin 11', 'Ireland', '8456458456', '8207061E'),
('P0004', 'Arnold', 'Black', 'Male', '2010-06-22', '4 Park Avenue', 'Harare', 'Mashonaland', 'Zimbabwe', '8863458336', '8365045B'),
('P0005', 'Mark', 'Strasberg', 'Male', '1999-08-31', '1Main Street', 'Pretoria', 'Gauteng', 'South Africa', '8863423465', '9557061G'),
('P0006', 'Tarja', 'Turunen', 'Female', '2003-04-17', '17 Park Crescent', 'Blackrock', 'Co Dublin', 'Ireland', '886334656', '9378465'),
('P0007', 'Anna', 'Murphy', 'Female', '2017-10-31', '6 Park Lawns', 'Zurich', '', 'Switzerland', '8863459873', '8463061V'),
('P0008', 'Elsianne', 'Green', 'Female', '2009-02-28', '9 Park Drive', 'Blackpitts', 'Dublin 8', 'Ireland', '88623438456', '0807261V'),
('P0009', 'Agnes', 'Oble', 'Female', '2012-08-14', '22 Park Meadow', 'Clonee', 'Meath ', 'Ireland', '8875658456', '2107061B'),
('P0010', 'Nick', 'Holmes', 'Male', '2013-05-09', '44 Park Drive', 'Castleknock', 'Dublin 15', 'Ireland', '8895538456', '0048871Y');

-- --------------------------------------------------------

--
-- Table structure for table `patientsunder8`
--

CREATE TABLE `patientsunder8` (
  `patientID` varchar(8) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `address1` varchar(30) DEFAULT NULL,
  `address2` varchar(30) DEFAULT NULL,
  `county` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `telNumber` varchar(15) DEFAULT NULL,
  `PPS` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientsunder8`
--

INSERT INTO `patientsunder8` (`patientID`, `firstName`, `surname`, `gender`, `DOB`, `address1`, `address2`, `county`, `country`, `telNumber`, `PPS`) VALUES
('P0001', 'Ellie', 'Bergin', 'Female', '2008-09-15', '1 Park View', 'Hansfield', 'Dublin 15', 'Ireland', '8863458456', '0807061V'),
('P0002', 'Floor', 'Jansen', 'Female', '2006-12-12', '2 Park Heights', 'Hansfield', 'Dublin 15', 'Ireland', '88631234456', '0815061X'),
('P0004', 'Arnold', 'Black', 'Male', '2010-06-22', '4 Park Avenue', 'Harare', 'Mashonaland', 'Zimbabwe', '8863458336', '8365045B'),
('P0005', 'Mark', 'Strasberg', 'Male', '1999-08-31', '1Main Street', 'Pretoria', 'Gauteng', 'South Africa', '8863423465', '9557061G'),
('P0006', 'Tarja', 'Turunen', 'Female', '2003-04-17', '17 Park Crescent', 'Blackrock', 'Co Dublin', 'Ireland', '886334656', '9378465'),
('P0008', 'Elsianne', 'Green', 'Female', '2009-02-28', '9 Park Drive', 'Blackpitts', 'Dublin 8', 'Ireland', '88623438456', '0807261V');

-- --------------------------------------------------------

--
-- Table structure for table `patienttreatment`
--

CREATE TABLE `patienttreatment` (
  `patientID` varchar(8) NOT NULL,
  `treatmentID` varchar(8) NOT NULL,
  `location` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patienttreatment`
--

INSERT INTO `patienttreatment` (`patientID`, `treatmentID`, `location`) VALUES
('P0001', 'T0003', 'Dressing Clinic'),
('P0001', 'T0005', 'Dressing Clinic'),
('P0002', 'T0001', 'St Anne\'s Ward'),
('P0003', 'T0010', 'Dressing Clinic'),
('P0004', 'T0007', 'Dressing Clinic'),
('P0005', 'T0003', 'St Anne\'s Ward'),
('P0006', 'T0008', 'St Anne\'s Ward'),
('P0007', 'T0006', 'Emergency Depar'),
('P0008', 'T0004', 'Dressing Clinic'),
('P0008', 'T0005', 'Dressing Clinic');

-- --------------------------------------------------------

--
-- Table structure for table `septweek1rota`
--

CREATE TABLE `septweek1rota` (
  `clinicEpisodeID` varchar(8) NOT NULL,
  `dateOfEpisode` varchar(8) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `managerID` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `septweek1rota`
--

INSERT INTO `septweek1rota` (`clinicEpisodeID`, `dateOfEpisode`, `firstName`, `surname`, `managerID`) VALUES
('CE001', '20180901', 'Sue', 'Golding', NULL),
('CE002', '20180901', 'Walter', 'Green', NULL),
('CE003', '20180902', 'Fleur', 'Chapman', NULL),
('CE004', '20180903', 'Mary', 'Fields', NULL),
('CE005', '20180904', 'Xen', 'Li', NULL),
('CE006', '20180905', 'Xanthe', 'Robin', 'N0011'),
('CE007', '20180906', 'John', 'Hope', NULL),
('CE008', '20180907', 'Barry', 'Westman', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentID` varchar(8) NOT NULL,
  `description` varchar(50) NOT NULL,
  `cost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentID`, `description`, `cost`) VALUES
('T0001', 'Adaptic Touch Dressing', 10.25),
('T0002', 'Flaminal Forte', 8.33),
('T0003', 'Flaminal Hydro', 11.75),
('T0004', 'Mepetil One Dressing', 0.5),
('T0005', 'Duoderm with Allevyn Dressing', 5.1),
('T0006', 'Silver Nitrate', 1.76),
('T0007', 'Mepilex', 2.75),
('T0008', 'Mepore', 7),
('T0009', 'Debridement', 50),
('T0010', 'Activon Tulle', 3.795);

-- --------------------------------------------------------

--
-- Table structure for table `treatmentnurse`
--

CREATE TABLE `treatmentnurse` (
  `nurseID` varchar(8) NOT NULL,
  `treatmentID` varchar(8) NOT NULL,
  `durationHours` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatmentnurse`
--

INSERT INTO `treatmentnurse` (`nurseID`, `treatmentID`, `durationHours`) VALUES
('N0003', 'T0005', 0.5),
('N0003', 'T0009', 0.25),
('N0004', 'T0001', 0.25),
('N0005', 'T0010', 1),
('N0007', 'T0008', 0.75),
('N0008', 'T0003', 0.5),
('N0009', 'T0006', 1),
('N0010', 'T0007', 1.5),
('N0011', 'T0005', 0.5),
('N0012', 'T0002', 0.25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clinicepisode`
--
ALTER TABLE `clinicepisode`
  ADD PRIMARY KEY (`clinicEpisodeID`),
  ADD KEY `ceFK` (`patientID`),
  ADD KEY `cdNurse` (`nurseID`);

--
-- Indexes for table `nextofkin`
--
ALTER TABLE `nextofkin`
  ADD PRIMARY KEY (`patientID`,`firstName`,`surname`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurseID`),
  ADD KEY `fk_CNM` (`managerID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientID`),
  ADD UNIQUE KEY `ak_PPS` (`PPS`);

--
-- Indexes for table `patienttreatment`
--
ALTER TABLE `patienttreatment`
  ADD PRIMARY KEY (`patientID`,`treatmentID`),
  ADD KEY `pkTX2` (`treatmentID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentID`);

--
-- Indexes for table `treatmentnurse`
--
ALTER TABLE `treatmentnurse`
  ADD PRIMARY KEY (`nurseID`,`treatmentID`),
  ADD KEY `txNurse2` (`treatmentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clinicepisode`
--
ALTER TABLE `clinicepisode`
  ADD CONSTRAINT `cdNurse` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`nurseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ceFK` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nextofkin`
--
ALTER TABLE `nextofkin`
  ADD CONSTRAINT `ptFK` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `fk_CNM` FOREIGN KEY (`managerID`) REFERENCES `nurse` (`nurseID`);

--
-- Constraints for table `patienttreatment`
--
ALTER TABLE `patienttreatment`
  ADD CONSTRAINT `pkTX1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pkTX2` FOREIGN KEY (`treatmentID`) REFERENCES `treatment` (`treatmentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `treatmentnurse`
--
ALTER TABLE `treatmentnurse`
  ADD CONSTRAINT `txNurse1` FOREIGN KEY (`nurseID`) REFERENCES `nurse` (`nurseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `txNurse2` FOREIGN KEY (`treatmentID`) REFERENCES `treatment` (`treatmentID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

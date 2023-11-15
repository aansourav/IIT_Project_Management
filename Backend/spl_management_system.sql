-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 06:37 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spl_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `name`) VALUES
(1, 'admin', 'admin', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `committee_members`
--

CREATE TABLE `committee_members` (
  `member_id` int(11) NOT NULL,
  `tcr_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `committee_members`
--

INSERT INTO `committee_members` (`member_id`, `tcr_id`, `role`, `room_id`) VALUES
(15, 1, 2, 30),
(16, 2, 1, 30),
(37, 2, 1, 42),
(38, 3, 2, 42),
(39, 6, 2, 42),
(40, 7, 2, 42);

-- --------------------------------------------------------

--
-- Table structure for table `committee_posts`
--

CREATE TABLE `committee_posts` (
  `post_id` int(11) NOT NULL,
  `post_by` int(11) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `room_id` int(11) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `committee_room`
--

CREATE TABLE `committee_room` (
  `room_id` int(11) NOT NULL,
  `batch` int(11) NOT NULL,
  `course_type` int(11) NOT NULL,
  `members` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `batch` int(11) NOT NULL,
  `course_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `batch`, `course_type`) VALUES
(42, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roll` varchar(100) NOT NULL,
  `batch` int(11) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `roll`, `batch`, `password`) VALUES
(1, 'Rahat Uddin Azad', 'ASH1825022M', 13, 'rahat'),
(2, 'Abdullah An-Noor', 'ASH1825001M', 13, 'noor');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `tcr_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`tcr_id`, `username`, `password`, `name`, `email`, `designation`, `active`) VALUES
(1, 'fm001', 'fm001_001', 'Dr. Mohammad Salim Hossain', '', 'Professor', 0),
(2, 'fm002', 'fm002_002', 'Md. Nuruzzaman Bhuiyan', '', 'Assistant Professor', 1),
(3, 'fm003', 'fm003_003', 'Md. Auhidur Rahaman', '', 'Assistant Professor', 1),
(4, 'fm004', 'fm004_004', 'Dipanita Saha', '', 'Assistant Professor', 1),
(5, 'fm005', 'fm005_005', 'Falguni Roy', '', 'Assistant Professor', 0),
(6, 'fm006', 'fm006_006', 'Dipok Chandra Das', '', 'Assistant Professor', 1),
(7, 'fm007', 'fm007_007', 'Md. Iftekharul Alam Efat', '', 'Assistant Professor', 1),
(8, 'fm008', 'fm008_008', 'Tasniya Ahmed', '', 'Assistant Professor', 1),
(9, 'fm009', 'fm009_009', 'Md. Eusha Kadir', '', 'Lecturer', 1),
(10, 'fm010', 'fm010_010', 'Tasnim Rahman', '', 'Lecturer', 0),
(11, 'fm011', 'fm011_011', 'Nazmun Nahar', '', 'Lecturer', 1),
(12, 'fm012', 'fm012_012', 'Rafid Mostafiz', '', 'Lecturer', 1),
(13, 'fm013', 'fm013_013', 'Md Hasan Imam', '', 'Lecturer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `supervisor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `room_id`, `team_name`, `supervisor_id`) VALUES
(380, 42, 'Team_01', 4),
(381, 42, 'Team_02', 2),
(382, 42, 'Team_03', 8),
(383, 42, 'Team_04', 12),
(384, 42, 'Team_05', 11),
(385, 42, 'Team_06', 6),
(386, 42, 'Team_07', 9),
(387, 42, 'Team_08', 7),
(388, 42, 'Team_09', 3);

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `team_members_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `roll` varchar(100) NOT NULL,
  `cgpa` varchar(100) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`team_members_id`, `team_id`, `name`, `roll`, `cgpa`, `batch`) VALUES
(732, 362, 'Nishat Tasnim Tamanna', 'BKH1825006F', '3.75', 13),
(733, 362, 'Md. Al jaber', 'ASH1825029M', '3', 13),
(734, 362, 'Md. Faysal Ahmed', 'ASH1825015M', '3.25', 13),
(735, 363, 'Tahrim Kabir', 'BFH1825013F', '3.25', 13),
(736, 363, 'Shuvra Aditya', 'ASH1825009M', '4', 13),
(737, 363, 'Foyzul Karim Pathan', 'ASH1825033M', '2.95', 13),
(738, 364, 'Mahfujur Rahman', 'ASH1825024M', '3.25', 13),
(739, 364, 'Al Shahriar Priyo', 'ASH1825020M', '3.75', 13),
(740, 364, 'Khair Ahmed', 'ASH1825036M', '2.25', 13),
(741, 365, 'Md. Kamruzzaman', 'ASH1825035M', '4', 13),
(742, 365, 'Rahat Uddin Azad', 'ASH1825022M', '4', 13),
(743, 365, 'Md. Abrar Hossain Asif', 'ASH1825005M', '4', 13),
(744, 366, 'Akash Chandra Deb Nath', 'ASH1825037M', '4', 13),
(745, 366, 'Nowal Benta Basher', 'BFH1825041F', '4', 13),
(746, 366, 'Md. Mahbub Alam', 'ASH1825003M', '3.5', 13),
(747, 367, 'Nadim Bhuiyan', 'ASH1825034M', '4', 13),
(748, 367, 'Emran Hossain', 'ASH1825002M', '3.75', 13),
(749, 367, 'Saifur Rahman', 'ASH1825031M', '4', 13),
(750, 368, 'Md. Maynuddin', 'ASH1825007M', '2.75', 13),
(751, 368, 'Moonmoon Das', 'BKH1825027F', '4', 13),
(752, 368, 'Shuvo Islam', 'ASH1825032M', '3', 13),
(753, 369, 'Abdullah An Noor', 'ASH1825001M', '3.75', 13),
(754, 369, 'Md. Azad Hossain', 'ASH1825014M', '3', 13),
(755, 369, 'Fazle Rabbi', 'ASH1825004M', '3.75', 13),
(756, 370, 'Anwar Kabir Sajib', 'ASH1825038M', '3.25', 13),
(757, 370, 'Md. Al Adnan', 'ASH1825008M', '3.75', 13),
(758, 370, 'Muin Uddin', 'ASH1825012M', '4', 13),
(759, 371, 'Saifur Rahman', 'ASH1825031M', '4', 13),
(760, 371, 'Al Shahriar Priyo', 'ASH1825020M', '3.75', 13),
(761, 371, 'Nadim Bhuiyan', 'ASH1825034M', '4', 13),
(762, 372, 'Emran Hossain', 'ASH1825002M', '3.75', 13),
(763, 372, 'Foyzul Karim Pathan', 'ASH1825033M', '2.95', 13),
(764, 372, 'Nowal Benta Basher', 'BFH1825041F', '4', 13),
(765, 373, 'Khair Ahmed', 'ASH1825036M', '2.25', 13),
(766, 373, 'Muin Uddin', 'ASH1825012M', '4', 13),
(767, 373, 'Md. Kamruzzaman', 'ASH1825035M', '4', 13),
(768, 374, 'Md. Azad Hossain', 'ASH1825014M', '3', 13),
(769, 374, 'Md. Faysal Ahmed', 'ASH1825015M', '3.25', 13),
(770, 374, 'Md. Al jaber', 'ASH1825029M', '3', 13),
(771, 375, 'Shuvo Islam', 'ASH1825032M', '3', 13),
(772, 375, 'Md. Mahbub Alam', 'ASH1825003M', '3.5', 13),
(773, 375, 'Md. Maynuddin', 'ASH1825007M', '2.75', 13),
(774, 376, 'Anwar Kabir Sajib', 'ASH1825038M', '3.25', 13),
(775, 376, 'Shuvra Aditya', 'ASH1825009M', '4', 13),
(776, 376, 'Akash Chandra Deb Nath', 'ASH1825037M', '4', 13),
(777, 377, 'Rahat Uddin Azad', 'ASH1825022M', '4', 13),
(778, 377, 'Mahfujur Rahman', 'ASH1825024M', '3.25', 13),
(779, 377, 'Moonmoon Das', 'BKH1825027F', '4', 13),
(780, 378, 'Nishat Tasnim Tamanna', 'BKH1825006F', '3.75', 13),
(781, 378, 'Md. Al Adnan', 'ASH1825008M', '3.75', 13),
(782, 378, 'Md. Abrar Hossain Asif', 'ASH1825005M', '4', 13),
(783, 379, 'Abdullah An Noor', 'ASH1825001M', '3.75', 13),
(784, 379, 'Tahrim Kabir', 'BFH1825013F', '3.25', 13),
(785, 379, 'Fazle Rabbi', 'ASH1825004M', '3.75', 13),
(786, 380, 'Tahrim Kabir', 'BFH1825013F', '3.25', 13),
(787, 380, 'Nishat Tasnim Tamanna', 'BKH1825006F', '3.75', 13),
(788, 380, 'Md. Faysal Ahmed', 'ASH1825015M', '3.25', 13),
(789, 381, 'Md. Azad Hossain', 'ASH1825014M', '3', 13),
(790, 381, 'Shuvra Aditya', 'ASH1825009M', '4', 13),
(791, 381, 'Md. Maynuddin', 'ASH1825007M', '2.75', 13),
(792, 382, 'Md. Abrar Hossain Asif', 'ASH1825005M', '4', 13),
(793, 382, 'Nowal Benta Basher', 'BFH1825041F', '4', 13),
(794, 382, 'Md. Kamruzzaman', 'ASH1825035M', '4', 13),
(795, 383, 'Moonmoon Das', 'BKH1825027F', '4', 13),
(796, 383, 'Foyzul Karim Pathan', 'ASH1825033M', '2.95', 13),
(797, 383, 'Khair Ahmed', 'ASH1825036M', '2.25', 13),
(798, 384, 'Muin Uddin', 'ASH1825012M', '4', 13),
(799, 384, 'Al Shahriar Priyo', 'ASH1825020M', '3.75', 13),
(800, 384, 'Akash Chandra Deb Nath', 'ASH1825037M', '4', 13),
(801, 385, 'Abdullah An Noor', 'ASH1825001M', '3.75', 13),
(802, 385, 'Saifur Rahman', 'ASH1825031M', '4', 13),
(803, 385, 'Md. Mahbub Alam', 'ASH1825003M', '3.5', 13),
(804, 386, 'Fazle Rabbi', 'ASH1825004M', '3.75', 13),
(805, 386, 'Shuvo Islam', 'ASH1825032M', '3', 13),
(806, 386, 'Md. Al Adnan', 'ASH1825008M', '3.75', 13),
(807, 387, 'Rahat Uddin Azad', 'ASH1825022M', '4', 13),
(808, 387, 'Emran Hossain', 'ASH1825002M', '3.75', 13),
(809, 387, 'Anwar Kabir Sajib', 'ASH1825038M', '3.25', 13),
(810, 388, 'Mahfujur Rahman', 'ASH1825024M', '3.25', 13),
(811, 388, 'Md. Al jaber', 'ASH1825029M', '3', 13),
(812, 388, 'Nadim Bhuiyan', 'ASH1825034M', '4', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `committee_members`
--
ALTER TABLE `committee_members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `committee_posts`
--
ALTER TABLE `committee_posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `committee_room`
--
ALTER TABLE `committee_room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`tcr_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`team_members_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `committee_members`
--
ALTER TABLE `committee_members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `committee_posts`
--
ALTER TABLE `committee_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `committee_room`
--
ALTER TABLE `committee_room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `tcr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `team_members_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=813;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

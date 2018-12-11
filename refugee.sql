-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 11, 2018 at 10:36 AM
-- Server version: 10.0.36-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `python`
--

-- --------------------------------------------------------

--
-- Table structure for table `refugee`
--

CREATE TABLE `refugee` (
  `name` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(100) NOT NULL,
  `weight` double NOT NULL,
  `height` double NOT NULL,
  `color` varchar(100) NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refugee`
--

INSERT INTO `refugee` (`name`, `country`, `dob`, `gender`, `weight`, `height`, `color`, `id`) VALUES
('Keenan Snowball', 'China', '0000-00-00', 'Male', 43, 48, '#574541', 237),
('Lee Anneslie', 'Egypt', '0000-00-00', 'male', 8, 70, '#7fa701', 238),
('Wenonah Mileham', 'Indonesia', '0000-00-00', 'male', 7, 29, '#4456d4', 239),
('Tull Giffard', 'Myanmar', '0000-00-00', 'Male', 23, 76, '#bf4134', 240),
('Orsola Plessing', 'Sweden', '0000-00-00', 'male', 67, 43, '#ce1a51', 241),
('Gauthier Joan', 'China', '0000-00-00', 'Male', 52, 19, '#d72217', 242),
('Claudette Saura', 'Palestinian Territory', '0000-00-00', 'male', 89, 9, '#eafb4c', 243),
('Leontyne Slyford', 'Poland', '0000-00-00', 'male', 83, 32, '#77ffa8', 244),
('Sanford Durtnal', 'Turkmenistan', '0000-00-00', 'Male', 68, 46, '#50abea', 245),
('Nessi Capaldo', 'Russia', '0000-00-00', 'Female', 84, 85, '#586f0d', 246),
('Ian Cranmere', 'Colombia', '0000-00-00', 'Male', 58, 41, '#a3b01b', 247),
('Broderic Drust', 'Brazil', '0000-00-00', 'Male', 32, 44, '#9c17a3', 248),
('Robers Hrinchenko', 'Greece', '0000-00-00', 'Male', 22, 20, '#35ec07', 249),
('Allie Hankinson', 'China', '0000-00-00', 'Female', 65, 69, '#edbf8a', 250),
('Wang Maryan', 'Greece', '0000-00-00', 'Male', 90, 35, '#231974', 251),
('Martha Dossantos', 'Poland', '0000-00-00', 'Female', 15, 11, '#ac864c', 252),
('Enid Avrasin', 'Russia', '0000-00-00', 'male', 9, 14, '#8e9ab4', 253),
('Maurie MacNaughton', 'France', '0000-00-00', 'Male', 86, 34, '#36bff4', 254),
('Sigismondo Brodie', 'China', '0000-00-00', 'Male', 91, 59, '#9c1b00', 255),
('Enrico Illem', 'Costa Rica', '0000-00-00', 'Male', 31, 57, '#d2a344', 256),
('Willetta Gooding', 'Indonesia', '0000-00-00', 'Female', 68, 11, '#bf69f2', 257),
('Dosi Davie', 'South Africa', '0000-00-00', 'Female', 33, 16, '#959a88', 258),
('Jessie Castellanos', 'Indonesia', '0000-00-00', 'Male', 53, 23, '#a66086', 259),
('Pammy Desson', 'Canada', '0000-00-00', 'Female', 67, 86, '#8bf179', 260),
('Hyacintha Clinkard', 'Tanzania', '0000-00-00', 'Female', 84, 52, '#1b8d69', 261),
('Ailsun Leverage', 'Indonesia', '0000-00-00', 'Female', 29, 56, '#053c4f', 262),
('Austin Sinnie', 'Czech Republic', '0000-00-00', 'Male', 87, 52, '#d06e5a', 263),
('Amye Ridgers', 'China', '0000-00-00', 'Female', 87, 44, '#bac73c', 264),
('Mahala Willey', 'Brazil', '0000-00-00', 'Female', 3, 34, '#d9802d', 265),
('Veronika Buff', 'Brazil', '0000-00-00', 'Female', 30, 41, '#2cd0fd', 266),
('Griffith Moretto', 'Democratic Republic of the Congo', '0000-00-00', 'Male', 22, 82, '#04e984', 267),
('Valenka Garnsworth', 'Russia', '0000-00-00', 'Female', 96, 47, '#35162d', 268),
('Winny Chong', 'Syria', '0000-00-00', 'Male', 92, 3, '#e75c37', 269),
('Benedicto Jacqueme', 'Japan', '0000-00-00', 'Male', 73, 45, '#3a239c', 270),
('Cally Woollin', 'China', '0000-00-00', 'Female', 31, 75, '#d1fad6', 271),
('Gwynne Groarty', 'Brazil', '0000-00-00', 'Female', 90, 15, '#290e53', 272),
('Shurlocke Northeast', 'Macedonia', '0000-00-00', 'Male', 31, 26, '#e283d6', 273),
('Pincas Bussel', 'Indonesia', '0000-00-00', 'Male', 50, 17, '#bc7c6b', 274),
('Adah Broadberrie', 'Cyprus', '0000-00-00', 'Female', 57, 7, '#8c6e9c', 275),
('Dun Juggins', 'Poland', '0000-00-00', 'Male', 50, 1, '#185db7', 276),
('Lazar Gyles', 'Greece', '0000-00-00', 'Male', 59, 75, '#16e267', 277),
('Lenci Hills', 'Brazil', '0000-00-00', 'Male', 25, 55, '#4e180a', 278),
('Lisette Hrinishin', 'Czech Republic', '0000-00-00', 'Female', 24, 60, '#c2c892', 279),
('Tanner Barette', 'United Kingdom', '0000-00-00', 'Male', 20, 16, '#6a9980', 280),
('Lotta Durran', 'Sweden', '0000-00-00', 'Female', 32, 5, '#6decdf', 281),
('Storm Sucre', 'Albania', '0000-00-00', 'Female', 22, 4, '#23f000', 282),
('Eddie Gauvin', 'China', '0000-00-00', 'Female', 46, 59, '#9270aa', 283),
('Jenilee Howsego', 'Philippines', '0000-00-00', 'Female', 78, 64, '#c55e0a', 284),
('Sigrid Maryet', 'Indonesia', '0000-00-00', 'Female', 14, 26, '#0a9aa9', 285),
('Bartel Brotherhood', 'Brazil', '0000-00-00', 'Male', 85, 7, '#4bbe8c', 286),
('Marina Adlington', 'China', '0000-00-00', 'Female', 18, 99, '#3ba8d0', 287),
('Gaylene Matyugin', 'Argentina', '0000-00-00', 'Female', 90, 92, '#b14cde', 288),
('Sallyann Habergham', 'Russia', '0000-00-00', 'Female', 4, 34, '#bcfef3', 289),
('Sigismond Arenson', 'Philippines', '0000-00-00', 'Male', 44, 72, '#3d0cf7', 290),
('Camilla Bwye', 'Poland', '0000-00-00', 'Female', 66, 27, '#7931e3', 291),
('Mindy Bullivant', 'Serbia', '0000-00-00', 'Female', 52, 62, '#e5dea5', 292),
('Clemmy Carruth', 'Sweden', '0000-00-00', 'Female', 34, 36, '#0fd452', 293),
('Elli Jellman', 'Brazil', '0000-00-00', 'Female', 41, 31, '#51099e', 294),
('Pepe Ricket', 'Argentina', '0000-00-00', 'Male', 62, 65, '#c4d774', 295),
('Kayle Gregoraci', 'France', '0000-00-00', 'Female', 57, 54, '#1a10b2', 296),
('Boniface Gilby', 'Indonesia', '0000-00-00', 'Male', 12, 32, '#54e6e2', 297),
('Marielle Gibling', 'Germany', '0000-00-00', 'Female', 54, 56, '#f4158d', 298),
('Dallis Foukx', 'Cameroon', '0000-00-00', 'Male', 24, 14, '#4eaa09', 299),
('Sydelle Zelley', 'Poland', '0000-00-00', 'Female', 50, 98, '#b01a54', 300),
('Annabella Izakov', 'Ukraine', '0000-00-00', 'Female', 75, 60, '#891b1d', 301),
('Jonie Schirok', 'China', '0000-00-00', 'Female', 65, 91, '#758522', 302),
('Darya Strickland', 'Portugal', '0000-00-00', 'Female', 49, 68, '#b7a22a', 303),
('Nikoletta Coye', 'China', '0000-00-00', 'Female', 98, 83, '#22a839', 304),
('Codi Crinion', 'Indonesia', '0000-00-00', 'Male', 25, 17, '#6a693e', 305),
('Charmian Derham', 'Russia', '0000-00-00', 'Female', 48, 58, '#ef75c2', 306),
('Vikki Rubertis', 'China', '0000-00-00', 'Female', 63, 32, '#43020e', 307),
('Killian Povall', 'Philippines', '0000-00-00', 'Male', 76, 66, '#3af87a', 308),
('Danya Campbell', 'Sweden', '0000-00-00', 'Male', 1, 11, '#db5d7e', 309),
('Rayna Harg', 'Indonesia', '0000-00-00', 'Female', 87, 63, '#afc647', 310),
('Regina Syplus', 'Poland', '0000-00-00', 'Female', 17, 57, '#021ac6', 311),
('Bale MacKissack', 'Indonesia', '0000-00-00', 'Male', 26, 59, '#9f7747', 312),
('Rodger Cockett', 'Peru', '0000-00-00', 'Male', 4, 86, '#22bb14', 313),
('Johnathon Welbrock', 'Finland', '0000-00-00', 'Male', 69, 12, '#4ff1e0', 314),
('Marshal Reinert', 'Indonesia', '0000-00-00', 'Male', 98, 97, '#bae1d8', 315),
('Martin Carbine', 'Vietnam', '0000-00-00', 'Male', 67, 49, '#94e031', 316),
('Tobye Drinkeld', 'Brazil', '0000-00-00', 'Female', 80, 62, '#97b0c0', 317),
('La verne Raitie', 'Philippines', '0000-00-00', 'Female', 97, 74, '#1df825', 318),
('Nickolai Flett', 'Philippines', '0000-00-00', 'Male', 89, 93, '#b841e6', 319),
('Rockie Thorowgood', 'Japan', '0000-00-00', 'Male', 9, 75, '#e38d18', 320),
('Marven Flag', 'Poland', '0000-00-00', 'Male', 41, 22, '#75c184', 321),
('Belia Dalglish', 'China', '0000-00-00', 'Female', 73, 31, '#4d2276', 322),
('Rayna Tummasutti', 'Peru', '0000-00-00', 'Female', 4, 72, '#e68c80', 323),
('Brittany Aslum', 'Indonesia', '0000-00-00', 'Female', 84, 67, '#9cb963', 324),
('Gates Jedrachowicz', 'Mongolia', '0000-00-00', 'Female', 34, 2, '#25546b', 325),
('Edd Sapwell', 'Costa Rica', '0000-00-00', 'Male', 84, 53, '#9f2962', 326),
('Malina Kingett', 'China', '0000-00-00', 'Female', 87, 88, '#c79375', 327),
('Tonye Muldrew', 'Morocco', '0000-00-00', 'Female', 85, 14, '#a4b88f', 328),
('Fiann Danielczyk', 'Russia', '0000-00-00', 'Female', 37, 87, '#036dbc', 329),
('Brocky Blankhorn', 'China', '0000-00-00', 'Male', 66, 83, '#1d876b', 330),
('miller', 'algeria', '0000-00-00', 'male', 56, 2, '#442020', 331),
('tom', 'angola', '1995-11-06', 'male', 73, 1, '#291616', 332),
('james', 'UK', '2000-03-06', 'male', 46.7, 1.1, '#7f3737', 333);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `refugee`
--
ALTER TABLE `refugee`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `refugee`
--
ALTER TABLE `refugee`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 10, 2021 lúc 06:17 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `movie`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `avgstar` (IN `movieId` INT)  NO SQL
SELECT movies.id as id, movies.id as movieId, AVG(star.star) as star FROM star JOIN movies ON star.movieId = movies.id WHERE movieId = movieId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findMovieByUserLike` (IN `userId` INT(11))  NO SQL
SELECT * FROM movies JOIN likes ON movies.id = likes.movieId JOIN users ON likes.userId = users.id WHERE users.id = userId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findmovienew` ()  NO SQL
SELECT * FROM movies ORDER BY movies.dateAired DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insss` ()  NO SQL
SELECT * FROM users$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `categoryName`) VALUES
(1, 'Thể loại'),
(2, 'Quốc gia'),
(3, 'Phim mới'),
(13, 'Phim cũ'),
(14, 'Phim mới 2021');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categoryitem`
--

CREATE TABLE `categoryitem` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `categoryName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categoryitem`
--

INSERT INTO `categoryitem` (`id`, `categoryId`, `categoryName`, `url`) VALUES
(1, 1, 'Phim hành động', 'phim-hanh-dong'),
(2, 1, 'Phim hài', 'phim-hai'),
(3, 1, 'Phim võ thuật', 'phim-vo-thuat'),
(5, 2, 'Phim Trung Quốc', 'phim-trung-quoc'),
(9, 2, 'Phim Việt Nam', 'phim-viet-nam'),
(10, 13, 'Phim cũ', 'phim-cu'),
(12, 14, 'Phim chiếu rạp', 'phim-chieu-rap');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categoryitemmovie`
--

CREATE TABLE `categoryitemmovie` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `movieId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categoryitemmovie`
--

INSERT INTO `categoryitemmovie` (`id`, `categoryId`, `movieId`) VALUES
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 5, 6),
(10, 5, 10),
(11, 5, 11),
(14, 5, 14),
(16, 5, 16),
(17, 2, 6),
(44, 1, 28),
(45, 2, 28),
(46, 5, 28),
(47, 1, 29),
(56, 2, 30),
(57, 9, 30),
(63, 1, 32),
(64, 5, 32),
(66, 1, 33),
(67, 5, 33),
(71, 1, 1),
(72, 2, 1),
(74, 1, 7),
(75, 2, 7),
(76, 12, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `movieId` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `dateComment` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `userId`, `movieId`, `content`, `dateComment`) VALUES
(12, 10001, 3, ' hello', '2021-07-25 15:28:44'),
(13, 10001, 3, ' ádfsadfsafsaf', '2021-07-25 15:40:00'),
(14, 10000, 3, ' xem cc', '2021-07-25 15:40:28'),
(15, 10000, 3, ' f', '2021-07-25 15:41:06'),
(16, 10000, 31, ' hello', '2021-07-26 09:26:11'),
(17, 10001, 6, ' hello', '2021-07-26 19:07:43'),
(18, 10001, 6, ' rrrrrr', '2021-07-26 19:07:56'),
(19, 10001, 6, ' ewwerwre', '2021-07-26 19:08:07'),
(20, 10000, 31, ' xem', '2021-07-28 22:12:02'),
(21, 10001, 5, ' hello', '2021-07-28 22:20:35'),
(22, 10001, 30, ' hello', '2021-08-04 19:22:59'),
(23, 10001, 30, ' helloff', '2021-08-04 19:23:05'),
(24, 10001, 30, ' fdfdf', '2021-08-04 19:23:09'),
(25, 10000, 6, ' a', '2021-08-08 09:56:57'),
(26, 10000, 5, ' eeeeeeeeeeeeeee', '2021-08-08 10:15:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `movieId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `likes`
--

INSERT INTO `likes` (`id`, `userId`, `movieId`) VALUES
(2, 10000, 3),
(3, 10000, 28),
(4, 10001, 28),
(7, 10001, 4),
(8, 10000, 31),
(9, 10001, 6),
(12, 10000, 30),
(13, 10001, 1),
(15, 10001, 30),
(16, 10008, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `moviedetail`
--

CREATE TABLE `moviedetail` (
  `id` int(11) NOT NULL,
  `movieId` int(11) DEFAULT NULL,
  `episode` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `moviedetail`
--

INSERT INTO `moviedetail` (`id`, `movieId`, `episode`, `url`) VALUES
(1, 6, 1, 'https://www.youtube.com/watch?v=9WHeltwTSwI&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&ab_channel=WeTVV'),
(2, 6, 2, 'https://www.youtube.com/watch?v=2cGiXe1Mx5w&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=2&ab_channel=WeTVVietnam'),
(3, 6, 3, 'https://www.youtube.com/watch?v=EAUQZKlQb_g&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=3&ab_channel=WeTVVietnam'),
(4, 6, 4, 'https://www.youtube.com/watch?v=EAUQZKlQb_g&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=3&ab_channel=WeTVVietnam'),
(5, 6, 5, 'https://www.youtube.com/watch?v=DJ9-QPGd2Y4&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=5&ab_channel=WeTVVietnam'),
(6, 6, 6, 'https://www.youtube.com/watch?v=MWfxZ3dNldg&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=6&ab_channel=WeTVVietnam'),
(7, 6, 7, 'https://www.youtube.com/watch?v=oTkjY1_Z-UE&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=7&ab_channel=WeTVVietnam'),
(8, 6, 8, 'https://www.youtube.com/watch?v=Qr5t-nxXbXg&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=8&ab_channel=WeTVVietnam'),
(9, 6, 9, 'https://www.youtube.com/watch?v=x6u6fj-9vG4&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=9&ab_channel=WeTVVietnam'),
(10, 6, 10, 'https://www.youtube.com/watch?v=DuLwanbssGw&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=10&ab_channel=WeTVVietnam'),
(11, 6, 11, 'https://www.youtube.com/watch?v=KmRwFmOQChI&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=11&ab_channel=WeTVVietnam'),
(12, 6, 12, 'https://www.youtube.com/watch?v=KBNNyVE6ZDo&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=12&ab_channel=WeTVVietnam'),
(13, 6, 13, 'https://www.youtube.com/watch?v=IvOOlPJgaYY&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=13&ab_channel=WeTVVietnam'),
(14, 6, 14, 'https://www.youtube.com/watch?v=4QG_6YoTYtk&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=14&ab_channel=WeTVVietnam'),
(15, 6, 15, 'https://www.youtube.com/watch?v=Jy9fp5T6RG0&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=15&ab_channel=WeTVVietnam'),
(16, 6, 16, 'https://www.youtube.com/watch?v=8OPdv857Qz8&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=16&ab_channel=WeTVVietnam'),
(17, 6, 17, 'https://www.youtube.com/watch?v=cU4BbQEdzbs&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=17&ab_channel=WeTVVietnam'),
(18, 6, 18, 'https://www.youtube.com/watch?v=-B_V14xOHsg&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=18&ab_channel=WeTVVietnam'),
(19, 6, 19, 'https://www.youtube.com/watch?v=4NBNOg5rc40&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=19&ab_channel=WeTVVietnam'),
(20, 6, 20, 'https://www.youtube.com/watch?v=Wh5KXhIqYMg&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&index=20&ab_channel=WeTVVietnam'),
(21, 6, 21, 'https://www.youtube.com/watch?v=9WHeltwTSwI&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&ab_channel=WeTVV'),
(22, 6, 22, 'https://www.youtube.com/watch?v=9WHeltwTSwI&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&ab_channel=WeTVV'),
(23, 6, 23, 'https://www.youtube.com/watch?v=9WHeltwTSwI&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&ab_channel=WeTVV'),
(24, 6, 24, 'https://www.youtube.com/watch?v=9WHeltwTSwI&list=PL4qw_ACnAQqBpBay-oiT-ZE7W3cQgsRCf&ab_channel=WeTVV'),
(25, 3, 1, 'https://www.youtube.com/watch?v=nW948Va-l10&ab_channel=MarvelEntertainment\r\n\r\n'),
(28, 28, 1, 'https://www.youtube.com/watch?v=0tQzKegvtj4&ab_channel=%C4%91%E1%BA%B7ngph%C3%BAtv'),
(29, 29, 1, 'https://www.youtube.com/watch?v=bnTwm9GQYPs&ab_channel=UniMovie'),
(50, 30, 1, 'https://www.youtube.com/watch?v=NKMZH817pto&list=PLEyKu1JwbU4sBaR3zBSrP7H6jcOeseltI&index=24&ab_channel=FAPTV'),
(51, 30, 2, 'https://www.youtube.com/watch?v=ewdJKS_4kkg&list=PLEyKu1JwbU4sBaR3zBSrP7H6jcOeseltI&index=23&ab_channel=FAPTV'),
(52, 30, 3, 'https://www.youtube.com/watch?v=I_ue3KU-TeQ&list=PLEyKu1JwbU4sBaR3zBSrP7H6jcOeseltI&index=22&ab_channel=FAPTV'),
(53, 30, 4, 'https://www.youtube.com/watch?v=NUl74k5YeK8&list=PLEyKu1JwbU4sBaR3zBSrP7H6jcOeseltI&index=21&ab_channel=FAPTV'),
(54, 30, 5, 'https://www.youtube.com/watch?v=6g325_467b4&list=PLEyKu1JwbU4sBaR3zBSrP7H6jcOeseltI&index=20&ab_channel=FAPTV');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `descreption` text DEFAULT NULL,
  `duration` int(10) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `dateAired` date DEFAULT NULL,
  `quality` varchar(20) DEFAULT NULL,
  `createBy` varchar(50) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `actor` text DEFAULT NULL,
  `vip` bit(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `movies`
--

INSERT INTO `movies` (`id`, `name`, `thumbnail`, `banner`, `views`, `descreption`, `duration`, `active`, `dateAired`, `quality`, `createBy`, `createDate`, `actor`, `vip`, `price`) VALUES
(1, 'Kỵ sĩ công lý 1111', 'bi-kip-luyen-rong-2-2014.jpg', '1.jpg', 176234, '<p>Bộ phim xoay quanh c&acirc;u chuyện về người qu&acirc;n nh&acirc;n t&ecirc;n Markus, mới vừa anh anh vẫn c&ograve;n nằm trong lực lượng triển khai qu&acirc;n đội giờ phải gấp r&uacute;t trở về nh&agrave; với đứa con g&aacute;i y&ecirc;u của m&igrave;nh l&agrave; Mathilde. Bởi v&igrave; vợ anh vừa mới qua đời trong một vụ tai nạn t&agrave;u hỏa thảm khốc. Thoạt nh&igrave;n vụ tai nạn chỉ l&agrave; tr&ugrave;ng hợp sự xui xẻo to lớn xảy đến m&agrave; th&ocirc;i, nhưng thật chất đ&acirc;y lại l&agrave; &acirc;m mưu được chuẩn bị cẩn thận từ trước v&agrave; vợ anh ch&iacute;nh l&agrave; nạn nh&acirc;n xấu số ngẫu nhi&ecirc;n c&oacute; mặt tr&ecirc;n chuyến t&agrave;u. Điều n&agrave;y chỉ được phơi b&agrave;y m&atilde;i cho đến khi một người đam m&ecirc; to&aacute;n học đồng thời l&agrave; h&agrave;nh kh&aacute;ch tr&ecirc;n t&agrave;u c&ugrave;ng đồng nghiệp của anh ta bất ngờ xuất hiện.</p>\r\n', 135, b'1', '2021-05-10', '1', 'admin', '2021-07-07', 'Lindh, Roland Møller, Albert Rudbeck Lindhardt, Anne Birgitte Lind', b'00000000000', 0),
(2, 'The Flash Season 7 (2021)', 'https://filmyhotspot.com/wp-content/uploads/2020/11/8d06b116-fbe0-4e27-8754-3dd91a6f9d95.jpg', 'https://i.pinimg.com/originals/7c/67/ad/7c67adc405d7d36b63bd25aebe53174b.jpg', 313, 'Khi một thử nghiệm để cứu tốc độ của Barry bị đảo ngược, Nash Wells tìm kiếm cách để cứu The Flash và đưa ra một kế hoạch nguy hiểm và Iris thực hiện một nhận thức đáng kinh ngạc bên trong Mirrorverse...\r\n\r\n', 45, b'1', '2021-07-07', '1', 'admin', '2021-07-11', 'Grant Gustin, Candice Patton, Danielle', b'00000000000', 0),
(3, 'Loki Season 1 (2021)', '3.jpg', '3.jpg', 42347, '<p>Anh ch&agrave;ng &quot;nam thần&quot; Loki (Tom Hiddleston) vốn lu&ocirc;n l&agrave; một nh&acirc;n vật được y&ecirc;u th&iacute;ch của Marvel v&igrave; sự tinh qu&aacute;i, vừa gian xảo vừa đ&aacute;ng y&ecirc;u với người anh trai Thor. Giờ đ&acirc;y, Loki sẽ ch&iacute;nh thức được &quot;t&aacute;c oai t&aacute;c qu&aacute;i&quot; với series của ri&ecirc;ng m&igrave;nh, k&eacute;o d&agrave;i 6 tập phim v&agrave; ra mắt tr&ecirc;n hệ thống Disney+, đang khiến kh&aacute;n giả cả thế giới chờ đợi. Tuy nhi&ecirc;n trước khi thưởng thức Loki, h&atilde;y &quot;khắc cốt ghi t&acirc;m&quot; những điều dưới đ&acirc;y để c&oacute; thể thưởng thức bộ phim &quot;mượt&quot; nhất c&oacute; thể nh&eacute;!</p>\r\n\r\n<p><img alt=\"\" src=\"http://images.vkool.tv/vkoolsnap/upload/movies/ATuezG6.jpg\" style=\"height:359px; width:640px\" /></p>\r\n\r\n<p><img alt=\"\" src=\"http://images.vkool.tv/vkoolsnap/upload/movies/dgVof5h.jpg\" /></p>\r\n', 45, b'1', '2021-05-10', '1', 'admin', '2021-07-04', 'Di Martino, Richard E. Grant, Jon Levine, Aaron Beelner', b'00000000000', 0),
(4, 'Voice 4: Judgment Hour (2021)', '4.jpg', '4.png', 92677, 'Âm Thanh Tội Phạm 4 (Voice 4) bộ phim hành động, phá án do đạo diễn Shin Yong Hwi cầm trịch, trải qua 3 phần phim đã gặt hái nhiều thành công nhất định cũng nhờ nội dung phim hay, lôi cuốn. Phim xoay quanh cuộc sống cũng như hành trình phá án hồi hộp và gây cấn của những cảnh sát thuộc Trung tâm cuộc gọi khẩn cấp.\r\n\r\n', 45, b'1', '2021-04-20', '14', 'admin', '2021-07-05', 'Lee Hana, Eun-seo Son, Lee Jin-Wook, Kim Woo-Seok, Seung-mok Yoo, Jang Hyuk, Jong-woon Kim, Sung-Hyu', b'00000000000', 0),
(5, 'Hawaii Five-0 Season 6 (2015)', '5.jpg', '5.jpeg', 65422, '<p>Bộ Phim Biệt Đội Hawaii 6 - Hawaii Five-0 (Season 6) n&oacute;i về nh&acirc;n vật Steve McGarrett trở về nh&agrave; để t&igrave;m ra kẻ giết cha m&igrave;nh. Thống đốc cung cho anh cơ hội để chỉ huy lực lượng đặc nhiệm của ri&ecirc;ng m&igrave;nh (Five-0). Đội Steve được tham gia bởi Chin Ho Kelly, Danny &quot;Danno&quot; Williams, v&agrave; Kono Kalakaua.</p>\r\n', 120, b'1', '2021-07-05', '25', 'admin', '2021-07-12', 'Kurtzman Orci Paper Products, 101st Street Productions, CBS Productions', b'00000000001', 20000),
(6, 'Trần Thiên Thiên trong lời đồn', 'test1.jpg', 'test.jpg', 12344, '<p>Chuyển thể từ tiểu thuyết &quot;Tam c&ocirc;ng ch&uacute;a trong lời đồn&quot;. Nội dung phim n&oacute;i về nữ bi&ecirc;n kịch Trần Tiểu Thi&ecirc;n (Triệu Lộ Tư diễn) sau khi xuy&ecirc;n kh&ocirc;ng đ&atilde; trở th&agrave;nh Tam c&ocirc;ng ch&uacute;a của nữ quốc Đ&ocirc;ng Lương. C&aacute;i danh c&ocirc;ng ch&uacute;a trong lời đồn n&agrave;y cũng kh&ocirc;ng được l&yacute; tưởng cho lắm, n&agrave;ng v&ocirc; c&ugrave;ng đanh đ&aacute; hơn nữa v&ocirc; c&ugrave;ng cậy mạnh, mặc d&ugrave; tướng mạo xinh đẹp ngọt ng&agrave;o, nhưng lại bị d&acirc;n ch&uacute;ng v&ocirc; c&ugrave;ng căm gh&eacute;t. Nữ bi&ecirc;n kịch Trần Tiểu Thi&ecirc;n kh&ocirc;ng biết động n&atilde;o, xuy&ecirc;n v&agrave;o th&acirc;n thể c&ocirc; c&ocirc;ng ch&uacute;a Trần Thi&ecirc;n Thi&ecirc;n, kh&ocirc;ng biết sẽ g&acirc;y ra c&acirc;u chuyện dở kh&oacute;c dở cười thế n&agrave;o. Ngo&agrave;i ra c&ograve;n c&oacute; thế tử H&agrave;n Thước (Đinh Vũ Hề diễn), th&acirc;n l&agrave; thế tử của Bắc Hạ, hắn v&igrave; muốn thậu t&oacute;m nữ quốc Đ&ocirc;ng Lương m&agrave; kh&ocirc;ng ngại tới đ&acirc;y l&agrave;m một t&ecirc;n t&ugrave; nh&acirc;n. Sớm chiều chung đụng c&ugrave;ng Trần Thi&ecirc;n Thi&ecirc;n, cuối c&ugrave;ng H&agrave;n Thước bu&ocirc;ng bỏ &yacute; định tấn c&ocirc;ng nữ quốc. Một c&acirc;u truyện trước ngược sau sủng, trước b&aacute;n nước mắt sau rải cẩu lương như thế m&agrave; bắt đầu..</p>\r\n', 45, b'1', '2021-07-04', '24', 'admin', NULL, 'Triệu Lộ Tư, Đinh Vũ Hề, Chu Tử Hâm, Mạnh Anh Hào, Quyền Bái Luân, Trần Danh Hào', b'00000000001', 100000),
(7, 'Phim test 2', 'test1.jpg', 'test.jpg', 12322, '<p>Chuyển thể từ tiểu thuyết &quot;Tam c&ocirc;ng ch&uacute;a trong lời đồn&quot;. Nội dung phim n&oacute;i về nữ bi&ecirc;n kịch Trần Tiểu Thi&ecirc;n (Triệu Lộ Tư diễn) sau khi xuy&ecirc;n kh&ocirc;ng đ&atilde; trở th&agrave;nh Tam c&ocirc;ng ch&uacute;a của nữ quốc Đ&ocirc;ng Lương. C&aacute;i danh c&ocirc;ng ch&uacute;a trong lời đồn n&agrave;y cũng kh&ocirc;ng được l&yacute; tưởng cho lắm, n&agrave;ng v&ocirc; c&ugrave;ng đanh đ&aacute; hơn nữa v&ocirc; c&ugrave;ng cậy mạnh, mặc d&ugrave; tướng mạo xinh đẹp ngọt ng&agrave;o, nhưng lại bị d&acirc;n ch&uacute;ng v&ocirc; c&ugrave;ng căm gh&eacute;t. Nữ bi&ecirc;n kịch Trần Tiểu Thi&ecirc;n kh&ocirc;ng biết động n&atilde;o, xuy&ecirc;n v&agrave;o th&acirc;n thể c&ocirc; c&ocirc;ng ch&uacute;a Trần Thi&ecirc;n Thi&ecirc;n, kh&ocirc;ng biết sẽ g&acirc;y ra c&acirc;u chuyện dở kh&oacute;c dở cười thế n&agrave;o. Ngo&agrave;i ra c&ograve;n c&oacute; thế tử H&agrave;n Thước (Đinh Vũ Hề diễn), th&acirc;n l&agrave; thế tử của Bắc Hạ, hắn v&igrave; muốn thậu t&oacute;m nữ quốc Đ&ocirc;ng Lương m&agrave; kh&ocirc;ng ngại tới đ&acirc;y l&agrave;m một t&ecirc;n t&ugrave; nh&acirc;n. Sớm chiều chung đụng c&ugrave;ng Trần Thi&ecirc;n Thi&ecirc;n, cuối c&ugrave;ng H&agrave;n Thước bu&ocirc;ng bỏ &yacute; định tấn c&ocirc;ng nữ quốc. Một c&acirc;u truyện trước ngược sau sủng, trước b&aacute;n nước mắt sau rải cẩu lương như thế m&agrave; bắt đầu..</p>\r\n', 45, b'1', '2021-07-04', '24', 'admin', '2021-07-12', 'Triệu Lộ Tư, Đinh Vũ Hề, Chu Tử Hâm, Mạnh Anh Hào, Quyền Bái Luân, Trần Danh Hào', b'00000000000', 0),
(10, 'Phim test 5', 'test1.jpg', 'test.jpg', 12322, 'Chuyển thể từ tiểu thuyết \"Tam công chúa trong lời đồn\". Nội dung phim nói về nữ biên kịch Trần Tiểu Thiên (Triệu Lộ Tư diễn) sau khi xuyên không đã trở thành Tam công chúa của nữ quốc Đông Lương. Cái danh công chúa trong lời đồn này cũng không được lý tưởng cho lắm, nàng vô cùng đanh đá hơn nữa vô cùng cậy mạnh, mặc dù tướng mạo xinh đẹp ngọt ngào, nhưng lại bị dân chúng vô cùng căm ghét. Nữ biên kịch Trần Tiểu Thiên không biết động não, xuyên vào thân thể cô công chúa Trần Thiên Thiên, không biết sẽ gây ra câu chuyện dở khóc dở cười thế nào. Ngoài ra còn có thế tử Hàn Thước (Đinh Vũ Hề diễn), thân là thế tử của Bắc Hạ, hắn vì muốn thậu tóm nữ quốc Đông Lương mà không ngại tới đây làm một tên tù nhân. Sớm chiều chung đụng cùng Trần Thiên Thiên, cuối cùng Hàn Thước buông bỏ ý định tấn công nữ quốc. Một câu truyện trước ngược sau sủng, trước bán nước mắt sau rải cẩu lương như thế mà bắt đầu..\r\n\r\n', 45, b'1', '2021-07-04', '24', 'admin', '2021-07-12', 'Triệu Lộ Tư, Đinh Vũ Hề, Chu Tử Hâm, Mạnh Anh Hào, Quyền Bái Luân, Trần Danh Hào', b'00000000000', 0),
(11, 'Phim test 6', 'bi-kip-luyen-rong-2-2014.jpg', 'test.jpg', 12321, '<p>Chuyển thể từ tiểu thuyết &quot;Tam c&ocirc;ng ch&uacute;a trong lời đồn&quot;. Nội dung phim n&oacute;i về nữ bi&ecirc;n kịch Trần Tiểu Thi&ecirc;n (Triệu Lộ Tư diễn) sau khi xuy&ecirc;n kh&ocirc;ng đ&atilde; trở th&agrave;nh Tam c&ocirc;ng ch&uacute;a của nữ quốc Đ&ocirc;ng Lương. C&aacute;i danh c&ocirc;ng ch&uacute;a trong lời đồn n&agrave;y cũng kh&ocirc;ng được l&yacute; tưởng cho lắm, n&agrave;ng v&ocirc; c&ugrave;ng đanh đ&aacute; hơn nữa v&ocirc; c&ugrave;ng cậy mạnh, mặc d&ugrave; tướng mạo xinh đẹp ngọt ng&agrave;o, nhưng lại bị d&acirc;n ch&uacute;ng v&ocirc; c&ugrave;ng căm gh&eacute;t. Nữ bi&ecirc;n kịch Trần Tiểu Thi&ecirc;n kh&ocirc;ng biết động n&atilde;o, xuy&ecirc;n v&agrave;o th&acirc;n thể c&ocirc; c&ocirc;ng ch&uacute;a Trần Thi&ecirc;n Thi&ecirc;n, kh&ocirc;ng biết sẽ g&acirc;y ra c&acirc;u chuyện dở kh&oacute;c dở cười thế n&agrave;o. Ngo&agrave;i ra c&ograve;n c&oacute; thế tử H&agrave;n Thước (Đinh Vũ Hề diễn), th&acirc;n l&agrave; thế tử của Bắc Hạ, hắn v&igrave; muốn thậu t&oacute;m nữ quốc Đ&ocirc;ng Lương m&agrave; kh&ocirc;ng ngại tới đ&acirc;y l&agrave;m một t&ecirc;n t&ugrave; nh&acirc;n. Sớm chiều chung đụng c&ugrave;ng Trần Thi&ecirc;n Thi&ecirc;n, cuối c&ugrave;ng H&agrave;n Thước bu&ocirc;ng bỏ &yacute; định tấn c&ocirc;ng nữ quốc. Một c&acirc;u truyện trước ngược sau sủng, trước b&aacute;n nước mắt sau rải cẩu lương như thế m&agrave; bắt đầu..</p>\r\n', 45, b'1', '2021-07-04', '24', 'admin', '2021-07-12', 'Triệu Lộ Tư, Đinh Vũ Hề, Chu Tử Hâm, Mạnh Anh Hào, Quyền Bái Luân, Trần Danh Hào', b'00000000000', 0),
(13, 'Phim test 8', 'test1.jpg', 'test.jpg', 12321, 'Chuyển thể từ tiểu thuyết \"Tam công chúa trong lời đồn\". Nội dung phim nói về nữ biên kịch Trần Tiểu Thiên (Triệu Lộ Tư diễn) sau khi xuyên không đã trở thành Tam công chúa của nữ quốc Đông Lương. Cái danh công chúa trong lời đồn này cũng không được lý tưởng cho lắm, nàng vô cùng đanh đá hơn nữa vô cùng cậy mạnh, mặc dù tướng mạo xinh đẹp ngọt ngào, nhưng lại bị dân chúng vô cùng căm ghét. Nữ biên kịch Trần Tiểu Thiên không biết động não, xuyên vào thân thể cô công chúa Trần Thiên Thiên, không biết sẽ gây ra câu chuyện dở khóc dở cười thế nào. Ngoài ra còn có thế tử Hàn Thước (Đinh Vũ Hề diễn), thân là thế tử của Bắc Hạ, hắn vì muốn thậu tóm nữ quốc Đông Lương mà không ngại tới đây làm một tên tù nhân. Sớm chiều chung đụng cùng Trần Thiên Thiên, cuối cùng Hàn Thước buông bỏ ý định tấn công nữ quốc. Một câu truyện trước ngược sau sủng, trước bán nước mắt sau rải cẩu lương như thế mà bắt đầu..\r\n\r\n', 45, b'1', '2021-07-04', '24', 'admin', '2021-07-12', 'Triệu Lộ Tư, Đinh Vũ Hề, Chu Tử Hâm, Mạnh Anh Hào, Quyền Bái Luân, Trần Danh Hào', b'00000000000', 0),
(14, 'Phim test 9', 'test1.jpg', 'test.jpg', 12322, 'Chuyển thể từ tiểu thuyết \"Tam công chúa trong lời đồn\". Nội dung phim nói về nữ biên kịch Trần Tiểu Thiên (Triệu Lộ Tư diễn) sau khi xuyên không đã trở thành Tam công chúa của nữ quốc Đông Lương. Cái danh công chúa trong lời đồn này cũng không được lý tưởng cho lắm, nàng vô cùng đanh đá hơn nữa vô cùng cậy mạnh, mặc dù tướng mạo xinh đẹp ngọt ngào, nhưng lại bị dân chúng vô cùng căm ghét. Nữ biên kịch Trần Tiểu Thiên không biết động não, xuyên vào thân thể cô công chúa Trần Thiên Thiên, không biết sẽ gây ra câu chuyện dở khóc dở cười thế nào. Ngoài ra còn có thế tử Hàn Thước (Đinh Vũ Hề diễn), thân là thế tử của Bắc Hạ, hắn vì muốn thậu tóm nữ quốc Đông Lương mà không ngại tới đây làm một tên tù nhân. Sớm chiều chung đụng cùng Trần Thiên Thiên, cuối cùng Hàn Thước buông bỏ ý định tấn công nữ quốc. Một câu truyện trước ngược sau sủng, trước bán nước mắt sau rải cẩu lương như thế mà bắt đầu..\r\n\r\n', 45, b'1', '2021-07-04', '24', 'admin', '2021-07-12', 'Triệu Lộ Tư, Đinh Vũ Hề, Chu Tử Hâm, Mạnh Anh Hào, Quyền Bái Luân, Trần Danh Hào', b'00000000000', 0),
(16, 'Phim test 11', 'test1.jpg', 'test.jpg', 12321, 'Chuyển thể từ tiểu thuyết \"Tam công chúa trong lời đồn\". Nội dung phim nói về nữ biên kịch Trần Tiểu Thiên (Triệu Lộ Tư diễn) sau khi xuyên không đã trở thành Tam công chúa của nữ quốc Đông Lương. Cái danh công chúa trong lời đồn này cũng không được lý tưởng cho lắm, nàng vô cùng đanh đá hơn nữa vô cùng cậy mạnh, mặc dù tướng mạo xinh đẹp ngọt ngào, nhưng lại bị dân chúng vô cùng căm ghét. Nữ biên kịch Trần Tiểu Thiên không biết động não, xuyên vào thân thể cô công chúa Trần Thiên Thiên, không biết sẽ gây ra câu chuyện dở khóc dở cười thế nào. Ngoài ra còn có thế tử Hàn Thước (Đinh Vũ Hề diễn), thân là thế tử của Bắc Hạ, hắn vì muốn thậu tóm nữ quốc Đông Lương mà không ngại tới đây làm một tên tù nhân. Sớm chiều chung đụng cùng Trần Thiên Thiên, cuối cùng Hàn Thước buông bỏ ý định tấn công nữ quốc. Một câu truyện trước ngược sau sủng, trước bán nước mắt sau rải cẩu lương như thế mà bắt đầu..\r\n\r\n', 45, b'1', '2021-07-04', '24', 'admin', '2021-07-12', 'Triệu Lộ Tư, Đinh Vũ Hề, Chu Tử Hâm, Mạnh Anh Hào, Quyền Bái Luân, Trần Danh Hào', b'00000000000', 0),
(28, 'Tây hành kỉ', 'http://images.vkool.tv/fposter/thumb/movies/BSW0dgv.jpg', 'http://images.vkool.tv/vkoolsnap/upload/movies/vQCBnAs.jpg', 4, 'Tây Hành Kỷ: Tạm Biệt Ngộ Không VietSub, Tây Hành Kỷ: Tạm Biệt Ngộ Không Thuyết Minh, Tây Hành Kỷ: Tạm Biệt Ngộ Không Bản Đẹp, Phụ đề Tây Hành Kỷ: Tạm Biệt Ngộ Không Goodbye Monkey King VietSub, Goodbye Monkey King Thuyết Minh, Goodbye Monkey King Bản Đẹp, Phụ Đề Goodbye Monkey King Tây Hành Kỷ: Tạm Biệt Ngộ Không v1vn, Tây Hành Kỷ: Tạm Biệt Ngộ Không phim3s, Tây Hành Kỷ: Tạm Biệt Ngộ Không phim47, Tây Hành Kỷ: Tạm Biệt Ngộ Không hdonline, Tây Hành Kỷ: Tạm Biệt Ngộ Không phimmoi, Tây Hành Kỷ: Tạm Biệt Ngộ Không phimbathu, Tây Hành Kỷ: Tạm Biệt Ngộ Không phimhayso, Tây Hành Kỷ: Tạm Biệt Ngộ Không phim7, Tây Hành Kỷ: Tạm Biệt Ngộ Không mphim, Tây Hành Kỷ: Tạm Biệt Ngộ Không phimhd, Tây Hành Kỷ: Tạm Biệt Ngộ Không phimnhanh, Tây Hành Kỷ: Tạm Biệt Ngộ Không phimf, Tây Hành Kỷ: Tạm Biệt Ngộ Không phimvang, Tây Hành Kỷ: Tạm Biệt Ngộ Không kst, Tây Hành Kỷ: Tạm Biệt Ngộ Không kites, Tây Hành Kỷ: Tạm Biệt Ngộ Không phim4d, Tây Hành Kỷ: Tạm Biệt Ngộ Không phim4g, Tây Hành Kỷ: Tạm Biệt Ngộ Không vuaphim, Tây Hành Kỷ: Tạm Biệt Ngộ Không hayghe, Tây Hành Kỷ: Tạm Biệt Ngộ Không topphim, Tây Hành Kỷ: Tạm Biệt Ngộ Không phim88, Tây Hành Kỷ: Tạm Biệt Ngộ Không xuongphim, Goodbye Monkey King DVDRIP, Goodbye Monkey King 720p BluRay x264 Tây Hành Kỷ: Tạm Biệt Ngộ Không Tập 1, Tây Hành Kỷ: Tạm Biệt Ngộ Không Tập 2, Tây Hành Kỷ: Tạm Biệt Ngộ Không Tập 3, Tây Hành Kỷ: Tạm Biệt Ngộ Không Tập 4, Tây Hành Kỷ: Tạm Biệt Ngộ Không Tập 5,Goodbye Monkey King Episode 1, Goodbye Monkey King Episode 2, Goodbye Monkey King Episode 3, Goodbye Monkey King Episode 4, Goodbye Monkey King Episode 5,', 120, b'1', '2021-02-03', '1', 'admin', '2021-07-24', 'Đang cập nhật', b'00000000000', 0),
(29, 'Kẻ lập dị', 'http://images.vkool.tv/fposter/thumb/thumbs2.imagebam.com/b6/36/05/1490d51287718504.jpg', 'http://adharalo.com/wp-content/uploads/2018/09/Crank-2006-poster.jpg', 1, ' Chev Chelios (Jason Statham) là sát thủ chuyên nghiệp của một băng đảng xã hội đen ở Los Angeles. Sau nhiều năm tung hoành trên giang hồ, một ngày nọ gã quyết định rửa tay gác kiếm để sống một cuộc đời khác với cô bạn gái Eve (Amy Smart). Ông trùm Carlito (Carlos Sanz) chấp nhận quyết định của Chev, nhưng bắt gã phải thực hiện nhiệm vụ cuối cùng: giết kẻ cầm đầu tổ chức mafia người Trung Quốc trong thành phố. Nhưng Chev đã không làm được điều đó. Một buổi sáng, Chev nhận được một đĩa DVD qua đường bưu phẩm. Bật đĩa lên, gã nhìn thấy cảnh Verona Jose (Pablo Cantillo), một chiến hữu trong băng đảng, dùng kim tiêm đâm vào cổ tay gã - lúc đó đang mê mệt do bị lừa uống thuốc ngủ. Dung dịch trong kim tiêm là một thứ được giới xã hội đen gọi là cocktail Trung Quốc. Độc dược này có thể giết người trong nháy mắt, nhưng sẽ không gây tác hại gì nếu trong máu có nhiều adrenaline. Muốn tăng nồng độ adrenaline, người bị tiêm phải liên tục vận động mạnh hoặc dùng chất kích thích. Nếu ngừng hoạt động, lượng adrenaline giảm và cocktail Trung Quốc sẽ gây co thắt tim dẫn đến tử vong. Kể từ hôm đó, Chev luôn phải nghĩ ra cách để được vận động ở cường độ cao. Hết lái xe lạng lách, rượt đuổi, đánh nhau, cướp trực thăng, gã lại la hét trên đường phố và giật đồ, trêu chọc người đi đường để được... chạy. Không tìm thấy Verona, Chev càng trở nên điên loạn. Để Verona phải lộ mặt, Chev bèn cho anh trai của tên này, cũng là một nhân vật cộm cán trong thế giới ngầm, về thế giới bên kia bằng mấy phát đạn. Tiếp đó, gã tiếp tục bắn giết với các tay súng của các băng nhóm mafia khác trong thành phố, gây thù kết oán khắp nơi.', 88, b'1', '2021-02-03', '1', 'admin', '2021-07-24', 'Jason Statham, Amy Smart, Carlos Sanz', b'00000000000', 0),
(30, 'Tầng lớp sinh viên', 'https://scontent-hkg4-1.xx.fbcdn.net/v/t1.6435-9/125373707_2877597502482986_8729799839597645134_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=730e14&_nc_ohc=iKC4DnJEtB4AX8o8Q6j&_nc_ht=scontent-hkg4-1.xx&oh=cefcce515729681097eb0af8eb888303&oe=6121F110', 'https://scontent-hkg4-1.xx.fbcdn.net/v/t1.6435-9/125237868_2875250992717637_4612713208190187396_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=e3f864&_nc_ohc=HfSOBediW1MAX9SX6XS&_nc_ht=scontent-hkg4-1.xx&oh=369684827fbadd19229f992d68491e28&oe=61232C45', 8, ' Chev Chelios (Jason Statham) là sát thủ chuyên nghiệp của một băng đảng xã hội đen ở Los Angeles. Sau nhiều năm tung hoành trên giang hồ, một ngày nọ gã quyết định rửa tay gác kiếm để sống một cuộc đời khác với cô bạn gái Eve (Amy Smart). Ông trùm Carlito (Carlos Sanz) chấp nhận quyết định của Chev, nhưng bắt gã phải thực hiện nhiệm vụ cuối cùng: giết kẻ cầm đầu tổ chức mafia người Trung Quốc trong thành phố. Nhưng Chev đã không làm được điều đó. Một buổi sáng, Chev nhận được một đĩa DVD qua đường bưu phẩm. Bật đĩa lên, gã nhìn thấy cảnh Verona Jose (Pablo Cantillo), một chiến hữu trong băng đảng, dùng kim tiêm đâm vào cổ tay gã - lúc đó đang mê mệt do bị lừa uống thuốc ngủ. Dung dịch trong kim tiêm là một thứ được giới xã hội đen gọi là cocktail Trung Quốc. Độc dược này có thể giết người trong nháy mắt, nhưng sẽ không gây tác hại gì nếu trong máu có nhiều adrenaline. Muốn tăng nồng độ adrenaline, người bị tiêm phải liên tục vận động mạnh hoặc dùng chất kích thích. Nếu ngừng hoạt động, lượng adrenaline giảm và cocktail Trung Quốc sẽ gây co thắt tim dẫn đến tử vong. Kể từ hôm đó, Chev luôn phải nghĩ ra cách để được vận động ở cường độ cao. Hết lái xe lạng lách, rượt đuổi, đánh nhau, cướp trực thăng, gã lại la hét trên đường phố và giật đồ, trêu chọc người đi đường để được... chạy. Không tìm thấy Verona, Chev càng trở nên điên loạn. Để Verona phải lộ mặt, Chev bèn cho anh trai của tên này, cũng là một nhân vật cộm cán trong thế giới ngầm, về thế giới bên kia bằng mấy phát đạn. Tiếp đó, gã tiếp tục bắn giết với các tay súng của các băng nhóm mafia khác trong thành phố, gây thù kết oán khắp nơi.', 24, b'1', '2021-02-03', '24', 'admin', '2021-07-24', 'O.S.T by TTeam  - Long Cao Director: Thanh Da Beo Executive Producer: Trần Đức Viễn Line Producer: Trần Long', b'00000000000', 0),
(31, 'Peter Rabbit 2: The Runaway (2021)', 'bi-kip-luyen-rong-2-2014.jpg', 'dwadragons_banner_wfni.jpg', 3, '<p>Trong phần tiếp theo của Thỏ Peter, những kẻ lừa đảo đ&aacute;ng y&ecirc;u đ&atilde; trở lại. Bea, Thomas v&agrave; những con thỏ đ&atilde; tạo ra một gia đ&igrave;nh tạm thời, nhưng mặc d&ugrave; đ&atilde; cố gắng hết sức, Peter dường như kh&ocirc;ng thể l&agrave;m suy chuyển những &quot;th&agrave;nh t&iacute;ch&quot; nghịch ngợm tinh qu&aacute;i của cậu. Quyết định mở rộng cuộc phi&ecirc;u lưu ra khỏi khu vườn, Peter t&igrave;m thấy ch&iacute;nh m&igrave;nh ở nơi m&agrave; bản chất thật của cậu được tr&acirc;n trọng. Nhưng rồi gia đ&igrave;nh cậu nhất quyết đ&aacute;nh đổi bằng mọi gi&aacute; để t&igrave;m cậu về. Peter buộc phải t&igrave;m ra lối đi cho ri&ecirc;ng m&igrave;nh v&agrave; trở th&agrave;nh một người m&agrave; cậu lu&ocirc;n mong muốn.</p>\r\n\r\n<p><img alt=\"\" src=\"http://images.vkool.tv/vkoolsnap/upload/movies/43MHo4o.png\" style=\"height:264px; width:640px\" /><img alt=\"\" src=\"http://images.vkool.tv/vkoolsnap/upload/movies/xoapffH.png\" /></p>\r\n', 123132, b'1', '2021-07-20', '123', 'admin', '2021-07-26', 'Rose Byrne, Domhnall Gleeson, David Oyelowo, James Corden, Colin Moody, Margot Robbie, Elizabeth Debicki, Aimee Horne, Lennie James', b'00000000000', 0),
(32, 'qưeqwe', 'bi-kip-luyen-rong-2-2014.jpg', 'dwadragons_banner_wfni.jpg', 1, '<p>4123423423423</p>\r\n', 123, b'1', '2021-07-26', '132', 'admin', '2021-07-26', '12414134', b'00000000000', 0),
(33, 'phim test 12', 'bi-kip-luyen-rong-2-2014.jpg', 'dwadragons_banner_wfni.jpg', 1, '', 123, b'1', '2021-07-06', '123', 'admin', '2021-07-26', '12132312123132312', b'00000000000', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `movieId` int(11) DEFAULT NULL,
  `stt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `movieId`, `stt`) VALUES
(2, 30, 4),
(4, 28, 7),
(5, 4, 6),
(9, 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `star`
--

CREATE TABLE `star` (
  `id` int(11) NOT NULL,
  `movieId` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `star`
--

INSERT INTO `star` (`id`, `movieId`, `star`) VALUES
(1, 6, 4),
(2, 6, 5),
(3, 30, 4),
(4, 30, 5),
(5, 30, 2),
(6, 30, 3),
(7, 30, 4),
(8, 30, 3),
(9, 30, 3),
(10, 30, 3),
(11, 30, 4),
(12, 30, 5),
(13, 30, 2),
(14, 30, 3),
(15, 30, 4),
(16, 30, 5),
(17, 30, 1),
(18, 30, 2),
(19, 30, 3),
(20, 30, 4),
(21, 30, 4),
(22, 30, 4),
(23, 30, 4),
(24, 30, 5),
(25, 30, 5),
(26, 30, 5),
(27, 30, 5),
(28, 30, 5),
(29, 30, 5),
(30, 30, 5),
(31, 30, 5),
(32, 30, 5),
(33, 30, 5),
(34, 30, 5),
(35, 30, 5),
(36, 30, 5),
(37, 30, 5),
(38, 30, 5),
(39, 30, 5),
(40, 30, 5),
(41, 30, 5),
(42, 30, 5),
(43, 30, 5),
(44, 30, 5),
(45, 30, 5),
(46, 30, 4),
(47, 30, 5),
(48, 30, 5),
(49, 30, 5),
(50, 30, 3),
(51, 30, 4),
(52, 30, 5),
(53, 30, 5),
(54, 30, 5),
(55, 30, 5),
(56, 30, 5),
(57, 30, 5),
(58, 30, 5),
(59, 30, 5),
(60, 30, 5),
(61, 30, 5),
(62, 6, 4),
(63, 3, 4),
(64, 6, 5),
(65, 28, 2),
(66, 28, 5),
(67, 4, 5),
(68, 5, 4),
(69, 5, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `usermovie`
--

CREATE TABLE `usermovie` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `movieId` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `buyDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `usermovie`
--

INSERT INTO `usermovie` (`id`, `userId`, `movieId`, `price`, `buyDate`) VALUES
(5, 10001, 6, 100000, '2021-08-07'),
(6, 10000, 5, 20000, '2021-08-07'),
(7, 10009, 6, 100000, '2021-08-09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `role` bit(1) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `surplus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `password`, `email`, `fullname`, `avatar`, `role`, `active`, `surplus`) VALUES
(10000, '1', 'admin', 'admin', NULL, b'1', b'1', 345513300),
(10001, '1', 'user', 'Nguyễn Đức Thành', NULL, b'0', b'1', 9800000),
(10002, '123', 'vjpvai141@gmail.com', 'thanh', '', b'0', b'0', 0),
(10005, '123', 'vjpvai14@gmail.com', 'Nguyen Duc Thanh', '', b'0', b'0', 0),
(10008, '43242', 'ducthanh260801@gmail.com', 'Thành Đức', '', b'0', b'1', 0),
(10009, '43242', 'thanhndph12794@fpt.edu.vn', 'Nguyễn Đức Thành PH‌1‌2794', '', b'0', b'1', 9900000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categoryitem`
--
ALTER TABLE `categoryitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Chỉ mục cho bảng `categoryitemmovie`
--
ALTER TABLE `categoryitemmovie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieId` (`movieId`),
  ADD KEY `categoryitemmovie_ibfk_1` (`categoryId`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `movieId` (`movieId`);

--
-- Chỉ mục cho bảng `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `movieId` (`movieId`);

--
-- Chỉ mục cho bảng `moviedetail`
--
ALTER TABLE `moviedetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieId` (`movieId`);

--
-- Chỉ mục cho bảng `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieId` (`movieId`);

--
-- Chỉ mục cho bảng `star`
--
ALTER TABLE `star`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieId` (`movieId`);

--
-- Chỉ mục cho bảng `usermovie`
--
ALTER TABLE `usermovie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `movieId` (`movieId`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `categoryitem`
--
ALTER TABLE `categoryitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `categoryitemmovie`
--
ALTER TABLE `categoryitemmovie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `moviedetail`
--
ALTER TABLE `moviedetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT cho bảng `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `star`
--
ALTER TABLE `star`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `usermovie`
--
ALTER TABLE `usermovie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10010;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categoryitem`
--
ALTER TABLE `categoryitem`
  ADD CONSTRAINT `categoryitem_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `categoryitemmovie`
--
ALTER TABLE `categoryitemmovie`
  ADD CONSTRAINT `categoryitemmovie_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categoryitem` (`id`),
  ADD CONSTRAINT `categoryitemmovie_ibfk_2` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);

--
-- Các ràng buộc cho bảng `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);

--
-- Các ràng buộc cho bảng `moviedetail`
--
ALTER TABLE `moviedetail`
  ADD CONSTRAINT `moviedetail_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);

--
-- Các ràng buộc cho bảng `slider`
--
ALTER TABLE `slider`
  ADD CONSTRAINT `slider_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);

--
-- Các ràng buộc cho bảng `star`
--
ALTER TABLE `star`
  ADD CONSTRAINT `star_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);

--
-- Các ràng buộc cho bảng `usermovie`
--
ALTER TABLE `usermovie`
  ADD CONSTRAINT `usermovie_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `usermovie_ibfk_2` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

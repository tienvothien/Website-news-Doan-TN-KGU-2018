-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 14, 2018 lúc 03:39 PM
-- Phiên bản máy phục vụ: 10.1.29-MariaDB
-- Phiên bản PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `newsdoan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bantin`
--

CREATE TABLE `bantin` (
  `idtin` int(11) NOT NULL,
  `tieude` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `avata` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `trichdan` text COLLATE utf8_unicode_ci NOT NULL,
  `maloaitin` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `idtk` int(11) NOT NULL,
  `ngaydang` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucvu`
--

CREATE TABLE `chucvu` (
  `machucvudoan` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `ten` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chucvu`
--

INSERT INTO `chucvu` (`machucvudoan`, `ten`) VALUES
('BT', 'Bí Thư'),
('PBT', 'Phó Bí Thư'),
('TV', 'Thường Vụ'),
('UV', 'Ủy Viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cochucvu`
--

CREATE TABLE `cochucvu` (
  `mstt` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `machucvudoan` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `madoankhoa` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `nambatdau` int(4) NOT NULL,
  `namketthuc` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cochucvu`
--

INSERT INTO `cochucvu` (`mstt`, `machucvudoan`, `madoankhoa`, `nambatdau`, `namketthuc`) VALUES
('1234567800', 'BT', 'CNTP', 0, 0),
('1234567890', 'BT', 'TTTT', 2019, 2009),
('1501206027', 'UV', 'TTTT', 2017, 2019),
('1501206121', 'PBT', 'TTTT', 2017, 2019),
('1501206121', 'UV', 'DT', 2017, 2019);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doankhoa`
--

CREATE TABLE `doankhoa` (
  `madoankhoa` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `tendoankhoa` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `doankhoa`
--

INSERT INTO `doankhoa` (`madoankhoa`, `tendoankhoa`) VALUES
('DT', 'Đoàn Trường'),
('CNTP', 'Khoa Học Biển và Công Nghệ Thực Phẩm'),
('KTDL', 'Kinh Tế Du Lich'),
('KTCN', 'Kỹ Thuật Công Nghệ'),
('NNGU', 'Ngoại Ngữ'),
('NNNT', 'Nông Nghiệp Phát Triển Nông Thông'),
('SPXH', 'Sư Phạm Xã Hội và Nhân Văn'),
('TNMT', 'Tài Nguyên Môi Trường'),
('TTTT', 'Thông Tin và Truyền Thông');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `goibantin`
--

CREATE TABLE `goibantin` (
  `idtingoi` int(11) NOT NULL,
  `tieude` text COLLATE utf8_unicode_ci NOT NULL,
  `avata` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `trichdan` text COLLATE utf8_unicode_ci NOT NULL,
  `maloaitin` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `idtk` int(11) NOT NULL,
  `capdotruycap` int(11) NOT NULL,
  `ngaygoi` date NOT NULL,
  `daduyet` int(11) NOT NULL DEFAULT '0',
  `chuaduyet` int(11) NOT NULL DEFAULT '0',
  `tuchoi` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `goibantin`
--

INSERT INTO `goibantin` (`idtingoi`, `tieude`, `avata`, `trichdan`, `maloaitin`, `noidung`, `idtk`, `capdotruycap`, `ngaygoi`, `daduyet`, `chuaduyet`, `tuchoi`) VALUES
(2, 'Hơn 2.000 học sinh tham dự ngày hội tư vấn tuyển sinh tại Trường Đại học Kiên Giang', '2.jpg', ' Sáng ngày 22/4, Trường Đại học Kiên Giang đã tổ chức ngày hội tư vấn tuyển sinh năm 2018 và ký kết thỏa thuận hợp tác đào tạo nguồn nhân lực với các doanh nghiệp trên địa bàn. Có hơn 2.000 học sinh đến từ 27 trường THPT trong và ngoài tỉnh Kiên Giang đến tham dự.', 'LT06', 'Phát biểu tại buổi lễ, PGS.TS Thái Thành Lượm, Hiệu trưởng Trường ĐH Kiên Giang, cho biết: Hội nghị tư vấn tuyển sinh được Nhà trường tổ chức hàng năm, bởi đây là dịp để Nhà trường báo cáo kết quả học tập, nghiên cứu khoa học của đội ngũ giảng viên và sinh viên; đồng thời giới thiệu công tác tư vấn tuyển sinh, nhất là những điểm mới trong các tác tuyển sinh theo quy định của Bộ GD&ĐT, giới thiệu về các ngành học, chương trình học và cơ sở vật chất đáp ứng công tác dạy và học trong Nhà trường. Hiện Trường ĐH Kiên Giang có đội ngũ CC,VC, NLĐ gần 300 người, trong đó có 250 giảng viên có trình độ thạc sĩ trở lên, với các phòng học, trung tâm thực hành thí nghiệm được trang bị đầy đủ trang thiết bị hiện đại, với tổng mức đầu tư trên 100 tỷ đồng đáp ứng tốt nhu cầu nghiên cứu, học tập.\r\nNgoài ra, để nâng cao chất lượng dạy và học, nhà trường đã ký kết với nhiều trường đại học nước ngoài, như: Đại học Hoàng gia Campuchia, Đại học Andalas – Inđônêsia, Đại học Utrecht – Hà Lan; cử du học sinh đi tu nghiệp nông nghiệp công nghệ cao tại Israel ...\r\n\r\nNăm học 2018-2019, Trường ĐH Kiên Giang dự kiến tuyển sinh chỉ tiêu hơn 2.000 sinh viên, với 10 mã ngành chính, bao gồm nhiều lĩnh vực: Khoa học xã hội, kinh tế, kỹ thuật công nghệ...\r\n\r\nTại hội nghị, lãnh đạo Trường ĐH Kiên Giang đã ký thỏa thuận hợp tác đào tạo nguồn nhân lực với với các ngân hàng, doanh nghiệp kinh doanh khách sạn, du lịch, nuôi trồng và chế biến thủy sản xuất khẩu, Tập đoàn tư vấn xây dựng Kiên Giang, ... để nâng cao khả năng giải quyết việc làm cho sinh viên sau khi tốt nghiệp ra trường.\r\nSau hội nghị là chương trình tư vấn chuyên sâu theo từng nhóm ngành nghề, trả lời những thắc mắc cụ thể hơn tại các khu vực tư vấn chuyên sâu, gồm có: Nhóm ngành sư phạm, ngoại ngữ, kế toán…; Nhóm ngành công nghệ thông tin, công nghệ kỹ thuật xây dựng, công nghệ kỹ thuật môi trường…; Nhóm ngành công nghệ thực phẩm, công nghệ sinh học, nuôi trồng thủy sản,… Các học sinh đã có nhiều cơ hội gặp gỡ, trao đổi trực tiếp với các thầy cô trong Ban tư vấn để nắm rõ các thông tin chi tiết, cần thiết giúp học sinh chọn ngành học phù hợp với khả năng và nguyện vọng.', 2, 2, '2018-05-07', 0, 0, 0),
(3, 'Tổ chức họp mặt mừng tết cổ truyền Chôl Chnăm Thmây 2018', '3.jpg', 'Chiều ngày 16/4, Trường Đại học Kiên Giang đã tổ chức họp mặt mừng tết cổ truyền Chôl Chnăm Thmây cho cán bộ, giảng viên, người lao động và sinh viên người Khmer.', 'LT06', 'Đại diện Ban Dân vận Tỉnh ủy Kiên Giang, Ban Dân tộc tỉnh Kiên Giang, cùng Ban Giám hiệu Trường Đại học Kiên Giang đã đến tham dự.\r\nThay mặt Đảng ủy, Ban Giám hiệu Nhà trường, PGS.TS Thái Thành Lượm - Hiệu trưởng - đã gửi lời chúc mừng vui tươi, hạnh phúc đến các đồng chí lãnh đạo, cùng toàn thể viên chức, giảng viên và các em sinh viên dân tộc Khmer trong toàn Trường.\r\n\r\nPGS.TS Thái Thành Lượm đã ghi nhận sự phấn đấu, đóng góp, cùng những thành tích đạt được trong quá trình thành lập Trường đến nay của cán bộ, viên chức, người lao động, sinh viên dân tộc Khmer.\r\n“Nhân dịp tết cổ truyền Chôl Chnăm Thmây năm 2018, Đảng ủy, Ban Giám hiệu, Công đoàn Trường Đại học Kiên Giang mong rằng tất cả viên chức, giảng viên, người lao động, sinh viên Khmer tiếp tục phát huy truyền thống đoàn kết, hưởng ứng tích cực các phong trào thi đua, luôn tích cực trong lao động và học tập, không ngừng nâng cao trình độ chuyên môn, góp phần tạo nên không khí học tập, rèn luyện sôi nổi trong toàn trường” - PGS.TS Thái Thành Lượm phát biểu.\r\nTrong không khí vui tươi, phấn khởi của buổi họp mặt, TS. Danh Mô, Trưởng khoa Tài nguyên – Môi trường, chia sẻ: tôi cảm thấy rất hạnh phúc khi nhận được sự quan tâm của Đảng ủy, Ban Giám hiệu Nhà trường đã  tổ chức họp mặt, vui tết dân tộc cổ truyền cho cán bộ, giảng viên, sinh viên dân tộc Khmer; đây là nguồn cổ vũ động viên rất lớn, là nguồn động lực cho chúng tôi ngày càng cố gắng, hoàn thành tốt nhiệm được giao.', 2, 2, '2018-05-07', 0, 0, 0),
(4, 'Sinh viên tự tin đáp ứng nhu cầu của nhà tuyển dụng', '4.jpg', 'Nhằm tạo điều kiện và cơ hội cho sinh viên tìm được việc làm ngay sau khi ra trường, Trường Đại học Kiên Giang đã tăng cường liên kết, hợp tác cùng với các doanh nghiệp trên địa bàn tỉnh Kiên Giang.', 'LT06', 'Vừa qua, Nhà trường đã phối hợp với Vinpearl Phú Quốc tổ chức giao lưu, giới thiệu cơ hội việc làm cho sinh viên. Kết quả, có hơn 70 hồ sơ ứng tuyển. Qua phỏng vấn, bộ phận tuyển dụng của Vinpearl Phú Quốc đã tuyển chọn được có 23 sinh viên vào làm việc.\r\n\r\nTheo đánh giá của nhà tuyển dụng, các sinh viên của Trường Đại học Kiên Giang trúng tuyển lần này đều đáp ứng đầy đủ các yêu cầu, sinh viên có có khả năng sử dụng thành thạo tiếng Anh, ngoại hình khá, tự tin, nhanh nhẹn trong ứng xử, giao tiếp tốt. \r\n\r\nEm Thị Cẩm Tiên, sinh viên ngành Ngôn ngữ Anh, cho biết trước khi tham gia phỏng vấn em đã tìm hiểu các thông tin liên quan đến đơn vị tuyển dụng, trau dồi nâng cao vốn tiếng Anh, tự luyện tập trả lời các câu hỏi giả định. Theo Tiên, việc tổ chức phỏng vấn tuyển dụng tại Trường vừa qua là cơ hội tốt để sinh viên có thể tìm được việc làm, tiếp xúc với môi trường làm việc chuyên nghiệp, tích lũy thêm kinh nghiệm ứng xử và trả lời phỏng vấn của nhà tuyển dụng.\r\nEm Nguyễn Trí Thức, sinh viên ngành Ngôn ngữ Anh chia sẻ: em rất vui khi nhận được tin trúng tuyển, qua phần thi phỏng vấn em cảm thấy tự tin hơn rất nhiều. Em cảm ơn Nhà trường đã tạo điều kiện cho em cùng các bạn có cơ hội tiếp xúc với nhà tuyển dụng, giúp chúng em có thêm trải nghiệm và cơ hội có việc làm ngay sau khi ra trường.\r\n\r\nTS. Nguyễn Tuấn Khanh - Phó Hiệu trưởng - cho biết Nhà trường đang tiếp tục đẩy mạnh hợp tác, liên kết cùng với các doanh nghiệp rà soát chương trình, kết nối các hoạt động phối hợp đào tạo nhằm tạo đầu ra cho sinh viên, đáp ứng nhu cầu của nhà tuyển dụng.', 2, 2, '2018-05-07', 0, 0, 0),
(5, ' Trường Đại học Kiên Giang phối hợp Vinpearl Phú Quốc giao lưu, giới thiệu cơ hội việc làm cho sinh viên', '1 (1).jpg', 'Ngày 1/4, hàng trăm sinh viên có mặt tại sân Trường Đại học Kiên Giang để nghe bộ phận tuyển dụng của Vinpearl Phú Quốc tư vấn về những chính sách, cơ hội việc làm cho sinh viên sau khi tốt nghiệp.', 'LT06', 'Đây là lần đầu tiên Vinpearl Phú Quốc phối hợp với Trường Đại học Kiên Giang tổ chức tư vấn đào tạo theo yêu cầu của doanh nghiệp, đồng thời trực tiếp phỏng vấn sinh viên để tuyển chọn vị trí việc làm.\r\n\r\nTại buổi giao lưu, chia sẻ cơ hội việc làm, PGS.TS. Thái Thành Lượm – Hiệu trưởng Trường Đại học Kiên Giang định hướng trong thời gian tới ngoài thời gian học trong chương trình chính khóa, sinh viên nên rèn luyện học tập thêm về khả năng ngoại ngữ, trau dồi kỹ năng mềm để nâng cao khả năng tìm việc làm sau khi ra trường.\r\nMỗi năm, Vinpearl Phú Quốc có nhu cầu tuyển từ 300 sinh viên đến 500 lao động, trong đó ưu tiên cho các trường trên địa bàn tỉnh Kiên Giang. Điều mà doanh nghiệp quan tâm là có được đội ngũ nhân viên đáp ứng được nhu cầu của công việc, không phải đưa đi đào tạo lại. Chính vì vậy sinh viên muốn có cơ hội việc làm sau khi tốt nghiệp cần phải xác định rõ mục đích và đáp ứng yêu cầu chuyên môn.Em Danh Thiên (sinh viên Trường Đại học Kiên Giang) chia sẻ buổi giao lưu đã giúp em có thêm nhiều kiến thức về doanh nghiệp, đặc biệt là đã tạo cho em những định hướng để tìm việc.Việc giao lưu, chia sẻ thông tin giữa Nhà trường và doanh nghiệp sẽ mở ra cơ hội việc làm cho sinh viên sau khi ra trường, giúp Nhà trường tuyển sinh đào tạo đúng chuyên ngành mà nhu cầu xã hội cần, qua đó, tạo dựng thêm uy tín của Trường trong công tác đào tạo.', 2, 2, '2018-05-07', 0, 0, 0),
(6, ' Hơn 1.000 sinh viên học giáo dục quốc phòng – an ninh', '6.jpg', 'Sáng ngày 28/3, ThS. Lâm Đông Hồ - Phó Trưởng khoa Giáo dục Quốc phòng - An ninh, cho biết hiện tại đang có hơn 1.000 sinh viên khóa 3 tham gia khóa học quốc phòng tại Trường Đại học Kiên Giang.', 'LT06', 'Theo ThS. Lâm Đông Hồ, Giáo dục Quốc phòng – An ninh môn học chính khóa, là một trong những nội dung giáo dục toàn diện của Nhà trường. Trang bị cho  sinh viên kiến thức cơ bản về đường lối quân sự, công tác quốc phòng an ninh của Đảng và Nhà nước; những kỹ năng quân sự, an ninh cần thiết nhằm đáp ứng nhu cầu xây dựng, củng cố lực lượng vũ trang nhân dân, sẵn sàng tham gia lực lượng dân quân tự vệ, dự bị động viên và làm nghĩa vụ quân sự, giữ gìn trật tự, an toàn xã hội. Thực hành rèn luyện một số kỹ năng quân sự cần thiết về tác phong, tính kỷ luật, góp phần vào việc thực hiện mục tiêu đào tạo của Nhà trường.\r\n\r\nMôn học Giáo dục Quốc phòng – An ninh bao gồm 3 học phần: đường lối quân sự của Đảng; Công tác quốc phòng an ninh; Quân sự chung, chiến thuật, kỹ thuật bắn súng tiểu liên, AK. Yêu cầu sinh viên phải rèn luyện, bồi dưỡng kiến thức, kỹ năng, thái độ và tuân thủ quy chế. \r\n\r\nQua môn học này, sinh viên sẽ được trang bị kiến thức về đường lối quân sự của Đảng trong sự nghiệp bảo vệ tổ quốc; Quan điểm của Đảng về xây dựng nền quốc phòng toàn dân, an ninh nhân dân; Đấu tranh, phòng chống chiến lược “diễn biến hòa bình, bạo loạn lật độ” của các thế lực thù địch với cách mạng Việt Nam trong tình hình mới; được đào tạo các kỹ năng quân sự cần thiết, biết sử dụng một số loại vũ khí bộ binh như súng tiểu liên AK, súng ngắn K54.\r\n\r\nNgoài ra, môn học còn giúp sinh viên rèn luyện phẩm chất, bản lĩnh chính trị vững vàng, vun đắp tinh thần yêu nước, yêu chủ nghĩa xã hội; Xây dựng tác phong nhanh nhẹn, hình thành nếp sống có kỷ luật trong sinh hoạt tập thể, ý thức cộng đồng.', 2, 2, '2018-05-07', 0, 0, 0),
(11, ' Khởi động Tháng Thanh niên tỉnh Kiên Giang 2018', '7.jpg', ' Sáng ngày 06/3, tại Nhà Bia tưởng niệm liệt sĩ, anh hùng lực lượng vũ trang nhân dân Mai Thị Nương (Giồng Riềng), Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 đã tổ chức Lễ khởi động Tháng Thanh niên 2018 với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”.', 'LT06', 'Tham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.\r\nPhát biểu tại lễ khởi động, đồng chí Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đề nghị đoàn thanh niên các cấp quán triệt sâu sắc ý nghĩa, mục tiêu, nhiệm vụ của Tháng Thanh niên năm 2018; phát huy cao độ tinh thần đoàn kết nhất trí, năng động sáng tạo, xung kích tình nguyện, tham gia giải quyết những việc khó, những vấn đề bức xúc mà xã hội đang cần ở tuổi trẻ; lựa chọn nội dung trọng tâm, trọng điểm, phù hợp với điều kiện, khả năng của tổ chức Đoàn ở mỗi cấp, mỗi địa phương, đơn vị để có kế hoạch thực hiện; trong đó, chú trọng các hoạt động hỗ trợ thanh niên khởi nghiệp, phát triển kinh tế, khuyến khích làm giàu chính đáng và giảm nghèo bền vững; cùng với các hoạt động xây dựng đời sống văn hóa, nếp sống văn minh; bảo vệ môi trường, ứng phó với biến đổi khí hậu, xây dựng cảnh quan môi trường xanh, sạch, đẹp; đảm bảo trật tự an toàn giao thông, an toàn xã hội và xây dựng tổ chức Đoàn vững mạnh trên địa bàn dân cư.\r\nĐồng chí Lê Trung Hồ - Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 cho biết, với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”, Tỉnh đoàn đề ra một số mục tiêu thiết thực, cụ thể, như: Đoàn cấp huyện và 100% cơ sở Đoàn tổ chức tuyên truyền về Tháng Thanh niên, tổ chức kỷ niệm 87 năm Ngày thành lập Đoàn TNCS Hồ Chí Minh; tuyên truyền về Nghị quyết Đại hội Đoàn TNCS Hồ Chí Minh tỉnh Kiên Giang lần thứ X nhiệm kỳ 2017- 2022; 100% Đoàn cấp huyện và tương đương triển khai cuộc vận động “Mỗi thanh niên một ý tưởng sáng tạo” do Trung ương Đoàn phát động; tổ chức ngày hội tuổi trẻ sáng tạo hoặc diễn đàn sáng tạo trẻ; tham gia các cuộc thi do tỉnh tổ chức; mỗi cơ sở Đoàn có ít nhất 01 công trình hoặc phần việc thanh niên, ít nhất 03 hoạt động tham gia xây dựng nông thôn mới hoặc đô thị văn minh; 100% Đoàn xã, Phường, Thị trấn duy trì và thành lập mới mô hình thanh niên làm kinh tế; tư vấn, hướng nghiệp 4.500 đoàn viên, thanh niên; dạy nghề cho 1.200 đoàn viên, thanh niên; giới thiệu việc làm cho 4.500 thanh niên; giải quyết việc làm cho 2.500 thanh niên; mỗi Đoàn xã, Phường, Thị trấn tiếp nhận giúp đỡ ít nhất 01 thanh thiếu niên chậm tiến; 100% Đoàn cấp huyện có hoạt động hỗ trợ thanh niên khởi nghiệp; phối hợp mở 50 lớp chuyển giao khoa học kỹ thuật; xây dựng 15 Tổ hợp tác thanh niên; phát triển 6.500 đoàn viên mới; giới thiệu 800 đoàn viên ưu tú cho Đảng xem xét, chăm bồi; phát triển ít nhất 01 tổ chức cơ sở Đoàn, 01 tổ chức Hội trong doanh nghiệp ngoài Nhà nước; 100% các Huyện, Thị, Thành đoàn đồng loạt tổ chức 04 “Ngày Thứ bảy tình nguyện hỗ trợ nhân dân về thủ tục hành chính”; 100% Đoàn cấp huyện và tương đương tổ chức Ngày Đoàn viên; 100% cơ sở Đoàn tổ chức trao danh sách đoàn viên ưu tú cho Đảng.\r\n\r\nSau lễ khởi động, Tỉnh đoàn khởi công xây dựng 1 căn nhà thanh niên, ra mắt 2 tổ hợp tác thanh niên, khai giảng lớp dạy bơi cho thiếu nhi, ra quân thực hiện tuyến đường xanh – sạch – đẹp trên địa bàn huyện Giồng Riềng.\r\nTham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.\r\nPhát biểu tại lễ khởi động, đồng chí Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đề nghị đoàn thanh niên các cấp quán triệt sâu sắc ý nghĩa, mục tiêu, nhiệm vụ của Tháng Thanh niên năm 2018; phát huy cao độ tinh thần đoàn kết nhất trí, năng động sáng tạo, xung kích tình nguyện, tham gia giải quyết những việc khó, những vấn đề bức xúc mà xã hội đang cần ở tuổi trẻ; lựa chọn nội dung trọng tâm, trọng điểm, phù hợp với điều kiện, khả năng của tổ chức Đoàn ở mỗi cấp, mỗi địa phương, đơn vị để có kế hoạch thực hiện; trong đó, chú trọng các hoạt động hỗ trợ thanh niên khởi nghiệp, phát triển kinh tế, khuyến khích làm giàu chính đáng và giảm nghèo bền vững; cùng với các hoạt động xây dựng đời sống văn hóa, nếp sống văn minh; bảo vệ môi trường, ứng phó với biến đổi khí hậu, xây dựng cảnh quan môi trường xanh, sạch, đẹp; đảm bảo trật tự an toàn giao thông, an toàn xã hội và xây dựng tổ chức Đoàn vững mạnh trên địa bàn dân cư.\r\nĐồng chí Lê Trung Hồ - Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 cho biết, với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”, Tỉnh đoàn đề ra một số mục tiêu thiết thực, cụ thể, như: Đoàn cấp huyện và 100% cơ sở Đoàn tổ chức tuyên truyền về Tháng Thanh niên, tổ chức kỷ niệm 87 năm Ngày thành lập Đoàn TNCS Hồ Chí Minh; tuyên truyền về Nghị quyết Đại hội Đoàn TNCS Hồ Chí Minh tỉnh Kiên Giang lần thứ X nhiệm kỳ 2017- 2022; 100% Đoàn cấp huyện và tương đương triển khai cuộc vận động “Mỗi thanh niên một ý tưởng sáng tạo” do Trung ương Đoàn phát động; tổ chức ngày hội tuổi trẻ sáng tạo hoặc diễn đàn sáng tạo trẻ; tham gia các cuộc thi do tỉnh tổ chức; mỗi cơ sở Đoàn có ít nhất 01 công trình hoặc phần việc thanh niên, ít nhất 03 hoạt động tham gia xây dựng nông thôn mới hoặc đô thị văn minh; 100% Đoàn xã, Phường, Thị trấn duy trì và thành lập mới mô hình thanh niên làm kinh tế; tư vấn, hướng nghiệp 4.500 đoàn viên, thanh niên; dạy nghề cho 1.200 đoàn viên, thanh niên; giới thiệu việc làm cho 4.500 thanh niên; giải quyết việc làm cho 2.500 thanh niên; mỗi Đoàn xã, Phường, Thị trấn tiếp nhận giúp đỡ ít nhất 01 thanh thiếu niên chậm tiến; 100% Đoàn cấp huyện có hoạt động hỗ trợ thanh niên khởi nghiệp; phối hợp mở 50 lớp chuyển giao khoa học kỹ thuật; xây dựng 15 Tổ hợp tác thanh niên; phát triển 6.500 đoàn viên mới; giới thiệu 800 đoàn viên ưu tú cho Đảng xem xét, chăm bồi; phát triển ít nhất 01 tổ chức cơ sở Đoàn, 01 tổ chức Hội trong doanh nghiệp ngoài Nhà nước; 100% các Huyện, Thị, Thành đoàn đồng loạt tổ chức 04 “Ngày Thứ bảy tình nguyện hỗ trợ nhân dân về thủ tục hành chính”; 100% Đoàn cấp huyện và tương đương tổ chức Ngày Đoàn viên; 100% cơ sở Đoàn tổ chức trao danh sách đoàn viên ưu tú cho Đảng.\r\n\r\nSau lễ khởi động, Tỉnh đoàn khởi công xây dựng 1 căn nhà thanh niên, ra mắt 2 tổ hợp tác thanh niên, khai giảng lớp dạy bơi cho thiếu nhi, ra quân thực hiện tuyến đường xanh – sạch – đẹp trên địa bàn huyện Giồng Riềng.\r\nTham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.\r\nPhát biểu tại lễ khởi động, đồng chí Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đề nghị đoàn thanh niên các cấp quán triệt sâu sắc ý nghĩa, mục tiêu, nhiệm vụ của Tháng Thanh niên năm 2018; phát huy cao độ tinh thần đoàn kết nhất trí, năng động sáng tạo, xung kích tình nguyện, tham gia giải quyết những việc khó, những vấn đề bức xúc mà xã hội đang cần ở tuổi trẻ; lựa chọn nội dung trọng tâm, trọng điểm, phù hợp với điều kiện, khả năng của tổ chức Đoàn ở mỗi cấp, mỗi địa phương, đơn vị để có kế hoạch thực hiện; trong đó, chú trọng các hoạt động hỗ trợ thanh niên khởi nghiệp, phát triển kinh tế, khuyến khích làm giàu chính đáng và giảm nghèo bền vững; cùng với các hoạt động xây dựng đời sống văn hóa, nếp sống văn minh; bảo vệ môi trường, ứng phó với biến đổi khí hậu, xây dựng cảnh quan môi trường xanh, sạch, đẹp; đảm bảo trật tự an toàn giao thông, an toàn xã hội và xây dựng tổ chức Đoàn vững mạnh trên địa bàn dân cư.\r\nĐồng chí Lê Trung Hồ - Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 cho biết, với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”, Tỉnh đoàn đề ra một số mục tiêu thiết thực, cụ thể, như: Đoàn cấp huyện và 100% cơ sở Đoàn tổ chức tuyên truyền về Tháng Thanh niên, tổ chức kỷ niệm 87 năm Ngày thành lập Đoàn TNCS Hồ Chí Minh; tuyên truyền về Nghị quyết Đại hội Đoàn TNCS Hồ Chí Minh tỉnh Kiên Giang lần thứ X nhiệm kỳ 2017- 2022; 100% Đoàn cấp huyện và tương đương triển khai cuộc vận động “Mỗi thanh niên một ý tưởng sáng tạo” do Trung ương Đoàn phát động; tổ chức ngày hội tuổi trẻ sáng tạo hoặc diễn đàn sáng tạo trẻ; tham gia các cuộc thi do tỉnh tổ chức; mỗi cơ sở Đoàn có ít nhất 01 công trình hoặc phần việc thanh niên, ít nhất 03 hoạt động tham gia xây dựng nông thôn mới hoặc đô thị văn minh; 100% Đoàn xã, Phường, Thị trấn duy trì và thành lập mới mô hình thanh niên làm kinh tế; tư vấn, hướng nghiệp 4.500 đoàn viên, thanh niên; dạy nghề cho 1.200 đoàn viên, thanh niên; giới thiệu việc làm cho 4.500 thanh niên; giải quyết việc làm cho 2.500 thanh niên; mỗi Đoàn xã, Phường, Thị trấn tiếp nhận giúp đỡ ít nhất 01 thanh thiếu niên chậm tiến; 100% Đoàn cấp huyện có hoạt động hỗ trợ thanh niên khởi nghiệp; phối hợp mở 50 lớp chuyển giao khoa học kỹ thuật; xây dựng 15 Tổ hợp tác thanh niên; phát triển 6.500 đoàn viên mới; giới thiệu 800 đoàn viên ưu tú cho Đảng xem xét, chăm bồi; phát triển ít nhất 01 tổ chức cơ sở Đoàn, 01 tổ chức Hội trong doanh nghiệp ngoài Nhà nước; 100% các Huyện, Thị, Thành đoàn đồng loạt tổ chức 04 “Ngày Thứ bảy tình nguyện hỗ trợ nhân dân về thủ tục hành chính”; 100% Đoàn cấp huyện và tương đương tổ chức Ngày Đoàn viên; 100% cơ sở Đoàn tổ chức trao danh sách đoàn viên ưu tú cho Đảng.\r\n\r\nSau lễ khởi động, Tỉnh đoàn khởi công xây dựng 1 căn nhà thanh niên, ra mắt 2 tổ hợp tác thanh niên, khai giảng lớp dạy bơi cho thiếu nhi, ra quân thực hiện tuyến đường xanh – sạch – đẹp trên địa bàn huyện Giồng Riềng.\r\nTham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.\r\nPhát biểu tại lễ khởi động, đồng chí Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đề nghị đoàn thanh niên các cấp quán triệt sâu sắc ý nghĩa, mục tiêu, nhiệm vụ của Tháng Thanh niên năm 2018; phát huy cao độ tinh thần đoàn kết nhất trí, năng động sáng tạo, xung kích tình nguyện, tham gia giải quyết những việc khó, những vấn đề bức xúc mà xã hội đang cần ở tuổi trẻ; lựa chọn nội dung trọng tâm, trọng điểm, phù hợp với điều kiện, khả năng của tổ chức Đoàn ở mỗi cấp, mỗi địa phương, đơn vị để có kế hoạch thực hiện; trong đó, chú trọng các hoạt động hỗ trợ thanh niên khởi nghiệp, phát triển kinh tế, khuyến khích làm giàu chính đáng và giảm nghèo bền vững; cùng với các hoạt động xây dựng đời sống văn hóa, nếp sống văn minh; bảo vệ môi trường, ứng phó với biến đổi khí hậu, xây dựng cảnh quan môi trường xanh, sạch, đẹp; đảm bảo trật tự an toàn giao thông, an toàn xã hội và xây dựng tổ chức Đoàn vững mạnh trên địa bàn dân cư.\r\nĐồng chí Lê Trung Hồ - Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 cho biết, với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”, Tỉnh đoàn đề ra một số mục tiêu thiết thực, cụ thể, như: Đoàn cấp huyện và 100% cơ sở Đoàn tổ chức tuyên truyền về Tháng Thanh niên, tổ chức kỷ niệm 87 năm Ngày thành lập Đoàn TNCS Hồ Chí Minh; tuyên truyền về Nghị quyết Đại hội Đoàn TNCS Hồ Chí Minh tỉnh Kiên Giang lần thứ X nhiệm kỳ 2017- 2022; 100% Đoàn cấp huyện và tương đương triển khai cuộc vận động “Mỗi thanh niên một ý tưởng sáng tạo” do Trung ương Đoàn phát động; tổ chức ngày hội tuổi trẻ sáng tạo hoặc diễn đàn sáng tạo trẻ; tham gia các cuộc thi do tỉnh tổ chức; mỗi cơ sở Đoàn có ít nhất 01 công trình hoặc phần việc thanh niên, ít nhất 03 hoạt động tham gia xây dựng nông thôn mới hoặc đô thị văn minh; 100% Đoàn xã, Phường, Thị trấn duy trì và thành lập mới mô hình thanh niên làm kinh tế; tư vấn, hướng nghiệp 4.500 đoàn viên, thanh niên; dạy nghề cho 1.200 đoàn viên, thanh niên; giới thiệu việc làm cho 4.500 thanh niên; giải quyết việc làm cho 2.500 thanh niên; mỗi Đoàn xã, Phường, Thị trấn tiếp nhận giúp đỡ ít nhất 01 thanh thiếu niên chậm tiến; 100% Đoàn cấp huyện có hoạt động hỗ trợ thanh niên khởi nghiệp; phối hợp mở 50 lớp chuyển giao khoa học kỹ thuật; xây dựng 15 Tổ hợp tác thanh niên; phát triển 6.500 đoàn viên mới; giới thiệu 800 đoàn viên ưu tú cho Đảng xem xét, chăm bồi; phát triển ít nhất 01 tổ chức cơ sở Đoàn, 01 tổ chức Hội trong doanh nghiệp ngoài Nhà nước; 100% các Huyện, Thị, Thành đoàn đồng loạt tổ chức 04 “Ngày Thứ bảy tình nguyện hỗ trợ nhân dân về thủ tục hành chính”; 100% Đoàn cấp huyện và tương đương tổ chức Ngày Đoàn viên; 100% cơ sở Đoàn tổ chức trao danh sách đoàn viên ưu tú cho Đảng.\r\n\r\nSau lễ khởi động, Tỉnh đoàn khởi công xây dựng 1 căn nhà thanh niên, ra mắt 2 tổ hợp tác thanh niên, khai giảng lớp dạy bơi cho thiếu nhi, ra quân thực hiện tuyến đường xanh – sạch – đẹp trên địa bàn huyện Giồng Riềng.Tham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.\r\nPhát biểu tại lễ khởi động, đồng chí Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đề nghị đoàn thanh niên các cấp quán triệt sâu sắc ý nghĩa, mục tiêu, nhiệm vụ của Tháng Thanh niên năm 2018; phát huy cao độ tinh thần đoàn kết nhất trí, năng động sáng tạo, xung kích tình nguyện, tham gia giải quyết những việc khó, những vấn đề bức xúc mà xã hội đang cần ở tuổi trẻ; lựa chọn nội dung trọng tâm, trọng điểm, phù hợp với điều kiện, khả năng của tổ chức Đoàn ở mỗi cấp, mỗi địa phương, đơn vị để có kế hoạch thực hiện; trong đó, chú trọng các hoạt động hỗ trợ thanh niên khởi nghiệp, phát triển kinh tế, khuyến khích làm giàu chính đáng và giảm nghèo bền vững; cùng với các hoạt động xây dựng đời sống văn hóa, nếp sống văn minh; bảo vệ môi trường, ứng phó với biến đổi khí hậu, xây dựng cảnh quan môi trường xanh, sạch, đẹp; đảm bảo trật tự an toàn giao thông, an toàn xã hội và xây dựng tổ chức Đoàn vững mạnh trên địa bàn dân cư.\r\nĐồng chí Lê Trung Hồ - Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 cho biết, với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”, Tỉnh đoàn đề ra một số mục tiêu thiết thực, cụ thể, như: Đoàn cấp huyện và 100% cơ sở Đoàn tổ chức tuyên truyền về Tháng Thanh niên, tổ chức kỷ niệm 87 năm Ngày thành lập Đoàn TNCS Hồ Chí Minh; tuyên truyền về Nghị quyết Đại hội Đoàn TNCS Hồ Chí Minh tỉnh Kiên Giang lần thứ X nhiệm kỳ 2017- 2022; 100% Đoàn cấp huyện và tương đương triển khai cuộc vận động “Mỗi thanh niên một ý tưởng sáng tạo” do Trung ương Đoàn phát động; tổ chức ngày hội tuổi trẻ sáng tạo hoặc diễn đàn sáng tạo trẻ; tham gia các cuộc thi do tỉnh tổ chức; mỗi cơ sở Đoàn có ít nhất 01 công trình hoặc phần việc thanh niên, ít nhất 03 hoạt động tham gia xây dựng nông thôn mới hoặc đô thị văn minh; 100% Đoàn xã, Phường, Thị trấn duy trì và thành lập mới mô hình thanh niên làm kinh tế; tư vấn, hướng nghiệp 4.500 đoàn viên, thanh niên; dạy nghề cho 1.200 đoàn viên, thanh niên; giới thiệu việc làm cho 4.500 thanh niên; giải quyết việc làm cho 2.500 thanh niên; mỗi Đoàn xã, Phường, Thị trấn tiếp nhận giúp đỡ ít nhất 01 thanh thiếu niên chậm tiến; 100% Đoàn cấp huyện có hoạt động hỗ trợ thanh niên khởi nghiệp; phối hợp mở 50 lớp chuyển giao khoa học kỹ thuật; xây dựng 15 Tổ hợp tác thanh niên; phát triển 6.500 đoàn viên mới; giới thiệu 800 đoàn viên ưu tú cho Đảng xem xét, chăm bồi; phát triển ít nhất 01 tổ chức cơ sở Đoàn, 01 tổ chức Hội trong doanh nghiệp ngoài Nhà nước; 100% các Huyện, Thị, Thành đoàn đồng loạt tổ chức 04 “Ngày Thứ bảy tình nguyện hỗ trợ nhân dân về thủ tục hành chính”; 100% Đoàn cấp huyện và tương đương tổ chức Ngày Đoàn viên; 100% cơ sở Đoàn tổ chức trao danh sách đoàn viên ưu tú cho Đảng.\r\n\r\nSau lễ khởi động, Tỉnh đoàn khởi công xây dựng 1 căn nhà thanh niên, ra mắt 2 tổ hợp tác thanh niên, khai giảng lớp dạy bơi cho thiếu nhi, ra quân thực hiện tuyến đường xanh – sạch – đẹp trên địa bàn huyện Giồng Riềng.\r\nTham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.\r\nPhát biểu tại lễ khởi động, đồng chí Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đề nghị đoàn thanh niên các cấp quán triệt sâu sắc ý nghĩa, mục tiêu, nhiệm vụ của Tháng Thanh niên năm 2018; phát huy cao độ tinh thần đoàn kết nhất trí, năng động sáng tạo, xung kích tình nguyện, tham gia giải quyết những việc khó, những vấn đề bức xúc mà xã hội đang cần ở tuổi trẻ; lựa chọn nội dung trọng tâm, trọng điểm, phù hợp với điều kiện, khả năng của tổ chức Đoàn ở mỗi cấp, mỗi địa phương, đơn vị để có kế hoạch thực hiện; trong đó, chú trọng các hoạt động hỗ trợ thanh niên khởi nghiệp, phát triển kinh tế, khuyến khích làm giàu chính đáng và giảm nghèo bền vững; cùng với các hoạt động xây dựng đời sống văn hóa, nếp sống văn minh; bảo vệ môi trường, ứng phó với biến đổi khí hậu, xây dựng cảnh quan môi trường xanh, sạch, đẹp; đảm bảo trật tự an toàn giao thông, an toàn xã hội và xây dựng tổ chức Đoàn vững mạnh trên địa bàn dân cư.\r\nĐồng chí Lê Trung Hồ - Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 cho biết, với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”, Tỉnh đoàn đề ra một số mục tiêu thiết thực, cụ thể, như: Đoàn cấp huyện và 100% cơ sở Đoàn tổ chức tuyên truyền về Tháng Thanh niên, tổ chức kỷ niệm 87 năm Ngày thành lập Đoàn TNCS Hồ Chí Minh; tuyên truyền về Nghị quyết Đại hội Đoàn TNCS Hồ Chí Minh tỉnh Kiên Giang lần thứ X nhiệm kỳ 2017- 2022; 100% Đoàn cấp huyện và tương đương triển khai cuộc vận động “Mỗi thanh niên một ý tưởng sáng tạo” do Trung ương Đoàn phát động; tổ chức ngày hội tuổi trẻ sáng tạo hoặc diễn đàn sáng tạo trẻ; tham gia các cuộc thi do tỉnh tổ chức; mỗi cơ sở Đoàn có ít nhất 01 công trình hoặc phần việc thanh niên, ít nhất 03 hoạt động tham gia xây dựng nông thôn mới hoặc đô thị văn minh; 100% Đoàn xã, Phường, Thị trấn duy trì và thành lập mới mô hình thanh niên làm kinh tế; tư vấn, hướng nghiệp 4.500 đoàn viên, thanh niên; dạy nghề cho 1.200 đoàn viên, thanh niên; giới thiệu việc làm cho 4.500 thanh niên; giải quyết việc làm cho 2.500 thanh niên; mỗi Đoàn xã, Phường, Thị trấn tiếp nhận giúp đỡ ít nhất 01 thanh thiếu niên chậm tiến; 100% Đoàn cấp huyện có hoạt động hỗ trợ thanh niên khởi nghiệp; phối hợp mở 50 lớp chuyển giao khoa học kỹ thuật; xây dựng 15 Tổ hợp tác thanh niên; phát triển 6.500 đoàn viên mới; giới thiệu 800 đoàn viên ưu tú cho Đảng xem xét, chăm bồi; phát triển ít nhất 01 tổ chức cơ sở Đoàn, 01 tổ chức Hội trong doanh nghiệp ngoài Nhà nước; 100% các Huyện, Thị, Thành đoàn đồng loạt tổ chức 04 “Ngày Thứ bảy tình nguyện hỗ trợ nhân dân về thủ tục hành chính”; 100% Đoàn cấp huyện và tương đương tổ chức Ngày Đoàn viên; 100% cơ sở Đoàn tổ chức trao danh sách đoàn viên ưu tú cho Đảng.\r\n\r\nSau lễ khởi động, Tỉnh đoàn khởi công xây dựng 1 căn nhà thanh niên, ra mắt 2 tổ hợp tác thanh niên, khai giảng lớp dạy bơi cho thiếu nhi, ra quân thực hiện tuyến đường xanh – sạch – đẹp trên địa bàn huyện Giồng Riềng.', 2, 2, '2018-05-07', 0, 0, 0),
(12, 'Thử  đi nek', '5.jpg', 'Sáng ngày 06/3, tại Nhà Bia tưởng niệm liệt sĩ, anh hùng lực lượng vũ trang nhân dân Mai Thị Nương (Giồng Riềng), Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 đã tổ chức Lễ khởi động Tháng Thanh niên 2018 với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”.', 'LT06', 'Tham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.\r\n<br>\r\nSáng ngày 06/3, tại Nhà Bia tưởng niệm liệt sĩ, anh hùng lực lượng vũ trang nhân dân Mai Thị Nương (Giồng Riềng), Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 đã tổ chức Lễ khởi động Tháng Thanh niên 2018 với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”.\r\n<br>\r\nHơn 500 ĐVTN huyện Giồng Riềng tham dự lễ khởi động Tháng Thanh niên 2018\r\n<br>\r\nTham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.<br>ThS. Nguyễn Văn Thành cùng các đại biểu dâng hương tưởng niệm liệt sĩ, anh hùng lực lượng vũ trang nhân dân Mai Thị Nương\r\n\r\nPhát biểu tại lễ khởi động, đồng chí Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đề nghị đoàn thanh niên các cấp quán triệt sâu sắc ý nghĩa, mục tiêu, nhiệm vụ của Tháng Thanh niên năm 2018; phát huy cao độ tinh thần đoàn kết nhất trí, năng động sáng tạo, xung kích tình nguyện, tham gia giải quyết những việc khó, những vấn đề bức xúc mà xã hội đang cần ở tuổi trẻ; lựa chọn nội dung trọng tâm, trọng điểm, phù hợp với điều kiện, khả năng của tổ chức Đoàn ở mỗi cấp, mỗi địa phương, đơn vị để có kế hoạch thực hiện; trong đó, chú trọng các hoạt động hỗ trợ thanh niên khởi nghiệp, phát triển kinh tế, khuyến khích làm giàu chính đáng và giảm nghèo bền vững; cùng với các hoạt động xây dựng đời sống văn hóa, nếp sống văn minh; bảo vệ môi trường, ứng phó với biến đổi khí hậu, xây dựng cảnh quan môi trường xanh, sạch, đẹp; đảm bảo trật tự an toàn giao thông, an toàn xã hội và xây dựng tổ chức Đoàn vững mạnh trên địa bàn dân cư.', 2, 2, '2018-05-07', 0, 0, 0),
(21, 'File is an image - image/jpeg.Sorry, your file is too large.Sorry, your file was not uploaded.', '60e850fd1a6df533ac7c.jpg', 'File is an image - image/jpeg.Sorry, your file is too large.Sorry, your file was not uploaded.', 'LT01', 'File is an image - image/jpeg.Sorry, your file is too large.Sorry, your file was not uploaded.\r\nFile is an image - image/jpeg.Sorry, your file is too large.Sorry, your file was not uploaded.\r\nFile is an image - image/jpeg.Sorry, your file is too large.Sorry, your file was not uploaded.\r\nFile is an image - image/jpeg.Sorry, your file is too large.Sorry, your file was not uploaded.\r\nFile is an image - image/jpeg.Sorry, your file is too large.Sorry, your file was not uploaded.\r\nFile is an image - image/jpeg.Sorry, your file is too large.Sorry, your file was not uploaded.\r\n\r\n\r\nFile is an image - image/jpeg.Sorry, your file is too large.Sorry, your file was not uploaded.', 1, 1, '2018-05-08', 0, 0, 0),
(22, 'Nhiều hoạt động chào đón tân sinh viên khóa 3', '1+(5).jpg', ' Nhằm tạo điều kiện và không khí vui vẻ cho sinh viên có môi trường học tập, giải trí lành mạnh, thoải mái chào mừng năm học mới 2017 – 2018, phòng Công tác sinh viên, Đoàn Trường Đại học Kiên Giang đã phối hợp với các khoa, các phòng lập một chuỗi các kế hoạch, phong trào, hoạt động chào đón tân sinh viên khóa 3.', 'LT06', 'Đồng chí Lê Việt Khái – Trưởng phòng Công tác Sinh viên, Bí thư Đoàn Trường ĐHKG – cho biết trong năm học này đã có hơn 1.100 sinh viên khóa 3 đăng ký nhập học. Nhà trường đã tổ chức tuần sinh hoạt công dân đầu khóa cho các tân sinh viên với nhiều nội dung sinh hoạt về thời sự, chính trị, giáo dục tư tưởng, pháp luật, tuyên truyền an toàn giao thông, phòng chống HIV/AIDS, ma túy, mại dâm... Bên cạnh đó để nâng cao nhận thức, trau dồi các kỹ năng mềm, khả năng định hướng nghề nghiệp, khởi nghiệp cho sinh viên Nhà trường đã đẩy mạnh giáo dục hướng nghiệp, tuyên truyền các hoạt động tình nguyện vì cộng đồng; tổ chức các buổi đối thoại trực tiếp giữa Ban Giám hiệu Nhà trường, lãnh đạo khoa với sinh viên, lắng nghe, giải đáp thắc mắc cho sinh viên về các chế độ, chính sách, học bổng, cách đăng ký học phần, cách học...\r\n\r\n\r\n     Bạn Nguyễn Văn Phồng – sinh viên khóa 3, ngành Công nghệ kỹ thuật Xây dựng, Trường ĐHKG cảm thấy phấn khởi khi bước vào năm học mới. Theo Phồng, môi trường học tập mới tại Trường mang đến cho bạn nhiều thú vị, thầy cô, bạn bè ở Trường rất thân thiện, cởi mở. “Tuy cách dạy và học ở đại học khác nhiều so với khi em học tập tại trường THPT nhưng được sự hướng dẫn nhiệt tình, cùng phương pháp giảng dạy hướng đến sự chủ động cho sinh viên của thầy cô đã khiến những môn học đầu khóa trở nên rất thu hút với em. Em mong mình sẽ cố gắng nhiều hơn nữa để có một tương lai tốt đẹp sau khi ra trường” – Phồng nói.\r\n\r\n     Chia sẻ về việc xa nhà học đại học, bạn Châu Ngọc Trân, sinh viên khóa 3, ngành Ngôn ngữ Anh, Trường ĐHKG cho biết môi trường học tập và nơi sống mới khiến Trân có nhiều bỡ ngỡ và không tránh khỏi những lo lắng. Trải qua 2 tuần học tập và sinh hoạt tại khu ký túc xá Trường ĐHKG Trân đã bắt đầu làm quen mọi thứ. “Khu ký túc xá nằm ngay trong khuôn viên Trường rất sạch sẽ, tiện nghi, an toàn, thuận tiện cho việc học nên em cảm thấy rất yên tâm khi sống và sinh hoạt tại phòng cùng các bạn. Cuộc sống xa nhà tuy mới bắt đầu nhưng em nhận được rất nhiều sự quan tâm, chia sẻ của các bạn, đây sẽ là động lực giúp em học tập tốt hơn” – Trân nói.\r\n\r\n     Theo đồng chí Lê Việt Khái, để thúc đẩy các hoạt động giao lưu, văn hóa, văn nghệ góp phần tạo sân chơi lành mạnh, năng động cho sinh viên khóa mới, tăng cường sự đoàn kết giữa sinh viên các khóa và các bạn sinh viên nước ngoài, tối ngày 19/9 Trường Đại học Kiên Giang sẽ tổ chức đêm văn nghệ “Chương trình chào đón tân sinh viên khóa 3 năm học 2017-2018”. Đặc biệt, trong chương trình sẽ có sự góp mặt giao lưu của các giảng viên, sinh viên Trường Đại học Anđalas, Indonesia. Đây sẽ là dịp để sinh viên Trường ĐHKG có thể giao lưu, học hỏi và mở rộng kiến thức về văn hóa, mang đến nhiều điều bổ ích cho sinh viên.\r\n\r\n\r\n     Hiện tại, Đoàn trường ĐHKG đang tích cực chuẩn bị các tiết mục ca múa truyền thống dân tộc, truyền thống đấu tranh cách mạng, phong trào sinh viên, Đoàn TNCS Hồ Chí Minh, Hội Sinh viên Việt Nam... Với nội dung ca ngợi Đảng, Bác Hồ kính yêu, ca ngợi quê hương, con người lao động sản xuất và bảo vệ Tổ quốc, những thành tựu trong quá trình đổi mới của đất nước trong thời kỳ hội nhập... \r\n\r\n     Bên cạnh đó, Đoàn trường ĐHKG còn đang lên kế hoạch phối hợp với Công ty Mobiphone Khu vực 9 tổ chức chương trình “Kết nối không giới hạn”, trao học bổng cho sinh viên nghèo vượt khó của Trường.\r\n\r\n\r\nSinh viên khóa 3, ngành Công nghệ kỹ thuật Xây dựng trong giờ học\r\n\r\n\r\n\r\nSinh viên khóa 3 phấn khởi đến trường tham gia học tập', 1, 1, '2018-05-09', 0, 0, 0),
(23, 'Công đoàn Trường Đại học Kiên Giang tổ chức cuộc thi hát Bolero chào mừng 8/3', '5.jpg', 'Thiết thực chào mừng Đại hội Công đoàn Giáo dục Việt Nam nhiệm kỳ XV (2018 – 2023) và Ngày Quốc tế Phụ nữ 8/3, chiều ngày 7/3, Công đoàn Trường Đại học Kiên Giang đã tổ chức cuộc thi “Tiếng hát Bolero Đại học Kiên Giang”.', 'LT06', 'Thiết thực chào mừng Đại hội Công đoàn Giáo dục Việt Nam nhiệm kỳ XV (2018 – 2023) và Ngày Quốc tế Phụ nữ 8/3, chiều ngày 7/3, Công đoàn Trường Đại học Kiên Giang đã tổ chức cuộc thi “Tiếng hát Bolero Đại học Kiên Giang”.\r\n\r\n     ThS. Huỳnh Kim Thủy – Phó Chủ tịch Công đoàn Trường ĐHKG phát biểu khai mạc cuộc thi\r\n     Phát biểu khai mạc, ThS. Huỳnh Kim Thủy – Phó Chủ tịch Công đoàn Trường Đại học Kiên Giang, cho biết cuộc thi là sân chơi nhằm hội tụ, phát huy khả năng ca hát, trao đổi kinh nghiệm, học tập về văn hóa văn nghệ. Qua đó giúp tăng cường giao lưu, phối hợp, thắt chặt mối quan hệ hợp tác, đoàn kết.\r\n     Ban Giám khảo cuộc thi “Tiếng hát Bolero Đại học Kiên Giang”\r\n      ThS. Huỳnh Kim Thủy – Phó Chủ tịch Công đoàn Trường ĐHKG tặng cờ lưu niệm cho các tổ công đoàn\r\n\r\nNgay sau chương trình khai mạc, có 24 tiết mục hát đơn ca và song ca đến từ 7 tổ công đoàn được thể hiện với tinh thần vui vẻ, giao lưu, mang tính học hỏi cao. Các thí sinh đã thể hiện các ca khúc bolero xưa và nay đậm chất truyền thống, trữ tình đầy sâu lắng về tình yêu quê hương, đất nước, tình yêu đôi lứa, ca ngợi người phụ nữ trong chiến đấu, lao động, sản xuất… Cuộc thi đã thu hút sự ủng hộ nhiệt tình của đông đảo công đoàn viên trong Nhà trường.\r\n\r\n\r\n\r\nTiết mục hát song ca của cặp thí sinh Đỗ Thị Kim Phương – Huỳnh Ngọc Thúy\r\n\r\n\r\n\r\nCa sĩ Quỳnh Anh hát giao lưu tại cuộc thi\r\n\r\n\r\n\r\nNhạc sĩ Dương Minh Đức nhận xét sau khi các thí sinh hoàn thành phần thi của mình\r\n\r\nSau cuộc thi, về hình thức đơn ca giải nhất thuộc về thí sinh Đoàn Cẩm Nhung với ca khúc “Chuyện tình quán bên hồ”; giải nhì thuộc về thí sinh Huỳnh Ngọc Thúy với ca khúc “Phận tơ tằm”; giải ba thuộc về thí sinh Nguyễn Hoàng Thiên với ca khúc “Vợ tôi”; 2 giải khuyến khích thuộc về thí sinh Lê Quang Thiện và thí sinh Trịnh Khắc Thái.\r\n\r\n\r\n\r\nPGS.TS. Thái Thành Lượm – Hiệu trưởng Trường ĐHKG trao giấy khen cho các thí sinh đạt giải nhất, nhì, ba\r\n\r\n\r\n\r\nTS. Nguyễn Tuấn Khanh – Phó Hiệu trưởng Trường ĐHKG trao giấy khen cho 2 thí sinh đạt giải khuyến khích\r\n\r\nVề hình thức song ca, giải nhất thuộc về cặp thí sinh Đoàn Cẩm Nhung – Trần Bảo Ngọc với ca khúc “Đính ước”; giải nhì thuộc về cặp thí sinh Ngô Thị Thanh Vân – Nguyễn Hoàng Thiên với ca khúc “Ngày xưa anh nói”; giải ba thuộc về cặp thí sinh Đỗ Thị Kim Phương – Huỳnh Ngọc Thúy với ca khúc “Duyên phận”; 2 giải khuyến khích thuộc về cặp thí sinh Lâm Đông Hồ - Nguyễn Thị Tô Lan và cặp thí sinh Nguyễn Thị Thanh Vy – Nguyễn Thị Thanh Phương.\r\n\r\n\r\n\r\nNhạc sĩ Dương Minh Đức trao giấy khen giải nhất cho thí sinh Đoàn Cẩm Nhung – Trần Bảo Ngọc\r\n\r\n\r\n\r\nCô Nguyễn Thị Tuyết Vân – Nguyên Hiệu trưởng Trường Văn hóa Nghệ thuật tỉnh Kiên Giang trao giấy khen giải nhì cho thí sinh Ngô Thị Thanh Vân – Nguyễn Hoàng Thiên\r\n\r\n\r\n\r\nCa sĩ Quỳnh Anh trao giấy khen giải ba cho thí sinh Đỗ Thị Kim Phương – Huỳnh Ngọc Thúy\r\n\r\n\r\n\r\nThS. Huỳnh Kim Thủy – Phó Chủ tịch Công đoàn Trường ĐHKG trao giấy khen giải khuyến khích cho các thí sinh\r\n\r\nKết thúc cuộc thi, tổ Công đoàn Đào tạo nhận giải toàn đoàn.\r\n\r\n\r\n\r\nPGS.TS. Thái Thành Lượm – Hiệu trưởng Trường ĐHKG trao giấy khen toàn đoàn cho đại diện tổ Công đoàn Đào tạo\r\n\r\nMột số hình ảnh khác tại cuộc thi “Tiếng hát Bolero Đại học Kiên Giang”\r\n\r\n\r\n\r\nĐại diện Công đoàn trường tặng hoa cho nữ công đoàn\r\n\r\n\r\n\r\nTS. Nguyễn Tuấn Khanh – Phó Hiệu trưởng Trường ĐHKG tặng hoa cho 2 nữ Ban Giám khảo\r\n\r\n\r\n\r\nThí sinh thể hiện tại cuộc thi “Tiếng hát Bolero Đại học Kiên Giang”', 1, 1, '2018-05-09', 0, 0, 0),
(24, ' Khởi động Tháng Thanh niên tỉnh Kiên Giang 2018', '3.jpg', 'Sáng ngày 06/3, tại Nhà Bia tưởng niệm liệt sĩ, anh hùng lực lượng vũ trang nhân dân Mai Thị Nương (Giồng Riềng), Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 đã tổ chức Lễ khởi động Tháng Thanh niên 2018 với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”.', 'LT06', 'Tham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.\r\n     Phát biểu tại lễ khởi động, đồng chí Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đề nghị đoàn thanh niên các cấp quán triệt sâu sắc ý nghĩa, mục tiêu, nhiệm vụ của Tháng Thanh niên năm 2018; phát huy cao độ tinh thần đoàn kết nhất trí, năng động sáng tạo, xung kích tình nguyện, tham gia giải quyết những việc khó, những vấn đề bức xúc mà xã hội đang cần ở tuổi trẻ; lựa chọn nội dung trọng tâm, trọng điểm, phù hợp với điều kiện, khả năng của tổ chức Đoàn ở mỗi cấp, mỗi địa phương, đơn vị để có kế hoạch thực hiện; trong đó, chú trọng các hoạt động hỗ trợ thanh niên khởi nghiệp, phát triển kinh tế, khuyến khích làm giàu chính đáng và giảm nghèo bền vững; cùng với các hoạt động xây dựng đời sống văn hóa, nếp sống văn minh; bảo vệ môi trường, ứng phó với biến đổi khí hậu, xây dựng cảnh quan môi trường xanh, sạch, đẹp; đảm bảo trật tự an toàn giao thông, an toàn xã hội và xây dựng tổ chức Đoàn vững mạnh trên địa bàn dân cư.\r\n     \r\nSáng ngày 06/3, tại Nhà Bia tưởng niệm liệt sĩ, anh hùng lực lượng vũ trang nhân dân Mai Thị Nương (Giồng Riềng), Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 đã tổ chức Lễ khởi động Tháng Thanh niên 2018 với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”.\r\n\r\n\r\nHơn 500 ĐVTN huyện Giồng Riềng tham dự lễ khởi động Tháng Thanh niên 2018\r\n\r\nTham dự Lễ khởi động có các đồng chí: Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh; Lê Hồng Thắm - Tỉnh ủy viên, Phó trưởng Ban Dân vận Tỉnh ủy; Lê Trung Hồ - Ủy viên Ban Chấp hành Trung ương Đoàn, Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018; cùng các đồng chí Thường trực, Ban Thường vụ Tỉnh đoàn, lãnh đạo Huyện ủy, UBND, các Ban, Ngành, Đoàn thể huyện Giồng Riềng; đại diện các trường Cao đẳng, Đại học trên địa bàn tỉnh Kiên Giang và trên 500 đoàn viên, thanh niên đến từ các cơ sở đoàn trong huyện Giồng Riềng.\r\n\r\n\r\n\r\nThS. Nguyễn Văn Thành cùng các đại biểu dâng hương tưởng niệm liệt sĩ, anh hùng lực lượng vũ trang nhân dân Mai Thị Nương\r\n\r\nPhát biểu tại lễ khởi động, đồng chí Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đề nghị đoàn thanh niên các cấp quán triệt sâu sắc ý nghĩa, mục tiêu, nhiệm vụ của Tháng Thanh niên năm 2018; phát huy cao độ tinh thần đoàn kết nhất trí, năng động sáng tạo, xung kích tình nguyện, tham gia giải quyết những việc khó, những vấn đề bức xúc mà xã hội đang cần ở tuổi trẻ; lựa chọn nội dung trọng tâm, trọng điểm, phù hợp với điều kiện, khả năng của tổ chức Đoàn ở mỗi cấp, mỗi địa phương, đơn vị để có kế hoạch thực hiện; trong đó, chú trọng các hoạt động hỗ trợ thanh niên khởi nghiệp, phát triển kinh tế, khuyến khích làm giàu chính đáng và giảm nghèo bền vững; cùng với các hoạt động xây dựng đời sống văn hóa, nếp sống văn minh; bảo vệ môi trường, ứng phó với biến đổi khí hậu, xây dựng cảnh quan môi trường xanh, sạch, đẹp; đảm bảo trật tự an toàn giao thông, an toàn xã hội và xây dựng tổ chức Đoàn vững mạnh trên địa bàn dân cư.\r\n\r\n\r\n\r\nĐ/c Mai Văn Huỳnh - Ủy viên Ban Thường vụ Tỉnh ủy, Phó Chủ tịch UBND tỉnh đánh trống phát động Tháng thanh niên tỉnh Kiên Giang năm 2018\r\n\r\nĐồng chí Lê Trung Hồ - Bí thư Tỉnh đoàn, Trưởng Ban Chỉ đạo Tháng Thanh niên tỉnh Kiên Giang 2018 cho biết, với chủ đề “Tuổi trẻ sáng tạo, lập nghiệp, dựng xây quê hương”, Tỉnh đoàn đề ra một số mục tiêu thiết thực, cụ thể, như: Đoàn cấp huyện và 100% cơ sở Đoàn tổ chức tuyên truyền về Tháng Thanh niên, tổ chức kỷ niệm 87 năm Ngày thành lập Đoàn TNCS Hồ Chí Minh; tuyên truyền về Nghị quyết Đại hội Đoàn TNCS Hồ Chí Minh tỉnh Kiên Giang lần thứ X nhiệm kỳ 2017- 2022; 100% Đoàn cấp huyện và tương đương triển khai cuộc vận động “Mỗi thanh niên một ý tưởng sáng tạo” do Trung ương Đoàn phát động; tổ chức ngày hội tuổi trẻ sáng tạo hoặc diễn đàn sáng tạo trẻ; tham gia các cuộc thi do tỉnh tổ chức; mỗi cơ sở Đoàn có ít nhất 01 công trình hoặc phần việc thanh niên, ít nhất 03 hoạt động tham gia xây dựng nông thôn mới hoặc đô thị văn minh; 100% Đoàn xã, Phường, Thị trấn duy trì và thành lập mới mô hình thanh niên làm kinh tế; tư vấn, hướng nghiệp 4.500 đoàn viên, thanh niên; dạy nghề cho 1.200 đoàn viên, thanh niên; giới thiệu việc làm cho 4.500 thanh niên; giải quyết việc làm cho 2.500 thanh niên; mỗi Đoàn xã, Phường, Thị trấn tiếp nhận giúp đỡ ít nhất 01 thanh thiếu niên chậm tiến; 100% Đoàn cấp huyện có hoạt động hỗ trợ thanh niên khởi nghiệp; phối hợp mở 50 lớp chuyển giao khoa học kỹ thuật; xây dựng 15 Tổ hợp tác thanh niên; phát triển 6.500 đoàn viên mới; giới thiệu 800 đoàn viên ưu tú cho Đảng xem xét, chăm bồi; phát triển ít nhất 01 tổ chức cơ sở Đoàn, 01 tổ chức Hội trong doanh nghiệp ngoài Nhà nước; 100% các Huyện, Thị, Thành đoàn đồng loạt tổ chức 04 “Ngày Thứ bảy tình nguyện hỗ trợ nhân dân về thủ tục hành chính”; 100% Đoàn cấp huyện và tương đương tổ chức Ngày Đoàn viên; 100% cơ sở Đoàn tổ chức trao danh sách đoàn viên ưu tú cho Đảng.\r\n\r\nSau lễ khởi động, Tỉnh đoàn khởi công xây dựng 1 căn nhà thanh niên, ra mắt 2 tổ hợp tác thanh niên, khai giảng lớp dạy bơi cho thiếu nhi, ra quân thực hiện tuyến đường xanh – sạch – đẹp trên địa bàn huyện Giồng Riềng.\r\n', 1, 1, '2018-05-09', 0, 0, 0);
INSERT INTO `goibantin` (`idtingoi`, `tieude`, `avata`, `trichdan`, `maloaitin`, `noidung`, `idtk`, `capdotruycap`, `ngaygoi`, `daduyet`, `chuaduyet`, `tuchoi`) VALUES
(25, 'Phát động “Tháng nhân đạo” và “Chiến dịch những giọt máu hồng” hè 2018', 'IMG_4065.jpg', '\r\nSáng ngày 8/5, Ban chỉ đạo vận động hiến máu tình nguyện tỉnh Kiên Giang phối hợp với Trường Đại học Kiên Giang tổ chức lễ phát động “Tháng nhân đạo” và “Chiến dịch những giọt máu hồng” hè 2018.', 'LT06', 'Đến tham dự buổi lễ có ông Lưu Kim Oai – Chủ tịch Hội chữ thập đỏ tỉnh Kiên Giang, Phó ban Chỉ đạo hiến máu tình nguyện tỉnh; ông Trần Quang Bảo – Phó Giám đốc Sở Giáo dục và Đào tạo tỉnh Kiên Giang; anh Lê Trung Hồ - Bí thư Tỉnh đoàn Kiên Giang, Phó ban Chỉ đạo hiến máu tình nguyện tỉnh; ThS. Nguyễn Văn Thành – Phó Hiệu trưởng Trường Đại học Kiên Giang; ThS. Lê Việt Khái – Trưởng phòng Công tác sinh viên, Bí thư Đoàn trường Đại học Kiên Giang; cùng gần 700 đoàn viên thanh niên.\r\n\r\n“Tháng nhân đạo” và “Chiến dịch những giọt máu hồng” hè năm 2018 với chủ đề “nhân đạo – từ nhận thức tới hành động”, “Hiến máu cứu người, sinh hiến thường xuyên” nhằm đề cao nhận thức, ý thức và hành động thực tiễn của cán bộ, Đảng viên, hội viên và các tầng lớp nhân dân đối với hoạt động nhân đạo.\r\n\r\nTháng nhân đạo sẽ bắt đầu từ ngày 1/5 đến ngày 31/5, với nhiều hoạt động như: hiến máu tình nguyện; trợ giúp vốn phát triển sản xuất; Ngân hàng bò sinh sản, hỗ trợ xây nhà chữ thập đỏ; khởi công công trình nhân đạo cầu, điện thắp sáng, trường học, xe cứu thương; tổ chức khám bệnh, tư vấn sức khỏe, cấp thuốc miễn phí, tặng quà; phòng ngừa, ứng phó thảm họa, và xây dựng tổ chức cơ sở hội vững mạnh…\r\n“Chiến dịch những giọt máu hồng” hè năm 2018 sẽ diễn ra trong thời gian 4 tháng, từ ngày 8/5 đến ngày 2/9 với các thông điệp: Hiến máu cứu người - Một nghĩa cử cao đẹp; Mỗi giọt máu cho đi - Một cuộc đời ở lại; Hiến máu cứu người - Xin hiến thường xuyên; Kết nối Trái tim - Kết nối sự sống; Hiến máu cứu người - Bắt đầu từ nhà quản lý… nhằm tuyên truyền, vận động các tầng lớp nhân dân đủ sức khỏe tích cực tham gia hiến máu tình nguyện, đáp ứng đủ lượng máu cho cấp cứu và điều trị người bệnh trong dịp hè năm 2018.  \r\n\r\nTheo Ban chỉ đạo Hiến máu tình nguyện tỉnh Kiên Giang, trong chiến dịch, phấn đấu vận động khoảng 5.200 người đăng ký hiến máu và tiếp nhận tối thiểu 5.075 đơn vị; huy động tối thiểu 210 người hiến máu dự bị; vận động ít nhất 500 tình nguyện viên trong tỉnh tham gia tuyên truyền; phấn đấu 100% huyện, thị, thành và các cơ quan thành viên Ban Chỉ đạo tỉnh hưởng ứng “Chiến dịch những giọt máu hồng” hè 2018…\r\nSau lễ phát động, đã có gần 700 cán bộ, giảng viên, đoàn viên thanh niên Trường Đại học Kiên Giang tham gia hiến máu. Kết quả thu về được 563 đơn vị máu.\r\n\r\nĐược biết trong năm 2018, tổng chỉ tiêu hiến máu tình nguyện của Trường Đại học Kiên Giang là 1.100 đơn vị máu. Dự kiến, chiến dịch hiến máu tình nguyện  đợt 2 sẽ được diễn ra vào tháng 10 năm 2018.\r\n\r\nEm Đỗ Đăng Khoa, sinh viên khóa 1, ngành Kế toán, Trường Đại học Kiên Giang cho biết ngay từ năm nhất em đã bắt đầu hiến máu nhân đạo, và đây là lần thứ 3 em tham gia hiến. “Với em đây là một việc làm có ý nghĩa, mang tính cộng đồng cao, giúp ích cho mọi người. Em rất thích tham gia vào hoạt động này và mong người thân, bạn bè sẽ cùng em tham gia hiến máu nhân đạo” – Khoa nói.', 1, 1, '2018-05-12', 0, 0, 0),
(30, '\"Nguyện ước\" cuối của tử tù vượt ngục Thọ \"sứt\" sau khi nhận thêm bản án 7 năm', '333.jpg', 'Trước khi bị dẫn giải từ tòa về trại giam, Thọ “sứt” ngoái lại nói với người thân mua cho mình một bộ quần áo mới.', 'LT06', 'Ngày 8/5 vừa qua, TAND TP Hà Nội đã mở phiên tòa sơ thẩm xét xử vụ án “Trốn khỏi nơi giam giữ” xảy ra tại Trại tạm giam T16 - Bộ Công an đối với 2 tử tù Lê Văn Thọ (tức Thọ “sứt”, 38 tuổi quê huyện Thanh Hà, tỉnh Hải Dương) và Nguyễn Văn Tình (29 tuổi, ở huyện Quốc Oai, Hà Nội).\r\n\r\n4 bị cáo khác là Nguyễn Thị Phương Lan (người tình của Thọ “sứt”, SN 1994, trú tại phường Phả Lại, thị xã Chí Linh, Hải Dương); Nguyễn Văn Hạnh (SN 1972), Nguyễn Văn Việt (SN 1985), Nguyễn Văn Ba (SN 1989), đều trú ở xã Yên Quang, Kỳ Sơn, Hòa Bình cùng bị truy tố về tội “Che giấu tội phạm”.\r\n\r\nCáo trạng truy tố các bị cáo thể hiện, ngày 27/4/2017, Nguyễn Văn Tình bị TAND TP Hà Nội tuyên phạt tử hình về tội “Mua bán trái phép chất ma túy”. Tương tự, ngày 18/5/2017, Lê Văn Thọ cũng bị TAND tỉnh Hà Nam áp dụng hình phạt loại bỏ ra khỏi đời sống xã hội cũng về tội “Mua bán trái phép chất ma túy”.\r\n\r\nTrong thời gian kháng cáo và chờ được xét xử phúc thẩm, ngày 1/7/2017, Tình và Thọ được chuyển vào giam chung tại buồng giam số 3, khu D, Trại Tạm giam T16 - Bộ Công an. Ở cùng buồng biệt giam, 2 tử tù đều bị cùm một bên chân bằng khóa và cùm gỗ.\r\n\r\nDù vậy sau ít ngày quan sát, Thọ “sứt” nhận thấy cơ sở vật chất ở buồng giam đã cũ và xuống cấp. Cụ thể là cùm chân bằng gỗ có thể tháo ra, tường xây gạch vữa ẩm nên có thể đục khoét được… Từ đó, đối tượng nảy sinh ý định trốn khỏi nơi giam giữ.\r\n\r\nNgày 10/7/2017, Thọ “sứt” nói rõ kế hoạch bỏ trốn và rủ Tình đồng hành. Cả hai sau đó tiếp tục bàn bạc, thống nhất cách thức và cùng nhau chuẩn bị dụng cụ cho việc trốn chạy.\r\n\r\nTrong khoảng thời gian từ 16h30 đến 23h ngày 10/9/2017, bộ đôi tử tù tháo khóa cùm, xé chăn bện thành dây vải, rồi dùng đinh sắt khoét thủng tường gạch buồng biệt giam.', 7, 10, '2018-05-14', 0, 0, 0),
(31, '\"Nguyện ước\" cuối của tử tù vượt ngục Thọ \"sứt\" sau khi nhận thêm bản án 7 năm', '1526262104-7-loi-ke-nhan-chung-vu-2-hiep-si-bi-nhom-trom-xe-sh-dam-chet-cuop--1--1526258910-width660', 'Trước khi bị dẫn giải từ tòa về trại giam, Thọ “sứt” ngoái lại nói với người thân mua cho mình một bộ quần áo mới.', 'LT06', 'Ngày 8/5 vừa qua, TAND TP Hà Nội đã mở phiên tòa sơ thẩm xét xử vụ án “Trốn khỏi nơi giam giữ” xảy ra tại Trại tạm giam T16 - Bộ Công an đối với 2 tử tù Lê Văn Thọ (tức Thọ “sứt”, 38 tuổi quê huyện Thanh Hà, tỉnh Hải Dương) và Nguyễn Văn Tình (29 tuổi, ở huyện Quốc Oai, Hà Nội).\r\n\r\n4 bị cáo khác là Nguyễn Thị Phương Lan (người tình của Thọ “sứt”, SN 1994, trú tại phường Phả Lại, thị xã Chí Linh, Hải Dương); Nguyễn Văn Hạnh (SN 1972), Nguyễn Văn Việt (SN 1985), Nguyễn Văn Ba (SN 1989), đều trú ở xã Yên Quang, Kỳ Sơn, Hòa Bình cùng bị truy tố về tội “Che giấu tội phạm”.\r\n\r\nCáo trạng truy tố các bị cáo thể hiện, ngày 27/4/2017, Nguyễn Văn Tình bị TAND TP Hà Nội tuyên phạt tử hình về tội “Mua bán trái phép chất ma túy”. Tương tự, ngày 18/5/2017, Lê Văn Thọ cũng bị TAND tỉnh Hà Nam áp dụng hình phạt loại bỏ ra khỏi đời sống xã hội cũng về tội “Mua bán trái phép chất ma túy”.\r\nTrong thời gian kháng cáo và chờ được xét xử phúc thẩm, ngày 1/7/2017, Tình và Thọ được chuyển vào giam chung tại buồng giam số 3, khu D, Trại Tạm giam T16 - Bộ Công an. Ở cùng buồng biệt giam, 2 tử tù đều bị cùm một bên chân bằng khóa và cùm gỗ.\r\n\r\nDù vậy sau ít ngày quan sát, Thọ “sứt” nhận thấy cơ sở vật chất ở buồng giam đã cũ và xuống cấp. Cụ thể là cùm chân bằng gỗ có thể tháo ra, tường xây gạch vữa ẩm nên có thể đục khoét được… Từ đó, đối tượng nảy sinh ý định trốn khỏi nơi giam giữ.\r\n\r\nNgày 10/7/2017, Thọ “sứt” nói rõ kế hoạch bỏ trốn và rủ Tình đồng hành. Cả hai sau đó tiếp tục bàn bạc, thống nhất cách thức và cùng nhau chuẩn bị dụng cụ cho việc trốn chạy.\r\n\r\nTrong khoảng thời gian từ 16h30 đến 23h ngày 10/9/2017, bộ đôi tử tù tháo khóa cùm, xé chăn bện thành dây vải, rồi dùng đinh sắt khoét thủng tường gạch buồng biệt giam.', 1, 2, '2018-05-14', 0, 0, 0),
(32, 'Phòng thí nghiệm trên cơ thể người của phát xít Nhật hồi Thế chiến II ', '444.jpg', 'Những thí nghiệm man rợ được thực hiện mà không sử dụng bất kì loại thuốc gây tê nào.', 'LT06', 'Đơn vị 731 được phát xít Nhật thành lập năm 1936 tại vùng Cáp Nhĩ Tân, đông bắc Trung Quốc ngày nay. Đây là đơn vị có nhiệm vụ thực hiện các cuộc thí nghiệm trên người nhằm đánh giá khả năng của các loại vũ khí hóa học và sinh học.\r\nTheo Daily Mail, ít nhất 3.000 người đã thiệt mạng - chủ yếu là người dân Trung Quốc và một số tù nhân chiến tranh của phe Đồng minh - vì bị phanh thây khi còn sống, bị tiêm virus dịch hạch và các loại bệnh truyền nhiễm chết người khác.\r\nNgày nay, địa điểm của đơn vị 731 được chuyển thành viện bảo tàng để đánh dấu một thời kì đen tối trong lịch sử phát xít Nhật. Một dãy nhà vẫn được bảo tồn, là nơi từng giam giữ những tù nhân Trung Quốc. Cũng chính tại đây, họ bị các bác sĩ và nhà khoa học Nhật Bản tiêm vi khuẩn dịch hạch lên người.\r\nNhững cuộc thử nghiệm trên người không sử dụng bất kì loại thuốc gây mê hay giảm đau nào. Các nhà khoa học Nhật Bản lí giải đây là nhằm tìm hiểu chính xác cơ chế truyền bệnh và tránh bị ảnh hưởng bởi các loại thuốc khác.', 1, 2, '2018-05-14', 0, 0, 0),
(33, 'Đua lên mạng tìm phụ kiện xế hộp \"lạc trôi\" sau mưa lớn', 'xe.jpg', 'Nhiều người lên mạng tìm, trả phụ kiện, biển số xế hộp bị \"lạc trôi\" tại Hà Nội trong cơn mưa lớn đêm 12/5.', 'LT06', 'Sáng nay, 13/5, mạng xã hội chia sẻ hình ảnh một chiếc ba đờ sốc được gá ở cổng đình làng Cót, Hà Nội với lời nhắn dí dỏm: \"Bác nào hôm qua bị sóng đánh \"tụt quần\" thì qua cổng đình làng Cót rước về nhé\".\r\n\r\nNgười đọc tưởng chuyện đùa thì ngay sau đó, trên một số diễn đàn ô tô, xe máy xuất hiện tài khoản Bao Bao nhờ tìm kiếm giúp chiếc ba đờ sốc xế hộp bị sóng đánh bung: “Tối hôm qua, em có đi từ cầu Thăng Long ra Võ Chí Công rồi qua cầu Cót, Nguyễn Khang, Trung Kính. Do trời mưa to quá nên em đã bị rơi ba đờ sốc trước. Có bác nào nhặt được làm ơn cho em chuộc lại…”. Kèm thông tin này, tài khoản Bao Bao cũng đăng hình ảnh chiếc ô tô nhãn hiệu Hyundai BKS 30E 277.58 có ba đờ sốc kèm biển trùng khớp với chiếc được gá tại cổng đình làng Cót! \r\nCâu chuyện bị \"lạc trôi\" phụ kiện trong cơn mưa lớn đêm 12/5 tại Hà Nội của tài khoản Bao Bao không phải là duy nhất. Anh Trần Trung Linh tối 12/5 cũng bị rơi biển số xe ô tô 30A 623.11 và lên mạng xã hội nhờ tìm giúp. Ngay sau đó, một số người vào bình luận đã gửi cho anh Linh ảnh tấm biển đang treo trên gốc cây ở phố Vương Thừa Vũ với lời nhắn: \"Cụ nào hôm qua bị sóng đánh bay mất biển thì qua 37 Vương Thừa Vũ nhận lại nhé\". Anh Trần Trung Linh đã có một phen mừng hụt bởi biển số treo gốc cây là 30A 261.11, gần trùng với biển của anh đánh rơi! \r\nCòn nhiều, rất nhiều xế hộp bị \"lạc trôi\" phụ kiện, biển số sau cơn mưa lớn đêm 12/5. Và cũng rất nhiều người sau khi nhặt được biển số chủ động đăng lên mạng xã hội để tìm cơ hội trả lại cho chủ nhân.', 1, 2, '2018-05-14', 0, 0, 0),
(34, '	hoa bay phấp phới khiến bao người xốn xang.', 'chonau.jpg', 'Nhiều khu vực ở trung tâm Sài Gòn nhuộm vàng bởi những cánh hoa dầu, mỗi khi có gió, hoa bay phấp phới khiến bao người xốn xang.', 'LT05', 'Cây dầu xuất hiện nhiều tuyến đường ở khu vực trung tâm TP.HCM khoảng 100 năm trước do người Pháp trồng để che bóng mát, lọc không khí. Dọc các con đường như: Phạm Ngọc Thạch, Mạc Đĩnh Chi, Trương Định, khu hồ Con Rùa, công viên 30.4, Công viên Tao Đàn…đều được phủ mát bởi những cây dầu cao vút.', 1, 2, '2018-05-14', 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaitin`
--

CREATE TABLE `loaitin` (
  `maloaitin` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `tenloaitin` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loaitin`
--

INSERT INTO `loaitin` (`maloaitin`, `tenloaitin`) VALUES
('LT03', 'An Ninh Quốc Phòng'),
('LT02', 'Khoc Học Công Nghệ'),
('LT01', 'Thể Thao'),
('LT05', 'Tin Khác'),
('LT06', 'Tin tứ - Sự Kiện'),
('LT04', 'Văn Nghệ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `idtk` int(11) NOT NULL,
  `tendangnhap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `matkhau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `capdotruycap` int(1) NOT NULL DEFAULT '10',
  `mstt` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ngaytao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`idtk`, `tendangnhap`, `matkhau`, `capdotruycap`, `mstt`, `ngaytao`) VALUES
(1, 'admin', 'admin1', 2, '1501206121', '2018-05-05'),
(2, 'admin1', 'admin1', 2, '1501206027', '2018-05-05'),
(3, 'admin3', 'admin3', 10, '1501206001', '2018-05-11'),
(6, 'admin4', 'admin4', 10, '1501206002', '2018-05-11'),
(7, 'admin5', 'admin5', 10, '1501206003', '2018-05-11'),
(8, 'admin0', 'admin0', 0, '1501206000', '2018-05-13'),
(9, 'admin1234', 'admin1234', 2, '1501206000', '2018-05-14'),
(10, 'admin12345', '12312323', 2, '1234567899', '0000-00-00'),
(11, 'admin9999', '12312323', 2, '1234567800', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongtintaikhoan`
--

CREATE TABLE `thongtintaikhoan` (
  `mstt` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hoten` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `gioitinh` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `madoankhoa` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thongtintaikhoan`
--

INSERT INTO `thongtintaikhoan` (`mstt`, `hoten`, `gioitinh`, `ngaysinh`, `madoankhoa`, `sdt`, `email`) VALUES
('1234567800', '1', 'Nam', '1997-04-04', 'CNTP', '1234567890', '1@1.vb'),
('1234567890', '1', 'Nam', '1997-04-04', 'CNTP', '1234567890', '1@1.vb'),
('1234567891', '1', 'Nam', '1997-04-04', 'CNTP', '1234567890', '1@1.vb'),
('1234567892', '1', 'Nam', '1997-04-04', 'CNTP', '1234567890', '1@1.vb'),
('1234567899', '1', 'Nam', '1997-04-04', 'CNTP', '1234567890', '1@1.vb'),
('1501206000', 'Đặng Võ Nhật Lam', 'Nữ', '1997-08-15', 'KTDL', '0987654321', ''),
('1501206001', 'Phạm Minh Bổn', 'Nam', '1996-01-01', 'TTTT', '01219659225', ''),
('1501206002', 'Phạm Hữu Nghĩa', 'Nam', '1997-01-02', 'TTTT', '0987654321', ''),
('1501206003', 'Phạm Thị Thoại Chi', 'Nữ', '1997-05-19', 'TTTT', '0987654322', ''),
('1501206027', 'Trần Thị Quỳnh Giao', 'Nữ', '1997-11-03', 'TTTT', '01866837004', 'ttqgiao0311@gmail.com'),
('1501206121', 'Võ Thiện Tiên', 'Nam', '1992-03-08', 'TTTT', '01219659225', 'votien8392@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vanban`
--

CREATE TABLE `vanban` (
  `stt` int(11) NOT NULL,
  `sohieu` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `ngaybanhanh` date NOT NULL,
  `maloaivanban` char(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `word`
--

CREATE TABLE `word` (
  `idw` int(11) NOT NULL,
  `tenw` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `word`
--

INSERT INTO `word` (`idw`, `tenw`) VALUES
(1, 'bainhom_NCKH_QLKTX.doc');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bantin`
--
ALTER TABLE `bantin`
  ADD PRIMARY KEY (`idtin`),
  ADD KEY `idtk` (`idtk`),
  ADD KEY `maloaitin` (`maloaitin`);

--
-- Chỉ mục cho bảng `chucvu`
--
ALTER TABLE `chucvu`
  ADD PRIMARY KEY (`machucvudoan`),
  ADD UNIQUE KEY `ten` (`ten`);

--
-- Chỉ mục cho bảng `cochucvu`
--
ALTER TABLE `cochucvu`
  ADD PRIMARY KEY (`mstt`,`machucvudoan`,`madoankhoa`),
  ADD KEY `machucvudoan` (`machucvudoan`),
  ADD KEY `madoankhoa` (`madoankhoa`);

--
-- Chỉ mục cho bảng `doankhoa`
--
ALTER TABLE `doankhoa`
  ADD PRIMARY KEY (`madoankhoa`),
  ADD UNIQUE KEY `tendoankhoa` (`tendoankhoa`);

--
-- Chỉ mục cho bảng `goibantin`
--
ALTER TABLE `goibantin`
  ADD PRIMARY KEY (`idtingoi`),
  ADD KEY `iktk` (`idtk`),
  ADD KEY `maloaitin` (`maloaitin`);

--
-- Chỉ mục cho bảng `loaitin`
--
ALTER TABLE `loaitin`
  ADD PRIMARY KEY (`maloaitin`),
  ADD UNIQUE KEY `tenloaitin` (`tenloaitin`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`idtk`),
  ADD UNIQUE KEY `tendangnhap` (`tendangnhap`),
  ADD KEY `mstt` (`mstt`);

--
-- Chỉ mục cho bảng `thongtintaikhoan`
--
ALTER TABLE `thongtintaikhoan`
  ADD PRIMARY KEY (`mstt`),
  ADD KEY `madoankhoa` (`madoankhoa`);

--
-- Chỉ mục cho bảng `vanban`
--
ALTER TABLE `vanban`
  ADD PRIMARY KEY (`stt`);

--
-- Chỉ mục cho bảng `word`
--
ALTER TABLE `word`
  ADD PRIMARY KEY (`idw`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `goibantin`
--
ALTER TABLE `goibantin`
  MODIFY `idtingoi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `idtk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `word`
--
ALTER TABLE `word`
  MODIFY `idw` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bantin`
--
ALTER TABLE `bantin`
  ADD CONSTRAINT `bantin_ibfk_1` FOREIGN KEY (`idtk`) REFERENCES `taikhoan` (`idtk`),
  ADD CONSTRAINT `bantin_ibfk_2` FOREIGN KEY (`maloaitin`) REFERENCES `loaitin` (`maloaitin`),
  ADD CONSTRAINT `bantin_ibfk_3` FOREIGN KEY (`idtin`) REFERENCES `goibantin` (`idtingoi`);

--
-- Các ràng buộc cho bảng `cochucvu`
--
ALTER TABLE `cochucvu`
  ADD CONSTRAINT `cochucvu_ibfk_1` FOREIGN KEY (`machucvudoan`) REFERENCES `chucvu` (`machucvudoan`),
  ADD CONSTRAINT `cochucvu_ibfk_2` FOREIGN KEY (`madoankhoa`) REFERENCES `doankhoa` (`madoankhoa`),
  ADD CONSTRAINT `cochucvu_ibfk_3` FOREIGN KEY (`mstt`) REFERENCES `thongtintaikhoan` (`mstt`);

--
-- Các ràng buộc cho bảng `goibantin`
--
ALTER TABLE `goibantin`
  ADD CONSTRAINT `goibantin_ibfk_1` FOREIGN KEY (`idtk`) REFERENCES `taikhoan` (`idtk`),
  ADD CONSTRAINT `goibantin_ibfk_2` FOREIGN KEY (`maloaitin`) REFERENCES `loaitin` (`maloaitin`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`mstt`) REFERENCES `thongtintaikhoan` (`mstt`);

--
-- Các ràng buộc cho bảng `thongtintaikhoan`
--
ALTER TABLE `thongtintaikhoan`
  ADD CONSTRAINT `thongtintaikhoan_ibfk_1` FOREIGN KEY (`madoankhoa`) REFERENCES `doankhoa` (`madoankhoa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

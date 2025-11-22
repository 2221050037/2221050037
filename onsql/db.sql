CREATE DATABASE  IF NOT EXISTS  quan_ly_web_phim;
 USE quan_ly_xem_phim;
create DATABASE IF not EXISTS quan_ly_web_phim;

1. thể loại
    - id int primary key
    - ten_the_loai varchar(50)
CREATE TABLE IF NOT EXISTS the_loai(
    id INT PRIMARY KEY,
    ten_the_loai VARCHAR(50)
);
2. người dùng
    - id int
    - ten_dang_nhap varchar(50)
    - matKhau varchar(50)
    - ho_ten varchar(50)
    - email varchar(50)
    - sdt varchar(10)
    - vai_tro_id int 
    - ngay_sinh datetime
CREATE TABLE IF NOT EXISTS nguoi_dung(
    id INT PRIMARY KEY,
    ten_dang_nhap VARCHAR(50),
    matKhau VARCHAR(50),
    ho_ten VARCHAR(50),
    email VARCHAR(50),
    sdt VARCHAR(10),
    vai_tro_id INT,
    ngay_sinh DATETIME,
    FOREIGN KEY (vai_tro_id) REFERENCES vai_tro(id)
);

3. vai_tro
    - id int
    - ten_vai_tro varchar(20)
CREATE TABLE IF NOT EXISTS vai_tro(
    id INT PRIMARY KEY,
    ten_vai_tro VARCHAR(20)
);
4. phim
    - id int primary key
    - ten_phim varchar
    - dao_dien_id int
    - nam_phat_hanh int
    - poster varchar
    - quoc_gia_id int
    - so_tap int
    - trailer varchar
    - mo_ta text
CREATE TABLE IF NOT EXISTS phim(
    id INT PRIMARY KEY,
    ten_phim VARCHAR,
    dao_dien_id INT,
    nam_phat_hanh INT,
    poster VARCHAR,
    quoc_gia_id INT,
    so_tap INT,
    trailer VARCHAR,
    mo_ta TEXT,
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id),
    FOREIGN KEY (dao_dien_id) REFERENCES nguoi_dung(id)
);

5. phim_dien_vien
    - id int
    - phim_id int
    - dien_vien_id int
CREATE TABLE IF NOT EXISTS phim_dien_vien (
    id INT PRIMARY KEY,
    phim_id INT,
    dien_vien_id INT,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (dien_vien_id) REFERENCES nguoi_dung(id)
);

6. phim_the_loai
    - id int
    - phim_id int
    - the_loai_id int
CREATE TABLE IF NOT EXISTS phim_the_loai (
    id INT PRIMARY KEY,
    phim_id INT,
    the_loai_id INT,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id)
);
7. quốc gia
    -id int
    -ten_quoc_gia varchar
CREATE TABLE IF NOT EXISTS quoc_gia(
    id INT PRIMARY KEY,
    ten_quoc_gia VARCHAR
);
5. Tập phim
    - id int
    - so_tap int
    - tieu_de varchar
    - phim_id int
    - thoiLuong float 
    - trailer varchar
CREATE TABLE IF NOT EXISTS tap_phim(
    id INT PRIMARY KEY,
    so_tap INT,
    tieu_de VARCHAR,
    phim_id INT,
    thoiLuong FLOAT,
    trailer VARCHAR,
    FOREIGN KEY (phim_id) REFERENCES phim(id)
);
- Hoàn thiện CSDL để quản lý web phim
- Viết các câu lệnh để chạy nhiều lần k bị lỗi


CREATE DATABASE IF NOT EXISTS quan_ly_web_phim; 
USE quan_ly_xem_phim;
CREATE TABLE IF NOT EXISTS the_loai(
    id INT PRIMARY KEY,
    ten_the_loai VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS vai_tro(
    id INT PRIMARY KEY,
    ten_vai_tro VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS nguoi_dung(
    id INT PRIMARY KEY,
    ten_dang_nhap VARCHAR(50),
    matKhau VARCHAR(50),
    ho_ten VARCHAR(50),
    email VARCHAR(50),
    sdt VARCHAR(10),
    vai_tro_id INT,
    ngay_sinh DATETIME,
    FOREIGN KEY (vai_tro_id) REFERENCES vai_tro(id)
);
CREATE TABLE IF NOT EXISTS quoc_gia(
    id INT PRIMARY KEY,
    ten_quoc_gia VARCHAR
);
CREATE TABLE IF NOT EXISTS phim(
    id INT PRIMARY KEY,
    ten_phim VARCHAR,
    dao_dien_id INT,
    nam_phat_hanh INT,
    poster VARCHAR,
    quoc_gia_id INT,
    so_tap INT,
    trailer VARCHAR,
    mo_ta TEXT,
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id)
);
CREATE TABLE IF NOT EXISTS phim_dien_vien (
    id INT PRIMARY KEY,
    phim_id INT NOT NULL,
    dien_vien_id INT NOT NULL,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (dien_vien_id) REFERENCES nguoi_dung(id)
);
CREATE TABLE IF NOT EXISTS phim_the_loai (
    id INT PRIMARY KEY,
    phim_id INT NOT NULL,
    the_loai_id INT NOT NULL,
    FOREIGN KEY (phim_id) REFERENCES phim(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id)
);
CREATE TABLE IF NOT EXISTS tap_phim(
    id INT PRIMARY KEY,
    so_tap INT,
    tieu_de VARCHAR,
    phim_id INT,
    thoiLuong FLOAT,
    trailer VARCHAR,
    FOREIGN KEY (phim_id) REFERENCES phim(id)
);
- Viết câu lệnh để mỗi 1 bảng tạo 30 dữ liệu
INSERT INTO the_loai (id, ten_the_loai) VALUES
(1, 'Hành động'), (2, 'Tình cảm'), (3, 'Kinh dị'), (4, 'Hài'), (5, 'Trinh thám'),
(6, 'Hoạt hình'), (7, 'Phiêu lưu'), (8, 'Viễn tưởng'), (9, 'Học đường'), (10, 'Âm nhạc'),
(11, 'Thể thao'), (12, 'Chiến tranh'), (13, 'Lịch sử'), (14, 'Tâm lý'), (15, 'Gia đình'),
(16, 'Tài liệu'), (17, 'Khoa học'), (18, 'Bí ẩn'), (19, 'Hồi hộp'), (20, 'Cổ trang'),
(21, 'Pháp luật'), (22, 'Võ thuật'), (23, 'Thiếu nhi'), (24, 'Ma cà rồng'), (25, 'Zombie'),
(26, 'Siêu anh hùng'), (27, 'Hình sự'), (28, 'Tội phạm'), (29, 'Kịch'), (30, 'Hành động – Hài');
INSERT INTO vai_tro (id, ten_vai_tro) VALUES
(1,'Quản trị'),(2,'Người dùng'),(3,'Khách'),(4,'Biên tập'),(5,'Admin'),
(6,'Moderator'),(7,'Editor'),(8,'Vip'),(9,'Viewer'),(10,'Staff'),
(11,'Reviewer'),(12,'Uploader'),(13,'Tester'),(14,'Developer'),(15,'User cấp 1'),
(16,'User cấp 2'),(17,'User cấp 3'),(18,'User cấp 4'),(19,'User cấp 5'),(20,'CTV'),
(21,'Support'),(22,'Quản lý phim'),(23,'Quản lý user'),(24,'Quản lý thể loại'),(25,'Quản lý quốc gia'),
(26,'Quản lý tài khoản'),(27,'Quản lý trailer'),(28,'Quản lý diễn viên'),(29,'Quản lý đạo diễn'),(30,'User đặc biệt');
INSERT INTO quoc_gia (id, ten_quoc_gia) VALUES
(1,'Việt Nam'),(2,'Hàn Quốc'),(3,'Nhật Bản'),(4,'Trung Quốc'),(5,'Mỹ'),
(6,'Anh'),(7,'Canada'),(8,'Thái Lan'),(9,'Pháp'),(10,'Đức'),
(11,'Ý'),(12,'Tây Ban Nha'),(13,'Nga'),(14,'Ấn Độ'),(15,'Úc'),
(16,'Mexico'),(17,'Brazil'),(18,'Philippines'),(19,'Singapore'),(20,'Malaysia'),
(21,'Indonesia'),(22,'Thổ Nhĩ Kỳ'),(23,'Thụy Điển'),(24,'Na Uy'),(25,'Đan Mạch'),
(26,'Hà Lan'),(27,'Bỉ'),(28,'Thụy Sĩ'),(29,'Ai Cập'),(30,'UAE');
INSERT INTO nguoi_dung (id, ten_dang_nhap, matKhau, ho_ten, email, sdt, vai_tro_id, ngay_sinh) VALUES
(1,'nguyenvanan','123456','Nguyễn Văn An','vana@gmail.com','0911000001',1,'1999-02-01'),
(2,'tranthibich','123456','Trần Thị Bích','thib@gmail.com','0911000002',2,'2000-03-12'),
(3,'phamvanhoa','123456','Phạm Văn Hoa','vanh.pham@gmail.com','0911000003',3,'1998-07-20'),
(4,'lethutrang','123456','Lê Thu Trang','trang.le@gmail.com','0911000004',4,'2001-11-05'),
(5,'dangquocduy','123456','Đặng Quốc Duy','duy.dang@gmail.com','0911000005',5,'1997-09-15'),
(6,'hoangminhtam','123456','Hoàng Minh Tâm','minhtam.hoang@gmail.com','0911000006',6,'1999-01-10'),
(7,'ngothanhtuan','123456','Ngô Thanh Tuấn','tuan.ngo@gmail.com','0911000007',7,'1996-12-24'),
(8,'vuthihong','123456','Vũ Thị Hồng','hong.vu@gmail.com','0911000008',8,'2002-04-02'),
(9,'truongtienphat','123456','Trương Tiến Phát','phat.truong@gmail.com','0911000009',9,'1998-06-09'),
(10,'dangthimai','123456','Đặng Thị Mai','mai.dang@gmail.com','0911000010',10,'2001-02-14'),
(11,'phungvanan','123456','Phùng Văn An','an.phung@gmail.com','0911000011',11,'1999-08-03'),
(12,'hoangthoa','123456','Hoàng Thảo','thao.hoang@gmail.com','0911000012',12,'2000-10-21'),
(13,'nguyenthien','123456','Nguyễn Thiện','thien.nguyen@gmail.com','0911000013',13,'1997-01-19'),
(14,'dangkimanh','123456','Đặng Kim Anh','kimanh.dang@gmail.com','0911000014',14,'1998-03-30'),
(15,'caominhtri','123456','Cao Minh Trí','tri.cao@gmail.com','0911000015',15,'1999-09-28'),
(16,'lamtuananh','123456','Lâm Tuấn Anh','tuananh.lam@gmail.com','0911000016',16,'2000-12-01'),
(17,'nguyenthaonhi','123456','Nguyễn Thảo Nhi','thaonhi.nguyen@gmail.com','0911000017',17,'2002-07-07'),
(18,'hoangduccanh','123456','Hoàng Đức Cảnh','canh.hoang@gmail.com','0911000018',18,'1996-11-11'),
(19,'buitranquynh','123456','Bùi Trần Quỳnh','quynh.bui@gmail.com','0911000019',19,'2000-04-19'),
(20,'phamngocnam','123456','Phạm Ngọc Nam','nam.pham@gmail.com','0911000020',20,'1998-10-10'),
(21,'luuthithu','123456','Lưu Thị Thu','thu.luu@gmail.com','0911000021',21,'2001-03-03'),
(22,'ngocminhquan','123456','Ngọc Minh Quân','quan.minh@gmail.com','0911000022',22,'1997-06-16'),
(23,'vuducthang','123456','Vũ Đức Thắng','thang.vu@gmail.com','0911000023',23,'1999-09-09'),
(24,'phamhoanglam','123456','Phạm Hoàng Lâm','lam.pham@gmail.com','0911000024',24,'1996-05-25'),
(25,'hoangthuminh','123456','Hoàng Thu Minh','thuminh.hoang@gmail.com','0911000025',25,'2002-08-08'),
(26,'truongvanbinh','123456','Trương Văn Bình','binh.truong@gmail.com','0911000026',26,'1995-12-12'),
(27,'nguyenthutrang','123456','Nguyễn Thu Trang','trang.nguyen@gmail.com','0911000027',27,'1999-03-22'),
(28,'duongquocviet','123456','Dương Quốc Việt','viet.duong@gmail.com','0911000028',28,'1998-01-29'),
(29,'nguyenminhthao','123456','Nguyễn Minh Thảo','minhthao.nguyen@gmail.com','0911000029',29,'2001-06-06'),
(30,'lequanghuy','123456','Lê Quang Huy','huy.le@gmail.com','0911000030',30,'1997-02-17');
INSERT INTO phim (id, ten_phim, dao_dien_id, nam_phat_hanh, poster, quoc_gia_id, so_tap, trailer, mo_ta) VALUES
(1,'Phim 1',1,2020,'poster1.jpg',1,10,'trailer1.mp4','Mô tả phim 1'),
(2,'Phim 2',2,2021,'poster2.jpg',2,12,'trailer2.mp4','Mô tả phim 2'),
(3,'Phim 3',3,2022,'poster3.jpg',3,8,'trailer3.mp4','Mô tả phim 3'),
(4,'Phim 4',4,2019,'poster4.jpg',4,15,'trailer4.mp4','Mô tả phim 4'),
(5,'Phim 5',5,2020,'poster5.jpg',5,20,'trailer5.mp4','Mô tả phim 5'),
(6,'Phim 6',6,2021,'poster6.jpg',6,10,'trailer6.mp4','Mô tả phim 6'),
(7,'Phim 7',7,2022,'poster7.jpg',7,18,'trailer7.mp4','Mô tả phim 7'),
(8,'Phim 8',8,2020,'poster8.jpg',8,12,'trailer8.mp4','Mô tả phim 8'),
(9,'Phim 9',9,2019,'poster9.jpg',9,16,'trailer9.mp4','Mô tả phim 9'),
(10,'Phim 10',10,2021,'poster10.jpg',10,14,'trailer10.mp4','Mô tả phim 10'),
(11,'Phim 11',11,2022,'poster11.jpg',11,11,'trailer11.mp4','Mô tả phim 11'),
(12,'Phim 12',12,2020,'poster12.jpg',12,13,'trailer12.mp4','Mô tả phim 12'),
(13,'Phim 13',13,2021,'poster13.jpg',13,17,'trailer13.mp4','Mô tả phim 13'),
(14,'Phim 14',14,2019,'poster14.jpg',14,19,'trailer14.mp4','Mô tả phim 14'),
(15,'Phim 15',15,2022,'poster15.jpg',15,15,'trailer15.mp4','Mô tả phim 15'),
(16,'Phim 16',16,2020,'poster16.jpg',16,10,'trailer16.mp4','Mô tả phim 16'),
(17,'Phim 17',17,2021,'poster17.jpg',17,12,'trailer17.mp4','Mô tả phim 17'),
(18,'Phim 18',18,2022,'poster18.jpg',18,14,'trailer18.mp4','Mô tả phim 18'),
(19,'Phim 19',19,2020,'poster19.jpg',19,16,'trailer19.mp4','Mô tả phim 19'),
(20,'Phim 20',20,2019,'poster20.jpg',20,18,'trailer20.mp4','Mô tả phim 20'),
(21,'Phim 21',21,2021,'poster21.jpg',21,20,'trailer21.mp4','Mô tả phim 21'),
(22,'Phim 22',22,2022,'poster22.jpg',22,15,'trailer22.mp4','Mô tả phim 22'),
(23,'Phim 23',23,2020,'poster23.jpg',23,12,'trailer23.mp4','Mô tả phim 23'),
(24,'Phim 24',24,2019,'poster24.jpg',24,14,'trailer24.mp4','Mô tả phim 24'),
(25,'Phim 25',25,2021,'poster25.jpg',25,16,'trailer25.mp4','Mô tả phim 25'),
(26,'Phim 26',26,2022,'poster26.jpg',26,18,'trailer26.mp4','Mô tả phim 26'),
(27,'Phim 27',27,2020,'poster27.jpg',27,20,'trailer27.mp4','Mô tả phim 27'),
(28,'Phim 28',28,2019,'poster28.jpg',28,15,'trailer28.mp4','Mô tả phim 28'),
(29,'Phim 29',29,2021,'poster29.jpg',29,12,'trailer29.mp4','Mô tả phim 29'),
(30,'Phim 30',30,2022,'poster30.jpg',30,10,'trailer30.mp4','Mô tả phim 30');
INSERT INTO phim_the_loai (id, phim_id, the_loai_id) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),
(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),
(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),
(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),
(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30);
INSERT INTO phim_dien_vien (id, phim_id, dien_vien_id) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),
(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),
(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),
(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),
(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30);
INSERT INTO tap_phim (id, so_tap, tieu_de, phim_id, thoiLuong, trailer) VALUES
(1,1,'Tập 1',1,20,'tap1.mp4'),
(2,2,'Tập 2',2,22,'tap2.mp4'),
(3,3,'Tập 3',3,21,'tap3.mp4'),
(4,4,'Tập 4',4,25,'tap4.mp4'),
(5,5,'Tập 5',5,18,'tap5.mp4'),
(6,6,'Tập 6',6,20,'tap6.mp4'),
(7,7,'Tập 7',7,22,'tap7.mp4'),
(8,8,'Tập 8',8,21,'tap8.mp4'),
(9,9,'Tập 9',9,19,'tap9.mp4'),
(10,10,'Tập 10',10,23,'tap10.mp4'),
(11,11,'Tập 11',11,20,'tap11.mp4'),
(12,12,'Tập 12',12,22,'tap12.mp4'),
(13,13,'Tập 13',13,21,'tap13.mp4'),
(14,14,'Tập 14',14,24,'tap14.mp4'),
(15,15,'Tập 15',15,23,'tap15.mp4'),
(16,16,'Tập 16',16,20,'tap16.mp4'),
(17,17,'Tập 17',17,22,'tap17.mp4'),
(18,18,'Tập 18',18,21,'tap18.mp4'),
(19,19,'Tập 19',19,20,'tap19.mp4'),
(20,20,'Tập 20',20,22,'tap20.mp4'),
(21,21,'Tập 21',21,23,'tap21.mp4'),
(22,22,'Tập 22',22,21,'tap22.mp4'),
(23,23,'Tập 23',23,20,'tap23.mp4'),
(24,24,'Tập 24',24,22,'tap24.mp4'),
(25,25,'Tập 25',25,21,'tap25.mp4'),
(26,26,'Tập 26',26,23,'tap26.mp4'),
(27,27,'Tập 27',27,22,'tap27.mp4'),
(28,28,'Tập 28',28,21,'tap28.mp4'),
(29,29,'Tập 29',29,20,'tap29.mp4'),
(30,30,'Tập 30',30,22,'tap30.mp4');
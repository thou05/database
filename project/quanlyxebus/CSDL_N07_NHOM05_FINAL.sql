CREATE DATABASE BUS_MANAGEMENT
GO

USE BUS_MANAGEMENT
GO

CREATE TABLE TUYEN_XE
(
	Ma_tuyen VARCHAR(5) NOT NULL,
	Ten_tuyen NVARCHAR(100) NOT NULL,
	Diem_xuat_phat NVARCHAR(100),
	Diem_ket_thuc NVARCHAR(100),
	CONSTRAINT pk_Matuyen PRIMARY KEY (Ma_tuyen)
);

CREATE TABLE XE
(
	Bien_so_xe VARCHAR(9) NOT NULL,
	Suc_chua INT,
	CONSTRAINT pk_Biensoxe PRIMARY KEY (Bien_so_xe)
);

CREATE TABLE TRAM_XE
(
	Ma_tram VARCHAR(10) NOT NULL,
	Ten_tram NVARCHAR(100) NOT NULL,
	Dia_chi NVARCHAR(100),
	CONSTRAINT pk_Matram PRIMARY KEY (Ma_tram)
);

CREATE TABLE HANH_KHACH
(
	Ma_hanh_khach VARCHAR(10) NOT NULL,
	Ho_va_ten NVARCHAR(100) NOT NULL,
	Ngay_sinh DATETIME,
	So_dien_thoai VARCHAR(10) NOT NULL,
	Email VARCHAR(100),
	CCCD VARCHAR(12),
	CONSTRAINT pk_Mahanhkhach PRIMARY KEY (Ma_hanh_khach)
);

CREATE TABLE NHAN_VIEN
(
	Ma_nhan_vien VARCHAR(10) NOT NULL,
	Ho NVARCHAR(40) NOT NULL,
	Ten NVARCHAR(40) NOT NULL,
	Ngay_sinh DATETIME,
	Gioi_tinh NVARCHAR(5),
	So_dien_thoai VARCHAR(10),
	Email VARCHAR(100),
	So_CCCD VARCHAR(12),
	Que_quan NVARCHAR(100),
	Bang_lai NVARCHAR(10),
	CONSTRAINT pk_Manhanvien PRIMARY KEY (Ma_nhan_vien)
);

CREATE TABLE LICH_TRINH
(
	Ma_lich_trinh VARCHAR(10) NOT NULL,
	Thoi_gian_xuat_phat DATETIME,
	Thoi_gian_ket_thuc DATETIME,
	Bien_so_xe VARCHAR(9),
	Ma_tuyen VARCHAR(5),
	Ma_nhan_vien VARCHAR(10),
	CONSTRAINT pk_Malichtrinh PRIMARY KEY (Ma_lich_trinh),
	CONSTRAINT fk_Biensoxe FOREIGN KEY (Bien_so_xe) REFERENCES XE(Bien_so_xe),
	CONSTRAINT fk_Matuyen FOREIGN KEY (Ma_tuyen) REFERENCES TUYEN_XE(Ma_tuyen),
	CONSTRAINT fk_Manhanvien FOREIGN KEY (Ma_nhan_vien) REFERENCES NHAN_VIEN(Ma_nhan_vien)
);

CREATE TABLE DI_QUA
(
	Thu_tu INT NOT NULL,
	Ma_tuyen VARCHAR(5),
	Ma_tram VARCHAR(10),
	PRIMARY KEY (Ma_tuyen, Ma_tram),
	FOREIGN KEY (Ma_tuyen) REFERENCES TUYEN_XE(Ma_tuyen),
	FOREIGN KEY (Ma_tram) REFERENCES TRAM_XE(Ma_tram)
);



CREATE TABLE DI_CHUYEN
(
	Thoi_gian_len_xe DATETIME NOT NULL,
	Ma_hanh_khach VARCHAR(10),
	Ma_lich_trinh VARCHAR(10),
	PRIMARY KEY (Ma_hanh_khach, Ma_lich_trinh),
	FOREIGN KEY (Ma_hanh_khach) REFERENCES HANH_KHACH(Ma_hanh_khach),
	FOREIGN KEY (Ma_lich_trinh) REFERENCES LICH_TRINH(Ma_lich_trinh)
);


CREATE TABLE VE_THANG
(
	Ma_ve VARCHAR(10) NOT NULL,
	Gia_ve INT,
	Loai_ve NVARCHAR(40),
	PRIMARY KEY (Ma_ve)
);

CREATE TABLE DANG_KY_VE_THANG 
(
	Ma_ve VARCHAR(10) NOT NULL,
	Ma_hanh_khach VARCHAR(10) NOT NULL,
	Ngay_dang_ky DATETIME,
	Han_ve DATETIME,
	PRIMARY KEY (Ma_ve, Ma_hanh_khach),
	FOREIGN KEY (Ma_hanh_khach) REFERENCES HANH_KHACH(Ma_hanh_khach),
	FOREIGN KEY (Ma_ve) REFERENCES VE_THANG(Ma_ve)
);

CREATE TABLE VE_LUOT
(
	Ma_ve VARCHAR(10) NOT NULL,
	Gia_ve INT,
	Thoi_gian_xuat_ve DATETIME,
	Ma_lich_trinh VARCHAR(10),
	PRIMARY KEY (Ma_ve),
	FOREIGN KEY (Ma_lich_trinh) REFERENCES LICH_TRINH(Ma_lich_trinh)
);

-- Ràng buộc tuổi

ALTER TABLE NHAN_VIEN
ADD 
	CONSTRAINT chk_tuoi 
	CHECK (DATEDIFF(YEAR, Ngay_sinh, GETDATE()) 
		BETWEEN 18 AND 61);


-- Tao du lieu
-- Bảng Tuyến Xe
INSERT INTO TUYEN_XE (Ma_tuyen, Ten_tuyen, Diem_xuat_phat, Diem_ket_thuc) 
VALUES
	('07', N'Cầu Giấy - Nội Bài', N'Cầu Giấy', N'Sân bay Nội Bài'),
	('16', N'Mỹ Đình - Nước Ngầm', N'Bến xe Mỹ Đình', N'Bến xe Nước Ngầm'),
	('27', N'Yên Nghĩa - Nam Thăng Long', N'Bến xe Yên Nghĩa', N'Nam Thăng Long'),
	('32', N'Giáp Bát - Nhổn', N'Bến xe Giáp Bát', N'Nhổn'),
	('34', N'Mỹ Đình - Gia Lâm', N'Bến xe Mỹ Đình', N'Bến xe Gia Lâm');

-- Bảng Xe
INSERT INTO XE (Bien_so_xe, Suc_chua) 
VALUES
    ('29B-58293', 45),
    ('29B-30752', 45),
    ('29B-81905', 45),
    ('29B-43128', 45),
    ('29B-76543', 45),
    ('29B-67329', 45),
    ('29B-21435', 45),
    ('29B-58942', 45),
    ('29B-32761', 50),
    ('29B-94820', 50),
    ('29B-43569', 50),
    ('29B-79802', 50),
    ('29B-67231', 50),
    ('29B-89045', 50),
    ('29B-50762', 60),
    ('29B-94103', 60),
    ('29B-68932', 60),
    ('29B-21487', 60),
    ('29B-59703', 60),
    ('29B-26034', 60);

-- Trạm xe
INSERT INTO TRAM_XE (Ma_tram, Ten_tram, Dia_chi)
VALUES
    ('TX001', N'Điểm cuối Cầu Giấy tuyến 20A', N'Bãi đỗ xe Cầu Giấy, đường Cầu Giấy, phường Quan Hoa, quận Cầu Giấy, Hà Nội'),
	('TX002', N'Bảo tàng Dân tộc học VN', N'Số 1 Nguyễn Văn Huyên, phường Nghĩa Đô, quận Cầu Giấy, Hà Nội'),
	('TX003', N'373 Phạm Văn Đồng', N'373 Phạm Văn Đồng, phường Cổ Nhuế 1, quận Bắc Từ Liêm, Hà Nội'),
	('TX004', N'Đối diện nhà ga T1 sân bay Nội Bài', N'Đối diện nhà ga T1, Sân bay Quốc tế Nội Bài, huyện Sóc Sơn, Hà Nội'),

	('TX005', N'BX Mỹ Đình', N'Bến xe Mỹ Đình, đường Phạm Hùng, phường Mỹ Đình 2, quận Nam Từ Liêm, Hà Nội'),
	('TX006', N'331 Cầu Giấy', N'Số 331 đường Cầu Giấy, phường Dịch Vọng, quận Cầu Giấy, Hà Nội'),
	('TX007', N'225 Trường Chinh', N'Số 225 đường Trường Chinh, phường Khương Mai, quận Thanh Xuân, Hà Nội'),
	('TX008', N'BX Nước Ngầm', N'Bến xe khách Nước Ngầm, đường Giải Phóng, phường Hoàng Liệt, quận Hoàng Mai, Hà Nội'),

	('TX009', N'BX Yên Nghĩa', N'Bến xe Yên Nghĩa, đường Quang Trung, phường Yên Nghĩa, quận Hà Đông, Hà Nội'),
	('TX010', N'Đại học Kiến trúc Hà Nội', N'Số 1 đường Nguyễn Trãi, phường Văn Quán, quận Hà Đông, Hà Nội'),
	('TX011', N'ĐH Sư phạm Hà Nội', N'Số 136 đường Xuân Thủy, phường Dịch Vọng Hậu, quận Cầu Giấy, Hà Nội'),
	('TX012', N'Nam Thăng Long', N'Bến xe Nam Thăng Long, đường Phạm Văn Đồng, phường Xuân Đỉnh, quận Bắc Từ Liêm, Hà Nội'),

	('TX013', N'BX Giáp Bát', N'Bến xe Giáp Bát, đường Giải Phóng, phường Giáp Bát, quận Hoàng Mai, Hà Nội'),
	('TX014', N'Vườn hoa Lênin - Cột Cờ Hà Nội', N'Ngã tư Điện Biên Phủ - Trần Phú, phường Điện Biên, quận Ba Đình, Hà Nội'),
	('TX015', N'ĐH Sư phạm Hà Nội', N'Số 136 đường Xuân Thủy, phường Dịch Vọng Hậu, quận Cầu Giấy, Hà Nội'),
	('TX016', N'Nhổn', N'Bến xe Nhổn, đường Hồ Tùng Mậu kéo dài, phường Minh Khai, quận Bắc Từ Liêm, Hà Nội'),

	('TX017', N'Bệnh viện Hữu Nghị Việt Nam - Cu Ba', N'18 Phương Mai, phường Phương Mai, quận Đống Đa, Hà Nội'),
	('TX018', N'Đối diện Bến xe khách Mỹ Đình', N'Bến xe khách Mỹ Đình, đường Phạm Hùng, phường Mỹ Đình 2, quận Nam Từ Liêm, Hà Nội'),
	('TX019', N'Tòa nhà Indochina Tower', N'Số 1 đường Chùa Bộc, phường Trung Liệt, quận Đống Đa, Hà Nội'),
	('TX020', N'Nhà hát Lớn Hà Nội', N'Số 1 đường Tràng Tiền, phường Tràng Tiền, quận Hoàn Kiếm, Hà Nội');
    
-- Đi qua
INSERT INTO DI_QUA (Ma_tuyen, Ma_tram, Thu_tu)
VALUES
    -- Tuyến 07: Cầu Giấy - Nội Bài
    ('07', 'TX001', 1),
    ('07', 'TX002', 2),
    ('07', 'TX003', 3),
    ('07', 'TX004', 4),
    
    -- Tuyến 16: Mỹ Đình - Nước Ngầm
    ('16', 'TX005', 1),
    ('16', 'TX006', 2),
    ('16', 'TX007', 3),
    ('16', 'TX008', 4),
    
    -- Tuyến 27: Yên Nghĩa - Nam Thăng Long
    ('27', 'TX009', 1),
    ('27', 'TX010', 2),
    ('27', 'TX011', 3),
    ('27', 'TX012', 4),
    
    -- Tuyến 32: Giáp Bát - Nhổn
    ('32', 'TX013', 1),
    ('32', 'TX014', 2),
    ('32', 'TX015', 3),
    ('32', 'TX016', 4),
    
    -- Tuyến 34: Mỹ Đình - Gia Lâm
    ('34', 'TX005', 1),
    ('34', 'TX017', 2),
    ('34', 'TX018', 3),
    ('34', 'TX019', 4),
    ('34', 'TX020', 5);

-- Nhân viên
INSERT INTO NHAN_VIEN (Ma_nhan_vien, Ho, Ten, Ngay_sinh, Gioi_tinh, So_dien_thoai, Email, So_CCCD, Que_quan, Bang_lai)  
VALUES
    ('NV001', N'Nguyễn Văn', N'An', '1985-06-15', N'Nam', '0912345678', 'nguyenvan.an@gmail.com', '123456789012', N'Hà Nội', N'B2'),
    ('NV002', N'Trần Văn', N'Bình', '1990-09-20', N'Nam', '0987654321', 'tranvan.binh@yahoo.com', '234567890123', N'Hải Phòng', N'C'),
    ('NV003', N'Lê Thị', N'Cúc', '1998-12-05', N'Nữ', '0978123456', 'lethi.cuc@hotmail.com', '345678901234', N'Đà Nẵng', N'B1'),
    ('NV004', N'Phạm Văn', N'Dũng', '1987-03-11', N'Nam', '0934567890', 'phamvan.dung@gmail.com', '456789012345', N'Hồ Chí Minh', N'B2'),
    ('NV005', N'Hoàng Văn', N'E', '1992-07-25', N'Nam', '0901234567', 'hoangvan.e@yahoo.com', '567890123456', N'Cần Thơ', N'C'),
    ('NV006', N'Vũ Văn', N'Long', '1980-01-30', N'Nam', '0918765432', 'vuvan.long@gmail.com', '678901234567', N'Hải Dương', N'B2'),
    ('NV007', N'Đỗ Thị', N'Mai', '1995-08-18', N'Nữ', '0982123456', 'dothi.mai@hotmail.com', '789012345678', N'Nam Định', N'B1'),
    ('NV008', N'Ngô Văn', N'Hiếu', '1983-10-14', N'Nam', '0976543210', 'ngovan.hieu@gmail.com', '890123456789', N'Quảng Nam', N'C'),
    ('NV009', N'Bùi Văn', N'Sơn', '1997-12-01', N'Nam', '0965432109', 'buivan.son@yahoo.com', '901234567890', N'Nha Trang', N'B1'),
    ('NV010', N'Phan Văn', N'Tuấn', '1986-07-22', N'Nam', '0954321098', 'phanvan.tuan@gmail.com', '012345678901', N'Đà Lạt', N'B2'),
    ('NV011', N'Đặng Thị', N'Trang', '1999-04-05', N'Nữ', '0943210987', 'dangthi.trang@gmail.com', '123450987654', N'Bắc Giang', N'B1'),
    ('NV012', N'Cao Văn', N'Thịnh', '1981-11-30', N'Nam', '0932109876', 'caovan.thinh@hotmail.com', '234567891234', N'Huế', N'C'),
    ('NV013', N'Mạc Văn', N'Quang', '1989-06-09', N'Nam', '0921098765', 'macvan.quang@gmail.com', '345678912345', N'Thanh Hóa', N'B1'),
    ('NV014', N'Lý Văn', N'Minh', '1982-03-21', N'Nam', '0910987654', 'lyvan.minh@yahoo.com', '456789123456', N'Thái Bình', N'B2'),
    ('NV015', N'Trịnh Thị', N'Hoa', '1996-05-17', N'Nữ', '0909876543', 'trinhthi.hoa@gmail.com', '567891234567', N'Nghệ An', N'B1'),
    ('NV016', N'Quách Văn', N'Tài', '1984-09-27', N'Nam', '0898765432', 'quachvan.tai@gmail.com', '678912345678', N'Tuyên Quang', N'C'),
    ('NV017', N'Lưu Văn', N'Phong', '1988-12-14', N'Nam', '0887654321', 'luuvan.phong@hotmail.com', '789123456789', N'Vĩnh Phúc', N'B1'),
    ('NV018', N'Hàn Văn', N'Đại', '1983-07-19', N'Nam', '0876543210', 'hanvan.dai@gmail.com', '891234567890', N'Bạc Liêu', N'B2'),
    ('NV019', N'Dương Thị', N'Hạnh', '2000-01-08', N'Nữ', '0865432109', 'duongthi.hanh@yahoo.com', '912345678901', N'Kon Tum', N'B1'),
    ('NV020', N'Tần Văn', N'Việt', '1991-03-03', N'Nam', '0854321098', 'tanvan.viet@gmail.com', '345678901234', N'Lào Cai', N'C');

-- Lịch trình
INSERT INTO LICH_TRINH (Ma_lich_trinh, Thoi_gian_xuat_phat, Thoi_gian_ket_thuc, Bien_so_xe, Ma_tuyen, Ma_nhan_vien) 
VALUES
	('LT001', '06:00:00', '09:00:00', '29B-58293', '07', 'NV001'),
    ('LT002', '07:30:00', '10:15:00', '29B-30752', '16', 'NV002'),
    ('LT003', '08:45:00', '11:30:00', '29B-81905', '27', 'NV003'),
    ('LT004', '05:30:00', '08:00:00', '29B-43128', '32', 'NV004'),
    ('LT005', '06:15:00', '09:30:00', '29B-76543', '34', 'NV005'),
    ('LT006', '07:00:00', '10:00:00', '29B-67329', '07', 'NV006'),
    ('LT007', '08:30:00', '11:00:00', '29B-21435', '16', 'NV007'),
    ('LT008', '05:45:00', '08:45:00', '29B-58942', '27', 'NV008'),
    ('LT009', '06:30:00', '09:45:00', '29B-32761', '32', 'NV009'),
    ('LT010', '07:15:00', '10:15:00', '29B-94820', '34', 'NV010'),
    ('LT011', '08:00:00', '11:30:00', '29B-43569', '07', 'NV011'),
    ('LT012', '05:15:00', '08:30:00', '29B-79802', '16', 'NV012'),
    ('LT013', '06:45:00', '10:00:00', '29B-67231', '27', 'NV013'),
    ('LT014', '07:00:00', '09:45:00', '29B-89045', '32', 'NV014'),
    ('LT015', '08:30:00', '11:15:00', '29B-50762', '34', 'NV015'),
    ('LT016', '05:45:00', '08:45:00', '29B-94103', '07', 'NV016'),
    ('LT017', '06:15:00', '09:30:00', '29B-68932', '16', 'NV017'),
    ('LT018', '07:30:00', '10:15:00', '29B-21487', '27', 'NV018'),
    ('LT019', '08:00:00', '11:00:00', '29B-59703', '32', 'NV019'),
    ('LT020', '05:30:00', '08:30:00', '29B-26034', '34', 'NV020');

-- Vé lượt
INSERT INTO VE_LUOT (Ma_ve, Gia_ve, Thoi_gian_xuat_ve, Ma_lich_trinh)
VALUES
	('VL001', 12000, '2025-04-01 07:00', 'LT001'),
	('VL002', 8000,  '2025-04-03 07:15', 'LT002'),
	('VL003', 10000, '2025-04-03 07:30', 'LT003'),
	('VL004', 10000, '2025-04-03 07:45', 'LT004'),
	('VL005', 12000, '2025-04-04 08:00', 'LT005'),
	('VL006', 8000, '2025-04-05 08:15', 'LT006'),
	('VL007', 10000, '2025-04-05 08:30', 'LT007'),
	('VL008', 10000, '2025-04-05 08:45', 'LT008'),
	('VL009', 12000, '2025-04-06 09:00', 'LT009'),
	('VL010', 8000,  '2025-04-06 09:15', 'LT010'),
	('VL011', 10000, '2025-04-06 09:30', 'LT011'),
	('VL012', 10000, '2025-04-06 09:45', 'LT012'),
	('VL013', 12000, '2025-04-08 10:00', 'LT013'),
	('VL014', 8000, '2025-04-08 10:15', 'LT014'),
	('VL015', 10000, '2025-04-08 10:30', 'LT015'),
	('VL016', 10000, '2025-04-08 10:45', 'LT016'),
	('VL017', 12000, '2025-04-08 11:00', 'LT017'),
	('VL018', 8000,  '2025-04-09 11:15', 'LT018'),
	('VL019', 10000, '2025-04-09 11:30', 'LT019'),
	('VL020', 10000, '2025-04-10 11:45', 'LT020');

-- Vé tháng
INSERT INTO VE_THANG (Ma_ve, Gia_ve, Loai_ve)
VALUES
	('VT001', 70000, N'Ưu tiên - Một tuyến'),
	('VT002', 140000, N'Bình thường - Một tuyến'),
	('VT003', 140000, N'Ưu tiên - Liên tuyến'),
	('VT004', 280000, N'Bình thường - Liên tuyến'),
	('VT005', 0, N'Ưu tiên - Đặc biệt');

-- Hành Khách
INSERT INTO HANH_KHACH (Ma_hanh_khach, Ho_va_ten, Ngay_sinh, So_dien_thoai, Email, CCCD)
VALUES 
	('HK001', N'Nguyễn Công Thắng', '1995-01-01', '0912345678', 'nguyenvanan@gmail.com', '001095123456'),
	('HK002', N'Trần Hoàng Việt', '2000-01-01', '0987654321', 'tranbinh2000@yahoo.com', '002300789012'),
	('HK003', N'Lê Thị Thảo', '1989-01-01', '0356789123', NULL, '003089345678'),
	('HK004', N'Cao Thị Thanh Xuân', '1998-01-01', '0823456789', 'dungpham99@gmail.com', '004198901234'),
	('HK005', N'Đỗ Đức Minh Quang', '2003-01-01', '0934567890', 'hoangem03@hotmail.com', '005203456789'),
	('HK006', N'Nguyễn Thị Hoa', '1990-01-01', '0765432109', NULL, '006190127890'),
	('HK007', N'Trần Văn Khoa', '1985-01-01', '0945678901', 'khoatran85@gmail.com', '007085128901'),
	('HK008', N'Lê Thị Lan', '2001-01-01', '0378901234', 'lanle2001@gmail.com', '008301234567'),
	('HK009', N'Phạm Văn Minh', '1996-01-01', '0856789012', NULL, '009096789012'),
	('HK010', N'Nguyễn Hoàng Nam', '1987-01-01', '0967890123', 'namnguyen87@yahoo.com', '010087456789'),
	('HK011', N'Trần Thị Oanh', '2002-01-01', '0390123456', 'oanhtran02@gmail.com', '048302901234'),
	('HK012', N'Lê Văn Phong', '1994-01-01', '0834567890', NULL, '079094567890'),
	('HK013', N'Phạm Thị Quyên', '2005-01-01', '0971234567', 'quyenpham05@gmail.com', '036305123456'),
	('HK014', N'Nguyễn Minh Tú', '1993-02-15', '0911222333', 'tunguyen93@gmail.com', '011093345678'),
	('HK015', N'Trần Đức Bảo', '2001-04-20', '0922333444', 'baotran2001@gmail.com', '012301456789'),
	('HK016', N'Lê Thị Hằng', '1998-08-10', '0933444555', 'hang.le98@yahoo.com', '013198123456'),
	('HK017', N'Phạm Văn Sơn', '1989-09-30', '0944555666', NULL, '014089012345'),
	('HK018', N'Võ Thị Mai', '2002-12-12', '0955666777', 'maivo2002@gmail.com', '015302123456'),
	('HK019', N'Hoàng Đức Anh', '1992-06-22', '0966777888', 'anhthep92@gmail.com', '016092678901'),
	('HK020', N'Trịnh Thị Như', '1987-04-25', '0977888999', NULL, '017087456123');

-- Di chuyển
INSERT INTO DI_CHUYEN (Thoi_gian_len_xe, Ma_hanh_khach, Ma_lich_trinh)
VALUES
	('2025-04-01 06:05:00', 'HK005', 'LT003'),
	('2025-04-01 07:35:00', 'HK017', 'LT002'),
	('2025-04-01 08:50:00', 'HK014', 'LT008'),
	('2025-04-01 05:40:00', 'HK020', 'LT005'),
	('2025-04-02 06:20:00', 'HK008', 'LT014'),
	('2025-04-02 07:05:00', 'HK016', 'LT007'),
	('2025-04-02 08:15:00', 'HK002', 'LT010'),
	('2025-04-02 05:55:00', 'HK009', 'LT004'),
	('2025-04-03 06:35:00', 'HK011', 'LT016'),
	('2025-04-03 07:25:00', 'HK019', 'LT019'),
	('2025-04-03 08:05:00', 'HK004', 'LT004'),
	('2025-04-03 05:50:00', 'HK018', 'LT012'),
	('2025-04-04 06:40:00', 'HK003', 'LT006'),
	('2025-04-04 07:15:00', 'HK013', 'LT017'),
	('2025-04-04 08:25:00', 'HK017', 'LT009'),
	('2025-04-05 06:10:00', 'HK015', 'LT013'),
	('2025-04-05 07:50:00', 'HK012', 'LT018'),
	('2025-04-05 08:15:00', 'HK006', 'LT011'),
	('2025-04-06 06:30:00', 'HK010', 'LT001'),
	('2025-04-06 07:45:00', 'HK001', 'LT020');

-- Đăng kí vé tháng
INSERT INTO DANG_KY_VE_THANG (Ma_ve, Ma_hanh_khach, Ngay_dang_ky, Han_ve)
VALUES
	('VT004', 'HK003', '2025-04-01', '2025-05-01'),
	('VT002', 'HK005', '2025-04-02', '2025-05-02'),
	('VT005', 'HK008', '2025-04-03', '2025-05-03'),
	('VT001', 'HK017', '2025-04-04', '2025-05-04'),
	('VT003', 'HK010', '2025-04-05', '2025-05-05'),
	('VT004', 'HK014', '2025-04-06', '2025-05-06'),
	('VT002', 'HK002', '2025-04-07', '2025-05-07'),
	('VT005', 'HK015', '2025-04-08', '2025-05-08'),
	('VT001', 'HK007', '2025-04-09', '2025-05-09'),
	('VT003', 'HK013', '2025-04-10', '2025-05-10'),
	('VT004', 'HK011', '2025-04-11', '2025-05-11'),
	('VT002', 'HK016', '2025-04-12', '2025-05-12'),
	('VT005', 'HK020', '2025-04-13', '2025-05-13'),
	('VT001', 'HK004', '2025-04-14', '2025-05-14'),
	('VT003', 'HK009', '2025-04-15', '2025-05-15'),
	('VT004', 'HK019', '2025-04-16', '2025-05-16'),
	('VT002', 'HK006', '2025-04-17', '2025-05-17'),
	('VT005', 'HK018', '2025-04-18', '2025-05-18'),
	('VT001', 'HK012', '2025-04-19', '2025-05-19'),
	('VT003', 'HK020', '2025-04-20', '2025-05-20');

-- CÂU TRUY VẤN
--1. Lấy danh sách tất cả các tuyến xe, bao gồm mã tuyến và tên tuyến.
SELECT Ma_tuyen, Ten_tuyen FROM TUYEN_XE;

--2. Đếm số lượng nhân viên đang có trong hệ thống.
SELECT COUNT(*) AS [So luong nhan vien] FROM NHAN_VIEN;

--3. Hiển thị danh sách nhân viên với mã nhân viên, họ tên đầy đủ, số điện thoại.
SELECT Ma_nhan_vien, Ho + ' ' + Ten AS Ho_ten, So_dien_thoai FROM NHAN_VIEN;

--4. Tìm tất cả các trạm xe với mã trạm và tên trạm.
SELECT Ma_tram, Ten_tram FROM TRAM_XE;

--5. Tìm tất cả biển số xe và sức chứa của từng xe.
SELECT Bien_so_xe, Suc_chua FROM XE;

--6. Liệt kê trạm xe của tuyến xe 32
SELECT TX.Ma_tram, TR.Ten_tram
FROM DI_QUA TX
JOIN TRAM_XE TR ON TX.Ma_tram = TR.Ma_tram
WHERE TX.Ma_tuyen = '32';

--7. Lấy thông tin lịch trình bao gồm mã lịch trình, thời gian xuất phát, thời gian kết thúc và mã tuyến.
SELECT Ma_lich_trinh, Thoi_gian_xuat_phat, Thoi_gian_ket_thuc, Ma_tuyen
FROM LICH_TRINH;

--8. Đếm số lượng xe có sức chứa lớn hơn hoặc bằng 40 chỗ.
SELECT COUNT(*) AS So_luong_xe_lon
FROM XE
WHERE Suc_chua >= 50;

--9. Liệt kê danh sách các tuyến xe có điểm xuất phát là "Bến xe Mỹ Đình".
SELECT Ma_tuyen, Ten_tuyen
FROM TUYEN_XE
WHERE Diem_xuat_phat = N'Bến xe Mỹ Đình';

--10. Lấy danh sách hành khách có độ tuổi từ 25 đến 40.
SELECT Ma_hanh_khach, Ho_va_ten, Ngay_sinh
FROM HANH_KHACH
WHERE DATEDIFF(YEAR, Ngay_sinh, GETDATE()) BETWEEN 25 AND 40;

--11. Tìm tất cả các nhân viên có họ bắt đầu bằng 'Nguyễn' và quê quán ở Hà Nội.
SELECT Ma_nhan_vien, Ho, Ten, Que_quan
FROM NHAN_VIEN
WHERE Que_quan = N'Hà Nội';

--12. Tìm tuyến xe có lợi nhuận cao nhất, giả sử mỗi vé lượt được bán có giá trị trong bảng VELUOT.
SELECT TOP 1 WITH TIES TX.Ma_tuyen, TX.Ten_tuyen, SUM(VL.Gia_ve) AS Tong_loi_nhuan
FROM VE_LUOT VL
JOIN LICH_TRINH LT ON VL.Ma_lich_trinh = LT.Ma_lich_trinh
JOIN TUYEN_XE TX ON LT.Ma_tuyen = TX.Ma_tuyen
GROUP BY TX.Ma_tuyen, TX.Ten_tuyen
ORDER BY Tong_loi_nhuan DESC;

--13. Tìm các hành khách có số điện thoại trùng nhau (phát hiện dữ liệu sai)
SELECT hk1.So_dien_thoai, COUNT(*) AS So_luong
FROM HANH_KHACH hk1
GROUP BY hk1.So_dien_thoai
HAVING COUNT(*) > 1;

--14. Tìm những hành khách có số điện thoại bắt đầu bằng ‘09’, nhưng không đăng ký bất kỳ vé tháng nào.
SELECT hk.*
FROM HANH_KHACH hk
WHERE hk.So_dien_thoai LIKE '09%'
	AND NOT EXISTS (
		SELECT 1 
		  FROM DANG_KY_VE_THANG dk
		  WHERE dk.Ma_hanh_khach = hk.Ma_hanh_khach
	);

--15. Tìm hành khách đã đi trên nhiều tuyến xe nhất.
SELECT TOP 1 WITH TIES Ma_hanh_khach, COUNT(DISTINCT LT.Ma_tuyen) AS So_tuyen
FROM DI_CHUYEN DC
JOIN LICH_TRINH LT ON DC.Ma_lich_trinh = LT.Ma_lich_trinh
GROUP BY Ma_hanh_khach
ORDER BY So_tuyen DESC;
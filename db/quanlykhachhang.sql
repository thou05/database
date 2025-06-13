CREATE DATABASE NHOM_05
GO

USE NHOM_05
GO

CREATE TABLE nhacungcap
(
	macongty	NVARCHAR(10)	NOT NULL,
	tencongty	NVARCHAR(40)	NOT NULL,
	tengiaodich NVARCHAR(30),
	diachi		NVARCHAR(50),
	dienthoai	NVARCHAR(15),
	fax			NVARCHAR(15),
	email		NVARCHAR(30),
				CONSTRAINT pk_macongty PRIMARY KEY(macongty),
);

CREATE TABLE loaihang
(
	maloaihang	NVARCHAR(10) NOT NULL,
	tenloaihang NVARCHAR(40),
				CONSTRAINT pk_maloaihang PRIMARY KEY(maloaihang),
);

CREATE TABLE mathang (
	mahang		NVARCHAR(10) NOT NULL
				CONSTRAINT pk_mathang_mahang PRIMARY KEY,
	tenhang		NVARCHAR(50) NOT NULL,
	macongty	NVARCHAR(10) 
				CONSTRAINT fk_macongty FOREIGN KEY REFERENCES nhacungcap(macongty),
    maloaihang	NVARCHAR(10)
				CONSTRAINT fk_maloaihang FOREIGN KEY REFERENCES loaihang(maloaihang),
	soluong		INT,
	donvitinh	NVARCHAR(10),
	giahang		INT,
);

CREATE TABLE khachhang
(
    makhachhang	NVARCHAR(10) NOT NULL,
    tencongty	NVARCHAR(40) NOT NULL,
    tengiaodich NVARCHAR(30),
    diachi		NVARCHAR(50),
    dienthoai	NVARCHAR(15),
    fax			NVARCHAR(15),
    email		NVARCHAR(30),
				CONSTRAINT pk_makhachhang PRIMARY KEY(makhachhang),
);

CREATE TABLE nhanvien 
(
	manhanvien	NVARCHAR(10) NOT NULL
				CONSTRAINT pk_nhanvien_manhanvien PRIMARY KEY,
	ho			NVARCHAR(20) NOT NULL,
	ten			NVARCHAR(10) NOT NULL,
	ngaysinh	DATETIME,
	ngaylamviec	DATETIME,
	diachi		NVARCHAR(50),
	dienthoai	NVARCHAR(15),
	luongcoban	INT,
	phucap		INT
);


CREATE TABLE dondathang(
	sohoadon		INT		NOT NULL,
	makhachhang		NVARCHAR(10),
	manhanvien		NVARCHAR(10),
	ngaydathang		DATETIME,
	ngaygiaohang	DATETIME,
	ngaychuyenhang	DATETIME,
	noigiaohang		NVARCHAR(50),
					CONSTRAINT pk_sohoadon	PRIMARY KEY(sohoadon),
					CONSTRAINT fk_makhachhang FOREIGN KEY(makhachhang) REFERENCES khachhang(makhachhang),
					CONSTRAINT fk_manhanvien FOREIGN KEY(manhanvien) REFERENCES nhanvien(manhanvien)
);

CREATE TABLE chitietdathang(
	sohoadon	INT		NOT NULL,
	mahang		NVARCHAR(10)	NOT NULL,
	giaban		INT,
	soluong		SMALLINT,
	mucgiamgia	NUMERIC(2,1),
				PRIMARY KEY (sohoadon, mahang),
				FOREIGN KEY (sohoadon) REFERENCES dondathang(sohoadon),
				FOREIGN KEY (mahang) REFERENCES mathang(mahang)
);

DROP DATABASE NHOM_05

create database new_library;

create table ThanhVien(
id int primary key auto_increment,
username varchar(100),
password varchar(100),
hoTen varchar(100),
soDienThoai varchar(20),
diaChi varchar(100),
email varchar(100),
vaiTro tinyint
);

create table NhaCungCap(
id int primary key auto_increment,
ten varchar(100),
diaChi varchar(100),
soDienThoai varchar(100)
);

create table TaiLieu(
id int primary key auto_increment,
ten varchar(100),
tacGia varchar(100),
moTa text,
soLuong int,
anhBia varchar(100)
);

create table PhieuMuon(
id int primary key auto_increment,
ngayMuon date,
ngayPhaiTra date,
nhanVienId int,
banDocId int,
foreign key (nhanVienId) references ThanhVien(id),
foreign key (banDocId) references ThanhVien(id)
);

create table PhieuTra(
id int primary key auto_increment,
ngayTra date,
nhanVienId int,
banDocId int,
foreign key (nhanVienId) references ThanhVien(id),
foreign key (banDocId) references ThanhVien(id)
);

create table HoaDonTra(
id int primary key auto_increment,
tienPhat double,
ghiChu text,
phieuTraId int,
foreign key (phieuTraId) references PhieuTra(id)
);

create table TaiLieuMuon(
id int primary key auto_increment,
trangThai tinyint,
taiLIeuId int,
phieuMuonId int, 
phieuTraId int,
foreign key (taiLIeuId) references TaiLieu(id),
foreign key (phieuMuonId) references PhieuMuon(id),
foreign key (phieuTraId) references PhieuTra(id)
);

create table HoaDonNhap(
id int primary key auto_increment,
ngayNhap date,
tongTien double,
nhanVienId int,
nhaCungCapId int,
foreign key (nhanVienId) references ThanhVien(id),
foreign key (nhaCungCapId) references NhaCungCap(id)
);

create table TaiLieuNhap(
id int primary key auto_increment,
soLuong int,
giaNhap double,
taiLieuId int,
hoaDonNhapId int,
foreign key (taiLieuId) references TaiLieu(id),
foreign key (hoaDonNhapId) references HoaDonNhap(id)
);










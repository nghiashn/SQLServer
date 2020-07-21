/* Học phần: Cơ sở dữ liệu
   Ngày: 24/4/2020
   Người thực hiện: Sử Hữu Nghĩa
   Mã số sinh viên: 1610168
*/
create database Lab02_QLSX

go
use Lab02_QLSX
go
create table ToSanXuat
(
MaTSX char(4) primary key not null,
TenTSX nvarchar(20)
)
go
create table CongNhan
(
MaCN char(5) primary key not null,
Ho nvarchar(50),
Ten nvarchar(20),
Phai nvarchar(10),
NgaySinh datetime,
MaTSX char(4) references ToSanXuat(MaTSX)
)
go

create table SanPham
(
MaSP char(5) primary key not null,
TenSP nvarchar(30),
DVT nvarchar(10),
TienCong int check (TienCong>0)
)
go
create table ThanhPham
(
MaCN char(5) references CongNhan(MaCN)not null,
MaSP char(5) references SanPham(MaSP)not null,
Ngay datetime,
SoLuong int check (SoLuong >=0)
primary key (MaCN,MaSP,ngay)
)

go

--Nhap bang ToSanXuat
insert into ToSanXuat values('TS01',N'Tố 1')
insert into ToSanXuat values('TS02',N'Tố 2')
select * from ToSanXuat

set dateformat dmy
--Nhap bang CongNhan
insert into CongNhan values('CN001',N'Nguyễn Trường',N'An',N'Nam','12/05/1981','TS01')
insert into CongNhan values('CN002',N'Lê Thị Hồng',N'Gấm',N'Nữ','04/06/1980','TS01')
insert into CongNhan values('CN003',N'Nguyễn Công',N'Thành',N'Nam','04/05/1981','TS02')
insert into CongNhan values('CN004',N'Võ Hữu',N'Hạnh',N'Nam','15/02/1980','TS02')
insert into CongNhan values('CN005',N'Lý Thanh',N'Hân',N'Nữ','03/12/1981','TS01')
select * from CongNhan

--Nhap bang SanPham
insert into SanPham values('SP001',N'Nồi đất',N'Cái',10000)
insert into SanPham values('SP002',N'Chén',N'Cái',2000)
insert into SanPham values('SP003',N'Bình gốm nhỏ',N'Cái',20000)
insert into SanPham values('SP004',N'Bình gốm lớn',N'Cái',25000)
select * from SanPham

set dateformat dmy
--Nhap bang Thanh phan
insert into ThanhPham values('CN001','SP001','01/02/2007','10')
insert into ThanhPham values('CN002','SP001','01/02/2007','5')
insert into ThanhPham values('CN003','SP002','10/01/2007','50')
insert into ThanhPham values('CN004','SP003','12/01/2007','10')
insert into ThanhPham values('CN005','SP002','12/01/2007','100')
insert into ThanhPham values('CN002','SP004','13/02/2007','10')
insert into ThanhPham values('CN001','SP003','14/02/2007','15')
insert into ThanhPham values('CN003','SP001','15/01/2007','20')
insert into ThanhPham values('CN003','SP004','14/02/2007','15')
insert into ThanhPham values('CN004','SP002','30/01/2007','100')
insert into ThanhPham values('CN005','SP003','01/02/2007','50')
insert into ThanhPham values('CN001','SP001','20/02/2007','30')
select * from ThanhPham

---------------------
--1) Liệt kê các công nhân theo tổ sản xuất gồm các thông tin: TenTSX, HoTen,NgaySinh, Phai 
--(xếp thứ tự tăng dần của tên tổ sản xuất, Tên của công nhân)
select TenTSX,Ho +' '+Ten as HoTen, NgaySinh,Phai
from CongNhan A, ToSanXuat B
where A.MaTSX =B.MaTSX
order by TenTSX, Ho +' '+Ten
--2) Liệt kê các thành phẩm mà công nhân ‘Nguyễn Trường An’ đã làm được gồmcác thông tin: TenSP, Ngay, SoLuong, ThanhTien 
--(xếp theo thứ tự tăng dần của ngày).
select TenSP, Ngay, SoLuong, SoLuong * TienCong as ThanhTien
from CongNhan A, ThanhPham B, SanPham C
where A.MaCN = B.MaCN and B.MaSP = C.MaSP
		and Ho = N'Nguyễn Trường' and Ten = N'An'
order by Ngay
--3) Liệt kê các nhân viên không sản xuất sản phẩm ‘Bình gốm lớn’
select *
from CongNhan
where  MaCN not in(select  D.MaCN
							from CongNhan D, ThanhPham E, SanPham F
							where D.MaCN = E.MaCN and E.MaSP = F.MaSP
									and F.TenSP = N'Bình gốm lớn')

--4) Liệt kê thông tin các công nhân có sản xuất cả ‘Nồi đất’ và ‘Bình gốm nhỏ’.
select *
from CongNhan A, ThanhPham B, SanPham C
where A.MaCN = B.MaCN and B.MaSP = C.MaSP
		and C.TenSP = N'Nồi đất'
		and A.MaCN in (select D.MaCN
							from CongNhan D, ThanhPham E, SanPham F
							where D.MaCN = E.MaCN and E.MaSP = F.MaSP
									and F.TenSP = N'Bình gốm nhỏ')


--5)
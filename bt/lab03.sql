/* Học phần: Cơ sở dữ liệu
   Ngày: 22/4/2020
   Người thực hiện: Sử Hữu Nghĩa
   Mã số sinh viên: 1610168
*/
create database lab03_QLNXHH
go
use lab03_QLNXHH
go

--tao bang
create table HANGHOA
(
MAHH char(5) primary key not null,
TENHH nvarchar(200),
DVT nvarchar(10),
SOLUONGTON int
)
create table DOITAC
(
MADT char(5) primary key,
TENDT nvarchar(50),
DIACHI nvarchar(50),
DIENTHOAI char(12)
)
create table KHANANGCC
(
MADT char(5) references DOITAC(MADT),
MAHH char(5) references HANGHOA(MAHH)
primary key (MADT,MAHH)
)
create table HOADON
(
SOHD char(5) primary key,
NGAYLAPHD datetime,
MADT char(5) references DOITAC(MADT),
TONGTG int
)
create table CT_HOADON
(
SOHD char(5),
MAHH char(5) references HANGHOA(MAHH),
DONGIA int,
SOLUONG int
primary key(SOHD,MAHH)
)

--nhap bang hang hoa
insert into HANGHOA values('CPU01',N'CPU INTEL, CELERON 600 BOX',N'CÁI',5)
insert into HANGHOA values('CPU02',N'CPU INTEL, piii 700',N'CÁI',10)
insert into HANGHOA values('CPU03',N'CPU AMD K7 ATHL, ON 600',N'CÁI',8)

insert into HANGHOA values('HDD01',N'HDD 10.2 GB QUANNTUM',N'CÁI',10)
insert into HANGHOA values('HDD02',N'HDD 13.6 GB SEAGATE',N'CÁI',15)
insert into HANGHOA values('HDD03',N'HDD 20 GB QUANTUM',N'CÁI',6)

insert into HANGHOA values('KB01',N'KB GENIUS',N'CÁI',12)
insert into HANGHOA values('KB02',N'KB MITSUMIMI',N'CÁI',5)

insert into HANGHOA values('MB01',N'GIGABYTE CHIPSET INTEL',N'CÁI',10)
insert into HANGHOA values('MB02',N'ACOPR BX CHIPSET VIA',N'CÁI',10)
insert into HANGHOA values('MB03',N'INTEL PHI CHIPSET INTEL',N'CÁI',10)
insert into HANGHOA values('MB04',N'ECS CHIPSET SIS',N'CÁI',10)
insert into HANGHOA values('MB05',N'ECS CHIPSET VIA',N'CÁI',10)

insert into HANGHOA values('MNT01',N'SAMSUNG 14" SYNCMASTER',N'CÁI',5)
insert into HANGHOA values('MNT02',N'LG 14"',N'CÁI',5)
insert into HANGHOA values('MNT03',N'ACER 14"',N'CÁI',8)
insert into HANGHOA values('MNT04',N'PHILIPS 14"',N'CÁI',6)
insert into HANGHOA values('MNT05',N'VIEWSONIC 14"',N'CÁI',7)

SELECT * from HANGHOA

-- nhap bang DOITAC
insert into DOITAC values('CC001',N'Cty TNC',N'176 BTX Q1 - TPHCM','08.8250259')
insert into DOITAC values('CC002',N'Cty Hoàng Long',N'15A TTT Q1 – TP. HCM',08.8250898)
insert into DOITAC values('CC003',N'Cty Hợp Nhất',N'152 BTX Q1 – TP.HCM',08.8252376)
insert into DOITAC values('K0001',N'Nguyễn Minh Hải',N'91 Nguyễn Văn Trỗi Tp. Đà Lạt',063.831129)
insert into DOITAC values('K0002',N'Như Quỳnh',N'21 Điện Biên Phủ. N.Trang',058590270)
insert into DOITAC values('K0003',N'Trần nhật Duật',N'Lê Lợi TP. Huế',054.848376)
insert into DOITAC values('K0004',N'Phan Nguyễn Hùng Anh',N' 11 Nam Kỳ Khởi nghĩa- TP. Đà lạt',063.823409)
 select * from DOITAC

 --nhap bang hoa don
 set dateformat dmy 
 insert into HOADON values('N0001','25/01/2006 ','CC001',NULL)
 insert into HOADON values('N0002','01/05/2006','CC002',NULL)
 insert into HOADON values('X0001','12/05/2006','K0001',NULL)
 insert into HOADON values('X0002','16/06/2006 ','K0002',NULL)
 insert into HOADON values('X0003','20/04/2006 ',' K0001',NULL)
 select * from HOADON

 --nhap bang khanangcc
 insert into KHANANGCC values('CC001','CPU01')
 insert into KHANANGCC values('CC001','HDD03')
 insert into KHANANGCC values('CC001','KB01')
 insert into KHANANGCC values('CC001','MB02')
 insert into KHANANGCC values('CC001','MB04')
 insert into KHANANGCC values('CC001','MNT01')
 insert into KHANANGCC values('CC002','CPU01')
 insert into KHANANGCC values('CC002','CPU02')
 insert into KHANANGCC values('CC002','CPU03')
 insert into KHANANGCC values('CC002','KB02')
 insert into KHANANGCC values('CC002','MB01')
 insert into KHANANGCC values('CC002','MB05')
 insert into KHANANGCC values('CC002','MNT03')
 insert into KHANANGCC values('CC003','HDD01')
 insert into KHANANGCC values('CC003','HDD02')
 insert into KHANANGCC values('CC003','HDD03')
 insert into KHANANGCC values('CC003','MB03')
 select * from KHANANGCC
 delete KHANANGCC

 --nhap bang ct hoa don
 insert into CT_HOADON values ('N0001','CPU01',63,10)
 insert into CT_HOADON values ('N0001','HDD03',97,7)
 insert into CT_HOADON values ('N0001','KB01',3,5)
 insert into CT_HOADON values ('N0001','MB02',57,5)
 insert into CT_HOADON values ('N0001','MNT01',112,3)

 insert into CT_HOADON values ('N0002','CPU02',115,3)
 insert into CT_HOADON values ('N0002','KB02',5,7)
 insert into CT_HOADON values ('N0002','MNT03',111,5)

 insert into CT_HOADON values ('X0001','CPU01',67,2)
 insert into CT_HOADON values ('X0001','HDD03',100,2)
 insert into CT_HOADON values ('X0001','KB01',5,2)
 insert into CT_HOADON values ('X0001','MB02',62,1)

 insert into CT_HOADON values ('X0002','CPU01',67,1)
 insert into CT_HOADON values ('X0002','KB02',7,3)
 insert into CT_HOADON values ('X0002','MNT01',115,2)

 insert into CT_HOADON values ('X0003','CPU01',67,1)
 insert into CT_HOADON values ('X0003','MNT03',115,2)
 select * from CT_HOADON

 ---------
 --truy vấn
 --1) Liệt kê các mặt hàng thuộc loại đĩa cứng
 select *
 from HANGHOA
 where MAHH like 'HDD%'
 --2) Liệt kê các mặt hàng có số lượng tồn trên 10.
 select MAHH, TENHH, SOLUONGTON
 from HANGHOA
 where SOLUONGTON >=10
 --3) Cho biết thông tin về các nhà cung cấp ở Thành phố Hồ Chí Minh
 select *
 from DOITAC
 where DIACHI like '%HCM'
 --4) Liệt kê các hóa đơn nhập hàng trong tháng 5/2006, thông tin hiển thị gồm: 
 --sohd; ngaylaphd; tên, địa chỉ, và điện thoại của nhà cung cấp; số mặt hàng
select B.SOHD, B.NGAYLAPHD , A.TENDT, A.DIACHI, A.DIENTHOAI, COUNT(C.MAHH) as SoMatHang
from DOITAC A, HOADON B, KHANANGCC C
where A.MADT = B.MADT and B.MADT = C.MADT 
	and MONTH(B.NGAYLAPHD) = 5 and YEAR(B.NGAYLAPHD) = 2006
group by B.SOHD, B.NGAYLAPHD , A.TENDT, A.DIACHI, A.DIENTHOAI 
		
--5) Cho biết tên các nhà cung cấp có cung cấp đĩa cứng.
select A.TENDT
from DOITAC A, KHANANGCC B
where A.MADT = B.MADT and B.MAHH like 'HDD%'

--6) Cho biết tên các nhà cung cấp có thể cung cấp tất cả các loại đĩa cứng.
select A.MADT, A.TENDT
from DOITAC A, KHANANGCC B
where A.MADT = B.MADT and B.MAHH like 'HDD01'
		and A.MADT IN(select C.MADT
						from DOITAC C, KHANANGCC D
						where C.MADT = D.MADT and D.MAHH like 'HDD02')
--7) Cho biết tên nhà cung cấp không cung cấp đĩa cứng.
select A.TENDT
from DOITAC A, KHANANGCC B
where A.MADT = B. MADT 
		and A.TENDT not in(select C.TENDT
							from DOITAC C, KHANANGCC D
							where C.MADT = D.MADT and D.MAHH like 'HDD%')
--8) Cho biết thông tin của mặt chưa bán được.
select *
from HANGHOA
where MAHH Not in (select MAHH
					from CT_HOADON
					where SOHD like 'X%') --left(SOHD,1) = 'X'

--9) Cho biết tên và tổng số lượng bán của mặt hàng bán chạy nhất (tính theo số
--lượng).
select A.TENHH, SUM(SOLUONG) as TongSoLuong
from HANGHOA A, CT_HOADON B
where A.MAHH = B.MAHH
group by A.TENHH 
Having SUM(SOLUONG) >= all (select SUM(SOLUONG) as TongSoLuong
							from HANGHOA C, CT_HOADON D
							where C.MAHH = D.MAHH
							group by C.TENHH)
--10) Cho biết tên và tổng số lượng của mặt hàng nhập về ít nhất.




--20) Liệt kê thông tin của mặt hàng có nhiều người mua nhất.
select A.MAHH, A.TENHH, COUNT(distinct MADT) as SoNguoiMua
from HANGHOA A, CT_HOADON B, HOADON C
where A.MAHH = B.MAHH and B.SOHD = C.SOHD and B.SOHD like 'X%'
group by A.MAHH, A.TENHH
Having COUNT(distinct MADT) >=ALL (select COUNT(distinct MADT)
									from CT_HOADON D, HOADON E
									where D.SOHD = E.SOHD and E.SOHD like 'X%' 
									group by D.MAHH)

--21) Tính và cập nhật tổng trị giá của các hóa đơn.
Update HOADON
set TONGTG = (Select SUM(DONGIA*SOLUONG)
				from CT_HOADON
				where CT_HOADON.SOHD = HOADON.SOHD)

select * from HOADON
insert into HOADON values('X0003','20/04/2006 ','K0001',NULL)
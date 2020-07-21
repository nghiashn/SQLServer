/* Học phần: Cơ sở dữ liệu
   Ngày: 18/05/2020
   Người thực hiện: Sử Hữu Nghĩa
   Mã số sinh viên: 1610168
*/
Create database Lab08_QLSV
go

use Lab08_QLSV
go

create table KHOA
(MSKhoa nchar(2) primary key,
TenKhoa nvarchar(30) not null unique,
TenTat nchar(4) not null unique);

go
create table Lop
(MSLop nchar(4) primary key,
TenLop nvarchar(30) not null unique,
MSKhoa nchar(2) references KHOA(MSKhoa),
NienKhoa nchar(4) not null);

go
create table Tinh
(MSTinh nchar(2) primary key,
TenTinh nvarchar(20) not null unique);

go
create table MonHoc
(MSMH nchar(4) primary key,
TenMH nvarchar(30) not null,
HeSo tinyint not null);

go
create table SinhVien
(MSSV nchar(7) primary key,
Ho nvarchar(20) not null,
Ten nchar(10) not null,
NgaySinh date not null,
MSTinh nchar(2) references TINH(MSTinh),
NgayNhapHoc date not null,
MSLop nchar(4) references LOP(MSLop),
Phai bit not null,
DiaChi nvarchar(30) not null,
DienThoai nchar(10)
	)

go

create table BANGDIEM
(MSSV nchar(7) foreign key references SinhVien(MSSV),
MSMH nchar(4) foreign key references MonHoc(MSMH),
LanThi tinyint not null,
Diem float not null,
constraint PK primary key (MSSV, MSMH, LanThi));

Insert into KHOA Values('1','Cong nghe thong tin','CNTT')
Insert into KHOA Values('2','Dien tu vien thong','DTVT')
Insert into KHOA Values('3','Quan tri kinh doanh','QTKD')
Insert into KHOA Values('4','Cong nghe sinh hoc','CNSH')

Insert into Lop Values('98TH','Tin hoc khoa 1998','1','1998')
Insert into Lop Values('98VT','Vien thong khoa 1998','2','1998')
Insert into Lop Values('99QT','Quan tri khoa 1999','3','1999')
Insert into Lop Values('99TH','Tin hoc khoa 1999','1','1999')
Insert into Lop Values('99VT','Vien thong khoa 1999','2','1999')

Insert into Tinh Values('01','An Giang')
Insert into Tinh Values('02','TPHCM')
Insert into Tinh Values('03','Dong Nai')
Insert into Tinh Values('04','Long An')
Insert into Tinh Values('05','Hue')
Insert into Tinh Values('06','Ca Mau')

Insert into MonHoc Values('QA01','Kinh te vi mo','2')
Insert into MonHoc Values('QA02','Quan tri chat luong','3')
Insert into MonHoc Values('TA01','Nhap mon tin hoc','2')
Insert into MonHoc Values('TA02','Lap trinh co ban','3')
Insert into MonHoc Values('TB01','Cau truc du lieu','2')
Insert into MonHoc Values('TB02','Co so du lieu','2')
Insert into MonHoc Values('VA01','Dien tu co ban','2')
Insert into MonHoc Values('VA02','Mach so','3')
Insert into MonHoc Values('VB01','Truyen so lieu','3')
Insert into MonHoc Values('XA01','Vat ly dai cuong','2')

Insert into SinhVien Values('98TH001','Nguyen Van','An','8/6/1980','01','9/3/1998','98TH','1','12 Tran Hung Dao, Q.1','8234512')
Insert into SinhVien Values('98TH002','Le Thi','An','10/17/1979','01','9/3/1998','98TH','0','23 CMT8, Q.Tan Binh','0303234342')
Insert into SinhVien Values('98VT001','Nguyen Duc','Bình','11/25/1981','02','9/3/1998','98VT','1','245 Lac Long Quan, Q.11','8654323')
Insert into SinhVien Values('98VT002','Tran Ngoc','Anh','8/19/1980','02','9/3/1998','98VT','0','242 Tran Hung Dao, Q.1','')
Insert into SinhVien Values('99QT001','Nguyen Thi','Oanh','8/19/1973','04','10/5/1999','99QT','0','76 Hung Vuong, Q.5','0901656324')
Insert into SinhVien Values('99QT002','Le My','Hanh','5/20/1976','04','10/5/1999','99QT','0','12 Pham Ngoc Thach, Q.3','')
Insert into SinhVien Values('99TH001','Ly Van Hung','Dung','9/27/1981','03','10/5/1999','99TH','1','178 CMT8, Q. Tân Bình','7563213')
Insert into SinhVien Values('99TH002','Van Minh','Hoang','1/1/1981','04','10/5/1999','99TH','1','272 Ly Thuong Kiet, Q.10','8341234')
Insert into SinhVien Values('99TH003','Nguyen','Tuan','1/12/1980','03','10/5/1999','99TH','1','162 Tran Hung Dao, Q.5','')
Insert into SinhVien Values('99TH004','Tran Van','Minh','6/25/1981','04','10/5/1999','99TH','1','147 Dien Bien Phu, Q.3','7236754')
Insert into SinhVien Values('99TH005','Nguyen Thai','Minh','1/1/1980','04','10/5/1999','99TH','1','345 Le Dai Hanh, Q.11','')
Insert into SinhVien Values('99VT001','Le Ngoc','Mai','6/21/1982','01','10/5/1999','99VT','0','129 Tran Hung Dao, Q.1','0903124534')


Insert into BANGDIEM Values('98TH001','TA01','1','8.5')
Insert into BANGDIEM Values('98TH001','TA02','1','8')
Insert into BANGDIEM Values('98TH001','TB01','1','7')
Insert into BANGDIEM Values('98TH002','TA01','1','4')
Insert into BANGDIEM Values('98TH002','TA01','2','5.5')
Insert into BANGDIEM Values('98TH002','TB01','1','7.5')
Insert into BANGDIEM Values('98VT001','VA01','1','4')
Insert into BANGDIEM Values('98VT001','VA01','2','5')
Insert into BANGDIEM Values('98VT002','VA02','1','7.5')
Insert into BANGDIEM Values('99QT001','QA01','1','7')
Insert into BANGDIEM Values('99QT001','QA02','1','6.5')
Insert into BANGDIEM Values('99QT002','QA01','1','8.5')
Insert into BANGDIEM Values('99QT002','QA02','1','9')
Insert into BANGDIEM Values('99TH001','TA01','1','4')
Insert into BANGDIEM Values('99TH001','TA01','2','6')
Insert into BANGDIEM Values('99TH001','TB01','1','6.5')
Insert into BANGDIEM Values('99TH002','TB01','1','10')
Insert into BANGDIEM Values('99TH002','TB02','1','9')
Insert into BANGDIEM Values('99TH003','TA02','1','7.5')
Insert into BANGDIEM Values('99TH003','TB01','1','3')
Insert into BANGDIEM Values('99TH003','TB01','2','6')
Insert into BANGDIEM Values('99TH003','TB02','1','8')
Insert into BANGDIEM Values('99TH004','TB02','1','2')
Insert into BANGDIEM Values('99TH004','TB02','2','4')
Insert into BANGDIEM Values('99TH004','TB02','3','3')

select *from KHOA

select *from Lop

select *from Tinh

select *from MonHoc

select *from SinhVien

select *from BANGDIEM

---------------------Truy va61n---------------------
--câu 1) Liệt kê MSSV, Họ, Tên, Địa chỉ của tất cả các sinh viên
select MSSV,Ho+''+Ten as HoTen,Diachi
from SinhVien

--câu 2) Liệt kê MSSV, Họ, Tên, MS Tỉnh của tất cả các sinh viên. Sắp xếp kết quả theo MS tỉnh, trong cùng tỉnh sắp xếp theo họ tên của sinh viên.
select MSSV,Ho+''+Ten as HoTen,MSTinh
from SinhVien
order by MSTinh,HoTen

--câu 3) Liệt kê các sinh viên nữ của tỉnh Long An
select MSSV,Ho+''+Ten as HoTen,MSTinh,Phai
from SinhVien
where MSTinh='04'and Phai='0'

--4) Liệt kê các sinh viên có sinh nhật trong tháng giêng. 
select MSSV, Ho+ ' ' + Ten as HoTen, NgaySinh
from SinhVien
where MONTH(NgaySinh) = 1

--5) Liệt kê các sinh viên có sinh nhật nhằm ngày 1/1. 
select MSSV, Ho+ ' ' + Ten as HoTen, NgaySinh
from SinhVien
where MONTH(NgaySinh) = 1 and Day(NgaySinh) = 1

--6) Liệt kê các sinh viên có số điện thoại. 
select MSSV, Ho+ ' ' + Ten as HoTen, DienThoai
from SinhVien
where DienThoai != ' '

--7) Liệt kê các sinh viên có số điện thoại di động. 
select MSSV, Ho+ ' ' + Ten as HoTen, DienThoai
from SinhVien
where DienThoai like '0%'

--8) Liệt kê các sinh viên tên ‘Minh’ học lớp ’99TH’
select MSSV, Ho+ ' ' + Ten as HoTen, NgaySinh, Phai
from SinhVien a, Lop b
where a.MSLop = b.MSLop and Ten = 'Minh' and b.MSLop = '99TH'

--9) Liệt kê các sinh viên có địa chỉ ở đường ‘Tran Hung Dao’ 
select MSSV, Ho+ ' ' + Ten as HoTen, DiaChi
from SinhVien a
where DiaChi like '%Tran Hung Dao%'

--10) Liệt kê các sinh viên có tên lót chữ ‘Van’ (không liệt kê người họ ‘Van’) 
select MSSV, Ho+ ' ' + Ten as HoTen
from SinhVien a
where Ho like '%Van'

--11) Liệt kê MSSV, Họ Ten (ghép họ và tên thành một cột), Tuổi của các sinh viên ở tỉnh Long An. 
select MSSV, Ho+ ' ' + Ten as HoTen
from SinhVien a, Tinh b
where a.MSTinh = b.MSTinh and b.MSTinh = '04'

--12) Liệt kê các sinh viên nam từ 23 đến 28 tuổi. 
select MSSV, Ho+ ' ' + Ten as HoTen, 2020 - YEAR(NgaySinh) as tuoi
from SinhVien a
where Phai = 1 and  2020 - YEAR(NgaySinh) between 23 and 28
--13) Liệt kê các sinh viên nam từ 32 tuổi trở lên và các sinh viên nữ từ 27 tuổi trở lên. 
select MSSV, Ho+ ' ' + Ten as HoTen, 2020 - YEAR(NgaySinh) as tuoi
from SinhVien a
where Phai = 1 and  2020 - YEAR(NgaySinh) >= 32 or Phai = 0 and  2020 - YEAR(NgaySinh) >= 27

--14) Liệt kê các sinh viên khi nhập học còn dưới 18 tuổi, hoặc đã trên 25 tuổi. 
select MSSV, Ho+ ' ' + Ten as HoTen, Year(NgayNhapHoc) - Year(NgaySinh) as tuoi
from SinhVien a
where Year(NgayNhapHoc) - YEAR(NgaySinh) <= 18 or Year(NgayNhapHoc) - YEAR(NgaySinh) > 25

--15) Liệt kê danh sách các sinh viên của khóa 99 (MSSV có 2 ký tự đầu là ‘99’). 
select MSSV, Ho+ ' ' + Ten as HoTen, NgayNhapHoc
from SinhVien a
where year(NgayNhapHoc) = 1999

--16) Liệt kê MSSV, Điểm thi lần 1 môn ‘Co so du lieu’ của lớp ’99TH’ 
select a.MSSV, Ho+ ' ' + Ten as HoTen,LanThi, NgayNhapHoc
from SinhVien a, BANGDIEM b
where a.MSSV = b.MSSV and LanThi = 1 and year(NgayNhapHoc) = 1999

--17) Liệt kê MSSV, Họ tên của các sinh viên lớp ’99TH’ thi không đạt lần 1 môn ‘Co so du lieu’
select a.MSSV, Ho+ ' ' + Ten as HoTen, b.MSLop
from SinhVien a, Lop b
where a.MSLop = b.MSLop and b.MSLop like '99TH'

--18) Liệt kê tất cả các điểm thi của sinh viên có mã số ’99TH001’ theo mẫu sau: 
select a.MSMH, TenMH, LanThi, Diem
from MonHoc a, BANGDIEM b
where a.MSMH = b.MSMH

--19) Liệt kê MSSV, họ tên, MSLop của các sinh viên có điểm thi lần 1 môn ‘Co so du lieu’ từ 8 điểm trở lên
select a.MSSV, Ho+ ' ' + Ten as HoTen, b.MSLop, LanThi, Diem
from SinhVien a, Lop b, BANGDIEM c
where a.MSLop = b.MSLop and a.MSSV = c.MSSV and LanThi = 1 and Diem >= 8

--20) Liệt kê các tỉnh không có sinh viên theo học 
select b.MSTinh, TenTinh
from Tinh b
where b.MSTinh not in(select MSTinh
from SinhVien a
where a.MSTinh = B.MSTinh)

--21) Liệt kê các sinh viên hiện chưa có điểm môn thi nào
select a.MSSV, Ho+ ' ' + Ten as HoTen
from SinhVien a
where a.MSSV not in(select MSSV
from BANGDIEM b
where a.MSSV = b.MSSV)

--22) Thống kê số lượng sinh viên ở mỗi lớp theo mẫu sau: MSLop, TenLop, SoLuongSV
select a.MSLop, TenLop, COUNT(MSSV) as SoLuong
from Lop a, SinhVien b
where a.MSLop = b.MSLop
group by a.MSLop, TenLop



--23)Thống kê số lượng sinh viên ở mỗi tỉnh theo mẫu sau:
--MSTinh | Tên Tỉnh | Số SV Nam | Số SV Nữ | Tổng cộng
SELECT A.MSTinh    AS MSTinh, B.TenTinh   AS N'Tên Tỉnh', 
       Count(CASE phai  WHEN '1' THEN 1  ELSE NULL END) AS N'Số SV Nam', 
       Count(CASE phai WHEN '0' THEN 1 ELSE NULL  END) AS N'Số SV Nữ', 
       Count(Phai)   AS N'Tổng cộng' 
FROM   SinhVien A, Tinh B
Where A.MSTinh = B.MSTinh
GROUP  BY A.MSTinh, B.TenTinh 

--24) Thống kê kết quả thi lần 1 môn ‘Co so du lieu’ ở các lớp, theo mẫu sau
--MSLop | TenLop | Số SV đạt | Tỉ lệ đạt (%) | Số SV không đạt | Tỉ lệ không đạt
Select D.MSLop AS 'MaLop',D.TenLop AS 'TenLop', 
       Count(CASE WHEN diem >= 4 THEN 1 ELSE NULL  END) AS N'Số SV đạt', 
       ( Count(CASE WHEN diem >= 4 THEN 1 ELSE NULL END) * 100 / Count(B.Diem) ) AS N'Tỉ lệ đạt (%)', 
       Count(CASE WHEN diem < 4 THEN 1 ELSE NULL END)  AS N'Số SV không đạt', 
       ( Count(CASE WHEN diem < 4 THEN 1 ELSE NULL END) * 100 / Count(B.Diem) ) AS N'Tỉ lệ không đạt (%)', 
       Count(B.Diem) AS TongSo 
From  MonHoc A, BANGDIEM B, SinhVien C, Lop D
Where A.MSMH = B.MSMH and B.MSSV = C.MSSV and C.MSLop = D.MSLop
		and B.LanThi = 1 and A.TenMH = 'Co so du lieu' 
Group by D.MSLop , D.TenLop

--25)Lọc ra điểm cao nhất trong các lần thi cho các sinh viên theo mẫu sau (điểm in ra của
--mỗi môn là điểm cao nhất trong các lần thi của môn đó)
--MSSV | MSMH | Tên MH | Hệ số | Điểm | Điểm x hệ số

Select A.LanThi, A.MSSV, B.TenMH as N'Tên MH', B.HeSo as N'Hệ Số', A.Diem as N'Điểm', (A.Diem * B.HeSo) as N'Điểm x Hệ Số'
From BANGDIEM A, MonHoc B
Where A.MSMH = B.MSMH 
		and A.Diem = (select MAX(C.Diem)
						from BANGDIEM C
						where C.LanThi = A.LanThi)
Order by A.LanThi

--26) Lập bảng tổng kết theo mẫu sau:
--MSSV | Họ | Tên | ĐTB
--Điểm trung bình (ĐTB) = Tổng (điểm x hệ số)/Tổng hệ số
Select A.MSSV, A.Ho as N'Họ', A.Ten as N'Tên', Round(Sum(B.Diem * C.HeSo)/Sum(C.HeSo),2) as ĐTB
From SinhVien A, BANGDIEM B, MonHoc C
Where A.MSSV = B.MSSV and B.MSMH = C.MSMH
Group by A.MSSV, A.Ho, A.Ten

--27) Thống kê số lượng sinh viên tỉnh ‘Long An’ đang theo học ở các khoa, theo mẫu sau:
--	Năm học | MSKhoa | TenKhoa | Số lượng SV
Select C.NienKhoa as N'Năm học',D.MSKhoa,D.TenKhoa,Count(B.MSSV) as N'Số lượng SV'
From Tinh A, SinhVien B, Lop C, KHOA D
Where A.MSTinh = B.MSTinh and B.MSLop = C.MSLop and C.MSKhoa = D.MSKhoa 
		and A.TenTinh = N'Long An'
Group by C.NienKhoa, D.MSKhoa,D.TenKhoa


------------------Hàm, thủ tục
--28)Nhập vào MSSV, in ra bảng điểm của sinh viên đó theo mẫu sau (điểm in ra lấy điểm cao nhất trong các lần thi):
--MSMH Tên MH Hệ số Điểm
Create Proc USP_LayDiem_Theo_MSSV @MSSV nchar(7)
as
	if Not Exists (Select * From BANGDIEM A Where A.MSSV = @MSSV)
		print N'Không tồn tại sinh viên ' + @MSSV + N' trong cơ sở dữ liệu'
	else
		begin
			select A.MSSV,  B.TenMH, max(A.Diem) as N'Max Điểm'
			from BANGDIEM A, MonHoc B
			where A.MSMH = B.MSMH and A.MSSV = @MSSV
			group by  A.MSSV,  B.TenMH
		end;

exec USP_LayDiem_Theo_MSSV '98TH001'
--29)Nhập vào MS lớp, in ra bảng tổng kết của lớp đó, theo mẫu sau:
---MSSV | Họ | Tên | ĐTB | Xếp loại
Create proc usp_Xuat_TongKet @MSLop nchar(4)
as
	if not exists (select * from Lop A where A.MSLop = @MSLop)
		print N'Không tồn tại MS lớp ' + @MSLop + N' trong cơ sở dữ liệu'
	else
		begin
			select A.MSSV, A.Ho, A.Ten, Round(Sum(B.Diem * C.HeSo)/Sum(C.HeSo),2) as ĐTB,
					case when Sum(B.Diem * C.HeSo)/Sum(C.HeSo) =10.00 then N'Xuất sắc'  
						 when Sum(B.Diem * C.HeSo)/Sum(C.HeSo) >=8.00 then N'Giỏi' 
						 when Sum(B.Diem * C.HeSo)/Sum(C.HeSo) >=7.00 then N'Khá' 
						 when Sum(B.Diem * C.HeSo)/Sum(C.HeSo) >=5.00 then N'Trung Bình'
						 when Sum(B.Diem * C.HeSo)/Sum(C.HeSo) >=3.00 then N'Yếu'  
					end
			from SinhVien A, BANGDIEM B, MonHoc C
			where A.MSSV = B.MSSV and B.MSMH = C.MSMH
			group by  A.MSSV, A.Ho, A.Ten
		end;

exec usp_Xuat_TongKet '98TH'

-------------------------Cập nhật dữ liệu
------30) Tạo bảng SinhVienTinh
create table SinhVienTinh
(
	MSSV nchar(7) primary key,
	Ho nvarchar(20) not null,
	Ten nchar(10) not null,
	NgaySinh date not null,
	MSTinh nchar(2) references TINH(MSTinh),
	NgayNhapHoc date not null,
	MSLop nchar(4) references LOP(MSLop),
	Phai bit not null,
	DiaChi nvarchar(30) not null,
	DienThoai nchar(10),
	hocBong int
)


SET DATEFORMAT dmy;
INSERT INTO SinhVienTinh(MSSV, Ho, Ten, NgaySinh, MSTinh, NgayNhapHoc, MSLop, Phai, DiaChi, DienThoai)
VALUES 
	('98TH001', 'Nguyen Van', 'An', '06/08/80', '01', '03/09/98', '98TH', '1', '12 Tran Hung Dao, Q.1', '8234512'),
	('98TH002', 'Le Thi', 'An', '17/10/79', '01', '03/09/98', '98TH', '0', '23 CMT8, Q. Tan Binh', '0303234342'),
	('99TH001', 'Ly Van Hung', 'Dung', '27/09/81', '03', '05/10/99', '99TH', '1', '178 CMT8, Q. Tan Binh', '7563213'),
	('99TH002', 'Van Minh', 'Hoang', '01/01/81', '04', '05/10/99', '99TH', '1', '272 Ly Thuong Kiet, Q.10', '8341234'),
	('99TH003', 'Nguyen', 'Tuan', '12/01/80', '03', '05/10/99', '99TH', '1', '162 Tran Hung Dao, Q.5', NULL),
	('99TH004', 'Tran Van', 'Minh', '25/06/81', '04', '05/10/99', '99TH', '1', '147 Dien Bien Phu, Q.3', '7236754'),
	('99TH005', 'Nguyen Thai', 'Minh', '01/01/80', '04', '05/10/99', '99TH', '1', '345 Le Dai Hanh, Q.11', NULL),
	('99VT001', 'Le Ngoc', 'Mai', '21/06/82', '01', '05/10/99', '99VT', '0', '129 Tran Hung Dao, Q.1', '0903124534'),
	('99QT001', 'Nguyen Thi', 'Oanh', '19/08/73', '04', '05/10/99', '99QT', '0', '76 Hung Vuong, Q.5', '0901656324'),
	('99QT002', 'Le My', 'Hanh', '20/05/76', '04', '05/10/99', '99QT', '0', '12 Pham Ngoc Thach, Q.3', NULL)

select * from SinhVienTinh

---31) Cập nhật thuộc tính HBONG trong table SinhVienThanh 10000 cho tất cả các sinh viên.
update SinhVienTinh
set hocBong = 10000

---32) Tăng HBONG lên 10% cho các sinh viên nữ
update SinhVienTinh
set hocBong = hocBong * 100/10
where Phai = '0' 
---33) Xóa tất cả các sinh viên có quê quán ở Long An ra khỏi table SinhVienTinh
delete from SinhVienTinh
		where MSTinh = '04'

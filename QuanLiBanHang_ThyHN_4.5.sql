create database IA1601_QuanLyBanHang_HoangNhaThy_SE151101
use IA1601_QuanLyBanHang_HoangNhaThy_SE151101

create table KHACHHANG(
 MAKH char(4) not null, 
 HOTEN varchar(40),
 DCHI varchar(50),
 SODT varchar(20),
 NGSINH smalldatetime,
 DOANHSO money,
 NGDK smalldatetime,
 constraint PK_KH primary key(MAKH)
)

create table NHANVIEN(
 MANV char(4) not null, 
 HOTEN varchar(40),
 SODT varchar(20),
 NGVL smalldatetime,
 constraint PK_NV primary key(MANV)
)

create table SANPHAM(
 MASP char(4) not null,
 TENSP varchar(40),
 DVT varchar(20),
 NUOCSX varchar(40),
 GIA money,
 constraint PK_SP primary key(MASP) 
)

create table HOADON(
 SOHD int not null,
 NGHD smalldatetime,
 MAKH char(4),
 MANV char(4),
 TRIGIA money,
 constraint PK_HD primary key(SOHD)
)

create table CTHD(
 SOHD int,
 MASP char(4),
 SL int,
 constraint PK_CTHD primary key(SOHD,MASP)
)

alter table HOADON add constraint fk01_HD foreign key(MAKH) references KHACHHANG(MAKH)
alter table HOADON drop constraint FK01_HD
alter table HOADON add constraint fk02_HD foreign key(MANV) references NHANVIEN(MANV)
alter table HOADON drop constraint FK02_HD

alter table CTHD add constraint fk01_CTHD foreign key(SOHD) references HOADON(SOHD)
alter table CTHD drop constraint FK01_CTHD
alter table CTHD add constraint fk02_CTHD foreign key(MASP) references SANPHAM(MASP)
alter table CTHD drop constraint FK02_CTHD

set dateformat dmy

insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960',13060000,'22/07/2006')
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974',280000,'30/07/2006')
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980',3860000,'08/05/2006')
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965',250000,'10/02/2006')
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950',21000,'28/10/2006')
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981',915000,'24/11/2006')
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971',12500,'12/01/2006')
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971',365000,'13/12/2006')
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979',70000,'14/01/2007')
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983',67500,'16/01/2007')
 
insert into nhanvien values('NV01','Nguyen Nhu Nhut','0927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','0987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','0997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','0913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','0918590387','20/07/2006')
 
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)
 
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)
 
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)

SELECT * FROM KHACHHANG
SELECT * FROM NHANVIEN
SELECT * FROM SANPHAM
SELECT * FROM HOADON
SELECT * FROM CTHD


--I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
--1. Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của quan hệ.
--Em đã tạo ở trên ạ
--2. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
alter table SANPHAM 
	add GHICHU varchar(20)
--3. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
alter table KHACHHANG 
	add LOAIKH tinyint
--4. Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
alter table SANPHAM 
	alter column GHICHU varchar(100)
--5. Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
alter table SANPHAM 
	drop column GHICHU
--6. Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là:"Vang lai", "Thuong xuyen", "Vip",...
alter table KHACHHANG  
	alter column LOAIKH varchar(20)
--7. Đơn vị tính của sản phẩm chỉ có thể là "cay","hop","cai","quyen","chuc")
alter table SANPHAM  
	add constraint SANPHAM_DVT check (DVT = 'cay' OR DVT = 'hop' OR DVT = 'cai' OR DVT = 'quyen' OR DVT = 'chuc')
--8. Giá bán của sản phẩm từ 500 đồng trở lên.
alter table SANPHAM 
	add constraint SANPHAM_GIA check (GIA > 500)
--9. Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
alter table CTHD
	add constraint CTHD_SL check (SL >= 1)
--10. Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
alter table KHACHHANG
add constraint KHANGHANG_NDK_NGSINH check (NGDK > NGSINH)
--11. Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK).
create trigger CHECH_NGAYKH 
	on HOADON for insert as if UPDATE(NGHD)
begin declare @NGHD smalldatetime, @NGDK smalldatetime
	set @NGHD = (select NGHD from INSERTED)
	set @NGDK = (select NGDK from KHACHHANG a, INSERTED b where a.MAKH = b.MAKH)
	if(@NGHD < @NGDK)
		begin
		print'NGHD phai lon hon NGDK.'
		rollback tran
		end
	else
		begin
		print'Them thanh cong hoa don.'
		end
end

create trigger CHECK_NGAYKH
	on HOADON for UPDATE, insert as if UPDATE(NGHD)
begin
	if(select COUNT(*) from KHACHHANG K, INSERTED I
		where K.MAKH = I.MAKH and I.NGHD < K.NGDK) > 0
		begin
		print'NGHD phai lon hon NGDK.'
		rollback tran
		end
	ELSE
		begin
		print'Them thanh cong hoa don.'
		end
end
--12.Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm.
create trigger TRG_NGAYNV 
	on HOADON for UPDATE, insert as if UPDATE(NGHD)
begin
	declare @NGHD smalldatetime, @NGVL smalldatetime
	set @NGHD = (select NGHD from INSERTED)
	set @NGVL = (select NGVL from NHANVIEN a,INSERTED b where a.MANV = b.MANV)
	if(@NGHD < @NGVL)
		begin
		print'NGHD phai lon hon NGVL'
		rollback tran
		end
end

create trigger TRG_NGAYNV02 on HOADON
	for insert, UPDATE as begin
	if exists (select * from INSERTED a, NHANVIEN b
		where A.MANV = B.MANV and A.NGHD < B.NGVL)
		begin
		print'NGHD phai lon hon NGVL.'
		rollback tran
		end
	if(UPDATE(NGHD))
		begin
		if exists ( select * from INSERTED a, DELETED b
		where a.SOHD = b.SOHD and a.NGHD = b.NGHD)
			begin
			print'Du lieu vua nhap da co.'
			rollback tran
			end
		end
--13. Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn.
create trigger CTHD_C13 on CTHD
	for delete,UPDATE as
	declare @SL int,@SOHD int
	select @SL=COUNT(a.SOHD),@SOHD = d.SOHD from  DELETED d,CTHD a
		where a.SOHD = d.SOHD
		group by d.SOHD
	if(@SL < 1)
		begin
		delete from HOADON
		where SOHD = @SOHD
		print'Da xoa CTHD cuoi cung cua hoa don tren.'
		end

create trigger HOADON_C13 on HOADON
	for insert as
	declare @SOHD int
	select @SOHD = SOHD
	from INSERTED
	UPDATE CTHD
	set MASP = 'NONE',SL = 0
		where SOHD = @SOHD
	print'Update thanh cong! Hay update lai CTHD: '
--Câu 14 và 15 cũng là trigger nhưng thầy bảo trigger muốn làm thì làm với lại 2 câu này làm rất dài nên em không làm ạ.
--II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
--1. Nhập dữ liệu cho các quan hệ trên.
--đã nhập ở trên
--2. Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
select * from SANPHAM,KHACHHANG
--3. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE SANPHAM set GIA = GIA + GIA/(100/5) 
	where NUOCSX = 'Thai Lan'
--4. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE SANPHAM set GIA = GIA/(100/5) + GIA 
	where NUOCSX = 'Trung Quoc' and GIA > 10000
--5. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 10.000.000 
	--trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
UPDATE KHACHHANG set LOAIKH ='Vip' 
	where (NGDK < '2007/1/1' and DOANHSO >= 10000000) or (NGDK > '2007/1/1' and DOANHSO >= 2000000)

--III. Ngôn ngữ truy vấn dữ liệu:
--Phần 1:
--1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
select MASP, TENSP from SANPHAM 
	where NUOCSX = 'Trung Quoc'
--2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
select MASP, TENSP from SANPHAM 
	where DVT in('cay', 'quyen')
--3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
select MASP, TENSP from SANPHAM 	where MASP like'B%01'--4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.select MASP,TENSP,NUOCSX from SANPHAM 
	where NUOCSX = 'Trung Quoc' and GIA between 30000 and 40000
--5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
select MASP, TENSP, NUOCSX from SANPHAM 
	where (NUOCSX = 'Trung Quoc' OR NUOCSX = 'Thai Lan') and GIA between 30000 and 40000
--6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007
select SOHD, TRIGIA from HOADON 
	where NGHD = '2007/1/1'  or NGHD = '2007/1/2'
--7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select SOHD, TRIGIA from HOADON 
	where YEAR (NGHD) = 2007 and MONTH (NGHD) = 1 order by NGHD, TRIGIA desc
--8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select KHACHHANG.MAKH ,HOTEN from KHACHHANG,HOADON 
	where KHACHHANG.MAKH = HOADON.MAKH and HOADON.NGHD ='2007/1/1'
--9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
select SOHD,TRIGIA from HOADON,NHANVIEN 
	where NHANVIEN.MANV = HOADON.MANV and NHANVIEN.HOTEN = 'Nguyen Van B' and HOADON.NGHD = '2006/10/28'
--10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
select SP.MASP,SP.TENSP from SANPHAM SP,HOADON HD,CTHD CT,KHACHHANG KH 
	where SP.MASP = CT.MASP and CT.SOHD = HD.SOHD and HD.MAKH = KH.MAKH and KH.HOTEN = 'Nguyen Van A' and YEAR(HD.NGHD) = 2006 and MONTH(HD.NGHD) = 10
--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
select SOHD from CTHD 
	where MASP in ('BB01', 'BB02')
--12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select SOHD from CTHD 
	where (MASP ='BB01' or MASP= 'BB02') and SL between 10 and 20
--13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20
select SOHD from CTHD 
	where (MASP ='BB01' and MASP= 'BB02') and SL between 10 and 20
--14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
select SANPHAM.MASP,SANPHAM.TENSP from SANPHAM,HOADON,CTHD 
	where SANPHAM.NUOCSX = 'Trung Quoc' and CTHD.SOHD = HOADON.SOHD or HOADON.NGHD = '2007/1/1'
--15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
select SANPHAM.MASP,SANPHAM.TENSP from SANPHAM 
	where SANPHAM.MASP not in (select CTHD.MASP from CTHD)

--Hoang Nha Thy - SE151101


-------------------------------------------------------------------------------------------------------------------------------------------------------------
--PHẦN 2
--16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
select sp.MASP,sp.TENSP from SANPHAM sp
	where sp.MASP not in (select ct.MASP from HOADON hd, CTHD ct 
								where hd.SOHD = ct.SOHD and YEAR(hd.NGHD) = 2006)
--17. In ra danh sách các sản phẩm (MASP,TENSP) do "Trung Quoc" sản xuất không bán được trong năm 2006.
select MASP, TENSP from SANPHAM
	where NUOCSX = 'Trung Quoc'
	except
		select distinct sp.MASP, sp.TENSP from HOADON hd, CTHD ct, SANPHAM sp
			where YEAR(hd.NGHD) = 2006 and hd.SOHD = ct.SOHD and sp.MASP = ct.MASP
--18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
select SOHD from HOADON
	where not exists (select * from SANPHAM
							where NUOCSX= 'Singapore' and MASP not in (select MASP from CTHD
																			where SOHD = HOADON.SOHD and CTHD.MASP = SANPHAM.MASP))
--19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
select SOHD from HOADON
	where YEAR(NGHD) = 2006 
	and not exists (select * from SANPHAM
						where NUOCSX = 'Singapore' and MASP not in (select MASP from CTHD 
																		where SOHD = HOADON.SOHD))
--20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select COUNT(SOHD) as SL from HOADON
	where MAKH is null
--21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
select COUNT(distinct ct.MASP) as DSO from HOADON hd, CTHD ct
	where YEAR(hd.NGHD) = 2006 and ct.SOHD = hd.SOHD
--22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select MAX(HOADON.TRIGIA) as MaxHD, MIN(HOADON.TRIGIA) as MinHD from HOADON
--23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select AVG(hd.TRIGIA) AverageHD from HOADON hd
	where YEAR(hd.NGHD) = 2006
--24. Tính doanh thu bán hàng trong năm 2006.
select sum(hd.TRIGIA) as DT from HOADON hd
	where YEAR(hd.NGHD) = 2006
--25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select SOHD from HOADON
	where TRIGIA in (select MAX(hd.TRIGIA) from HOADON hd
							where YEAR(hd.NGHD) = 2006)
--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
select kh.HOTEN from KHACHHANG kh, HOADON
	where HOADON.MAKH = KH.MAKH and HOADON.TRIGIA in (select MAX(hd.TRIGIA) from HOADON hd
															where YEAR(hd.NGHD) = 2006)
--27. In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
select top 3 MAKH, HOTEN from KHACHHANG 
	order by DOANHSO desc
--28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select MASP, TENSP from SANPHAM
	where GIA in (select distinct top 3 sp.GIA from SANPHAM sp
						order by sp.GIA desc)
--29. In ra danh sách các sản phẩm (MASP, TENSP) do "Thai Lan" sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
select SANPHAM.MASP, SANPHAM.TENSP from SANPHAM
	where SANPHAM.NUOCSX = 'Thai Lan' 
	and SANPHAM.GIA in (select distinct top 3 sp.GIA from SANPHAM sp
							order by sp.GIA desc)
--30. In ra danh sách các sản phẩm (MASP, TENSP) do "Trung Quoc" sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do "Trung Quoc" sản xuất).select SANPHAM.MASP, SANPHAM.TENSP from SANPHAM
	where SANPHAM.NUOCSX = 'Trung Quoc' 
	and SANPHAM.GIA in (select distinct top 3 sp.GIA from SANPHAM sp
							where sp.NUOCSX = 'Trung Quoc'
							order by sp.GIA desc)--31. * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
select top 3 RANK() over (order by kh.DOANHSO desc) ThuHang, * from KHACHHANG kh
	order by kh.DOANHSO desc
--32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select COUNT(MASP) as NumberSP from SANPHAM
	where NUOCSX = 'Trung Quoc'
--33. Tính tổng số sản phẩm của từng nước sản xuất.
select NUOCSX, COUNT(MASP) as NumberSP from SANPHAM
	group by NUOCSX
--34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select MAX(GIA) CaoNhat, MIN(GIA) ThapNhat, AVG(GIA) TrungBinh from SANPHAM
	group by NUOCSX
--35. Tính doanh thu bán hàng mỗi ngày.
select NGHD, SUM(TRIGIA) DoanhThu from HOADON
	group by NGHD
--36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
select ct.MASP, SUM(ct.SL) as SLSP from CTHD ct, HOADON hd
	where ct.SOHD = hd.SOHD and MONTH(NGHD) = 10 and YEAR(NGHD) = 2006 
	group by ct.MASP
--37. Tính doanh thu bán hàng của từng tháng trong năm 2006.select MONTH(hd.NGHD) Thang , SUM(hd.TRIGIA) Tong from HOADON hd 
	where YEAR(hd.NGHD) = 2006
	group by MONTH(hd.NGHD)--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select SOHD, COUNT(MASP) as SoSanPham from CTHD
	group by SOHD
	having COUNT(MASP) >= 4
--39. Tìm hóa đơn có mua 3 sản phẩm do "Viet Nam" sản xuất (3 sản phẩm khác nhau).
select ct.SOHD, COUNT(CT.MASP) as SoSanPham from CTHD ct, SANPHAM sp
	where ct.MASP = sp.MASP and sp.NUOCSX='Viet Nam'
	group by ct.SOHD
	having COUNT(ct.masp) >= 3
--40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
select TOP 1 HOADON.MAKH, KH.HOTEN from HOADON, KHACHHANG kh
	where HOADON.MAKH is not null and HOADON.MAKH = KH.MAKH
	group by HOADON.MAKH, KH.HOTEN
	order by COUNT(HOADON.MAKH) desc
--41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?select MONTH(hd2.NGHD) as MaxInMonth from HOADON hd2
	where YEAR(hd2.NGHD) = 2006
	group by MONTH(hd2.NGHD)
	having SUM(hd2.TRIGIA) >= all (select SUM(hd.TRIGIA) from HOADON hd
										where YEAR(hd.NGHD) = 2006
										group by MONTH(hd.NGHD))--42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select ct1.MASP, sp.TENSP from CTHD ct1, HOADON hd1, SANPHAM sp 
	where ct1.SOHD = hd1.SOHD and YEAR(hd1.NGHD)=2006 and sp.MASP = ct1.MASP
	group by ct1.MASP, sp.TENSP
	having SUM(ct1.SL) <= all (select SUM(ct.SL) from CTHD ct, HOADON hd 
									where ct.SOHD = hd.SOHD and YEAR(hd.NGHD)=2006
									group by ct.MASP)
--43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.select sp1.NUOCSX, sp1.MASP, sp1.TENSP from SANPHAM sp1, 
    (select sp.NUOCSX, MAX(sp.GIA) giamax from SANPHAM sp
			group by sp.NUOCSX) gia_QG
			where sp1.NUOCSX = gia_QG.NUOCSX and sp1.GIA = gia_QG.giamax--44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
select sp.NUOCSX from SANPHAM sp
	group by sp.NUOCSX
	having COUNT(distinct sp.GIA) >= 3
--45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
select hd1.MAKH, DS1.HOTEN from (select TOP 10 kh1.MAKH, KH1.HOTEN from KHACHHANG kh1
									where kh1.MAKH is not null
									order by kh1.DOANHSO desc) DS1, HOADON hd1
	where DS1.MAKH = hd1.MAKH
	group by hd1.MAKH, DS1.HOTEN
	having COUNT(HD1.SOHD) >= all (select COUNT(hd.SOHD) from (select TOP 10 kh.MAKH from KHACHHANG kh
																	where kh.MAKH is not null
																	order by kh.DOANHSO desc) DS, HOADON hd
										where DS.MAKH = hd.MAKH
										group by hd.MAKH)
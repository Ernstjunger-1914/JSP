create table TBL_PIZZA_01(
pcode char(4) primary key,
pname varchar2(30),
cost number(7)
);

create table TBL_SHOP_01(
scode char(4) primary key,
sname varchar2(20)
);

create table TBL_SALELIST_01(
saleno number(7) primary key,
scode char(4),
saledate date,
pcode char(4),
amount number(5),
CONSTRAINT FK_fk01 FOREIGN KEY(scode) REFERENCES TBL_SHOP_01(scode),
CONSTRAINT FK_fk02 FOREIGN KEY(pcode) REFERENCES TBL_PIZZA_01(pcode)
);

insert into TBL_PIZZA_01 values('AA01', '고르곤졸라피자', 6000);
insert into TBL_PIZZA_01 values('AA02', '치즈피자', 6500);
insert into TBL_PIZZA_01 values('AA03', '페페로니피자', 6000);
insert into TBL_PIZZA_01 values('AA04', '콤비네이션피자', 6000);
insert into TBL_PIZZA_01 values('AA05', '고구마피자', 6000);
insert into TBL_PIZZA_01 values('AA06', '포테이토피자', 6000);
insert into TBL_PIZZA_01 values('AA07', '불고기피자', 6000);
insert into TBL_PIZZA_01 values('AA08', '나폴리피자', 8000);

insert into TBL_SHOP_01 values('S001', '강남점');
insert into TBL_SHOP_01 values('S002', '강서점');
insert into TBL_SHOP_01 values('S003', '강동점');
insert into TBL_SHOP_01 values('S004', '영동점');
insert into TBL_SHOP_01 values('S005', '시청점');
insert into TBL_SHOP_01 values('S006', '인천점');

insert into TBL_SALELIST_01 values(100001, 'S001', '2018-12-02', 'AA01', 50);
insert into TBL_SALELIST_01 values(100002, 'S001', '2018-12-02', 'AA02', 30);
insert into TBL_SALELIST_01 values(100003, 'S001', '2018-12-02', 'AA03', 20);
insert into TBL_SALELIST_01 values(100004, 'S001', '2018-12-02', 'AA04', 50);
insert into TBL_SALELIST_01 values(100005, 'S003', '2018-12-03, 'AA01', 40);
insert into TBL_SALELIST_01 values(100006, 'S003', '2018-12-03', 'AA02', 60);
insert into TBL_SALELIST_01 values(100007, 'S003', '2018-12-03', 'AA04', 60);
insert into TBL_SALELIST_01 values(100008, 'S003', '2018-12-04', 'AA05', 70);
insert into TBL_SALELIST_01 values(100009, 'S005', '2018-12-02', 'AA01', 80);
insert into TBL_SALELIST_01 values(100010, 'S005', '2018-12-02', 'AA03', 30);
insert into TBL_SALELIST_01 values(100011, 'S005', '2018-12-02', 'AA04', 40);
insert into TBL_SALELIST_01 values(100012, 'S005', '2018-12-02', 'AA05', 50);
insert into TBL_SALELIST_01 values(100013, 'S004', '2018-12-04', 'AA01', 30);
insert into TBL_SALELIST_01 values(100014, 'S004', '2018-12-04', 'AA02', 20);
insert into TBL_SALELIST_01 values(100015, 'S004', '2018-12-04', 'AA06', 50);

commit;

select saleno, b.scode, sname, TO_CHAR(saledate, 'YYYY-MM-DD'), b.pcode, pname, amount, TO_CHAR((amount*cost), 'L999,999') FROM TBL_PIZZA_01 a, TBL_SALELIST_01 b, TBL_SHOP_01 c WHERE a.pcode=b.pcode AND b.scode=c.scode;

select b.scode, sname, TO_CHAR(SUM(amount*cost), '999,999,999') from TBL_PIZZA_01 a, TBL_SALELIST_01 b, TBL_SHOP_01 c WHERE a.pcode=b.pcode AND b.scode=c.scode GROUP BY b.scode, sname ORDER BY b.scode;

select a.pcode, a.pname, TO_CHAR(SUM(amount*cost), '999,999,999') from TBL_PIZZA_01 a, TBL_SALELIST_01 b, TBL_SHOP_01 c WHERE a.pcode=b.pcode AND b.scode=c.scode GROUP BY a.pcode, pname ORDER BY TO_CHAR(SUM(amount*cost), '999,999,999') DESC;

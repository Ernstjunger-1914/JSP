create table TBL_PIZZA_02(
pcode char(4) primary key,
pname varchar2(30),
cost number(7)
);

create table TBL_SHOP_02(
scode char(4) primary key,
sname varchar2(20)
);

create table TBL_SALELIST_02(
saleno number(7) primary key,
scode char(4),
saledate date,
pcode char(4),
amount number(5),
CONSTRAINT FK_fk01 FOREIGN KEY(scode) REFERENCES TBL_SHOP_02(scode),
CONSTRAINT FK_fk02 FOREIGN KEY(pcode) REFERENCES TBL_PIZZA_02(pcode)
);

insert into TBL_PIZZA_02 values('AA01', '고르곤졸라피자', 6000);
insert into TBL_PIZZA_02 values('AA02', '치즈피자', 6500);
insert into TBL_PIZZA_02 values('AA03', '페페로니피자', 6000);
insert into TBL_PIZZA_02 values('AA04', '콤비네이션피자', 6000);
insert into TBL_PIZZA_02 values('AA05', '고구마피자', 6000);
insert into TBL_PIZZA_02 values('AA06', '포테이토피자', 6000);
insert into TBL_PIZZA_02 values('AA07', '불고기피자', 6000);
insert into TBL_PIZZA_02 values('AA08', '나폴리피자', 8000);

insert into TBL_SHOP_02 values('S001', '강남점');
insert into TBL_SHOP_02 values('S002', '강서점');
insert into TBL_SHOP_02 values('S003', '강동점');
insert into TBL_SHOP_02 values('S004', '영동점');
insert into TBL_SHOP_02 values('S005', '시청점');
insert into TBL_SHOP_02 values('S006', '인천점');

insert into TBL_SALELIST_02 values(100001, 'S001', '2018-12-02', 'AA01', 50);
insert into TBL_SALELIST_02 values(100002, 'S001', '2018-12-02', 'AA02', 30);
insert into TBL_SALELIST_02 values(100003, 'S001', '2018-12-02', 'AA03', 20);
insert into TBL_SALELIST_02 values(100004, 'S001', '2018-12-02', 'AA04', 50);
insert into TBL_SALELIST_02 values(100005, 'S003', '2018-12-03', 'AA01', 40);
insert into TBL_SALELIST_02 values(100006, 'S003', '2018-12-03', 'AA02', 60);
insert into TBL_SALELIST_02 values(100007, 'S003', '2018-12-03', 'AA04', 60);
insert into TBL_SALELIST_02 values(100008, 'S003', '2018-12-04', 'AA05', 70);
insert into TBL_SALELIST_02 values(100009, 'S005', '2018-12-02', 'AA01', 80);
insert into TBL_SALELIST_02 values(100010, 'S005', '2018-12-02', 'AA03', 30);
insert into TBL_SALELIST_02 values(100011, 'S005', '2018-12-02', 'AA04', 40);
insert into TBL_SALELIST_02 values(100012, 'S005', '2018-12-02', 'AA05', 50);
insert into TBL_SALELIST_02 values(100013, 'S004', '2018-12-04', 'AA01', 30);
insert into TBL_SALELIST_02 values(100014, 'S004', '2018-12-04', 'AA02', 20);
insert into TBL_SALELIST_02 values(100015, 'S004', '2018-12-04', 'AA06', 50);

commit;

select saleno, b.scode, sname, TO_CHAR(saledate, 'YYYY-MM-DD'), b.pcode, pname, amount, TO_CHAR((amount*cost), 'L999,999') FROM TBL_PIZZA_02 a, TBL_SALELIST_02 b, TBL_SHOP_02 c WHERE a.pcode=b.pcode AND b.scode=c.scode;
select saleno, s.scode||'-'||sname as s, to_char(saledate, 'yyyy-mm-dd') as dt, ts.pcode, pname, amount, to_char((amount*cost), 'L999,999,999') total from tbl_salelist_02 ts, tbl_shop_02 s, tbl_pizza_02 p where ts.scode=s.scode and ts.pcode=p.pcode order by saleno;

select b.scode, sname, TO_CHAR(SUM(amount*cost), '999,999,999') from TBL_PIZZA_02 a, TBL_SALELIST_02 b, TBL_SHOP_02 c WHERE a.pcode=b.pcode AND b.scode=c.scode GROUP BY b.scode, sname ORDER BY b.scode;
select s.scode, sname, to_char(sum(amount*cost), 'L999,999,999') as total from tbl_shop_02 s, tbl_salelist_02 ts, tbl_pizza_02 p where s.scode=ts.scode and p.pcode=ts.pcode group by s.scode, sname order by s.scode;
SELECT tsl.scode, sname, TO_CHAR(SUM(amount*cost),'L999,999,999') FROM TBL_PIZZA_02 tp INNER JOIN TBL_SALELIST_02 tsl ON tp.pcode=tsl.pcode INNER JOIN TBL_SHOP_02 ts ON ts.scode=tsl.scode GROUP BY tsl.scode, sname ORDER BY tsl.scode;

select a.pcode, a.pname, TO_CHAR(SUM(amount*cost), '999,999,999') from TBL_PIZZA_02 a, TBL_SALELIST_02 b, TBL_SHOP_02 c WHERE a.pcode=b.pcode AND b.scode=c.scode GROUP BY a.pcode, pname ORDER BY TO_CHAR(SUM(amount*cost), '999,999,999') DESC;
select p.pcode, pname, to_char(sum(cost*amount), 'L999,999,999') as total from tbl_pizza_02 p inner join tbl_salelist_02 ts on p.pcode=ts.pcode inner join tbl_shop_02 s on ts.scode=s.scode group by p.pcode, pname;
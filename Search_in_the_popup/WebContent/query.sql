CREATE TABLE tbl_product_01(
pcode varchar2(10) PRIMARY KEY, 
name varchar2(20),
cost number(10)
);

CREATE TABLE tbl_shop_01(
scode varchar2(10) PRIMARY KEY,
sname varchar2(20)
);

CREATE TABLE tbl_salelist_01(
saleno number(10) PRIMARY KEY,
pcode varchar2(10),
saledate date,
scode varchar2(10),
amount number(10),
CONSTRAINT fk_pcode FOREIGN KEY(pcode) REFERENCES tbl_product_01(pcode),
CONSTRAINT fk_scode FOREIGN KEY(scode) REFERENCES tbl_shop_01(scode)
);

INSERT INTO tbl_product_01 VALUES('AA01', '아메리카노', 3000);
INSERT INTO tbl_product_01 VALUES('AA02', '에스프레소', 3500);
INSERT INTO tbl_product_01 VALUES('AA03', '카페라떼', 4000);
INSERT INTO tbl_product_01 VALUES('AA04', '카라멜마끼', 4500);
INSERT INTO tbl_product_01 VALUES('AA05', '카푸치노', 5000);
INSERT INTO tbl_product_01 VALUES('AA06', '초코롤케익', 6000);
INSERT INTO tbl_product_01 VALUES('AA07', '녹차롤케익', 6500);
INSERT INTO tbl_product_01 VALUES('AA08', '망고주스', 7000);
INSERT INTO tbl_product_01 VALUES('AA09', '핫초코', 2500);

INSERT INTO tbl_shop_01 VALUES('S001', '강남점');
INSERT INTO tbl_shop_01 VALUES('S002', '강서점');
INSERT INTO tbl_shop_01 VALUES('S003', '강동점');
INSERT INTO tbl_shop_01 VALUES('S004', '강북점');
INSERT INTO tbl_shop_01 VALUES('S005', '동대문점');
INSERT INTO tbl_shop_01 VALUES('S006', '인천점');

INSERT INTO tbl_salelist_01 VALUES('10001', 'AA01', '2018-09-02', 'S001', 50);
INSERT INTO tbl_salelist_01 VALUES('10002', 'AA03', '2018-09-02', 'S002', 40);
INSERT INTO tbl_salelist_01 VALUES('10003', 'AA04', '2018-09-02', 'S002', 20);
INSERT INTO tbl_salelist_01 VALUES('10004', 'AA04', '2018-09-02', 'S001', 30);
INSERT INTO tbl_salelist_01 VALUES('10005', 'AA05', '2018-09-02', 'S004', 40);
INSERT INTO tbl_salelist_01 VALUES('10006', 'AA03', '2018-09-02', 'S004', 30);
INSERT INTO tbl_salelist_01 VALUES('10007', 'AA01', '2018-09-02', 'S003', 50);
INSERT INTO tbl_salelist_01 VALUES('10008', 'AA04', '2018-09-02', 'S004', 10);
INSERT INTO tbl_salelist_01 VALUES('10009', 'AA01', '2018-09-02', 'S003', 20);
INSERT INTO tbl_salelist_01 VALUES('10010', 'AA05', '2018-09-02', 'S003', 30);
INSERT INTO tbl_salelist_01 VALUES('10011', 'AA01', '2018-09-02', 'S001', 40);
INSERT INTO tbl_salelist_01 VALUES('10012', 'AA03', '2018-09-02', 'S002', 50);
INSERT INTO tbl_salelist_01 VALUES('10013', 'AA04', '2018-09-02', 'S002', 50);
INSERT INTO tbl_salelist_01 VALUES('10014', 'AA05', '2018-09-02', 'S004', 20);
INSERT INTO tbl_salelist_01 VALUES('10015', 'AA01', '2018-09-02', 'S003', 30);

COMMIT;

select s.scode, sname, to_char(sum(cost*amount), '999,999,999') sum from tbl_product_01 p inner join tbl_salelist_01 sl on p.pcode=sl.pcode inner join tbl_shop_01 s on s.scode=sl.scode group by s.scode, sname order by s.scode;

select p.pcode, name, sum(cost*amount) from tbl_product_01 p inner join tbl_salelist_01 s on p.pcode=s.pcode group by p.pcode, name order by p.pcode asc;

select saleno, tp.pcode, TO_CHAR(saledate, 'YYYY-MM-DD'), name, ts.scode, amount, TO_CHAR((amount*cost), '999,999,999') from tbl_product_01 tp INNER JOIN tbl_salelist_01 tsl ON tp.pcode=tsl.pcode INNER JOIN tbl_shop_01 ts ON ts.scode=tsl.scode;
select saleno, tp.pcode, TO_CHAR(saledate, 'YYYY-MM-DD'), name, ts.scode, amount, TO_CHAR((amount*cost), '999,999,999') from tbl_product_01 tp INNER JOIN tbl_salelist_01 tsl ON tp.pcode=tsl.pcode INNER JOIN tbl_shop_01 ts ON ts.scode=tsl.scode where name like '%아메%';
select saleno, tp.pcode, TO_CHAR(saledate, 'YYYY-MM-DD'), name, ts.scode, amount, TO_CHAR((amount*cost), '999,999,999') from tbl_product_01 tp INNER JOIN tbl_salelist_01 tsl ON tp.pcode=tsl.pcode INNER JOIN tbl_shop_01 ts ON ts.scode=tsl.scode where saledate>=TO_DATE('20180901', 'YYYY-MM-DD') AND saledate<=TO_DATE('20181015', 'YYYY-MM-DD');
select saleno, tp.pcode, TO_CHAR(saledate, 'YYYY-MM-DD'), name, ts.scode, amount, TO_CHAR((amount*cost), '999,999,999') from tbl_product_01 tp INNER JOIN tbl_salelist_01 tsl ON tp.pcode=tsl.pcode INNER JOIN tbl_shop_01 ts ON ts.scode=tsl.scode where saleno=10001;

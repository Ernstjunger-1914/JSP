create table tbl_shop_202101(
shopno char(4) primary key,
shopname varchar2(20),
shopdc number(3)
);

create table tbl_product_202101(
pcode char(4) primary key,
pname varchar2(20),
cost number(5)
);

create table tbl_order_202101(
orderno char(8),
pcode char(4),
orderdate varchar2(8),
shopno char(4),
amount number(7),
constraint fk_p foreign key(pcode) references tbl_product_202101(pcode),
constraint fk_s foreign key(shopno) references tbl_shop_202101(shopno)
);

insert into tbl_shop_202101 values('S001', 'AA 할인점', '10');
insert into tbl_shop_202101 values('S002', 'BB 할인점', '15');
insert into tbl_shop_202101 values('S003', 'CC 할인점', '10');
insert into tbl_shop_202101 values('S004', 'DD 할인점', '15');

insert into tbl_product_202101 values('AA01', '삼각김밥', 1000);
insert into tbl_product_202101 values('AA02', '도시락', 3000);
insert into tbl_product_202101 values('AA03', '봉지만두', 2000);
insert into tbl_product_202101 values('AA04', '컵라면', 1500);
insert into tbl_product_202101 values('AA05', '초콜릿', 1200);
insert into tbl_product_202101 values('AA06', '콜라', 800);

insert into tbl_order_202101 values('20210001', 'AA01', '20211201', 'S001', 50);
insert into tbl_order_202101 values('20210002', 'AA02', '20211201', 'S002', 10);
insert into tbl_order_202101 values('20210003', 'AA03', '20211201', 'S003', 20);
insert into tbl_order_202101 values('20210004', 'AA01', '20211202', 'S001', 60);
insert into tbl_order_202101 values('20210005', 'AA04', '20211202', 'S002', 50);
insert into tbl_order_202101 values('20210006', 'AA06', '20211203', 'S003', 20);
insert into tbl_order_202101 values('20210007', 'AA05', '20211203', 'S002', 40);
insert into tbl_order_202101 values('20210008', 'AA04', '20211203', 'S001', 10);
insert into tbl_order_202101 values('20210009', 'AA01', '20211203', 'S003', 20);
insert into tbl_order_202101 values('20210010', 'AA03', '20211204', 'S004', 80);
insert into tbl_order_202101 values('20210011', 'AA02', '20211204', 'S001', 70);
insert into tbl_order_202101 values('20210012', 'AA04', '20211204', 'S004', 50);
insert into tbl_order_202101 values('20210013', 'AA01', '20211204', 'S002', 20);
insert into tbl_order_202101 values('20210014', 'AA01', '20211205', 'S001', 40);
insert into tbl_order_202101 values('20210015', 'AA02', '20211205', 'S002', 60);

commit;

select substr(orderno, 1, 4)||'-'||substr(orderno, 5, 6) as orderno, p.pcode, pname, o.shopno, shopname, substr(orderdate, 1, 4)||'-'||substr(orderdate, 5, 2)||'-'||substr(orderdate, 7, 2) as dt, cost, amount, to_char(cost*amount, '999,999') as total, to_char(decode(s.shopno, 'S001', cost*amount*0.9, 'S002', cost*amount*0.85, 'S003', cost*amount*0.9, 'S004', cost*amount*0.85), '999,999') as dc from tbl_shop_202101 s inner join tbl_order_202101 o on s.shopno=o.shopno inner join tbl_product_202101 p on p.pcode=o.pcode;

select o.pcode, o.shopno, pname, amount from tbl_product_202101 p inner join tbl_order_202101 o on p.pcode=o.pcode order by o.shopno, o.pcode;

select p.pcode, to_char(cost, '999,999') as cost, to_char(cost*0.9, '999,999') as dc10, to_char(cost*0.85, '999,999') as dc15 from tbl_product_202101 p;

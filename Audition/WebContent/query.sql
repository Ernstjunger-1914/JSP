create table tbl_artist_201905(
artist_id char(4) primary key,
artist_name varchar2(20),
artist_birth char(8),
artist_gender char(1),
talent char(1),
agency varchar2(30)
);

create table tbl_mento_201905(
mento_id char(4) primary key,
mento_name varchar2(20)
);

create table tbl_point_201905(
serial_no number(8) primary key,
artist_id char(4),
mento_id char(4),
point number(3),
constraint fk_art foreign key(artist_id) references tbl_artist_201905(artist_id),
constraint fk_men foreign key(mento_id) references tbl_mento_201905(mento_id)
);

INSERT INTO tbl_artist_201905 VALUES('AA01', '김스타', '19970101', 'F', '1', 'A엔터테인먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('AA02', '조스타', '19980201', 'M', '2', 'B엔터테인먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('AA03', '왕스타', '19900301', 'M', '3', 'C엔터테인먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('AA04', '정스타', '20000401', 'M', '1', 'D엔터테인먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('AA05', '홍스타', '20010501', 'F', '2', 'E엔터테인먼트');

INSERT INTO TBL_MENTO_201905 VALUES('J001', '함멘토');
INSERT INTO TBL_MENTO_201905 VALUES('J002', '박멘토');
INSERT INTO TBL_MENTO_201905 VALUES('J003', '장멘토');

INSERT INTO TBL_POINT_201905 VALUES(2019001, 'AA01', 'J001', 78);
INSERT INTO TBL_POINT_201905 VALUES(2019002, 'AA01', 'J002', 76);
INSERT INTO TBL_POINT_201905 VALUES(2019003, 'AA01', 'J003', 70);
INSERT INTO TBL_POINT_201905 VALUES(2019004, 'AA02', 'J001', 80);
INSERT INTO TBL_POINT_201905 VALUES(2019005, 'AA02', 'J002', 72);
INSERT INTO TBL_POINT_201905 VALUES(2019006, 'AA02', 'J003', 78);
INSERT INTO TBL_POINT_201905 VALUES(2019007, 'AA03', 'J001', 90);
INSERT INTO TBL_POINT_201905 VALUES(2019008, 'AA03', 'J002', 92);
INSERT INTO TBL_POINT_201905 VALUES(2019009, 'AA03', 'J003', 88);
INSERT INTO TBL_POINT_201905 VALUES(2019010, 'AA04', 'J001', 96);
INSERT INTO TBL_POINT_201905 VALUES(2019011, 'AA04', 'J002', 90);
INSERT INTO TBL_POINT_201905 VALUES(2019012, 'AA04', 'J003', 98);
INSERT INTO TBL_POINT_201905 VALUES(2019013, 'AA05', 'J001', 88);
INSERT INTO TBL_POINT_201905 VALUES(2019014, 'AA05', 'J002', 86);
INSERT INTO TBL_POINT_201905 VALUES(2019015, 'AA05', 'J003', 86);

commit;

select artist_id, artist_name, substr(artist_birth, 1, 4)||'년'||substr(artist_birth, 5, 2)||'월'||substr(artist_birth, 8, 2)||'일' as birth, decode(artist_gender, 'F', '여', 'M', '남') as gen, decode(talent, '1', '보컬', '2', '댄스', '3', '랩') as tal, agency from tbl_artist_201905;

select serial_no, a.artist_id, artist_name, substr(artist_birth, 1, 4)||'년'||substr(artist_birth, 5, 2)||'월'||substr(artist_birth, 8, 2)||'일' as birth, point, mento_name from tbl_point_201905 p inner join tbl_artist_201905 a on a.artist_id=p.artist_id inner join tbl_mento_201905 m on m.mento_id=p.mento_id;
select serial_no, a.artist_id, artist_name, substr(artist_birth, 1, 4)||'년'||substr(artist_birth, 5, 2)||'월'||substr(artist_birth, 8, 2)||'일' as birth, point, mento_name from tbl_point_201905 p inner join tbl_artist_201905 a on a.artist_id=p.artist_id inner join tbl_mento_201905 m on m.mento_id=p.mento_id order by serial_no;

select a.artist_id, artist_name, sum(point) as sum, to_char(avg(point), '99.99') as avg, rank() over(order by sum(point) desc) from tbl_artist_201905 a inner join tbl_point_201905 p on a.artist_id=p.artist_id group by a.artist_id, artist_name;
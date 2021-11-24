create table tbl_party_202005(
p_code char(2) primary key,
p_name varchar2(20),
p_indate date,
p_reader varchar2(20),
p_tel1 char(3),
p_tel2 char(4),
p_tel3 char(4)
);

create table tbl_member_202005(
m_no char(1) primary key,
m_name varchar2(20),
p_code char(2),
p_school char(1),
m_jumin char(13),
m_city varchar2(20),
CONSTRAINT FK_01 FOREIGN KEY(p_code) REFERENCES tbl_party_202005(p_code)
);

create table tbl_vote_202005(
v_jumin char(13) primary key,
v_name varchar2(20),
m_no char(1),
v_time char(4),
v_area char(20),
v_confirm char(1),
CONSTRAINT FK_02 FOREIGN KEY(m_no) REFERENCES tbl_member_202005(m_no)
);

insert into tbl_party_202005 values('P1', 'A정당', '20200101', '위대표', '02', '1111', '0001');
insert into tbl_party_202005 values('P2', 'B정당', '20200101', '명대표', '02', '1111', '0002');
insert into tbl_party_202005 values('P3', 'C정당', '20200101', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values('P4', 'D정당', '20200101', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values('P5', 'E정당', '20200101', '임대표', '02', '1111', '0005');

insert into tbl_member_202005 values('1', '김후보', 'P1', '1', '660301199991', '수선화동');
insert into tbl_member_202005 values('2', '이후보', 'P2', '3', '550301299992', '민들래동');
insert into tbl_member_202005 values('3', '박후보', 'P3', '2', '770301199993', '나팔꽃동');
insert into tbl_member_202005 values('4', '조후보', 'P4', '2', '880301299994', '진달래동');
insert into tbl_member_202005 values('5', '최후보', 'P5', '3', '990301199995', '개나리동');

insert into tbl_vote_202005 values('9901011000001', '김유권', '1', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values('8001012000002', '이유권', '2', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values('9301011000003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('7501012000004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('8301011000005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('8603012000006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('8004011000007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('8401012000008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('8501011000009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('9401012000010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('6301011000011', '신유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values('9401012000012', '오유권', '5', '1330', '제1투표장', 'Y');
insert into tbl_vote_202005 values('9601011000013', '현유권', '1', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('6601012000014', '왕유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('5001011000015', '유유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('5101012000016', '한유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('4001011000017', '문유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('5801012000018', '양유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('7701011000019', '구유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('7001012000020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('8801011000021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values('8901012000022', '전유권', '3', '1330', '제2투표장', 'Y');

commit;

select m_no, m_name, p_name, p_school, substr(m_jumin, 1,6)||'-'||substr(m_jumin, 7, 7), m_city, p_tel1||'-'||p_tel2||'-'||p_tel3 from tbl_party_202005 p, tbl_member_202005 m where p.p_code=m.p_code;
select m_no, m_name, p_name, decode(p_school, '1', '고졸', '2', '학사', '3', '석사') as p_school, substr(m_jumin, 1,6)||'-'||substr(m_jumin, 7, 7) as m_jumin, m_city, p_tel1||'-'||p_tel2||'-'||p_tel3 as tel from tbl_party_202005 p, tbl_member_202005 m where p.p_code=m.p_code;

select v_name, 19||substr(v_jumin, 1, 2)||'년'||substr(v_jumin, 3, 2)||'월'||substr(v_jumin, 5, 2)||'일', substr(v_jumin, 1, 2), substr(v_jumin, 7, 1), m_no, substr(v_time, 1, 2)||':'||substr(v_time, 3, 2), v_confirm from tbl_vote_202005;
select v_name name, 19||substr(v_jumin, 1, 2)||'년'||substr(v_jumin, 3, 2)||'월'||substr(v_jumin, 5, 2)||'일' birth, substr(v_jumin, 1, 2) birth2, substr(v_jumin, 7, 1) jumin, m_no vote, substr(v_time, 1, 2)||':'||substr(v_time, 3, 2) time, v_confirm yn from tbl_vote_202005;
select v_name name, 19||substr(v_jumin, 1, 2)||'년'||substr(v_jumin, 3, 2)||'월'||substr(v_jumin, 5, 2)||'일' birth, substr(v_jumin, 1, 2) birth2, decode(substr(v_jumin, 7, 1), '1', '남', '2', '여', '3', '남', '4', '여') jumin, m_no vote, substr(v_time, 1, 2)||':'||substr(v_time, 3, 2) time, decode(v_confirm, 'Y', '확인', 'N', '미확인') from tbl_vote_202005;
select v_name, 19||substr(v_jumin, 1, 2)||'년'||substr(v_jumin, 3, 2)||'월'||substr(v_jumin, 5, 2)||'일' as bitrh, substr(v_jumin, 1, 2), substr(v_jumin, 7, 1), m_no, substr(v_time, 1, 2)||':'||substr(v_time, 3, 2), decode(v_confirm, 'Y', '확인', 'N', '미확인') from tbl_vote_202005;

select m.m_no, m_name, count(*) cnt from tbl_member_202005 m, tbl_vote_202005 v where m.m_no=v.m_no and v_confirm='Y' group by m.m_no, m.m_name order by cnt desc;

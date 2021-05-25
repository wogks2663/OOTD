 -- 메인 리스트 테이블 --
DROP TABLE ootdlist;
CREATE TABLE ootdlist(
  list_no NUMBER PRIMARY KEY,
  m_id VARCHAR2(20 CHAR) NOT NULL,
  m_age NUMBER(3),
  list_reg_date TIMESTAMP NOT NULL,
  list_weather VARCHAR2(20 CHAR) NOT NULL,
  list_temp VARCHAR2(20 CHAR) NOT NULL,
  list_img VARCHAR2(50 CHAR),
  list_content VARCHAR2(1000 CHAR) NOT NULL,
  list_hash VARCHAR2(1000 CHAR) NOT NULL,
  list_thanks NUMBER DEFAULT 0
);

DROP SEQUENCE ootd_seq;
CREATE SEQUENCE ootd_seq;

INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'midas',23,'2021-04-27','맑음','20도','a1.JPG',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'점퍼'|| CHR(13) || CHR(10) ||'풀오버 탑'|| CHR(13) || CHR(10) || '데님 진'|| CHR(13) || CHR(10) || '에어 조던' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'jason',25,'2021-01-20','흐림','5도','a2.JPG',
    '착용 옷'|| CHR(13) || CHR(10) || '볼캡'|| CHR(13) || CHR(10) ||'블루종'|| CHR(13) || CHR(10) ||'티셔츠'|| CHR(13) || CHR(10) || '와이드팬츠'|| CHR(13) || CHR(10) || '스니커즈' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'harry',26,'2021-03-14','비','18도','a3.jpg',
    '착용 옷'|| CHR(13) || CHR(10) || '페도라'|| CHR(13) || CHR(10) ||'블랙 코트'|| CHR(13) || CHR(10) ||'니트'|| CHR(13) || CHR(10) || '슬랙스'|| CHR(13) || CHR(10) || '워커' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'jay',28,'2021-02-28','눈','16도','a4.jpg',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'바람막이'|| CHR(13) || CHR(10) ||'티셔츠'|| CHR(13) || CHR(10) || '츄리닝'|| CHR(13) || CHR(10) || '에어포스' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'michel',21,'2021-01-11','안개','8도','a5.JPG',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'항공점퍼'|| CHR(13) || CHR(10) ||'맨투맨'|| CHR(13) || CHR(10) || '청바지'|| CHR(13) || CHR(10) || '컨버스' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'hwai',32,'2021-05-12','구름많음','28도','a2.JPG',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'체크셔츠'|| CHR(13) || CHR(10) ||'티셔츠'|| CHR(13) || CHR(10) || '면바지'|| CHR(13) || CHR(10) || '스니커즈' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'kloe',36,'2021-03-10','맑음','19도','a3.jpg',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'후리스'|| CHR(13) || CHR(10) ||'긴팔티'|| CHR(13) || CHR(10) || '청바지'|| CHR(13) || CHR(10) || '런닝화' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'kevin',27,'2021-04-07','맑음','20도','a4.jpg',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'후드집업'|| CHR(13) || CHR(10) ||'티셔츠'|| CHR(13) || CHR(10) || '츄리닝'|| CHR(13) || CHR(10) || '스니커즈' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);

COMMIT;
SELECT * FROM ootdlist;

------------------------------------------------------------------------------------------------------------------------------------------------
-- 댓글 테이블 --
DROP TABLE reply;
CREATE TABLE reply(
	no NUMBER(7) PRIMARY KEY,
	list_no NUMBER(7) NOT NULL,
	reply VARCHAR2(500 CHAR),
	writer VARCHAR2(20 CHAR) NOT NULL,
	reg_date TIMESTAMP NOT NULL,	
	CONSTRAINT reply_fk FOREIGN KEY(list_no) REFERENCES ootdlist(list_no)
);

-- 댓글 테이블의 시퀀스
DROP SEQUENCE reply_seq;
CREATE SEQUENCE reply_seq
      MAXVALUE 9999999
      INCREMENT BY 1      
      NOCACHE
      NOORDER
      NOCYCLE;


-- 댓글 데이터 추가하기 - 1번만 실행 한다. --
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 1, '너무 멋있어요~', 'jay', '2021-03-08 13:44:32');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 1, '옷 잘입으시네요~', 'harry', '2021-03-09 03:24:57');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 2, '너무 맘에 드는 패션이에요~', 'jay', '2021-03-09 09:19:23');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 2, '헤헷~ 감사합니다~', 'jason', '2021-03-09 11:54:45');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 3, '자기애가 너무 넘치시네요;;', 'michel', '2021-03-09 12:16:51');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 3, '화..화이팅', 'jay', '2021-03-09 13:34:11');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 3, '왜 저래..', 'harry', '2021-03-09 14:03:37');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 4, '티셔츠가 이뻐요' , 'harry', '2021-03-09 14:39:29');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 4, '어디서 사셨어요?', 'jason', '2021-03-09 14:41:18');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 5, '저도 저거 가지고 싶어요', 'midas', '2021-03-09 14:52:48');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 5, '제가 만든거라 판매하는 곳은 없어요', 'michel', '2021-03-10 15:42:12');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 6, '이뻐요', 'harry', '2021-03-11 15:44:57');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 6, '항상 감사합니다.', 'jay', '2021-03-15 16:19:23');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 7, '땡큐!~', 'cloe', '2021-03-16 17:31:45');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 7, '모두들 열성이네요~', 'jason', '2021-03-19 18:16:51');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 8, '옷 잘입으시네요~', 'cloe', '2021-03-20 10:34:11');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 8, '땡큐~', 'midas', '2021-03-20 11:33:27');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 8, '어디서 사셨어요?', 'cloe', '2021-03-20 13:19:59');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 8, '좋아요', 'jason', '2021-04-10 13:41:17');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 1, '동감 합니다.', 'jason', '2021-04-12 14:52:48');

commit;
SELECT * FROM reply;

------------------------------------------------------------------------------------------------------------------------------------------------------
-- 북마크 테이블 --
DROP TABLE bookmark;
CREATE TABLE bookmark(
  no NUMBER PRIMARY KEY,
  ootd_no NUMBER,
  m_id VARCHAR2(20 CHAR) NOT NULL,
  state NUMBER DEFAULT 0
);

DROP SEQUENCE bookmark_seq;
CREATE SEQUENCE bookmark_seq;

-- 페이징 처리와 댓글 처리를 위해서 아래 SQL 쿼리를 COMMIT까지 5번 실행 한다. 
-- 주의 : 99번과 100번 게시 글을 댓글(reply) 테이블에서 참조하고 있음
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 4, 'jay', 1);
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 2, 'harry', 1);
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 3, 'jay', 1);
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 5, 'jason', 0);
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 5, 'michel', 1);
COMMIT;

SELECT * FROM bookmark;

--------------------------------------------------------------------------------------------------------------
-- 좋아요 테이블 --
DROP TABLE favariteList;
CREATE TABLE favariteList(
  no NUMBER PRIMARY KEY,
  ootd_no NUMBER,
  m_id VARCHAR2(20 CHAR) NOT NULL,
  state NUMBER DEFAULT 0
);

DROP SEQUENCE favariteList_seq;
CREATE SEQUENCE favariteList_seq;

INSERT INTO favariteList (no, ootd_no, m_id, state) VALUES (favariteList_seq.NEXTVAL, 8, 'midas', 1);
INSERT INTO favariteList (no, ootd_no, m_id, state) VALUES (favariteList_seq.NEXTVAL, 1, 'jason', 1);
INSERT INTO favariteList (no, ootd_no, m_id, state) VALUES (favariteList_seq.NEXTVAL, 3, 'midas', 1);
INSERT INTO favariteList (no, ootd_no, m_id, state) VALUES (favariteList_seq.NEXTVAL, 3, 'jay', 0);
INSERT INTO favariteList (no, ootd_no, m_id, state) VALUES (favariteList_seq.NEXTVAL, 5, 'jay', 1);
COMMIT;

SELECT * FROM favariteList;
SELECT * FROM ootd_member;

----------------------------------------------------------------------------------------------------------------------
-- 멤버 테이블 --
DROP TABLE ootd_member;
CREATE TABLE ootd_member(
    m_no NUMBER PRIMARY KEY,
	m_id VARCHAR2(100)  NOT NULL,
	m_name VARCHAR2(20) NOT NULL,
	m_pass VARCHAR2(15) NOT NULL,
	m_phone NUMBER(13) NOT NULL,
	m_age NUMBER NOT NULL,
	m_gender VARCHAR2(5 CHAR) NOT NULL
);
DROP SEQUENCE ootd_member_seq;
CREATE SEQUENCE ootd_member_seq;

INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL, 'midas', '홍길동', '1234', 
     01012345678, 23, '남자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'jason', '이주리', '1234', 
     01021547233, 24, '여자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'harry', '박성훈', '1234', 
     01084723293, 25, '남자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'jay', '김주희', '1234', 
     01087381123, 26, '여자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'michel', '최현동', '1234', 
     01049281121, 27, '남자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL, 'hwai', '김와이', '1234', 
     01012345678, 23, '남자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'cloe', '노다인', '1234', 
     01021547233, 24, '여자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'kevin', '정혜경', '1234', 
     01084723293, 25, '남자');

commit;
SELECT * FROM ootd_member;

-------------------------------------------------------------------------------------------------------------------------------------------
-- 인기검색어 테이블 --
DROP TABLE popular;
CREATE TABLE popular (
	id NUMBER PRIMARY KEY NOT NULL,
    word VARCHAR2(15) NOT NULL
    );

Drop SEQUENCE popular_seq;
CREATE SEQUENCE popular_seq;

INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'ma-1');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'ma-1');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'ma-1');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'ma-1');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'꾸안꾸');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'꾸안꾸');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'꾸안꾸');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'가디건');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'가디건');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'시티보이');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'셔츠');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'니트');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'맨투맨');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'청자켓');    
COMMIT;

SELECT * FROM popular;
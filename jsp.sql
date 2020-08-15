-- member_tbl
DROP TABLE member_tbl;

-- member_tbl table 생성 
CREATE TABLE member_tbl(
    memberNum Number PRIMARY KEY,
    id     VARCHAR2(20) NOT NULL UNIQUE,
    pwd    VARCHAR2(20) NOT NULL,
    name   VARCHAR2(20) NOT NULL,
    jumin VARCHAR2(6) NOT NULL,
    hp     VARCHAR2(13),
    email  VARCHAR2(30) NOT NULL,
    address VARCHAR2(300) NOT NULL,
    cash number DEFAULT 0,
    auth VARCHAR2(20) DEFAULT 0,
    key VARCHAR2(30),
    point number DEFAULT 0,
    reg_date TIMESTAMP DEFAULT sysdate
);
		select NVL(sum(realPrice),0) as price FROM order_tbl where o_state=0;


INSERT INTO member_tbl (memberNum, id, pwd, name, jumin, hp, email, address, cash, auth, point,reg_date)
VALUES (memberList_seq.nextVal,'1','1','다은','111111','010-1111-1111','111@naver.com','08655-서울 금하로-123',0, 2, 0,sysdate);

-- 멤버 시퀀스 생성
DROP SEQUENCE memberList_seq;

CREATE SEQUENCE memberList_seq 
START WITH 1        
INCREMENT BY 1   
MAXVALUE 9999        
MINVALUE 1       
NOCYCLE;          

SELECT * FROM member_tbl;
SELECT * FROM stock_tbl;
SELECT * FROM board_tbl;

DROP TABLE board_tbl;

CREATE TABLE board_tbl (
    num NUMBER(5) PRIMARY KEY,  -- 글번호
    writer VARCHAR2(20) NOT NULL,  -- 작성자
    pwd VARCHAR2(20) NOT NULL,  -- 비밀번호
    subject VARCHAR2(50) NOT NULL,  -- 글제목
    content VARCHAR2(4000),  --  글내용
    readCnt NUMBER(6) DEFAULT 0,  -- 조회수
    ref NUMBER(5) DEFAULT 0, -- 답변글 그룹 아이디 -- 답변 글번호로서 원글번호와 일치해야 한다.
    ref_step NUMBER(5) DEFAULT 0, -- 답변글 그룹 스텝
    ref_level NUMBER(5) DEFAULT 0, -- 답변글 그룹 레벨
    reg_date TIMESTAMP DEFAULT sysdate, -- 작성일
    ip VARCHAR2(15)  -- ip
);

DROP SEQUENCE boardList_seq;
CREATE SEQUENCE boardList_seq 
START WITH 1        
INCREMENT BY 1   
MAXVALUE 9999        
MINVALUE 1       
NOCYCLE;  

CREATE TABLE mvc_admin_tbl (
    ad_id VARCHAR2(20) PRIMARY KEY,
    ad_pwd VARCHAR2(20) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    reg_date TIMESTAMP DEFAULT sysdate
);

INSERT INTO mvc_admin_tbl (ad_id, ad_pwd, name,reg_date )
VALUES ('manager','1','관리자',sysdate);
SELECT * FROM mvc_admin_tbl;
COMMIT;

DROP TABLE stock_tbl;
DROP TABLE member_tbl;
DROP TABLE cart_tbl;
DROP TABLE order_tbl;

CREATE TABLE stock_tbl (
    i_Num NUMBER(5) PRIMARY KEY,  -- 제품번호
    item VARCHAR2(40) NOT NULL,  -- 이름
    i_price NUMBER(10) NOT NULL,  -- 가격
    i_conut NUMBER(5) NOT NULL,  -- 수량
    i_point NUMBER(10) NOT NULL,  -- 포인트
    review VARCHAR2(600),      -- 리뷰
    i_age VARCHAR2(20) NOT NULL,    -- 적용 나이
    i_part VARCHAR2(20) NOT NULL,   -- 부품수
    image VARCHAR2(100) NOT NULL,   -- 이미지 추가
    reg_date TIMESTAMP DEFAULT sysdate  -- 추가일 
);

SELECT * FROM stock_tbl;

commit;
DESC;
select * From tab;
select * From stock_tbl;
select * From order_tbl;
select * From member_tbl;
UPDATE member_tbl SET name='고객', point=10000 WHERE id=6;
select * From stock_tbl;

commit;
-- 장바구니
DROP TABLE cart_tbl;
SELECT * FROM cart_tbl;

CREATE TABLE cart_tbl (
  cartNum number(5) PRIMARY KEY,
  c_Num NUMBER(5) ,
  c_id VARCHAR2(20) NOT NULL,
  cartCount number(4) NOT NULL,
    CONSTRAINT fk_code_inum FOREIGN KEY(c_Num)
         REFERENCES stock_tbl(i_Num) ON DELETE CASCADE,
         
      CONSTRAINT fk_code_id FOREIGN KEY(c_id)
         REFERENCES member_tbl(id) ON DELETE CASCADE
);
DESC cart_tbl;

DROP SEQUENCE cart_tbl_seq;
CREATE SEQUENCE cart_tbl_seq 
START WITH 2000        
INCREMENT BY 1   
MAXVALUE 9999        
MINVALUE 1       
NOCYCLE;  
SELECT count(*) FROM cart_tbl WHERE c_id='1';
select * From cart_tbl;


DELETE order_tbl;

DROP TABLE order_tbl;
CREATE TABLE order_tbl (
  orderNum number(5) PRIMARY KEY,
  o_Num NUMBER(5) ,
  o_id VARCHAR2(20) NOT NULL,
  o_count number(4) NOT NULL,
  realPrice number DEFAULT 0,
  o_state varchar2(50) NOT NULL,
  o_date timestamp DEFAULT SYSDATE, 
  delivery number(5) DEFAULT 0,
    CONSTRAINT fk_order_inum FOREIGN KEY(o_Num)
         REFERENCES stock_tbl(i_Num) ON DELETE CASCADE,
         
      CONSTRAINT fk_order_id FOREIGN KEY(o_id)
         REFERENCES member_tbl(id) ON DELETE CASCADE
);
DESC order_tbl;

DROP SEQUENCE order_tbl_seq;
CREATE SEQUENCE order_tbl_seq 
START WITH 3000       
INCREMENT BY 1   
MAXVALUE 9999        
MINVALUE 1       
NOCYCLE;  
commit;

DROP SEQUENCE order_del_seq;
CREATE SEQUENCE order_del_seq 
START WITH 500       
INCREMENT BY 1   
MAXVALUE 9999        
MINVALUE 1       
NOCYCLE;

DROP SEQUENCE stock_tbl_seq;
CREATE SEQUENCE stock_tbl_seq 
START WITH 1000       
INCREMENT BY 1   
MAXVALUE 9999        
MINVALUE 1       
NOCYCLE;

SELECT count(*) FROM order_tbl WHERE c_id='1';
select * From cart_tbl;
SELECT * FROM order_tbl where o_state = '1';
SELECT * FROM order_tbl;
select * From member_tbl;
DELETE FROM order_tbl;
rollback;
update member_tbl set cash=100000 where id='1';
commit;
update member_tbl set point=0 where id='1';

DELETE FROM cart_tbl where c_id='1' ;
INSERT INTO order_tbl 
VALUES(order_tbl_seq.nextVal, 45644, '1', 1, 648500, '구매중', sysdate, 0);
INSERT INTO order_tbl 
VALUES(order_tbl_seq.nextVal, 10002, '1', 1, 452000, '배송중', sysdate, order_del_seq.nextVal);
SELECT count(*) as cnt FROM order_tbl WHERE o_id='1';
SELECT * FROM tab;
commit;
SELECT o_state FROM order_tbl;

SELECT COUNT(*) as cnt FROM order_tbl where o_state=1;
select sum(realPrice) as price FROM order_tbl where o_state=0;
select sum(realPrice) as price FROM order_tbl where o_state=1;
select sum(realPrice) as price FROM order_tbl where o_state=2;
select sum(realPrice) as price FROM order_tbl where o_state=3;

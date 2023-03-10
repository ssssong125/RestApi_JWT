--CREATE USER mini IDENTIFIED BY mini;
--GRANT CONNECT, RESOURCE TO mini;
--GRANT CREATE VIEW TO mini;
--GRANT CREATE SEQUENCE TO mini;
--GRANT CREATE TRIGGER TO mini;

DROP TABLE TBL_CATEGORY;
CREATE TABLE TBL_CATEGORY
(
    CATEGORY_CODE    NUMBER NOT NULL,
    CATEGORY_NAME    VARCHAR2(50) NOT NULL
);

ALTER TABLE TBL_CATEGORY
    ADD CONSTRAINT TBL_CATEGORY_PK PRIMARY KEY ( CATEGORY_CODE );

DROP SEQUENCE SEQ_CATEGORY_CODE;
CREATE SEQUENCE SEQ_CATEGORY_CODE
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
       NOCACHE
       NOORDER;

COMMENT ON COLUMN TBL_CATEGORY.CATEGORY_CODE IS '카테고리코드';
COMMENT ON COLUMN TBL_CATEGORY.CATEGORY_NAME IS '카테고리명';
COMMENT ON TABLE TBL_CATEGORY IS '상품카테고리';


DROP TABLE TBL_MEMBER;
CREATE TABLE TBL_MEMBER
(
    MEMBER_CODE    NUMBER NOT NULL,
    MEMBER_ID        VARCHAR2(100) UNIQUE NOT NULL,
    MEMBER_NAME  VARCHAR2(100) NOT NULL,
    MEMBER_PASSWORD    VARCHAR2(500) NOT NULL,
    MEMBER_ROLE    VARCHAR2(100) DEFAULT 'ROLE_USER' NOT NULL,
    MEMBER_EMAIL    VARCHAR2(100)
);

ALTER TABLE TBL_MEMBER
    ADD CONSTRAINT TBL_MEMBER_PK PRIMARY KEY ( MEMBER_CODE );

DROP SEQUENCE SEQ_MEMBER_CODE;
CREATE SEQUENCE SEQ_MEMBER_CODE
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
       NOCACHE
       NOORDER;

COMMENT ON COLUMN TBL_MEMBER.MEMBER_CODE IS '회원코드';
COMMENT ON COLUMN TBL_MEMBER.MEMBER_ID IS '아이디';
COMMENT ON COLUMN TBL_MEMBER.MEMBER_ID IS '회원이름';
COMMENT ON COLUMN TBL_MEMBER.MEMBER_PASSWORD IS '비밀번호';
COMMENT ON COLUMN TBL_MEMBER.MEMBER_EMAIL IS '이메일';
COMMENT ON COLUMN TBL_MEMBER.MEMBER_ROLE IS '권한';
COMMENT ON TABLE TBL_MEMBER IS '회원';


DROP TABLE TBL_ORDER;
CREATE TABLE TBL_ORDER
(
    ORDER_CODE    NUMBER NOT NULL,
    PRODUCT_CODE    NUMBER NOT NULL,
    ORDER_MEMBER    NUMBER NOT NULL,
    ORDER_PHONE    VARCHAR2(100) NOT NULL,
    ORDER_EMAIL    VARCHAR2(100) NOT NULL,
    ORDER_RECEIVER    VARCHAR2(100) NOT NULL,
    ORDER_ADDRESS    VARCHAR2(500) NOT NULL,
    ORDER_AMOUNT    VARCHAR2(50) NOT NULL,
    ORDER_DATE    VARCHAR2(100) NOT NULL    
);

ALTER TABLE TBL_ORDER
    ADD CONSTRAINT TBL_ORDER_PK PRIMARY KEY ( ORDER_CODE );

DROP SEQUENCE SEQ_ORDER_CODE;
CREATE SEQUENCE SEQ_ORDER_CODE
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
       NOCACHE
       NOORDER;

COMMENT ON COLUMN TBL_ORDER.ORDER_CODE IS '주문식별번호';
COMMENT ON COLUMN TBL_ORDER.PRODUCT_CODE IS '상품코드';
COMMENT ON COLUMN TBL_ORDER.ORDER_MEMBER IS '회원코드';
COMMENT ON COLUMN TBL_ORDER.ORDER_PHONE IS '핸드폰번호';
COMMENT ON COLUMN TBL_ORDER.ORDER_EMAIL IS '이메일주소';
COMMENT ON COLUMN TBL_ORDER.ORDER_RECEIVER IS '받는사람';
COMMENT ON COLUMN TBL_ORDER.ORDER_ADDRESS IS '배송주소';
COMMENT ON COLUMN TBL_ORDER.ORDER_AMOUNT IS '주문갯수';
COMMENT ON COLUMN TBL_ORDER.ORDER_DATE IS '주문일자';
COMMENT ON TABLE TBL_ORDER IS '주문';


DROP TABLE TBL_PRODUCT;

CREATE TABLE TBL_PRODUCT
(
    PRODUCT_CODE    NUMBER NOT NULL,
    PRODUCT_NAME    VARCHAR2(100) NOT NULL,
    PRODUCT_PRICE    VARCHAR2(100) NOT NULL,
    PRODUCT_DESCRIPTION    VARCHAR2(1000),
    PRODUCT_ORDERABLE    VARCHAR2(5) NOT NULL,
    CATEGORY_CODE    NUMBER,
    PRODUCT_IMAGE_URL    VARCHAR2(100) NOT NULL,
    PRODUCT_STOCK    NUMBER NOT NULL
);

ALTER TABLE TBL_PRODUCT
    ADD CONSTRAINT TBL_PRODUCT_PK PRIMARY KEY ( PRODUCT_CODE );

DROP SEQUENCE SEQ_PRODUCT_CODE;
CREATE SEQUENCE SEQ_PRODUCT_CODE
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
       NOCACHE
       NOORDER;

COMMENT ON COLUMN TBL_PRODUCT.PRODUCT_CODE IS '상품코드';
COMMENT ON COLUMN TBL_PRODUCT.PRODUCT_NAME IS '상품명';
COMMENT ON COLUMN TBL_PRODUCT.PRODUCT_PRICE IS '상품가격';
COMMENT ON COLUMN TBL_PRODUCT.PRODUCT_DESCRIPTION IS '상품설명';
COMMENT ON COLUMN TBL_PRODUCT.PRODUCT_ORDERABLE IS '구매가능여부';
COMMENT ON COLUMN TBL_PRODUCT.CATEGORY_CODE IS '카테고리코드';
COMMENT ON COLUMN TBL_PRODUCT.PRODUCT_IMAGE_URL IS '상품이미지경로';
COMMENT ON COLUMN TBL_PRODUCT.PRODUCT_STOCK IS '상품재고';
COMMENT ON TABLE TBL_PRODUCT IS '상품';


DROP TABLE TBL_REVIEW;
CREATE TABLE TBL_REVIEW
(
    REVIEW_CODE    NUMBER NOT NULL,
    PRODUCT_CODE    NUMBER NOT NULL,
    MEMBER_CODE    NUMBER NOT NULL,
    REVIEW_TITLE    VARCHAR2(100) NOT NULL,
    REVIEW_CONTENT    VARCHAR2(1000) NOT NULL,
    REVIEW_CREATE_DATE    VARCHAR2(100) NOT NULL
);

ALTER TABLE TBL_REVIEW
    ADD CONSTRAINT TBL_REVIEW_PK PRIMARY KEY ( REVIEW_CODE );

DROP SEQUENCE SEQ_REVIEW_CODE;
CREATE SEQUENCE SEQ_REVIEW_CODE
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
       NOCACHE
       NOORDER;

COMMENT ON COLUMN TBL_REVIEW.REVIEW_CODE IS '리뷰식별번호';
COMMENT ON COLUMN TBL_REVIEW.PRODUCT_CODE IS '상품코드';
COMMENT ON COLUMN TBL_REVIEW.MEMBER_CODE IS '회원코드';
COMMENT ON COLUMN TBL_REVIEW.REVIEW_TITLE IS '리뷰제목';
COMMENT ON COLUMN TBL_REVIEW.REVIEW_CONTENT IS '리뷰내용';
COMMENT ON COLUMN TBL_REVIEW.REVIEW_CREATE_DATE IS '작성일';
COMMENT ON TABLE TBL_REVIEW IS '상품리뷰';



# SQL 데이터 결합(JOIN) 
# Inner JOIN, LEFT JOIN, RIGHT JOIN

# 테이블 관계 - 1:1, 1:N, N:N 3가지 형태로 테이블 연결 가능
# JOIN: 두 테이블 관계를 활용하여 테이블을 결합

# ERM(Entity-Relationship Modelling)
# 개체-관계 모델링, 관계형 데이터베이스에 테이블을 모델링할 때 사용
# 개체(Entitiy): 하나 이상의 속성으로 구성된 객체
# 관계(Relationship): 속성들 간의 관계
# ERD(Entity-Relationship Diagram) -> ERM으로 만들어진 개체 간의 관계 도표
# 회원테이블 - 주문테이블 - 상풀테이블 -> 1:N, N:1

# 테이블 파일 import

----------------------------------------------------------------------------
# Inner JOIN: 두 테이블의 공통 값이 매칭되는 데이터만 결합
# Customer + Sales Inner JOIN
SELECT  *
  FROM  Customer as A
 INNER 
  JOIN  SALES AS B
    ON  A.MEM_NO = B.MEM_NO;
# => 주문이력이 있는 회원

# Customer alc Sales 테이블은 mem_no(회원번호) 기준으로 1:N 관계
SELECT  *
  FROM  Customer as A
 INNER 
  JOIN  SALES AS B
    ON  A.MEM_NO = B.MEM_NO
 WHERE  A.MEM_NO = '1000970';

 # LEFT JOIN: Inner JOIN + 왼쪽 테이블의 매칭되지 않는 데이터는 NULL
SELECT  *
  FROM  Customer as A
  LEFT 
  JOIN  SALES AS B
    ON  A.MEM_NO = B.MEM_NO;
# => 주문이력이 있는 회원 + 주문이력이 없는 회원 -> 전체 회원

# RIGHT JOIN: Inner JOIN + 오른쪽 테이블의 매칭되지 않는 데이터는 NULL
SELECT  *
  FROM  Customer as A
 RIGHT 
  JOIN  SALES AS B
    ON  A.MEM_NO = B.MEM_NO;
 WHERE  A.MEM_NO IS NULL;
# => 주문이력이 있는 회원 + 주문 이력이 있는 비회원 -> 주문이력이 있는 전체

-----------------------------------------------------------------------
# 회원 및 주문 테이블 Inner JOIN
SELECT  *
  FROM  Customer as A
 INNER 
  JOIN  SALES AS B
    ON  A.MEM_NO = B.MEM_NO;

# 임시테이블 생성
CREATE  TEMPORARY TABLE CUSTOMER_SALES_JOIN
SELECT  A. *                        # A.열은 A(CUSTOMER) 테이블의 모든 열
        , B.ORDER_NO         # B.ORDER_NO은 B(SALES) 테이블의 주문번호 열
  FROM  CUSTOMER AS A
 INNER 
  JOIN  SALED AS B
    ON  A.MEM_NO = B.MEM_NO;

# 임시테이블 조회
SELECT  *  FROM CUSTOMER_SALES_JOIN;

# 임시테이블(TEMPORARY TABLE)은 서버 연결 종료 시 자동으로 삭제

# 남성으로 필터링
SELECT  *
  FROM  CUSTOMER_SALES_JOIN
 WHERE  GERNDER = 'MAN';

# 거주지역별로 구매회수 집계
SELECT  ADDR
        ,COUNT(ORDER_NO) AS 구매횟수
  FROM  CUSTOMER_SALES_JOIN
 WHERE  GERNDER = 'MAN'
 GROUP
    BY  ADDR;

# 구매횟수 100회 미만으로 필터링
SELECT  ADDR
        ,COUNT(ORDER_NO) AS 구매횟수
  FROM  CUSTOMER_SALES_JOIN
 WHERE  ERNDER = 'MAN'
 GROUP
    BY  ADDR;
HAVING  COUNT(ORDER_NO) < 100;

# 구매횟수 낮은 순으로 모든 열 조회
SELECT  ADDR
        ,COUNT(ORDER_NO) AS 구매횟수
  FROM  CUSTOMER_SALES_JOIN
 WHERE  GERNDER = 'MAN'
 GROUP
    BY  ADDR;
HAVING  COUNT(ORDER_NO) < 100;
 ORDER
    BY  COUNT(ORDER_NO) ASC;

# 3개 이상 테이블 결합
SELECT  *
  FROM  SALES AS A
  LEFT 
  JOIN  CUSTOMER AS B
    ON  A.MEM_NO = B.MEM_NO;
  LEFT 
  JOIN  PRODUCT AS C
    ON  A.PRODUCT_CODE = C.PRODUCT_CODE;
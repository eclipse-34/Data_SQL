# SQL - 연산자

# 연산자 - 비교, 논리, 특수, 산술, 집합

USE PRACTICE

-------------------------------------------------------------------
# 비교 연산자 - >,>=,<,<=

# = : 같음
SELECT  *
  FROM  CUSTOMER
 WHERE  GENDER = 'MAN';

# <> : 같지 않음
SELECT  *
  FROM  CUSTOMER
 WHERE  GENDER <> 'MAN';    

# >= : 크거나 같음
SELECT  *
  FROM  CUSTOMER
 WHERE  YEAR(JOIN_DATE) >= 2020; 

# <= : 작거나 같음
SELECT  *
  FROM  CUSTOMER
 WHERE  YEAR(JOIN_DATE) <= 2020;  

# > : ~보다 큼
SELECT  *
  FROM  CUSTOMER
 WHERE  YEAR(JOIN_DATE) > 2020; 

# < : ~보다 작음
SELECT  *
  FROM  CUSTOMER
 WHERE  YEAR(JOIN_DATE) < 2020; 

--------------------------------------------------------------
# 논리 연산자 - AND, OR, NOT

# AND : 모든 조건 만족
SELECT  *
  FROM  CUSTOMER
 WHERE  GENDER = 'MAN'
   AND  ADDR = 'Gyeonggi';

# NOT : 뒤에 오는 조건의 반대
SELECT  *
  FROM  CUSTOMER
 WHERE  NOT GENDER = 'MAN'
   AND  ADDR = 'Gyeonggi';

# OR : 하나라도 만족
SELECT  *
  FROM  CUSTOMER
 WHERE  NOT GENDER = 'MAN'
    OR  ADDR = 'Gyeonggi';

--------------------------------------------------------------
# 특수 연산자 - BETWEEN, IN, LIKE, IS NULL

# BETWEEN a AND b : a와 b의 값 사이
SELECT  *
  FROM  CUSTOMER
 WHERE  YEAR(BIRTHDAY) BETWEEN 2010 AND 2011;

# NOT BETWEEN a AND b : a와 b의 값 사이가 아님
SELECT  *
  FROM  CUSTOMER
 WHERE  YEAR(BIRTHDAY) NOT BETWEEN 1950 AND 2020;

# IN(List) : 리스트 안의 값들만 조회
SELECT  *
  FROM  CUSTOMER
 WHERE  YEAR(BIRTHDAY) IN (2010,2011);

# NOT IN(List) : 리스트 안의 값이 아닌 값들
SELECT  *
  FROM  CUSTOMER
 WHERE  YEAR(BIRTHDAY) NOT IN (2010,2011);

# LIKE 비교문자열
SELECT  *
  FROM  CUSTOMER
 WHERE  ADDR LIKE 'D&';  # D로 시작하는 

SELECT  *
  FROM  CUSTOMER
 WHERE  ADDR LIKE '%N';  # N으로 끝나는 

SELECT  *
  FROM  CUSTOMER
 WHERE  ADDR LIKE '%EO%';  # EO를 포함하는

SELECT  *
  FROM  CUSTOMER
 WHERE  ADDR NOT LIKE '%EO%';  # EO를 제외하는 

# IS NULL : NULL인 경우
SELECT  * 
  FROM  CUSTOMER AS A
  LEFT
  JOIN  SALES AS B
    ON  A.MEM_NO = B.MEM_NO
 WHERE  B.MEM_NO IS NULL;     # 회원가입했고, 주문한 이력이 없는 회원들

# IS NOT NULL : NULL이 아닌 경우
SELECT  * 
  FROM  CUSTOMER AS A
  LEFT
  JOIN  SALES AS B
    ON  A.MEM_NO = B.MEM_NO
 WHERE  B.MEM_NO IS NOT NULL;  # 회원가입했고, 주문한 이력이 있는 회원들

--------------------------------------------------------------
# 산술 연산자 - +, -, *, /

# 구매수량과 상품가격의 곱이 결제금액으로 추가됨
SELECT  * 
        ,A.SALES_QTY * PRICE AS 결제금액   
  FROM  SALES AS A
  LEFT
  JOIN  PRODCT AS B
    ON  A.PRODCT_CODE = B.PRODCT_CODE;
  
--------------------------------------------------------------
# 집합 연산자 - UNION, UNION ALL 
# 집합하려는 테이블들의 열 개수와 데이터 타입이 일치해야 함

CREATE TEMPORARY TABLE SALES_2019
SELECT  *
  FROM SALES
 WHERE YEAR(ORDER_DATE) = '2019';

SELECT  *
  FROM  SALES_2019;     # 1235행

SELECT  *
  FROM  SALES;          # 3115행

# UNION : 2개 이상 테이블의 중복된 행들을 제거하여 집합
SELECT  *
  FROM  SALES_2019
 UNION 
SELECT  *
  FROM  SALES;      # 3115행 출력

# UNION ALL : 2개 이상 테이블의 중복된 행들을 제거 없이 집합
SELECT  *
  FROM  SALES_2019
 UNION ALL
SELECT  *
  FROM  SALES;      # 3115 + 1235 = 4390행 출력

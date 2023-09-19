# SQL 서브쿼리(Sub Query)

# 서브쿼리(Sub Query) : SELECT문 안에 또 다른 SELECT문이 있는 명령어
# SELECT절 서브쿼리, FROM절 서브쿼리, WHERE절 서브쿼리 => 3가지

USE PRACTICE;

-----------------------------------------------------------------------------
# <SELECT절 서브쿼리>
# -> SELECT절 안에 SELECT절
SELECT  *
        ,(SELECT GERNDER FROM CUSTOMER WHERE A.MEM_NO = MEM_NO) AS GERNDER
  FROM  SALES AS A;

# 확인
SELECT  *
  FROM  CUSTOMER
 WHERE  MEM_NO = '1000970';

# JOIN 사용 없이 다른 테이블 정보 가져오기 가능, but 처리속도가 느려서 사용X
# 테이블에 열을 추가, JOIN보다 느림

------------------------------------------------------------------------------
# <FROM절 서브쿼리>
# -> FROM 명령문 안에 SELECT 명령문
SELECT  *
  FROM  (
        SELECT MEM_NO
               ,COUNT(ORDER_NO) AS 주문횟수
          FROM SALES
         GROUP
            BY MEM_NO
         ) AS A;

# 열 이름 및 테이블 명을 지정해야 함
# 가장 많이 사용, JOIN과 함께 사용
------------------------------------------------------------------------------
# <WHERE절 서브쿼리>
# -> WHERE 명령문 안에 SELECT 명령문

SELECT  COUNT(ORDER_NO) AS 주문횟수
  FROM  SALES
 WHERE  MEM_NO IN (SELECT MEM_NO FROM CUSTOMER WHERE YEAR(JOIN_DATE) = 2019);

# YEAR: 날짜형 함수로 해당 열을 연도로 반환 
# (SELECT MEM_NO FROM CUSTOMER WHERE YEAR(JOIN_DATE) = 2019) => 리스트
# -> ('1000001','1000002','1000004','1000005','1000006','1000010',...)과 같음

# WHERE절 서브쿼리 VS JOIN 결과 값 비교 -> 동일
SELECT  COUNT(A.ORDER_NO) AS 주문횟수
  FROM  SALES AS A
 INNER 
  JOIN  CUSTOMER AS B
    ON  A.MEM_NO = B.MEM_NO
 WHERE  YEAR(B.JOIN_DATE) = 2019;

 # WHERE절 안에 리스트 형태로 사용 가능

---------------------------------------------------------------------------
# FROM절 서브쿼리 명령어 작성법
SELECT  *
  FROM  (
        SELECT [열1]
               ,[집계함수] AS [열이름]
          FROM [테이블명]
         GROUP
            BY [열1]
         ) AS A;
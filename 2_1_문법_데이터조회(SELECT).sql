# SQL 데이터 조회(SELECT) 
# FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY

# FROM - 조회하려는 테이블 선택
# WHERE - 특정 조건으로 필터링
# GROUP BY - 집계함수와 주로 사용되는 명령어 
             열 별로 그룹화(여러 열 별로 가능)
             기존 테이블이 새로운 테이블로 변환
             GROUP BY에 있는 열들을 SELECT에도 작성해야 원하는 분석결과 확인 가능
# HAVING - GROUP BY와 함께 사용, 그룹화된 새로운 테이블을 특정 조건으로 필터링
# SELECT - 열 선택
# ORDER BY - 열 정렬 (DESC: 내림차순, ASC: 오름차순)

실행순서: FROM -> WHERE -> GROUP BY
         (WHERE은 생략 가능)

-------------------------------------------------------------------------------
SELECT  [열1]
        ,[열2]
        ,[집계함수] AS [열이름]
  FROM  [테이블명]
 WHERE  [조건]
 GROUP
    BY  [열1]
        ,[열2]
HAVING  [조건]
 ORDER
    BY  [열1]

-------------------------------------------------------------------------------
USE PRACTICE;

# CUSTOMER 테이블의 모든 열 조회 
SELECT  * FROM CUSTOMER; 

# 남성만 필터링해서 조회
SELECT  * 
  FROM  CUSTOMER; 
 WHERE  GERNDER = 'MAN';

# 지역별로 회원수 집계
SELECT  ADDR 
        ,COUNT(MEM_NO) AS 회원수 
  FROM  CUSTOMER; 
 WHERE  GERNDER = 'MAN';
 GROUP BY  ADDR;

 # 집계 회원수 100명 미만 조건으로 필터링
 SELECT  ADDR 
        ,COUNT(MEM_NO) AS 회원수 
   FROM  CUSTOMER; 
  WHERE  GERNDER = 'MAN';
  GROUP 
     BY  ADDR;
 HAVING  COUNT(MEM_NO) < 100;

 # 회원 수가 높은 순으로 정렬
 SELECT  ADDR 
        ,COUNT(MEM_NO) AS 회원수 
   FROM  CUSTOMER; 
  WHERE  GERNDER = 'MAN';
  GROUP 
     BY  ADDR;
 HAVING  COUNT(MEM_NO) < 100;
  ORDER
     BY  COUNT(MEM_NO) DESC; 

# 거주지역을 서울, 인천으로 필터링 후 거주지명 및 성별로 회원수 집계
SELECT  ADDR 
        ,GERNDER               
        ,COUNT(MEM_NO) AS 회원수 
  FROM  CUSTOMER; 
 WHERE  ADDR IN ('SEOUL', 'INCHEON');
 GROUP 
    BY  ADDR
        ,GERNDER;
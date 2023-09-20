# SQL - 함수

# 함수 : 특정 규칙에 의해 새로운 결과값을 반환하는 명령어

# 단일행 함수 - 숫자형, 문자형, 날짜형, 형 변환, 일반
# 복수행 함수 - 집계형, 그룹형
# 윈도우 함수 - 순위, 집계(누적)

--------------------------------------------------------------------------
# <단일행 함수> : 모든 행에 대하여 각각 함수 적용, 반환
                 여러 함수들을 중첩해서 사용 가능

# -숫자형 함수-

# ABS(숫자) : 절대값 반환
SELECT ABS(-200);            # 200 

# ROUND(숫자, N) : N을 기준으로 반올림값 반환
SELECT ROUND(2.18, 1);       # 2.2 

# SQRT(숫자) : 제곱근 값 반환 
SELECT SQRT(9);              # 3 

# -문자형 함수-

# LOWER(문자), UPPER(문자) : 소문자, 대문자 변환
SELECT LOWER('AB');          # 'ab' 
SELECT UPPER('ab');          # 'AB' 

# LEFT(문자, N), RIGHT(문자, N) : 왼쪽, 오른쪽부터 N만큼 반환
SELECT LEFT('AB', 1);        # 'A'
SELECT RIGHT('AB', 1);       # 'B'

# LENGTH(문자) : 문자수(문자열 길이) 반환
SELECT LENGTH('AB');         # 2

# -날짜형 함수-

# YEAR, MONTH, DAY : 연, 월, 일 반환
SELECT YEAR('2022-12-31');   # 2022
SELECT MONTH('2022-12-31');  # 12
SELECT DAY('2022-12-31');    # 31

# DATE_ADD(날짜, INTERVAL) : INTERVAL만큼 더한 값 반환
SELECT DATE_ADD('2022-12-31', INTERVAL -1 MONTH);  # 2022-11-30

# DATEDIFF(날짜 a, 날짜 b) : 날짜 a - 날짜 b 일 수 반환
SELECT DATEDIFF('2022-12-31', '2022-12-1');    # 30

# -형변환 함수-

# DATE_FORMAT(날짜, 형식) : 날짜형식 변환
SELECT DATE_FORMAT('2022-12-31', '%m-%d-%y');   # 12-31-22
SELECT DATE_FORMAT('2022-12-31', '%M-%D-%Y');   # December-31st-2022

# CAST(형식 a, 형식 b) : 형식 a를 형식 b로 변환
SELECT CAST('2022-12-31 12:00:00' AS DATE);    # 2022-12-31 (시간 삭제)

# -일반 함수-

# IFNULL(A, B) : A가 NULL이면 B를 반환, 아니면 A 반환
SELECT IFNULL(NULL, 0);                 # 0 출력
SELECT IFNULL('NULL이 아님', 0);         # NULL이 아님 출력

# CASE WHEN : 여러 조건별로 반환값 지정
CASE WHEN [조건1] THEN [반환1]
     WHEN [조건2] THEN [반환2]
     ELSE [나머지] END

SELECT  *
        ,CASE WHEN GENDER = 'MAN' THEN '남성';
              ELSE '여성' END
  FROM  CUSTOMER;

--------------------------------------------------------------------------
# <복수행 함수> : 여러 행들이 하나의 결과값으로 반환됨
                 주로 GROUP BY절과 함께 사용

# 집계 함수
SELECT  COUNT(ORDER_NO) AS 구매횟수            # 행 수
        ,COUNT(DISTINCT MEM_NO) AS 구매자수    # 중복제거된 행 수 
        ,SUM(SALES_QTY) AS 구매수량            # 합계
        ,AVG(SALES_QTY) AS 평균구매수량        # 평균
        ,MAX(ORDER_DATE) AS 최근구매일자       # 최대
        ,MIN(ORDER_DATE) AS 최초구매일자       # 최소
  FROM  SALES;

# DISTINCT : 중복제거

# 그룹 함수
# WITH ROLLUP : GROUP BY 열들을 오른쪽에서 왼쪽으로 그룹, 합계 조회
SELECT  YEAR(JOIN_DATE) AS 가입연도
        ,ADDR
        ,COUNT(MEM_NO) AS 회원수
  FROM  CUSTOMER
 GROUP
    BY  YEAR(JOIN_DATE)
        ,ADDR
WITH ROLLUP;

--------------------------------------------------------------------------
# <윈도우 함수> : 행과 행간의 관계를 정의하여 결과값을 반환

# ORDER BY : 행과 행간의 순서를 정함
# -> 기본문법 : OVER (ORDER BY 열 ASC or DESC)

# PARTITION BY : 그룹화
# -> 기본문법 : OVER (PARTITION BY 열 OVER BY 열 ASC or DESC)

# 순위 함수
# ROW_NUMBER: 동일한 값이라도 고유한 순위 반환 (1,2,3,4,5)
# RANK: 동일한 값이면 동일한 순위 반환         (1,2,3,3,5)
# DENSE_RANK: 동일한 값이면 동일한 순위 반환   (1,2,3,3,4)

SELECT  ORDER_DATE
        ,ROW_NUMBER() OVER (ORDER BY ORDER_DATE ASC) AS 고유한_순위_변환
        ,RANK()       OVER (ORDER BY ORDER_DATE ASC) AS 동일한_순위_변환
        ,DENSE_RANK() OVER (ORDER BY ORDER_DATE ASC) AS 동일한_순위_변환_하나의등수
  FROM  SALES;

# 순위 함수 + PARTITION BY: 그룹별 순위
SELECT  MEM_NO
        ,ORDER_DATE
        ,ROW_NUMBER() OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 고유한_순위_변환
        ,RANK()       OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 동일한_순위_변환
        ,DENSE_RANK() OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 동일한_순위_변환_하나의등수
  FROM  SALES;

# 집계 함수(누적)
SELECT  ORDER_DATE
        ,SALES_QTY
        ,'-' AS 구분
        ,COUNT(ORDER_NO) OVER (ORDER BY ORDER_DATE ASC) AS 누적_구매횟수
        ,SUM(SALES_QTY)  OVER (ORDER BY ORDER_DATE ASC) AS 누적_구매수량
        ,AVG(SALES_QTY)  OVER (ORDER BY ORDER_DATE ASC) AS 누적_평균구매수량
        ,MAX(SALES_QTY)  OVER (ORDER BY ORDER_DATE ASC) AS 누적_가장높은구매수량
        ,MIN(SALES_QTY)  OVER (ORDER BY ORDER_DATE ASC) AS 누적_가장낮은구매수량
  FROM  SALES;

# 집계 함수(누적) + PARTITION BY: 그룹별 집계 함수(누적)
SELECT  MEM_NO
        ,ORDER_DATE
        ,SALES_QTY
        ,'-' AS 구분
        ,COUNT(ORDER_NO) OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_구매횟수
        ,SUM(SALES_QTY)  OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_구매수량
        ,AVG(SALES_QTY)  OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_평균구매수량
        ,MAX(SALES_QTY)  OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_가장높은구매수량
        ,MIN(SALES_QTY)  OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_가장낮은구매수량
  FROM  SALES;
  # 실행하면 회원번호가 그룹화되어 날짜기준, 오름차순으로 누적된 집계값 반환
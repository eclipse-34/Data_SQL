# SQL - View와 Procedure

# View : 사용자가 정의한 가상테이블
# -> JOIN 사용을 최소화, 편의성 최대화
# -> 중복되는 열이 저장될 수 없음

USE PRACTICE;

# 테이블 결합 - 주문 테이블 기준, 상품 테이블 LEFT JOIN 결합
SELECT  A. *
        ,A.SALES_QTY * B.PRICE AS 결제금액      # 결제금액 열 생성
  FROM  SALES AS A
  LEFT
  JOIN  PRODCT AS B
    ON  A.PRODCT_CODE = B.PRODCT_CODE;

# VIEW 생성
CREATE VIEW SALES_PRODUCT AS
SELECT  A. *
        ,A.SALES_QTY * B.PRICE AS 결제금액
  FROM  SALES AS A
  LEFT
  JOIN  PRODUCT AS B
    ON  A.PRODUCT_CODE = B.PRODCT_CODE;

# VIEW 실행
SELECT  *
  FROM  SALES_PRODUCT;

# VIEW 수정 
ALTER VIEW SALES_PRODUCT AS
SELECT  A. *
        ,a.SALES_QTY * B.PRICE * 1.1 AS 결제금액_수수료포함
  FROM  SALES AS A
  LEFT
  JOIN  PRODCT  AS B
    ON  A.PRODUCT_CODE = B.PRODCT_CODE;

# VIEW 삭제
DROP VIEW SALES_PRODUCT;

# VIEW 특징 - 중복되는 열 저장 불가
SELECT  *                                
  FROM  SALES AS A
  LEFT
  JOIN  PRODCT AS B
    ON  A.PRODCT_CODE = B.PRODCT_CODE;    -> 에러
# -> SALES 테이블, PRODCT 테이블 안에 PRODCT_CODE가 중복되기 때문에 
# -> 둘 중 하나만 SELECT절에 입력해야 함

---------------------------------------------------------------------------

# Procedure : 일련의 SQL 문과 제어 구문을 하나의 논리적 단위로 묶어놓은 것, 재사용 가능한 명령어 그룹
# 매개변수를 활용해 사용자가 정의한 작업을 저장

# 매개변수 - IN, OUT, INOUT

# IN : 매개변수를 프로시저로 전달
# OUT : 프로시저 결과값 반환
# INOUT IN, OUT의 기능을 모두 수행하는 매게변수

# <IN 매개변수>
DELIMITER //                   # 여러 명령어들을 하나로 묶어줄 때 사용
CREATE PROCEDURE CST_GEN_ADDR_IN( IN INPUT_A VARCHAR(20), INPUT_B VARCHAR(20) )
BEGIN 
    SELECT  *
      FROM  CUSTOMER
     WHERE  GENDER = INPUT_A
       AND  ADDR = INPUT_B;
END //                         # BEGIN, END 는 프로시저 명령어 시작, 끝 의미
DELIMITER ;

# PROCEDURE 실행
CALL CST_GEN_ADDR_IN('MAN', "SEOUL");
CALL CST_GEN_ADDR_IN('WOMAN', 'INCHEON');

# PROCEDURE 삭제
DROP PROCEDURE CST_GEN_ADDR_IN;


# <OUT 매개변수>
DELIMITER //
CREATE PROCEDURE CST_GEN_ADDR_IN_CNT_MEM_OUT( IN INPUT_A VARCHAR(20), INPUT_B VARCHAR(20), OUT CNT_MEM INT )
BEGIN 
    SELECT  COUNT(MEM_NO)
      INTO  CNT_MEM                  # INTO 는 OUT 매개변수의 결과값 반환하는 명령어
      FROM  CUSTOMER
     WHERE  GENDER = INPUT_A
       AND  ADDR = INPUT_B;
END //                        
DELIMITER ;

# PROCEDURE 실행
CALL CST_GEN_ADDR_IN('WOMAN', "INCHEON", @CNT_MEM);
SELECT  @CNT_MEM;


# <IN/OUT 매개변수>
DELIMITER //
CREATE PROCEDURE IN_OUT_PARAMETER( INOUT COUNT INT )
BEGIN 
    SET COUNT = COUNT + 10;           
END //                        
DELIMITER ;

# PROCEDURE 실행
SET @counter = 1;
CALL IN_OUT_PARAMETER(@counter);
SELECT  @counter;


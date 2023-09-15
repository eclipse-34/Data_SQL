# SQL 기본 명령어 4가지 - DDL, DML, DCL, TCL

# 데이터 조작어(DML) 
# > 테이블 삽입, 조회, 수정, 삭제

USE Practice
CREATE TABLE 회원정보 (         
회원번호 INT PRIMARY KEY,     
이름 VARCHAR(20),
가입일자 DATE NOT NULL,      
수신동의 BIT
);

# 데이터 삽입
INSERT INTO 회원정보 VALUES (1001, '이익준', '2023-09-01', 1);
INSERT INTO 회원정보 VALUES (1002, '채송화', '2023-09-02', 0);
INSERT INTO 회원정보 VALUES (1003, '김준완', '2023-09-03', 1);
INSERT INTO 회원정보 VALUES (1004, '안정원', '2023-09-04', 0);

# PRIMARY KEY 제약 조건 위반
INSERT INTO 회원정보 VALUES (1004, '양석형', '2023-09-05', 1);  -- 에러, 중복 저장 불가 
# NOT NULL 제약 조건 위반
INSERT INTO 회원정보 VALUES (1005, '양석형', NULL, 1);  -- 에러, 저장 불가
# 데이터 타입 조건 제약 조건 위반
INSERT INTO 회원정보 VALUES (1005, '양석형', 1, 1);  -- 문자열이 아닌 숫자라서 저장 불가

# 데이터 조회
SELECT * FROM 회원정보;                      -- 테이블의 모든 열 조회
SELECT 회원번호, 이름 FROM 회원정보;          -- 특정 열 조회
SELECT 회원번호, 이름 AS 성명 FROM 회원정보;  -- 특정 열 이름을 변경하여 조회

# <데이터 수정> 
# -> 수정 전 데이터 수정, 삭제 제한 설정 해제 
# -> MySQL_Workbench (Edit -> Preferences -> SQL Editor -> Other -> Safe updates 체크박스 해제)

# 열의 모든 데이터 수정
UPDATE 회원정보 SET 수신동의 = 0;

# 특정 조건 데이터 수정
UPDATE 회원정보 SET 수신동의 = 1 WHERE 이름 = '채송화';

# <데이터 삭제>
# 특정 데이터 삭제
DELETE FROM 회원정보 WHERE 이름 = '이익준';

# 모든 데이터 삭제
DELETE FROM 회원정보;
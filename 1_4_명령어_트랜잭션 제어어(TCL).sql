# SQL 기본 명령어 4가지 - DDL, DML, DCL, TCL

# 트랜잭선 제어어(TCL) 
# > 데이터 조작어 명령어 실행, 취소, 임시저장

# PRACTICE 데이터베이스 사용
USE Practice

# 회원 테이블 존재 시 삭제
DROP TABLE 회원정보;

# 회원 테이블 생성
CREATE TABLE 회원정보 (         
회원번호 INT PRIMARY KEY,     
이름 VARCHAR(20),
가입일자 DATE NOT NULL,      
수신동의 BIT
);

# 회원 테이블 조회
SELECT * FROM 회원정보;

# 트랜잭션 시작
BEGIN;

# 데이터 삽입
INSERT INTO 회원정보 VALUES (1001, '이익준', '2023-09-01', 1);

SELECT * FROM 회원정보;   -- 삽입 확인

# 취소
ROLLBACK;

SELECT * FROM 회원정보;  -- 삽입 취소 확인
---------------------------------------------------------------
BEGIN;

INSERT INTO 회원정보 VALUES (1001, '이익준', '2023-09-01', 1);

# 실행
COMMIT;

SELECT * FROM 회원정보;   -- 최종 실행
----------------------------------------------------------------

# 임시저장(SAVEPOINT) : ROLLBACK 저장점 지정
# 원하는 지점으로 롤백할 수 있음

DELETE FROM 회원정보;

BEGIN;
INSERT INTO 회원정보 VALUES (1005, '양석형', '2023-09-05', 1); 

# SAVEPOINT 지정
SAVEPOINT S1;

UPDATE 회원정보 SET 이름 = '김준완';
SAVEPOINT S2;

DELETE FROM 회원정보;
SAVEPOINT S3;

SELECT * FROM 회원정보;

# SAVEPOINT S2 지점으로 ROLLBACK
ROLLBACK TO S2;

SELECT * FROM 회원정보;
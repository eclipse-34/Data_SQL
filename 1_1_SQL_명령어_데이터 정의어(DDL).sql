# SQL 기본 명령어 4가지 - DDL, DML, DCL, TCL

# 데이터 정의어(DDL)
# > 테이블 생성, 열 추가, 열 데이터 타입 변경, 테이블명 변경, 테이블 삭제

# 테이블은 각 열마다 반드시 1가지 데이터 타입으로 정의
# 대표적인 데이터 형식 > 숫자형, 문자형, 날짜형

# 테이블에서 각 열마다 제약 조건 정의 가능
# PK(Primary Key): 중복되어 나타날 수 없는 단일 값, NOT NULL

# Practice 데이터베이스 생성, 사용
CREATE DATABASE Practice;    
USE Practice;                

# 회원 테이블 생성, 열 이름을 먼저 쓰고 뒤에 데이터 타입 작성
CREATE TABLE 회원 (         
회원번호 INT PRIMARY KEY,     -- 제약조건: PRIMARY KEY
이름 VARCHAR(20),
가입일자 DATE NOT NULL,       -- 제약조건: NOT NULL
수신동의 BIT
);

# 회원 테이블 조회
SELECT  *
    FROM 회원;
SELECT  *  FROM 회원;   --한 줄도 가능

# 테이블 열 추가
ALTER TABLE 회원 ADD 성별 VARCHAR(2);   -- 성별 열 추가

# 테이블 열 데이터 타입 타입 변경
ALTER TABLE 회원 MODIFY 성별 VARCHAR(20);

# 테이블 열 이름 변경
ALTER TABLE 회원 CHANGE 성별 성 VARCHAR(2);  -- 성별 -> 성 으로 열 이름 변경

# 테이블 이름 변경
ALTER TABLE 회원 RENAME 회원정보;   -- 회원 -> 회원정보로 테이블 이름 변경

# 테이블 삭제
DROP TABLE 회원정보;
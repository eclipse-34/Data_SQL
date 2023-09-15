# SQL 기본 명령어 4가지 - DDL, DML, DCL, TCL

# 데이터 제어어(DCL) 
# > 사용자 확인, 사용자 추가 및 삭제, 권한 부여 및 삭제
# > 데이터베이스 관리자(DBA)가 특정 사용자에게 데이터 접근 권한 부여, 제거할 때 사용

# MySQL 데이터베이스 사용
USE MYSQL;

# 사용자 확인
SELECT * FROM USER;

# 사용자 추가
CREATE USER 'TEST1'@LOCALHOST IDENTIFIED BY 'TEST2';   # 'TEST1'은 ID, 'TEST2'는 비밀번호

# 사용자 비밀번호 변경
SET PASSWORD FOR 'TEST2' @LOCALHOST = '1234';

# MySQL 서버로 접속 -> HOME -> MySQL Connections + -> Test Connection

# <권한 부여 및 제거>
# 권한 종류: CREATE, ALTER, DROP, INSERT, DELETE, UPDATE, SELECT 등
# 특정 권한 부여
GRANT SELECT, DELETE ON PRACTICE.회원정보 TO 'TEST1'@LOCALHOST;

# 특정 권한 제거
REVOKE DELETE ON PRACTICE.회원정보 FROM 'TEST1'@LOCALHOST;

# 모든 권한 부여
GRANT ALL ON PRACTICE.회원정보 TO 'TEST1'@LOCALHOST;

# 모든 권한 제거
REVOKE ALL ON PRACTICE.회원정보 FROM 'TEST1'@LOCALHOST;

# 사용자 삭제
DROP USER 'TEST1'@LOCALHOST;


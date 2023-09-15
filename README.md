# Data_SQL
## :pencil2: 기초 데이터 분석, 엔지니어링을 위한 SQL 정리
[0. SQL Workbench](https://github.com/eclipse-34/Data_SQL/blob/main/0_SQL_Workbench.sql)
- MySQL 작업 환경 -> 데이터베이스 생성, 사용, 삭제

[1-1. SQL_명령어 - 데이터 정의어(DDL)](https://github.com/eclipse-34/Data_SQL/blob/main/1_1_SQL_%EB%AA%85%EB%A0%B9%EC%96%B4_%EB%8D%B0%EC%9D%B4%ED%84%B0%20%EC%A0%95%EC%9D%98%EC%96%B4(DDL).sql)
- 데이터 정의어(Data Definition Language)
- CREATE, ALTER, DROP
- 테이블 생성, 열 추가, 열 데이터 타입 변경, 테이블명 변경, 테이블 삭제

## :pencil2: 데이터베이스 기본 개념
### SQL
Structured Query Language<br>
(관계형) 데이터베이스와 상호작용(질의)하기 위한 표준화된 프로그래밍 언어<br>
종류가 다양하며 한 회사에서 여러 종류의 데이터베이스, SQL을 쓰는 경우가 많음<br>
<details>
<summary>SQL 종류</summary>
<ul>
  <li>
    <strong>표준 SQL (Standard SQL)</strong>
    <ul>
      <li>SQL 언어의 공식 표준을 정의한 것으로, 대부분의 DBMS에서 지원</li>
      <li>ANSI 또는 ISO 표준 SQL이라고도 함</li>
      <li>기본 쿼리, 데이터 정의, 데이터 조작 및 데이터 제어 작업을 수행하기 위한 기본 문법과 기능 제공</li>
      <li> SELECT, INSERT, UPDATE, DELETE, CREATE TABLE, ALTER TABLE, DROP TABLE 등의 기본 SQL 문을 포함</li>
    </ul>
  </li>
  <li>
    <strong>MySQL SQL</strong>
    <ul>
      <li>MySQL: 오픈 소스 관계형 데이터베이스 관리 시스템(RDBMS)</li>
      <li>MySQL 고유의 확장된 SQL 문법, 기능, 함수 지원(저장 프로시저, 트리거, JSON 지원 등)</li>
      <li>중소기업에서 많이 사용</li>
    </ul>
  </li>
  <li>
    <strong>Oracle SQL</strong>
    <ul>
      <li>Oracle Database에서 사용하는 변형된 SQL</li>
      <li>데이터베이스 성능 최적화와 관련된 고급 기능</li>
      <li>중소기업보다 대규모 기업 및 조직에서 주로 사용</li>
    </ul>
  </li>
  <li>
    <strong>Microsoft SQL Server T-SQL</strong>
    <ul>
      <li>Microsoft SQL Server: Microsoft의 관계형 데이터베이스 관리 시스템(RDBMS)</li>
      <li>T-SQL(Transact-SQL)이라고 불리는 SQL 변형을 지원</li>
      <li>Microsoft SQL Server 환경과 관련된 확장 기능(저장 프로시저, 트리거 등)</li>
    </ul>
  </li>
  <li>
    <strong>PostgreSQL SQL</strong>
    <ul>
      <li>PostgreSQL: 데이터베이스 성능 및 확장성을 고려하여 설계된 오픈 소스 RDBMS</li>
      <li>웹 애플리케이션 데이터 저장, 관리에 주로 사용</li>
      <li>복잡한 데이터 모델링, 다양한 데이터 유형 지원</li>
    </ul>
  </li>
  <li>
    <strong>SQLite SQL</strong>
    <ul>
      <li>SQLite: 경량 데이터베이스 엔진</li>
      <li>모바일 애플리케이션 및 임베디드 시스템에서 많이 사용</li>
      <li>SQLite는 파일 기반 데이터베이스로 서버가 필요하지 않으며 데이터를 로컬 디스크 파일에 저장</li>
    </ul>
  </li>
</ul>
</details>

### 데이터베이스(Database):
구조화된 데이터의 집합을 저장하고 관리하는 시스템<br>
고객 정보, 주문 내역, 제품 목록 등을 저장
>#### 관계형 데이터베이스(RDB)
>데이터를 테이블 형태로 저장하고 관리하는 데이터베이스 시스템<br>
>다른 테이블과 관계를 맺고 모여있는 집합체<br>
>관계형 데이터베이스에서 여러 테이블 간의 관계를 정의<br>
>주로 1:1, 1:n, n:n 관계
<details>
<summary>관계형/비관계형 데이터베이스 종류</summary>
  <li>
    <strong>관계형 데이터베이스</strong>
    <ul>
      <li>MySQL</li>
      <li>PostgreSQL</li>
      <li>Microsoft SQL Server(MSSQL)</li>
      <li>Oracle Database</li>
      <li>SQLite</li>
    </ul>
    <strong>비관계형 데이터베이스</strong>
    <ul>
      <li>MongoDB</li>
      <li>Cassandra</li>
      <li>Redis</li>
      <li>Couchbase</li>
      <li>Amazon DynamoDB</li>
    </ul>
    <strong>비관계형 데이터베이스를 사용하는 이유</strong>
    <ul>
      <li>다양한 데이터 유형과 구조를 처리 가능</li>
      <li>대규모 데이터를 효율적으로 저장하고 검색 가능</li>
      <li>클라우드 환경과 간편하게 통합됨</li>
      <li>스키마가 유연하며, 데이터 모델을 동적으로 조정 가능-> 빠르게 변경에 대응 가능</li>
    </ul>
  </li>
</details>

### 테이블(Table):
데이터를 저장하는 데 사용되는 구조테이블<br>
열(Column)과 행(Row)으로 구성되며, 각 열은 데이터의 유형, 종류

### 쿼리(Query):
쿼리는 데이터베이스에서 정보를 검색, 추가, 수정 또는 삭제하는 명령문

### 조건문(Conditional Statement):
조건문은 데이터 검색 시 특정 조건을 충족하는 데이터만 검색하는 데 사용<br>
WHERE 절을 사용하여 조건을 지정

### 정규화(Normalization):
데이터베이스 설계 과정에서 중복을 최소화하고 데이터 일관성을 유지하기 위한 프로세스<br>
데이터를 여러 테이블로 분할하여 중복을 피하고, 관련 정보를 관련 테이블 간에 연결

### 기본 키(Primary Key):
기본 키는 각 행을 고유하게 식별하는 열<br>
테이블에서 모든 행은 고유한 기본 키 값을 가져야 함<br> 
기본 키는 검색 및 관계 정의에 사용

### 외래 키(Foreign Key):
다른 테이블의 기본 키를 참조하는 열<br>
관계형 데이터베이스에서 테이블 간의 관계를 정의하는 데 사용

### 트랜잭션(Transaction):
데이터베이스에서 하나 이상의 작업을 묶어서 그룹화<br>
성공 또는 실패에 따라 모든 작업을 롤백 또는 커밋할 수 있는 논리적 작업 단위 -> `all or nothing`<br>
원자성 (Atomicity), 일관성 (Consistency), 고립성 (Isolation),지속성 (Durability)을 가짐
>* 원자성(Atomic): 트랜잭션 내의 모든 작업이 완전히 수행되거나 전혀 수행되지 않음
>* 일관성 (Consistency): 트랜잭션이 실행 전과 후에 데이터베이스는 일관된 상태
>* 고립성 (Isolation): 여러 트랜잭션이 동시에 실행 중일 때, 각 트랜잭션은 다른 트랜잭션의 작업에 영향을 받지 않음
>* 지속성 (Durability): 트랜잭션이 성공적으로 완료되면 그 결과는 영구적으로 저장되고, 시스템 장애 또는 중단 상황에서도 유지

### 인덱스(Index):
인덱스는 데이터베이스 성능을 향상시키기 위해 사용되는 구조<br>
특정 열에 대한 빠른 데이터 검색










-- 주석, Comment
SELECT * FROM emp;

SELECT * FROM user_tab_comments; --테이블 주석 자료사전
SELECT * FROM user_col_comments; --컬럼 주석 자료사전


COMMENT ON TABLE emp IS '사원정보 테이블';

COMMENT ON COLUMN emp.empno IS '사원번호';
COMMENT ON COLUMN emp.ename IS '사원이름';
COMMENT ON COLUMN emp.job IS '직무';
COMMENT ON COLUMN emp.mgr IS '담당자';
COMMENT ON COLUMN emp.hiredate IS '입사일자';
COMMENT ON COLUMN emp.sal IS '급여';
COMMENT ON COLUMN emp.comm IS '상여금';
COMMENT ON COLUMN emp.deptno IS '부서번호';


SELECT * FROM user_tab_comments --테이블 주석 자료사전
WHERE table_name = upper('emp');
SELECT * FROM user_col_comments --컬럼 주석 자료사전
WHERE table_name = upper('emp');







--권한
SELECT * FROM dba_sys_privs;
SELECT * FROM user_sys_privs;


SELECT * FROM dba_sys_privs
WHERE grantee = upper('scott');
SELECT * FROM user_sys_privs;

-- ROLE 조회
SELECT * FROM dba_role_privs
WHERE grantee = upper('scott');

-- ROLE에 부여된 시스템 권한
SELECT * FROM dba_sys_privs
WHERE grantee IN ( upper('resource'), upper('connect') )
ORDER BY grantee, privilege;



-- ROLE을 포함한 시스템 권한 조회하기
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN (
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE grantee=upper('scott') )
UNION
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee=upper('scott');


-- 사용자 계정 생성
CREATE USER test IDENTIFIED BY 1234;

-- test에게 DB접속 권한 부여하기
GRANT CREATE SESSION
TO test;

-- test에게 DB접속 권한 회수하기
REVOKE CREATE SESSION
FROM test;


-- 롤을 이용한 권한 부여
--  RESOURCE : 기본 객체 생성 권한
--  CONNECT : DB로그온 권한
GRANT RESOURCE, CONNECT
TO test;



-- ( SCOTT이용 )
CREATE ROLE role1;

-- ( SYSTEM계정 이용 )
GRANT CREATE ROLE
TO scott;


-- ( SCOTT이용 )
CREATE ROLE role1;

SELECT * FROM all_users;

GRANT role1
TO test;

GRANT CREATE ROLE
TO test;

-- ( SYSTEM계정 이용 )
GRANT CREATE ROLE
TO scott
WITH ADMIN OPTION; --관리자급 권한 부여


-- ( SCOTT 계정 이용 )
GRANT CREATE ROLE
TO test;



-- ROLE을 포함한 시스템 권한 조회하기
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN (
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE grantee=upper('ROLE_TEST') )
UNION
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee=upper('ROLE_TEST');

---------- 롤, 권한 부여 실습 QUIZ ----------
-- 1. SCOTT계정을 이용하여 ROLE 생성
--  - 이름 : ROLE_TEST

-- ( SYSTEM 계정으로 )
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW
TO scott
WITH ADMIN OPTION;

-- ( SCOTT 계정으로)
CREATE ROLE ROLE_TEST;

--  - 롤에 권한 부여
--	CREATE TABLE
--	CREATE SESSION
--	CREATE VIEW

GRANT CREATE TABLE, CREATE SESSION, CREATE VIEW
TO ROLE_TEST;

SELECT * FROM user_role_privs;

-- 2. ROLE_TEST 롤을 test2에 부여
-- (SYSTEM 으로)
GRANT CREATE USER
TO scott;

-- (SCOTT으로)
CREATE USER test2 IDENTIFIED BY 1234;

-- role_test 를 test2에 부여하기
GRANT ROLE_TEST
TO test2;


-- 3. 확인
--  - test2/1234 로 connection(접속)
--  - 테이블 생성


--  - CREATE TABLE testTable ( num NUMBER ); 수행
--	-> 안만들어집니다!
-------------------------------------------



--테이블 스페이스, tablespace
--  테이블이 저장되는 공간(파일)


-- test2 계정 전용 tablespace 생성하기

-- ( SYSTEM 계정으로 수행할 것 )

--테이블 스페이스 생성
--  기본크기 100M, 부족하면 10M씩 확장됨, 최대 500M까지
CREATE TABLESPACE test2_db
DATAFILE 'C:\oraclexe\app\oracle\oradata\test2.db'
SIZE 100M
AUTOEXTEND ON NEXT 10M
MAXSIZE 500M;


--테이블스페이스를 사용자계정에 적용하기
ALTER USER test2
DEFAULT TABLESPACE test2_db --기본 테이블스페이스 지정
QUOTA UNLIMITED ON test2_db --테이블스페이스 용량 할당량(전부)
TEMPORARY TABLESPACE temp; --임시테이블로 temp 지정


-- 테이블스페이스 삭제
DROP TABLESPACE test2_db
INCLUDING CONTENTS AND DATAFILES --실데이터와 DBF파일 삭제
CASCADE CONSTRAINTS; --의존성을 가지는 모든 제약사항 삭제


-- (scott 계정 이용)
GRANT SELECT, INSERT
ON dept
TO test, test2;

REVOKE SELECT
ON dept
FROM test, test2;


--ALTER TABLE 테스트용 테이블 생성
CREATE TABLE alter_test(
    empno NUMBER(4),
    ename VARCHAR2(30),
    CONSTRAINT alter_test_pk PRIMARY KEY (empno));
    
    DESC alter_test;
    
    SELECT * FROM alter_test;
    
    INSERT INTO alter_test
    SELECT empno, ename FROM emp;
    
    DESC emp;
    -- emp.sal 컬럼 추가하기
    
    ALTER TABLE alter_test
    ADD ( sal NUMBER(7,2) );
    
    DESC alter_test;
    SELECT * FROM alter_test;
    
    -- emp.job 컬럼 추가하기
    ALTER TABLE alter_test
    ADD ( job VARCHAR2(9));

    
    -- sal, job에 emp테이블의 데이터를 반영하기
    --  empno가 같은 데이터를 찾아서 반영할 것
    UPDATE alter_test A
    SET (sal, job) = (
        SELECT sal, job FROM emp B 
        WHERE A.empno = B.empno);

SELECT * FROM alter_test;





-- alter_test.job : VARCHAR(9) -> number
ALTER TABLE alter_test
MODIFY ( job NUMBER );


-- JOB 컬럼의 모든 데이터를 null 로 수정
UPDATE alter_test
set job = null;

ALTER TABLE alter_test
MODIFY ( job NUMBER ) ; -- 데이터가 없어서 가능

DESC  alter_test;


ALTER TABLE alter_test
MODIFY ( job NOT NULL); -- NOT NULL 제약사항 부여
ALTER TABLE alter_test
MODIFY (eanme NOT NULL); --NOT NULL 제약사항 부여

-- 컬럼 삭제

ALTER TABLE alter_test
DROP COLUMN job;

-- 컬럼 비활성화( 복구 불가능 )
ALTER TABLE alter_test
SET UNUSED ( sal );
SELECT * FROM alter_test;

-- 비활성화된 컬럼 정보 자료사전 (개수만 나온다)

SELECT * FROM user_unused_col_tabs;

ALTER TABLE cons_15 SET UNUSED (data);
ALTER TABLE cons_14 SET UNUSED (data);
ALTER TABLE cons_12 SET UNUSED (data);


-- 비활성화된 컬럼 정리하기(완전 삭제)
ALTER TABLE alter_test DROP UNUSED COLUMNS;

-- 컬럼명 변경
-- altertest.empno -> alter_test.eno
ALTER TABLE alter_test
RENAME COLUMN empno TO eno;


SELECT * FROM alter_test;
DESC alter_test;


-- 테이블명 변경
-- alter_test -> alter_tb
ALTER TABLE alter_test
RENAME TO alter_tb;

SELECT * FROM alter_tb;


SELECT * FROM alter_tb;

-- 데이터 삭제 -- DML
DELETE alter_tb;
rollback;

-- TRUNCATE -- DDL
TRUNCATE TABLE  alter_tb;
SELECT * FROM alter_tb;
rollback;
 
-- 테이블 삭제 -- DDL
DROP TABLE alter_tb;
DESC alter_tb;
SELECT * FROM alter_tb;

SELECT * FROM tabs
WHERE table_name = upper('alter_tb');

-- user_tables : 사용자가 생성한 테이블들 정보 자료사전
SELECT * FROM user_tables
WHERE table_name = upper('alter_tb');

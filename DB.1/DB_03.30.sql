


SELECT * FROM emp;

DESC emp;

SELECT empno, ename, JOB, mgr ,hiredate ,sal ,comm ,deptno
FROM emp;


-- INSERT --
INSERT INTO emp ( empno, ename, JOB, mgr ,hiredate ,sal ,comm ,deptno) 
VALUES ( 1001, 'ALICE', 'CLERK', 1003, '16/4/9', 800, NULL, 30 ); 

INSERT INTO emp
VALUES ( 1003, 'MORRIS', 'CLERK', 1003, '16/9/2', 800, null, 30 );
SELECT * FROM emp WHERE empno < 2000;

SELECT 1, 2, 'a', 'b' FROM dual;

SELECT 1003, 'MATHEW', 'SALESMAN', NULL, sysdate, 1500 ,100, 30
FROM dual;

INSERT INTO emp
SELECT 1004, 'MATHEW', 'SALESMAN', NULL, sysdate, 1500 ,100, 30
FROM dual;
SELECT * FROM emp WHERE empno <2000;

INSERT INTO emp ( empno, ename, JOB) 
VALUES ( 1011, 'EDWARD', 'MANAGER');

INSERT INTO emp ( empno, ename, sal ) 
VALUES ( 1015, 'Richard', 2000 );

SELECT * FROM emp;

-- commit; 커밋, 데이터 변경사항 영구적으로 적용
SELECT * FROM emp;
-- DELECT emp; -- 테이블 전체 삭제
-- rollback; -- 롤백, 데이터 변경사항을 되돌리기



-- 테이블 생성 (SELECT 구문의 결과를 사본테이블로 생성한다)
CREATE TABLE emp_research
AS
SELECT * FROM emp;

-- 테이블 확인
SELECT * FROM emp_research;

-- 테이블 삭제
DROP TABLE emp_research;

-- 빈 테이블 복사
CREATE TABLE emp_research
AS
SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp_research;
-- 1=1 TRUE는 TRUE 와 같은 의미
-- 1=0 FALSE와 같은 의미


-- 20번 부서의 모든 데이터를 INSERT
INSERT INTO emp_research
SELECT * FROM emp WHERE deptno = 20;
SELECT * FROM emp_research;

-- 30번 부서의 모든 데이터를 empno, ename 만 INSERT
INSERT INTO emp_research( empno, ename)
SELECT empno, ename FROM emp WHERE deptno = 30;
SELECT * FROM emp_research;


-- 모든 데이터 삭제
DELETE emp_research;

INSERT ALL
WHEN deptno = 20
    THEN INTO emp_research
WHEN deptno = 30
    THEN INTO emp_research ( empno, ename )
    VALUES ( empno, ename )
SELECT * FROM emp;
SELECT * FROM emp_research;
ROLLBACK;


-- INSERT ALL QUIZ

-- 테이블 생성 (SELECT 구문의 결과를 사본테이블로 생성한다)
CREATE TABLE emp_research
AS
SELECT * FROM emp;

INSERT ALL
WHEN HIREDATE < '81/06/01'
    THEN INTO emp_HIRE
    VALUES ( empno, ename, hiredate)
SELECT * FROM emp;

INSERT ALL
WHEN SAL > 2000
    THEN INTO emp_SAL
    VALUES ( empno, ename, sal)
SELECT * FROM emp;
    
SELECT * FROM emp_HIRE; -- HIRE 테이블 확인   
SELECT * FROM emp_SAL; -- SAL 테이블 확인  


-- commit;
-- rollback;



-- 테이블 삭제
DELETE emp_hire;
DELETE emp_sal;
rollback;



SELECT * FROM emp_sal
-- DELETE emp_sal
WHERE empno = 7839;


SELECT * FROM emp
-- DELETE emp
WHERE empno = 7369;
rollback;

-- UPDATE
SELECT * FROM emp
-- UPDATE emp SET ename = 'Mc', job = 'Donald'
WHERE empno = 1001;
-- commit;



-- emp_hire 테이블의 전체 데이터의 입사일을 현재시간으로 변경
SELECT * FROM emp_hire;
update emp_hire SET HIREDATE = trunc(sysdate);
SELECT to_char(hiredate, 'yyy/mm/dd hh24:mi:ss') FROM emp;

-- emp_sal의 사원들 전부 급여 550 인상
-- update emp_sal SET sal = sal +550;
SELECT * FROM emp_sal;







-- MERGE
CREATE TABLE emp_merge
AS
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN (10, 20);

SELECT * FROM emp_merge
ORDER BY deptno, empno;


-- emp 테이블에서 20, 30부서 사원들을 조회(select)
-- emp_merge 테이블과 데이터 병합 (MERGE)
-- 이미 테이블에 존재하는 데이터라면 sal만 30% 인상 (UPDATE)
-- 테이블에 존재하지 않는 데이터라면 삽입 (INSERT)

MERGE INTO emp_merge M
USING (
    SELECT empno, ename, sal, deptno
    FROM emp
    WHERE deptno IN ( 20, 30 )
) E
ON ( M.empno = E.empno )
WHEN MATCHED THEN -- 존재하는 데이터, 20부서
    UPDATE SET M.sal = M.sal * 1.3
    WHERE E.sal > 1500
WHEN NOT MATCHED THEN -- 존재하지 않는 데이터, 30부서
    INSERT ( M.empno, M.ename, M.deptno, M.sal )
    VALUES ( E.empno, E.ename, E.deptno, E.sal )
    WHERE E.sal > 1000;
    
-- NUMBER
CREATE TABLE type_test_01 (
    data1 NUMBER,
    data2 NUMBER(10),
    data3 NUMBER(5,2),
    data4 NUMBER(4,5));
DESC type_test_01;


-- data1 : NUMBER
INSERT INTO type_test_01 (data1)
VALUES ( 111111111122222222223333333333444444444 );
SELECT data1 FROM type_test_01;



-- data2 : NUMBER(10)
INSERT INTO type_test_01 (data2)
VALUES ( 12345 );
INSERT INTO type_test_01 (data2)
VALUES ( 12345111111111111111111111 );
INSERT INTO type_test_01 (data2)
VALUES ( 1234.56781 ); -- 소수점 이하 반올림
SELECT data2 FROM type_test_01;


-- data3 : NUMBER(5,2)
INSERT INTO type_test_01 (data3)
VALUES (23.56);
INSERT INTO type_test_01 (data3)
VALUES (23.5678); -- 소수점 셋째자리 반올림
INSERT INTO type_test_01 (data3)
VALUES (1234.56); -- 안됨, 정수부 자리 너무 많음
INSERT INTO type_test_01 (data3)
VALUES (34.5);

SELECT data3 FROM type_test_01 WHERE data3 IS NOT NULL;



-- data4 : NUMBER (4,5) - 0.0xxxx
INSERT INTO type_test_01 (data4)
VALUES (1234); -- 안됨, 정수 입력 불가
INSERT INTO type_test_01 (data4)
VALUES (0.1234 ); -- 안됨, 소수점 첫째자리가 0이어야함
INSERT INTO type_test_01 (data4)
VALUES (0.012 );
INSERT INTO type_test_01 (data4)
VALUES (0.0123456789 );
SELECT data4 FROM type_test_01 WHERE data4 IS NOT NULL;


-- VARCHAR2 ( n ) : 문자
CREATE TABLE type_test_02 (
    data VARCHAR2(10) );
    DESC type_test_02;
    
-- 데이터 삽입해보기, 에러나는 데이터는?
-- '1234567890'
-- '123456789012345'
-- '일이삼사오육칠팔구십'
-- '일이삼'
INSERT INTO type_test_02
VALUES ('일이삼');


CREATE TABLE type_test_03 (
    data1 VARCHAR2 (10 BYTE), -- 10바이트
    data2 VARCHAR2 (10 CHAR)); -- 10개문자

INSERT INTO type_test_03 (data1, data2)
VALUES ( '일이삼' , '일이삼사오육칠팔구십' );

INSERT INTO type_test_03 (data1, data2)
VALUES ( '1234567890' , '1234567890' );

-- CHAR(n) : 고정 길이 문자
CREATE TABLE type_test_04 (
    data1 CHAR,
    data2 CHAR(20),
    data3 CHAR(20 CHAR));
    
INSERT INTO type_test_04
VALUES ( 'Y' , '1234567890', '일이삼사오육칠팔구십' );

SELECT * FROM type_test_04;

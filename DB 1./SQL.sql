--scott/tiger 접속..

-- 사용자계정의 테이블 조회
--( tabs 자료사전 )
SELECT * FROM tabs;


--- 테이블의 구조(스키마) 간단히 확인
DESC emp;

--- 테이블의 데이터 확인
SELECT * FROM emp;


-- 주석, Comment

-- 한줄 주석 단축키  : ctrl + /


-- SELECT 구문
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * FROM bonus;

SELECT *
FROM bonus;

-- 부분 컬럼( 지정한 컬럼 ) 조회
SELECT
    empno, ename, job 
FROM emp;

-- 조회되는 컬럼명에 별칭(Alias)을 적용하기
SELECT 
    empno AS "사번", -- 사원번호
    ename "이름" -- 사원이름
FROM emp;

desc emp;
SELECT empno, ename, job, mgr FROM emp;
SELECT * FROM emp; --실 서버에는 SELECT * 사용하면 멈출수도 있음 사용하는거 아님

-- WHERE절 (조건절)


-- 영업사원들만 조회하기
SELECT * FROM emp
WHERE job = 'SALESMAN'; -- 자바의 == 와 오라클의 = 는 같다.


-- 전체 사원들 중 급여가 2000이 넘는 사원
SELECT * FROM emp
WHERE sal > 2000;

-- 급여가 2500이 넘고 관리자가 아닌 사원
SELECT * FROM emp
WHERE sal > 2500
--  AND job <> 'MANAGER';
--  AND job != 'MANAGER';
AND NOT(job = 'MANAGER');

-- BETWEEN a AND b

-- 사원번호 7700 ~ 7900
SELECT empno, ename FROM emp
WHERE empno BETWEEN 7700 AND 7900;

-- 사원이름이 'ALLEN' ~ 'KING' 사이인 사원 조회
SELECT empno, ename FROM emp
--where ENAME between 'ALLEN' and 'KING';
--WHERE NOT(ename BETWEEN 'ALLEN' AND 'KING');
WHERE ename NOT BETWEEN 'ALLEN' AND 'KING';
-- ALT + ' 소문자 대문자 키워드 등등



-- IN( list )
SELECT empno, ename FROM emp
WHERE empno IN (7369, 7521, 7654, 7777, 8888, 7878);

-- NOT IN ( list )
SELECT empno, ename FROM emp
WHERE NOT (empno IN (7369, 7521, 7654, 7777, 8888, 7878));

SELECT empno, ename FROM emp
WHERE empno NOT IN (7369, 7521, 7654, 7777, 8888, 7878);

SELECT empno, ename FROM emp
WHERE ename IN ( 'SMITH', 'ALLEN', 'KING', 'ALICE' );


-- LIKE
SELECT empno, ename FROM emp
--WHERE ename LIKE '%R%'; -- 이름에 R을 포함하는 사원
--WHERE ename LIKE '_A%'; -- 이름의 두번째가 A인 사원
--WHERE ename LIKE '%RD'; -- RD로 끝나는 사원
WHERE ename NOT LIKE '%R%'; -- 이름에 R을 포함하지 않는 사원

-- LIKE 연산자와 IN연산자를 같이 사용하는 문법은 없다
SELECT EMPNO, ENAME FROM EMP
WHERE ENAME LIKE '%R%' 
   OR ENAME LIKE '%L%';


-- 서식없이 동등비교 (equal)를 할때에는
-- LIKE 연산자를 사용하면 안된다( Full-Scan 발생한다 )
SELECT empno, ename FROM emp
--WHERE empno LIKE '7654';
WHERE empno = '7654';



SELECT * FROM emp
--WHERE mgr IS NULL;
WHERE mgr IS NULL;

SELECT * FROM emp
where deptno = 30
AND job = 'SALESMAN';
--1번

SELECT * FROM emp
where deptno = 30
AND job != 'SALESMAN';
--2번

SELECT * FROM emp
where deptno != 30
AND job != 'SALESMAN';
--WHERE NOT ( deptno = 30 or job = 'SALESMAN' ) ;
--3번

SELECT * FROM emp
WHERE empno BETWEEN 7782 AND 7900;
--4번

SELECT * FROM emp
--WHERE ename LIKE 'A%' 
--OR ENAME LIKE 'B%'
--OR ENAME LIKE 'C%';
where ename between 'A%' AND 'C~';
--WHERE ename >= 'A' AND ename < 'D'; 
--5번

select * from emp
where deptno IN (10, 30);
--6번

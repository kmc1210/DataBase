
-- to_number
SELECT
    '123.67' "1",
    to_number('123.67') "2",
    to_number('123.67', '99999.99') "3",
--    to_number('123.67', '99999.9') "4"
    to_number('123.67', '99999.9999') "4"
    
FROM dual;


SELECT

    67890 + 11111 "1",
    '67890' + 11111 "1",
    to_number('67890') + 11111 "3",
--    '67,890' + 11111 "4"
    to_number('67,890', '999,999') + 11111 "4"
    
FROM dual;


SELECT
--    '$78,789' + 10000 "1"
to_number('$78,789', '$999,999,999') + 10000 "2"
FROM dual;




-- to_date
SELECT 
--    '19/10/7' "1",
    to_date('19/10/7') + 30 "2"
    FROM dual;
    
SELECT
    '12 1 11' "1",
    to_date('12 1 11') "2",
    to_date('12 1 11', 'YY MM DD')"3",
    to_date('12 1 11', 'MM DD YY')"4"
FROM dual;



-- NVL
SELECT * FROM emp;

SELECT empno, ename, NVL(comm, 0) comm
FROM emp
ORDER BY comm DESC, ename;


--NVL2
-- comm이 NULL이면 sal로 치환
-- comm이 NULL이 아니면 sal+comm로 치환

-- NULL 데이터는 존재하지 않는 데이터로 생각해서
-- 연산, 함수의 데이터 등으로 사용하면 아무것도 수행하지 않는다
SELECT ename, sal, comm, sal+comm 
FROM emp;

SELECT ename, NVL2(comm, sal+comm, sal) pay
FROM emp;



-- NULLIF
SELECT
    NULLIF(10, 20) "1",
    NULLIF(20, 10) "2",
    NULLIF(10, 10) "3"
FROM dual;

-- job컬럼에서 'SALESEMAN' ->null변환
-- NULL값을  NVL 을 이용해 '영업' 변환

SELECT empno, ename, job,
    NULLIF(job, 'SALESMAN') N_IF,
    NVL( NULLIF(job, 'SALESMAN'), '영업') job_kor
from emp;



--DECODE
SELECT * FROM dept;

SELECT empno, ename, deptno,
    DECODE( deptno,
        10, '회계팀',
        20, '연구팀',
        30, '영업팀',
        40, '운영팀',
        '부서없음' ) dname
FROM emp;


-- CASE 구문
SELECT empno, ename, deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        WHEN 40 THEN '운영팀'
        ELSE '부서없음'
    END dname
FROM emp;

SELECT empno, ename, deptno,
    CASE
        WHEN job=upper('president') THEN '사장'
        WHEN deptno=10 THEN '회계팀'
        WHEN deptno=20 THEN '연구팀'
        WHEN deptno=30 THEN '영업팀'
        WHEN deptno=40 THEN '운영팀'
        ELSE '부서없음'
    END dname
FROM emp;




--COUNT
SELECT * FROM emp;
SELECT count(*) cnt FROM emp;

SELECT empno FROM emp;
SELECT count(empno) cnt_empno FROM emp;

SELECT mgr FROM emp;
SELECT COUNT(mgr) FROM emp;

SELECT comm FROM emp ORDER BY comm;
SELECT COUNT(comm) FROM emp;

SELECT * FROM emp;
SELECT 1 FROM emp;
SELECT COUNT(*) FROM emp;
SELECT COUNT(1) FROM emp;


-- SUM
SELECT sum(sal) tot_sal FROM emp;

-- AVG 
SELECT round (avg(sal), 2) avg_sal FROM emp;

--MAX
SELECT max(sal) max_sal 
FROM emp;

--MIN
SELECT min(sal) min_sal FROM emp;

SELECT max(ename) FROM emp;

SELECT
    max(hiredate),
    min(hiredate)
    FROM emp;
    
SELECT * FROM emp
ORDER BY deptno;

--전체 sal에 대한 합계
SELECT sum(sal) FROM emp;

--부서별 급여 합계
SELECT 
    deptno ,
    sum(sal)
FROM emp
GROUP BY deptno --distinct 중복제거와 비슷하지만 GROUP BY는 제거가 아닌 겹쳐놓음
ORDER BY deptno;


-- 부서별 인원수
SELECT
    deptno,
    count(*) cnt
FROM emp
GROUP BY deptno;

SELECT
    deptno,
    job
FROM emp
ORDER BY deptno, job;


-- 부서별 + 직무별 사원 수
SELECT
    deptno, job, ename,
    count(*) cnt
FROM emp
GROUP BY deptno, job, ename
ORDER BY deptno, job;

-- 조회 컬럼
-- deptno, dname, cnt, tot_sal, avg_sal

-- dname -> 한글로
-- cnt, tot_sal, avg_sal -> 부서별 통계
-- avg_sal -> 소수점 2자리까지
SELECT 
    deptno,
    CASE 
        WHEN deptno=10 THEN '회계팀'
        WHEN deptno=20 THEN '연구팀'
        WHEN deptno=30 THEN '영업팀'
        WHEN deptno=40 THEN '운영팀'
        ELSE '부서없음'  
     END dname,
    count(*) cnt, 
    sum(sal) tot_sal, 
    round (avg(sal), 2) avg_sal
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT * FROM emp;

SELECT 
    deptno,
    round (avg(sal), 2) avg_sal
FROM emp
--WHERE avg(sal) > 2000
GROUP BY deptno
HAVING avg(sal) >2000
ORDER BY deptno;

SELECT * FROM emp
WHERE empno = 7369;
SELECT * FROM  dept
WHERE deptno =20;

SELECT * FROM emp;

-- 두 테이블의 모든 정보 결합하기
SELECT * FROM  emp, dept;


-- JOIN
-- emp : 8cols 12rows
-- dept : 3cols 4rows
-- emp x dept : 11cols(8+3) 48rows(12x4)

-- emp,dept 테이블 둘 모두에서 deptno 값이 같은 행만 추출
SELECT * FROM  emp, dept
WHERE emp.deptno = dept.deptno;

-- 테이블 이름에 Alias 적용
SELECT empno, ename, E.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- 조인 조건
    AND empno >7800; -- 일반 조회 조건

-- INNER JOIN, 내부조인
SELECT empno, ename, E.deptno, dname
FROM emp E 
INNER JOIN dept D
    ON E.deptno = D.deptno -- 조인 조건
    WHERE empno >7800; -- 일반 조회 조건
    
-- NON - EQUI JOIN, 비등가 조인
SELECT * FROM emp; -- 사원
SELECT * FROM salgrade; -- 급여등급

SELECT ename, sal, grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal -- 조인 조건
ORDER BY grade, sal, ename;

-- INNER JOIN으로 바꿨을때
SELECT ename, sal, grade
FROM emp 
INNER JOIN salgrade
ON sal BETWEEN losal AND hisal -- 조인 조건
-- WHERE grade =3
ORDER BY grade, sal, ename;

--SELF JOIN
SELECT * FROM emp EMPLOYEE;
SELECT * FROM emp MANAGER;

SELECT empno, ename FROM emp EMPLOYEE;
SELECT DISTINCT mgr FROM emp MANAGER;

SELECT
    E.empno, E.ename, E.mgr, M.empno, M.ename
FROM emp E, emp M
WHERE E.mgr = M.empno; -- 조인 조건

SELECT
    E.empno, E.ename, E.mgr, M.empno, M.ename
FROM emp E 
INNER JOIN emp M
ON E.mgr = M.empno; -- 조인 조건


-- IN 연산자

SELECT DISTINCT sal
FROM emp
WHERE job = upper('salesman')
ORDER BY sal;

SELECT * FROM emp
WHERE sal IN(
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') ) ;
    
-- 사장의 부서번호 확인
SELECT deptno FROM emp
WHERE job = upper('president');

SELECT * FROM emp
WHERE deptno IN (
    SELECT deptno FROM emp
    WHERE job = upper('president'));
    

-- ANY 연산자
SELECT * FROM emp
WHERE sal = ANY(    -- IN 연산자와 같음
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;


SELECT * FROM emp
WHERE sal < ANY(    -- 최대(최고)값보다 작은 데이터가 조회됨
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;


SELECT * FROM emp
WHERE sal > ANY(    -- 최소(최저)값보다 큰 데이터가 조회됨
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;


-- ALL

SELECT * FROM emp
WHERE sal = ALL(    -- 결과가 모두와 같은 때 조회됨.  쓸모없음.
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

SELECT * FROM emp
WHERE sal < ALL(    -- 최소(최저)값보다 작은 데이터 조회된다.
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;

SELECT * FROM emp
WHERE sal > ALL(    -- 최대(최고)값보다 큰 데이터 조회된다.
    SELECT DISTINCT sal
    FROM emp
    WHERE job = upper('salesman') )
ORDER BY sal;


--EXISTS
SELECT DISTINCT mgr FROM emp order by mgr; 

--매니저 역할을 수행하고 있는 사원들의 정보
SELECT * FROM emp E
WHERE empno IN(
    SELECT DISTINCT mgr
    FROM emp
    )
    ORDER by empno;
    
SELECT * FROM emp E
WHERE EXISTS (
    SELECT DISTINCT mgr
    FROM emp M
    WHERE E.empno = M.mgr
)
ORDER BY empno;

-- 소속인원이 존재하는 부서들의 정보
SELECT * FROM dept D
WHERE EXISTS (
    SELECT * FROM emp E
    WHERE D.deptno = E.deptno
)
ORDER BY deptno;


SELECT * FROM dept D
WHERE deptno IN (
    SELECT deptno FROM emp E
)
ORDER BY deptno;




-- 다중 열 서브쿼리

-- 부서 별 최고 임금을 받는 사원 조회하기
SELECT deptno, max(sal) FROM emp
GROUP BY deptno;

SELECT E.deptno, dname, empno, ename, sal
FROM emp E
INNER JOIN dept D
    ON E.deptno  = D.deptno
WHERE (E.deptno, sal) IN(
    SELECT deptno, max(sal) FROM emp
    GROUP BY deptno)
ORDER BY deptno;


-- 스칼라 서브쿼리를 사용한
-- 부서 별 최고 임금을 받는 사원 조회하기
SELECT deptno,
    ( SELECT dname FROM  dept D
        WHERE E.deptno = D.deptno) dname, 
        empno, ename, sal
FROM emp E
WHERE (E.deptno, sal) IN(
    SELECT deptno, max(sal) FROM emp
    GROUP BY deptno)
ORDER BY deptno;




-- 집합 연산자

-- UNION : 합집합
SELECT empno, ename, job, 0 deptno FROM emp
WHERE job = 'SALESMAN'

UNION
SELECT empno, ename, job, deptno FROM emp
WHERE job IN ( 'SALESMAN' , 'MANAGER' )
ORDER BY ename;

-- UNION ALL : 합집합, 중복 허용
SELECT empno, ename, sal FROM emp
WHERE sal <2000
UNION ALL
SELECT empno, ename, sal FROM emp
WHERE sal <1000;

-- INTERSECT : 교집합
SELECT empno, ename, sal FROM emp
WHERE sal <2000
INTERSECT
SELECT empno, ename, sal FROM emp
WHERE sal <1000;

-- MINUS : 차집합
SELECT empno, ename, sal FROM emp
WHERE sal <2000
MINUS
SELECT empno, ename, sal FROM emp
WHERE sal <1000;


-- 인덱스 자료사전

SELECT * FROM user_indexes

WHERE table_name = upper( 'emp' );

-- 인덱스 컬럼 자료사전
SELECT * FROM user_ind_columns
WHERE table_name = upper('emp');



-- 인덱스 조회, salgrade
SELECT * FROM user_indexes
WHERE table_name = upper('salgrade');


SELECT * FROM salgrade;


-- 인덱스 생성
CREATE INDEX idx_salgrade
ON salgrade ( grade );

-- 인덱스가 중복되는 값으로 데이터 삽입
 INSERT INTO salgrade VALUES ( 5, 10000, 15000 );
SELECT * FROM salgrade;



-- 인덱스 재생성 구문
ALTER INDEX idx_salgrade REBUILD;


-- 인덱스 삭제
DROP INDEX idx_salgrade;

SELECT * FROM salgrade;
-- UPDATE salgrade set grade = 6
WHERE grade = 5
AND LOSAL = 10000;


-- UNIQUE 인덱스 생성
CREATE UNIQUE INDEX idx_slagrade ON salgrade ( grade );

SELECT * FROM user_indexes
WHERE table_name = upper('salgrade');

INSERT INTO salgrade VALUES ( 6, 10000, 12000 );

-- emp 테이블 부서별 조회
SELECT * FROM emp
WHERE deptno = 30;

-- NONUNIQUE 인덱스 생성

CREATE INDEX idx_emp_deptno ON emp ( deptno );

SELECT deptno FROM emp;
SELECT * FROM user_indexes
WHERE table_name = upper('emp');

-- 부서 내 이름으로 조회
SELECT * FROM emp
WHERE deptno =10
    AND ename = 'MILLER';
    
-- 복합 컬럼 인덱스 (COMPOSITE UNIQUE INDEX)
CREATE UNIQUE INDEX idx_emp_deptno_ename
ON emp ( deptno, ename );

-- 자료사전 확인
SELECT * FROM user_indexes
WHERE table_name = upper('emp');


SELECT * FROM user_ind_columns
WHERE table_name = upper('emp')
ORDER BY index_name, column_position;


-- 뷰, VIEW
SELECT * FROM(
SELECT * FROM emp
WHERE empno < 2000
);

-- 사용자 계정에 뷰 생성 권한(CREATE VIEW)이 없어서
-- 수행할 수 없음( Insufficient Privileges )
CREATE VIEW test_view
AS (
    --서브쿼리
    SELECT * FROM emp
    WHERE empno < 2000
);

SELECT * FROM test_view;

-- 뷰 자료사전 조회
SELECT * FROM user_views;



-- 뷰 서브쿼리 수정
CREATE OR REPLACE VIEW test_view
AS (    
    SELECT empno, ename FROM emp
    WHERE empno < 2000
);

SELECT * FROM user_views;


-- 데이터 삽입
INSERT INTO test_view ( empno, ename )
VALUES ( 500, 'AAA' );

SELECT * FROM test_view;
SELECT * FROM emp;

INSERT INTO test_view
VALUES ( 1500, 'BB' );
SELECT * FROM test_view;
SELECT * FROM emp;


-- WITH CHECK OPTION 부여하기
CREATE OR REPLACE VIEW test_view
AS (
    SELECT empno, ename FROM emp
    WHERE empno < 2000) 
    WITH CHECK OPTION;

INSERT INTO test_view VALUES ( 8000, 'CCC' ); -- WHERE 조건절에 합당한 값이여야 함
INSERT INTO test_view VALUES ( 600, 'DDD' );


SELECT * FROM test_view;
SELECT * FROM emp;
WHERE empno = 8000;


-- 시퀀스
CREATE SEQUENCE seq_emp;

-- 시퀀스 자료사전 조회
SELECT * FROM user_sequences;


SELECT seq_emp.currval FROM dual;
SELECT seq_emp.nextval FROM dual;


INSERT INTO emp (empno, ename )
VALUES (seq_emp.nextval, 'Dave2' );
SELECT * FROM emp;

SELECT * FROM user_sequences;


--조건(옵션)부여해서 시퀀스 생성하기
CREATE SEQUENCE test_seq
START WITH 2001
MINVALUE 2001
MAXVALUE 3000
INCREMENT BY 100;


SELECT test_seq.nextval FROM dual;
SELECT test_seq.currval FROM dual;

-- CACHE 크기보다 CYCLE의 크기가 작음 -> 적용 안됨
ALTER SEQUENCE test_seq
CYCLE
CACHE 5;

--MyBoard Table 생성
CREATE TABLE MyBoard(
    boardno NUMBER,
    title VARCHAR2(300));
--SEQ_MyBoard Sequence 생성    
CREATE SEQUENCE SEQ_MyBoard;

-- AttachFile Table 생성
CREATE TABLE AttachFile (
    fileno NUMBER,
    boardno NUMBER,
    filename VARCHAR2(200)
    );

--SEQ_AttacheFile Sequence 생성

CREATE SEQUENCE SEQ_AttachFile;



ALTER TABLE MyBoard
ADD CONSTRAINT MyBoard_pk
    PRIMARY KEY ( boardno );

ALTER TABLE AttachFile
    ADD CONSTRAINT AttachFile_fk
    foreign key ( boardno )
    references MyBoard ( boardno );
--INSERT INTO emp (empno, ename )
--VALUES (seq_emp.nextval, 'Dave2' );
--SELECT * FROM emp;

INSERT INTO MyBoard (boardno, title)
VALUES (SEQ_MyBoard.nextval, '안녕하세요');

INSERT INTO AttachFile(fileno, boardno, filename)
 VALUES ( SEQ_AttachFile.nextval, SEQ_MyBoard.currval, 'Hello.jpg');

--DROP SEQUENCE SEQ_MyBoard;
--DROP SEQUENCE SEQ_AttachFile;
--DROP TABLE MyBoard;
--DROP TABLE AttachFile;

SELECT * FROM MyBoard;
SELECT * FROM AttachFile;
CREATE OR REPLACE VIEW board_with_file
AS(
SELECT
    B.boardno, title, fileno, filename
From myboard B, attachfile F
where B.boardno = F.boardno(+)
);
SELECT * FROM board_with_file
ORDER BY boardno, fileno NULLS LAST;


-- 뷰 생성시 --

CREATE VIEW test_view
AS (
    --서브쿼리
    SELECT * FROM emp
    WHERE empno < 2000
);


-- scott에게 뷰 생성 권한 부여하기 ( system 계정 사용)
GRANT CREATE VIEW
TO scott;

-- scott 계정을 이용한 뷰 생성 ( scott 사용자로 접속해서 실행 )

-- 데이터 연결 연산자 ||
SELECT
    ename || 'is' ||job AS EMPLOYEE
FROM emp;

-- ''로 표현된 문자 안에서 ' 를 사용하고 싶으면 ''를 사용
SELECT -- SMITH's job is CLERK
    ename || '''s job is' ||job AS EMPLOYEE
FROM emp;


-- SQL Functions
SELECT ename, length(ename) len From emp; -- single row

SELECT COUNT (*) FROM emp; -- Group 

-- Dual 테이블
SELECT 1 FROM emp;
SELECT 1 + 2 FROM emp; 

SELECT 1 FROM dual;
SELECT 1 + 2 FROM dual;

SELECT 1+2 FIRST, 6*5 SECOND, 5-7 THIRD FROM dual;


-- 숫자함수
-- abs()
SELECT abs(-45) FROM dual;
SELECT abs(-5786.456) FROM dual;
SELECT abs(sal) FROM emp;



-- 숫자함수 문제

SELECT round(12.523) from dual; -- 소수점이하 반올림
SELECT round(-12.723) FROM dual; -- 소수점이하 반올림
SELECT round(12.567, 2) FROM dual; -- 소수점 3째자리에서 반올림
SELECT round(12345, -1) FROM dual; -- 1의 자리에서 반올림
SELECT round(56789, -2) from dual; -- 10의 자리에서 반올림

SELECT TRUNC(12.456) from dual; -- 소수점 이하 버림
SELECT TRUNC(12.456, 2) from dual; -- 소수점 3째자리에서 버림
SELECT TRUNC(12345, -1) from dual; -- 소수점 이하 버림
SELECT TRUNC(56789, -2) from dual; -- 10의 자리에서 버림


SELECT MOD (13, 8)from dual; --13을 8로 나눈 나머지

select CEIL (12.345) FROM DUAL; -- 12.345 올림
SELECT CEIL (-12.567) FROM DUAL; -- 12.567 올림

SELECT FLOOR (12.567) FROM DUAL; -- 12.567 내림
SELECT FLOOR (12.123) FROM DUAL; -- 12.567 내림
SELECT FLOOR (-12.567) FROM DUAL; -- 12.567 내림
SELECT FLOOR (-12.123) FROM DUAL; -- 12.567 내림



SELECT POWER ( 3,4) FROM DUAL; -- 3의 4제곱 -> 81
SELECT POWER (3, -1) FROM DUAL;-- 3의 -1 제곱 -> 0.33333333333

SELECT SQRT (9) FROM DUAL; -- 9의 제곱근 -> 3
SELECT SQRT (11) FROM DUAL; -- 11의 제곱근 -> 3.3166...


-- 문자함수

-- length()

SELECT 
    length('Apple') len1,
    length('안녕') len2,
    length('Hello 오라클') len3
FROM dual;

-- lengthb()
SELECT 
    lengthb('Apple') len1,
    lengthb('안녕') len2,
    lengthb('Hello 오라클') len3
FROM dual;

-- 캐릭터셋(인코딩) 확인
SELECT * FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';


-- SUBSTR()

-- 문자 함수 문제

SELECT UPPER('hELlo')from dual; -- 'hELlo' 모두 대문자로 변환 -> HELLO

SELECT * FROM tabs
WHERE table_name = upper('emp');

SELECT LOWER('hELlo')from dual; -- 'hELlo' 모두 소문자로 변환 -> hello
SELECT INITCAP('hELlo')from dual; -- 'hELlo' 이니셜(첫글자) 대문자 -> Hello
SELECT length ('Alice Bob') from dual; -- 'Alice Bob'의 문자열 길이 -> 9
SELECT length ('안녕하세요') from dual; -- '안녕하세요'의 문자열 길이 -> 5

SELECT lengthb ('Alice Bob') from dual; -- 'Alice Bob' 문자열 바이트 수 -> 9
SELECT lengthb ('ACE 안녕하세요') from dual; -- 'ACE 안녕하세요'문자열 바이트 수 -> 19
-- (오라클은 한글 인코딩을 UTF-8을 기본으로 하며
--  UTF-8은 한글 한글자에 3바이트가 필요하다)

SELECT INSTR('ABCDEFGHI','D') FROM DUAL; -- 'ABCDEFGHI'에서 'D' 의 위치 -> 4
SELECT INSTR('ABCDEFGHI','DEF') FROM DUAL; -- 'ABCDEFGHI'에서 'DEF'문자열의 위치 ->4
SELECT INSTR('ABCDEFGHI','DF') FROM DUAL; -- 'ABCDEFGHI'에서 'DF'문자열의 위치 -> 0
SELECT INSTR('안녕하세요','하') FROM DUAL; -- '안녕하세요'에서 '하'문자열의 위치 -> 3
SELECT INSTRb('안녕하세요','하') FROM DUAL; -- '안녕하세요'에서 '하'문자열의 위치 -> 3

SELECT INSTR('ABCABCDDD','C') FROM DUAL; -- 'ABCABCDDD'에서 'C'문자열의 위치 -> 3

SELECT SUBSTR('Oracle SQL Developer', 6) FROM DUAL;--'Oracle SQL Developer'에서 5번째 인덱스 이후의 문자열로 자르기
SELECT SUBSTR('Oracle SQL Developer', 5, 5)FROM DUAL; --'Oracle SQL Developer'에서 5번째 인덱스부터 5글자로 자르기
SELECT SUBSTR('오라클 SQL', 2, 5)FROM DUAL; --'오라클 SQL'에서 2번째 인덱스부터 5글자로 자르기
SELECT SUBSTR('안녕하세요오라클', 3)FROM DUAL; --'안녕하세요오라클'에서 3번째 부터 자르기


-- 패딩, Padding
-- 문자를 표현하기 위해서 공간을 확보하고
-- 문자를 채워놓고 빈 공간이 남으면 설정한 문자로 채운다

-- LEFT PADDING : lpad()
SELECT lpad('SQL', 10) FROM dual;

SELECT lpad(ename, 10) FROM emp;
SELECT lpad('SQL', 10, '*') FROM emp;
SELECT lpad('SQL', 10, '*_*') FROM emp;

SELECT lpad('ABCDEFGH', 5) FROM dual;
SELECT ename from emp;


-- RIGHT PADDING : rpad()
SELECT rpad('SQL', 10, '*') FROM dual;
SELECT rpad('SQL', 10) FROM dual;


--TRIM
-- 데이터의 양 끝단에 있는 ' '(띄어쓰기, 공백)을
-- 제거하는 함수

SELECT ' SQL',
    ltrim('   SQL   '),
    rtrim('   SQL   '),
    trim('   SQL    '),
    ltrim(rtrim('   SQL   '))

FROM dual;


-- 날짜 함수, DATETIME

SELECT sysdate FROM dual;


-- 날짜시간 타입 -> 문자 타입 (서식 지정)
SELECT 
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') now
    from dual;
    
-- MONTHS_BETWEEN : 개월 수 차이   
SELECT 
    months_between('20-01-01', '20-02-01') "A",
    round (months_between('20/02/15', '20/02/01'),2) "B", 
    round (months_between(sysdate, '20/02/01'),2) "C"   

    from dual;

-- next_day : 지정된 요일이 다가오는 날짜 구하기
SELECT
    next_day(sysdate, '금')
FROM dual;

-- trunc(number)
-- trunc(datetime)
SELECT TRUNC(TO_DATE(sysdate, 'DD-MM-YY'), 'YEAR')
FROM dual;


SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS'),
    to_char(trunc(sysdate), 'YYYY/MM/DD HH24:MI:SS')
FROM dual;

-- 보이는 결과는 같지만
-- 시간이 포함되어있어 서로 다른 값을 가진다.
SELECT
    SYSDATE,
    trunc(sysdate)
FROM dual;



-- to_char( number )
-- to_char( number, fmt ) : 서식문자를 이용한 변환

SELECT 
    12345 "0",
    to_char(12345) "1",    -- '12345'
    length( to_char(12345) ) "3",
    length( 12345 ) "4",
    to_char(12345, '99') "5",
    to_char(12345, '999999999') "6",
    to_char(12345, '000000000') "7",
    to_char(12345, '999000000') "8"
FROM dual;


SELECT 
    to_char(12345.6789) "1",
    to_char(12345.6789, '99999.9') "2",
    to_char(12345.6789, '9,999,999.99') "3",
    to_char(12345.6, '9,999,999.99') "4"
FROM dual;


SELECT

    to_char(12345) "1",
    to_char(12345, '$99999999' ) "2",
    to_char(12345, '$999' ) "3",
    trim(to_char(12345, 'L99999999' )) "4" -- LOCALE
    
FROM dual;


--to_char(datetime)
SELECT
--    sysdate
--     to_char(sysdate, 'SCC') --세기
--    to_char(to_date('369/1/7'), 'SCC')

--    to_char(sysdate, 'YEAR'), --영문 년도
--    to_char(sysdate, 'year'),
--    to_char(sysdate, 'Year')

--     to_char(sysdate, 'YYYY'),--숫자 년도
--     to_char(sysdate, 'YY'),
--     to_char(sysdate, 'YYY'),
--     to_char(sysdate, 'Y'),
--     to_char(sysdate, 'YYYYY') -- YYYY YY

--     to_char(sysdate, 'MM'), -- 숫자 월
--     to_char(sysdate, 'MONTH'), -- 문자 월
--     to_char(sysdate, 'MOM') --문자 월 약어
     
--     to_char(sysdate, 'Q') --분기

--    to_char(sysdate, 'DD'), -- 월 단위 일수
--    to_char(sysdate, 'D'), -- 주 단위 일수, 요일
--    to_char(sysdate, 'DDD') -- 년 단위 일수

--    to_char(sysdate, 'DAY'), --요일
--    to_char(sysdate, 'DY') --요일 약어

--    to_char(sysdate, 'HH'), --12시간 기준 시간
--    to_char(sysdate, 'HH12'), --12시간 기준 시간
--    to_char(sysdate, 'HH24') --24시간 기준 시간
    
--    to_char(sysdate, 'MI') -- 분
--    to_char(sysdate, 'SS') -- 초
--    to_char(sysdate, 'AM'),
--    to_char(sysdate, 'PM'),
--    to_char(sysdate, 'A.M.'),
--    to_char(sysdate, 'P.M.')

    to_char(sysdate,  'FF') --밀리초
FROM dual;

SELECT systimestamp, sysdate FROM dual;

SELECT 
    to_char(systimestamp, 'FF'),
    to_char(systimestamp, 'FF1'),
    to_char(systimestamp, 'FF2'),
    to_char(systimestamp, 'FF3')
FROM dual;


SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS DAY')
FROM dual;

SELECT * FROM emp
--WHERE to_char(hiredate, 'Q') = 3;
WHERE hiredate >= '81/07/01' AND hiredate < '81/10/01';
